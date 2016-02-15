package phoenix;

import phoenix.Renderer;
import phoenix.geometry.Geometry;
import phoenix.Matrix;
import phoenix.Shader;

import snow.modules.opengl.GL;
import snow.api.buffers.Float32Array;

import luxe.Log.*;
import luxe.Emitter;
import luxe.structural.BalancedBST;

@:allow(phoenix.Renderer)
class Batcher {

    public var id : String;
    public var enabled : Bool = true;
    @:isVar public var layer (default, set) : Int = 0;

    public var geometry : BalancedBST< GeometryKey, Geometry >;
    public var emitter : Emitter<BatcherEventType>;
    public var tree_changed : Bool = false;

    public var pos_list    : Float32Array;
    public var tcoord_list : Float32Array;
    public var color_list  : Float32Array;
    public var normal_list : Float32Array;

    public var max_verts : Int = 0;
    public var max_floats : Int = 0;
    public var vert_count : Int = 0;

    public var renderer : Renderer;
    public var view : Camera;
        // An explicit shader override (instead of per geometry).
        // Useful for things like wireframe/depth/normal/debug/shadow rendering passes.
    public var shader : Shader;

    public var draw_calls : Int = 0;
    public var dynamic_batched_count : Int = 0;
    public var static_batched_count : Int = 0;
    public var visible_count : Int = 0;

    public var log : Bool = false;
    public var name : String = '';

        //This is a failsafe against identical layer values
        //being sorted differently by target etc. Not reset intentionally.
    static var _sequence_key : Int = -1;
    var sequence : Int = -1;

    var pos_floats    : Int = 0;
    var tcoord_floats  : Int = 0;
    var color_floats   : Int = 0;
    var normal_floats  : Int = 0;

    public function new( _r : Renderer, ?_name:String = '', ?_max_verts:Int=16384 ) {

        id = Luxe.utils.uniqueid();
        renderer = _r;
        sequence = ++_sequence_key;

        geometry = new BalancedBST<GeometryKey,Geometry>( geometry_compare );
        emitter = new Emitter();

        max_verts = _max_verts;
            //4 floats per vert, i.e x y z w
        max_floats = max_verts * 4;

            //these are expecting elements in floats, so each vert etc has 4 floats
        pos_list = new Float32Array( max_floats );
        tcoord_list = new Float32Array( max_floats );
        color_list = new Float32Array( max_floats );

        #if phoenix_use_normals
            normal_list = new Float32Array( max_floats );
        #end

            //The default view so we see stuff
        view = renderer.camera;

        GL.enableVertexAttribArray( vert_attribute );
        GL.enableVertexAttribArray( tcoord_attribute );
        GL.enableVertexAttribArray( color_attribute );

        #if phoenix_use_normals
            GL.enableVertexAttribArray( normal_attribute );
        #end

            //A default name
        if(_name.length == 0) {
            name = Luxe.utils.uniqueid();
        } else {
            name = _name;
        }

        _dropped = [];

    } //new

//Public function
    inline
    public function on(event:BatcherEventType, handler:Batcher->Void) {
        emitter.on(event, handler);
    }

    inline
    public function off(event:BatcherEventType, handler:Batcher->Void) {
        return emitter.off(event, handler);
    }

    public function add( _geom:Geometry, _force_add:Bool = false ) {

        // _debug("adding geom to batcher " + _geom.id + " at " + _geom.depth);
        // _debug("\t list before: ");
            // list_geometry();

        if( geometry.find(_geom.key) == null || _force_add ) {

                //Only add if not already there
            if( !Lambda.has(_geom.batchers, this) ) {
                _geom.batchers.push(this);
            }

                //Insert into our list
            geometry.insert( _geom.key, _geom );

                //Make sure it is flagged
            _geom.added = true;

                //and this local test flag
            tree_changed = true;

            // _debug("\t list after: ");
            //     list_geometry();

        } else {
            // trace("Warning : Attempting to add geometry to the same batcher twice. " + _geom);
        }

    } //add

        /** Drop all the geometry within this batcher, emptying it out. */
    public function empty( _drop:Bool=true ) {

        if(_drop) {
            for(geom in geometry) {
                geom.drop(true);
                geom = null;
            }
        } else {
            for(geom in geometry) {
                geometry.remove(geom.key);
            }
        }

    } //empty

        /** Destroy this batcher.
            Drops all the geometry within it (empty). 
            Removes itself from the renderer.
            Does not change the `view`.
            Do not use the batcher instance after calling this. */
    public function destroy( _drop:Bool=true ) {

        empty(_drop);

        renderer.remove_batch(this);

        emitter = null;
        geometry = null;
        pos_list = null;
        tcoord_list = null;
        color_list = null;
        normal_list = null;

        max_verts = 0;
        max_floats = 0;
        vert_count = 0;

        renderer = null;
        view = null;

    } //destroy

    public function remove( _geom:Geometry, ?_remove_batcher_from_geometry:Bool = true ) {

        if(_remove_batcher_from_geometry) {
            _geom.batchers.remove(this);
            if(_geom.batchers.length == 0) {
                _geom.added = false;
            }
        } //_remove_batcher_from_geometry

        var countbefore = geometry.size();

        geometry.remove( _geom.key );

        var countafter = geometry.size();

        if(countbefore == countafter) {
            //:todo: this fail state should never happen but it comes up on web rarely
            // throw("GEOMETRY NOT REMOVED " + _geom.key);
        }

        tree_changed = true;

    } //remove

        //Run the batcher over the current list of geometry
        //and submit it to the graphics card for drawing
    var state : phoenix.BatchState;
    var _dropped:Array<Geometry>;

    public function batch( persist_immediate : Bool = false ) {

        //reset render stats before we start
        dynamic_batched_count = 0;
        static_batched_count = 0;
        visible_count = 0;

        pos_floats = 0;
        tcoord_floats = 0;
        color_floats = 0;
        normal_floats = 0;

            //The current batch state values
        state = new phoenix.BatchState(this);
            //The current geometry in the set
        var geom : Geometry = null;

            //For each in the list
        for(_geom in geometry) {

                //grab the next geometry
            geom = _geom;

                //If it's valid to be drawn
            if( geom != null && !geom.dropped ) {

                    //If the update will cause a state change, submit the vertices accumulated
                if( state.update(geom) ) {

                        //if there are verts in the last batch, it needs to be submitted
                        //The function returns early if there are none 
                    submit_current_vertex_list( state.last_geom_state.primitive_type );

                } // state.update(geom)

                    // Now activate state changes (if any)
                state.activate(this);

                if(geom.visible) {
                    
                    //try
                    visible_count++;

                        //Buffer based geometry doesn't get submitted here yet
                    if(geom.buffer_based) {
                        visible_count--;
                        continue;
                    }

                        //Static batched geometry gets sent on it's own
                    if(geom.locked) {

                            //static submissions split the batch for sorting reasons
                        submit_current_vertex_list( state.last_geom_state.primitive_type );

                        submit_static_geometry( geom );
                        vert_count += geom.vertices.length;
                    }

                        // Do not accumulate for tri strips, line strips, line loops, triangle fans, quad strips, or polygons
                    else if( geom.primitive_type == PrimitiveType.line_strip ||
                             geom.primitive_type == PrimitiveType.line_loop ||
                             geom.primitive_type == PrimitiveType.triangle_strip ||
                             geom.primitive_type == PrimitiveType.triangle_fan ) {

                                // doing this with the same list is fine because the primitive type causes a batch break anyways.
                                // Send it on, this will also clear the list for the next geom so it doesn't acccumlate as usual.
                            geometry_batch(geom);
                                //submit the geometry
                            submit_current_vertex_list( geom.primitive_type );
                                //increase counts
                            vert_count += geom.vertices.length;

                    } //if it's unbatchable

                        // Accumulate, this is standard geometry
                    else {

                        geometry_batch( geom );

                            //increase counts
                        dynamic_batched_count++;
                        vert_count += geom.vertices.length;

                    } //standard geometry


                        // If the geometry is immediate get rid of it (unless the flag to keep immediate geometry)
                        // in the list was specified...i.e for drawing multiple passes etc
                    if( !persist_immediate && geom.immediate ) {
                        //set the flag to avoid redrawing at all
                        geom.dropped = true;
                        //store to be dropped after iteration
                        _dropped.push(geom);
                    } //!persist_immediate && geom.immediate

                } //geom.visible

            }

        } //geom list

            //If there is anything left in the vertex buffer, submit it.
        if(pos_floats > 0 && geom != null) {

                //Make sure the state matches this geometry
            state.update(geom);
                //And the state is active for renderering
            state.activate( this );
                //submit the list for rendering
            submit_current_vertex_list( state.last_geom_state.primitive_type );

        }

            //disable any states set by the batches
        state.deactivate(this);
            //cleanup
        state = null;

        prune();

    } //batch

    inline function prune() {

        //clean up dropped geometry
        if(_dropped.length > 0) {
            for(geom in _dropped) {
                geom.drop();
                geom = null;
            }
            _dropped = null;
            _dropped = [];
        }

    } //prune

    inline
    public function draw( ?persist_immediate:Bool = false ) {

        //Reset the draw count
        draw_calls = 0;
        vert_count = 0;

        emitter.emit(BatcherEventType.prerender, this);

        update_view();

        batch( persist_immediate );

        emitter.emit(BatcherEventType.postrender, this);

    } //draw

    @:noCompletion
    inline
    function update_view() {

            //update camera if it changes anything
        view.process();

        // trace('batcher $name / view ${view.name} / viewport:${view.viewport}');

            //Set the viewport to the view
        renderer.state.viewport( view.viewport.x, view.viewport.y, view.viewport.w, view.viewport.h );

    } //update_view

    @:noCompletion
    inline 
    public function apply_default_uniforms(_shader:Shader) {
        if(!_shader.no_default_uniforms) {
            _shader.set_matrix4_arr('projectionMatrix', view.proj_arr);
            _shader.set_matrix4_arr('modelViewMatrix', view.view_inverse_arr);
        }
    }

    //:todo: this is not part of the api
    //       and should be considered volatile/WIP
    @:noCompletion
    inline
    public function submit_geometry( _geom:Geometry, ?_shader:Shader ) {

        assert(_geom.buffer_based, 'Only buffer based geometry can be submitted directly');

        if(!_geom.visible) return;
        if(_shader == null) _shader = _geom.shader;
        if(shader != null) _shader = shader;

        _shader.activate();
        apply_default_uniforms(_shader);
        _geom.uniforms.apply();

        var _length = _geom.vertices.length;
        var _length4 = _length * 4;
        var _updated = _geom.update_buffers();

        if(_updated) {
            _geom.bind_and_upload();
        } else {
            _geom.bind();
        }

        _geom.draw();

        var _stats = renderer.stats;
        _stats.geometry_count++;
        _stats.visible_count++;
        _stats.draw_calls++;
        _stats.vert_count += _length;

    } //submit_geometry

    // inline
    @:noCompletion
    public function submit_buffers(type:PrimitiveType, _pos:Float32Array, _tcoords:Float32Array, _colors:Float32Array, _normals:Float32Array) {

        var pb = GL.createBuffer();
        var cb = GL.createBuffer();
        var tb = GL.createBuffer();
        #if phoenix_use_normals
        var nb = GL.createBuffer();
        #end

        GL.bindBuffer(GL.ARRAY_BUFFER, pb );
        GL.vertexAttribPointer( vert_attribute, 4, GL.FLOAT, false, 0, 0 );
        GL.bufferData( GL.ARRAY_BUFFER , _pos, GL.STREAM_DRAW);

        GL.bindBuffer(GL.ARRAY_BUFFER, tb );
        GL.vertexAttribPointer( tcoord_attribute, 4, GL.FLOAT, false, 0, 0 );
        GL.bufferData( GL.ARRAY_BUFFER , _tcoords, GL.STREAM_DRAW);

        GL.bindBuffer(GL.ARRAY_BUFFER, cb );
        GL.vertexAttribPointer( color_attribute, 4, GL.FLOAT, false, 0, 0 );
        GL.bufferData( GL.ARRAY_BUFFER , _colors, GL.STREAM_DRAW);

        #if phoenix_use_normals
        GL.bindBuffer(GL.ARRAY_BUFFER, nb );
        GL.bufferData( GL.ARRAY_BUFFER , _normals, GL.STREAM_DRAW);
        GL.vertexAttribPointer( normal_attribute, 4, GL.FLOAT, false, 0, 0 );
        #end

            //Draw
        GL.drawArrays( type, 0, Std.int(_pos.length/4) );

        GL.deleteBuffer(pb);
        GL.deleteBuffer(cb);
        GL.deleteBuffer(tb);
        #if phoenix_use_normals
        GL.deleteBuffer(nb);
        #end

        draw_calls++;

    } //submit_buffers

    @:noCompletion
    inline
    public function submit_static_geometry( geom:Geometry ) : Bool {

        var _length = geom.vertices.length;

        if( _length == 0 ) {
            return false;
        }

        var _updated = geom.update_buffers();

        if(_updated) {
            geom.bind_and_upload();
        } else {
            geom.bind();
        }

        geom.draw();

            //Disable attributes
        static_batched_count++;
        draw_calls++;

            //clear the geometry flags
        geom.dirty = false;

        return true;

    } //submit_static_geometry

    @:noCompletion
    inline
    public function submit_current_vertex_list( type : PrimitiveType ) : Bool {

        if( pos_floats == 0 ) {
            return false;
        }

        if( pos_floats > max_floats ) {
            throw "uh oh, somehow too many floats are being submitted (max:$max_floats, attempt:$pos_floats).";
        }

        var _pos = new Float32Array(pos_list.buffer, 0, pos_floats);
        var _tcoords = new Float32Array(tcoord_list.buffer, 0, tcoord_floats);
        var _colors = new Float32Array(color_list.buffer, 0, color_floats);
        var _normals:Float32Array = null;

        #if phoenix_use_normals
            _normals = new Float32Array(normal_list.buffer, 0, normal_floats);
        #end

        submit_buffers(type, _pos, _tcoords, _colors, _normals);

        _pos = null;
        _tcoords = null;
        _colors = null;
        _normals = null;

        pos_floats = 0;
        tcoord_floats = 0;
        color_floats = 0;
        normal_floats = 0;

        return true;

    } //submit_current_vertex_list

//Batch related helper functions

    inline
    function geometry_batch( geom:Geometry ) {

        if(geom.vertices.length > max_verts) {
            geom.locked = true;
            geom.dirty_based = false;
            luxe.Log.log('WARNING batcher `$name` trying to batch a geometry `${geom.id}` that has more verts than the batcher has preallocated, (${geom.vertices.length} vs max of $max_verts)');
            luxe.Log.log('WARNING geometry has been marked as direct submit, and will be submitted independently!');
            return;
        }

            //pos_floats is in element count (so/4)
        var _count_after = geom.vertices.length+(pos_floats/4);

            //submit the current batch if we exceed the max buffer size
        if(_count_after > max_verts) {
            submit_current_vertex_list( geom.primitive_type );
        }

        geom.batch(
            pos_floats,     tcoord_floats,  color_floats,   normal_floats,
            pos_list,       tcoord_list,    color_list,     normal_list
        );

        var _length = geom.vertices.length * 4;

        pos_floats       += _length;
        tcoord_floats    += _length;
        color_floats     += _length;
        normal_floats    += _length;

    } //geometry_batch


//Internal

    inline function set_layer( _layer:Int ) : Int {

            //set the value
        layer = _layer;
            //re-sort the list
        renderer.batchers.sort( renderer.sort_batchers );

            //return value
        return layer;

    } //set_layer

    inline
    function toString() {
        return "Batcher(" + name + ")";
    }

        //this sorts the batchers in a list by layer
    inline
    function compare(other:Batcher) {

        if(layer == other.layer) return 0;
        if(layer < other.layer) return -1;

        return 1;

    } //compare

    function compare_rule_to_string(r:Int) : String {
        return switch(r) {

            case 0: "same";
            case 1: "depth <";
            case 2: "depth >";

            case 3: "shader <";
            case 4: "shader >";
            case 5: "shader s._ >";
            case 6: "shader _.s <";

            case 7: "texture <";
            case 8: "texture >";
            case 9: "texture t._ >";
            case 10: "texture _.t <";

            case 11: "primitive <";
            case 12: "primitive >";
            case 13: "unclipped";
            case 14: "clipped";
            case 15: "timestamp <";
            case 16: "timestamp >";
            case 17: "timestamp ==";
            case 18: "sequence <";
            case 19: "sequence >";
            case 20: "fallback";
            default: "unknown";

        }

    } //compare_rule_to_string

    function compare_rule( a:GeometryKey, b:GeometryKey ) : Int {

        if(a.uuid == b.uuid)
            { return 0; }

            //sort by depth first
        if( a.depth < b.depth )
            { return 1; }
        if( a.depth > b.depth )
            { return 2; }

            //by this point, depth are equal
            //so sort by shader, then texture, then primitive type

        if(a.shader != null && b.shader != null) {

                //sort shaders id's by gl id
            if(a.shader.id < b.shader.id)
                { return 3; }
            if(a.shader.id > b.shader.id)
                { return 4; }

        } else {
            if(a.shader != null && b.shader == null) {
                return 5;
            } else
            if(a.shader == null && b.shader != null) {
                return 6;
            }
        }

        if(a.texture != null && b.texture != null) {

                //sort textures id's by gl id
            if(a.texture.id < b.texture.id)
                { return 7; }
            if(a.texture.id > b.texture.id)
                { return 8; }

        } else {
            if(a.texture != null && b.texture == null) {
                return 9;
            } else
            if(a.texture == null && b.texture != null) {
                return 10;
            }

        }

            //same texture and shader, so primitive type
        var a_primitive_index : Int = a.primitive_type;
        var b_primitive_index : Int = b.primitive_type;

        if( a_primitive_index < b_primitive_index )
            { return 11; }
        if( a_primitive_index > b_primitive_index )
            { return 12; }

            //if not the same clipping, we want clipped geometry after, and not clipped before
        if(a.clip != b.clip) {

            if(a.clip == false && b.clip == true) {
                return 13;
            } else

            if(a.clip == true && b.clip == false) {
                return 14;
            }

        } //clippin

            //if all else is indistinguishable,
            //make sure older geometry is before

        if( a.timestamp < b.timestamp )
            { return 15; }
        if( a.timestamp > b.timestamp )
            { return 16; }
        if( a.timestamp == b.timestamp )
            { return 17; }

        if( a.sequence < b.sequence )
            { return 18; }
        if( a.sequence > b.sequence )
            { return 19; }

            //otherwise push down the list because wtf
        return 20;

    } //compare_rule

    function geometry_compare( a:GeometryKey, b:GeometryKey ) : Int {

            //rules :
                //depth
                //shader
                //texture
                //primitive type
                //clipping
                //age
                //sequence/fallback

            //check equality
        if(a.uuid == b.uuid)
            { return 0; }

            //sort by depth first
        if( a.depth < b.depth )
            { return -1; }
        if( a.depth > b.depth )
            { return 1; }

            //by this point, depth are equal
            //so sort by shader, then texture, then primitive type
        if(a.shader != null && b.shader != null) {

                //sort shaders id's by gl id
            if(a.shader.id < b.shader.id)
                { return -1; }
            if(a.shader.id > b.shader.id)
                { return 1; }

        } else {
            if(a.shader != null && b.shader == null) {
                return 1;
            } else
            if(a.shader == null && b.shader != null) {
                return -1;
            }
        }

        if(a.texture != null && b.texture != null) {

                //sort textures id's by gl id
            if(a.texture.id < b.texture.id)
                { return -1; }
            if(a.texture.id > b.texture.id)
                { return 1; }

        } else {
            if(a.texture != null && b.texture == null) {
                return 1;
            } else
            if(a.texture == null && b.texture != null) {
                return -1;
            }
        }

            //same texture and shader, so primitive type
        var a_primitive_index : Int = a.primitive_type;
        var b_primitive_index : Int = b.primitive_type;

        if( a_primitive_index < b_primitive_index )
            { return -1; }
        if( a_primitive_index > b_primitive_index )
            { return 1; }

            //if not the same clipping, we want clipped geometry after, and not clipped before
        if(a.clip != b.clip) {

            if(a.clip == false && b.clip == true) {
                return 1;
            } else

            if(a.clip == true && b.clip == false) {
                return -1;
            }

        } //clippin

            //if all else is indistinguishable,
            //make sure older geometry is before

        if( a.timestamp < b.timestamp )
            { return -1; }
        if( a.timestamp >= b.timestamp )
            { return 1; }
        if( a.sequence < b.sequence )
            { return -1; }
        if( a.sequence > b.sequence )
            { return 1; }

            //otherwise push down the list because wtf
        return 1;

    } //geometry_compare

    function list_geometry() {
        for(geom in geometry) {
            _debug('\t   geometry: ' + geom.id  + ' / ' + geom.depth + ' / ' + geom.uuid );
            _debug('\t\t' + geom.key);
        }
    }

    public static inline var vert_attribute   : Int = 0;
    public static inline var tcoord_attribute : Int = 1;
    public static inline var color_attribute  : Int = 2;
    public static inline var normal_attribute : Int = 3;

} //Batcher


@:enum abstract PrimitiveType(Int) from Int to Int {

    var unknown         = -1;
    var line_strip      = GL.LINE_STRIP;
    var line_loop       = GL.LINE_LOOP;
    var lines           = GL.LINES;
    var triangle_strip  = GL.TRIANGLE_STRIP;
    var triangles       = GL.TRIANGLES;
    var triangle_fan    = GL.TRIANGLE_FAN;
    var points          = GL.POINTS;

} //PrimitiveType

@:enum abstract BlendMode(Int) from Int to Int {

    var zero                    = GL.ZERO;
    var one                     = GL.ONE;
    var src_color               = GL.SRC_COLOR;
    var one_minus_src_color     = GL.ONE_MINUS_SRC_COLOR;
    var src_alpha               = GL.SRC_ALPHA;
    var one_minus_src_alpha     = GL.ONE_MINUS_SRC_ALPHA;
    var dst_alpha               = GL.DST_ALPHA;
    var one_minus_dst_alpha     = GL.ONE_MINUS_DST_ALPHA;
    var dst_color               = GL.DST_COLOR;
    var one_minus_dst_color     = GL.ONE_MINUS_DST_COLOR;
    var src_alpha_saturate      = GL.SRC_ALPHA_SATURATE;

} //BlendMode

@:enum abstract BlendEquation(Int) from Int to Int {

    var add                    = GL.FUNC_ADD;
    var subtract               = GL.FUNC_SUBTRACT;
    var reverse_subtract       = GL.FUNC_REVERSE_SUBTRACT;

} //BlendEquation

@:enum abstract BatcherEventType(Int) from Int to Int {

    var unknown     = 0;
    var prerender   = 1;
    var postrender  = 2;

} //BatcherEventType


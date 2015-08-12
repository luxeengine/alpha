package phoenix;

import phoenix.Renderer;
import phoenix.geometry.Geometry;

import snow.modules.opengl.GL;
import snow.api.buffers.Float32Array;

import luxe.Log.*;
import luxe.structural.BalancedBST;

@:allow(phoenix.Renderer)
class Batcher {

    public var id : String;
    @:isVar public var layer (default, set) : Int = 0;
    public var enabled : Bool = true;

    public var geometry : BalancedBST< GeometryKey, Geometry >;
    public var groups : Map<Int, Array<BatchGroup> >;
    public var tree_changed : Bool = false;

    public var pos_list   : Float32Array;
    public var tcoord_list : Float32Array;
    public var color_list  : Float32Array;
    public var normal_list : Float32Array;

    public var max_verts : Int = 0;
    public var max_floats : Int = 0;
    public var vert_count : Int = 0;

    public var proj_attribute : GLUniformLocation;
    public var view_attribute : GLUniformLocation;

    public var tex0_attribute : GLUniformLocation;
    public var tex1_attribute : GLUniformLocation;
    public var tex2_attribute : GLUniformLocation;
    public var tex3_attribute : GLUniformLocation;
    public var tex4_attribute : GLUniformLocation;
    public var tex5_attribute : GLUniformLocation;
    public var tex6_attribute : GLUniformLocation;
    public var tex7_attribute : GLUniformLocation;

    public var renderer : Renderer;
    public var view : Camera;

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

    public function new( _r : Renderer, ?_name:String = '' ) {

        id = Luxe.utils.uniqueid();
        renderer = _r;
        sequence = ++_sequence_key;

        geometry = new BalancedBST<GeometryKey,Geometry>( geometry_compare );
        groups = new Map();

        max_verts = Std.int(Math.pow(2, 16));
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

    } //new

//Public function

    public function add_group(_group:Int, ?_pre_render:Batcher->Void, ?_post_render:Batcher->Void ) {

        if(!groups.exists(_group)) {
            groups.set(_group, new Array<BatchGroup>());
        }

        groups.get(_group).push( new BatchGroup(_pre_render, _post_render) );

    } //add_group

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

        /** :todo: this is a temporary construct as part of #119 */
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

        /** :todo: part of #119 */
    public function destroy() {

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

    public inline function shader_activate( _shader:Shader ) {

            //activate (GL.useProgram) the shader
        _shader.activate();

            //Matrices
        proj_attribute  = _shader.proj_attribute;
        view_attribute  = _shader.view_attribute;
            //Textures

        tex0_attribute = _shader.tex0_attribute;
        tex1_attribute = _shader.tex1_attribute;
        tex2_attribute = _shader.tex2_attribute;
        tex3_attribute = _shader.tex3_attribute;
        tex4_attribute = _shader.tex4_attribute;
        tex5_attribute = _shader.tex5_attribute;
        tex6_attribute = _shader.tex6_attribute;
        tex7_attribute = _shader.tex7_attribute;

            //and any uniforms they defined
        _shader.apply_uniforms();

            //undo any changes to be sure
        Luxe.renderer.state.activeTexture(GL.TEXTURE0);

    } //shader_activate


        //Run the batcher over the current list of geometry
        //and submit it to the graphics card for drawing
    public var state : phoenix.BatchState;

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

                        //Only submit if there are vertices in our list to draw
                        //but if there are the batch is dirty and needs to be submitted
                    if(pos_floats > 0) {
                        submit_current_vertex_list( state.last_geom_state.primitive_type );
                    } //if pos_list.length > 0

                } // state.update(geom)

                    // Now activate state changes (if any)
                state.activate(this);

                if(geom.visible) {
                        //try
                    visible_count++;

                        //Static batched geometry gets sent on it's own
                    if(geom.locked) {
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
                        geom.drop();
                    } //!persist_immediate && geom.immediate

                } //geom.visible

            } else { //!null && !dropped
                //:todo : If there is null (maybe dropped) geometry shouldn't they be removed or maybe
                //stashed in a diff list? Dropped come from the above drop, but null is invalid state
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

    }

    inline
    public function draw( ?persist_immediate:Bool = false ) {

        //Reset the draw count
        draw_calls = 0;
        vert_count = 0;

            //update camera if it changes anything
        view.process();

        // trace('batcher $name / view ${view.name} / viewport:${view.viewport}');

            //Set the viewport to the view
        renderer.state.viewport( view.viewport.x, view.viewport.y, view.viewport.w, view.viewport.h );

            //apply geometries
        batch( persist_immediate );

    } //draw

    inline
    public function submit_static_geometry( geom:Geometry ) {

        var _length = geom.vertices.length;
        var _submit = !geom.submitted || geom.dirty;

        if( _length == 0 ) {
            return;
        }

        var _static_verts = _length * 4;

        if(geom.static_vertex_buffer == null) {

            geom.static_vertex_buffer = GL.createBuffer();
            geom.static_tcoord_buffer = GL.createBuffer();
            geom.static_vcolor_buffer = GL.createBuffer();

            #if phoenix_use_normals
                geom.static_normal_buffer = GL.createBuffer();
            #end

        } //static_vertex_buffer == null

            //if resubmitting, rebatch
        var _pos_list: Float32Array = null;
        var _tcoord_list: Float32Array = null;
        var _color_list: Float32Array = null;
        var _normal_list: Float32Array = null;

        if(_submit) {

                //create the data streams, vert count * 4 floats per component
            _pos_list = new Float32Array(_length * 4);
            _tcoord_list = new Float32Array(_length * 4);
            _color_list = new Float32Array(_length * 4);

            #if phoenix_use_normals
                _normal_list = new Float32Array(_length * 4);
            #end

            geom.batch( 0, 0, 0, 0,
                _pos_list, _tcoord_list, _color_list, _normal_list
            );

        } //_submit

            //enable the shader attributes
        _enable_attributes();

        //these inline functions allow less branching and more imperative code
        //and because haxe inlines it actually inline it goes away at runtime

            inline function _setup_verts() {
                    //set the vertices positions in the shader, but to static buffers
                GL.bindBuffer(GL.ARRAY_BUFFER, geom.static_vertex_buffer);
                GL.vertexAttribPointer(vert_attribute, 4, GL.FLOAT, false, 0, 0);
            }

            inline function _setup_tcoords() {
                    //set the texture coordinates in the shader, but to static buffers
                GL.bindBuffer(GL.ARRAY_BUFFER, geom.static_tcoord_buffer);
                GL.vertexAttribPointer(tcoord_attribute, 4, GL.FLOAT, false, 0, 0);
            }

            inline function _setup_colors() {
                    //set the color values in the shader, but to static buffers
                GL.bindBuffer(GL.ARRAY_BUFFER, geom.static_vcolor_buffer);
                GL.vertexAttribPointer(color_attribute, 4, GL.FLOAT, false, 0, 0);
            }

            #if phoenix_use_normals
                inline function _setup_normals() {
                        //set the normal directions in the shader, but to static buffers
                    GL.bindBuffer(GL.ARRAY_BUFFER, geom.static_normal_buffer);
                    GL.vertexAttribPointer(normal_attribute, 4, GL.FLOAT, false, 0, 0);
                }
            #end

            inline function _bind_and_upload() {

                _setup_verts();
                GL.bufferData(GL.ARRAY_BUFFER, _pos_list, GL.DYNAMIC_DRAW);

                _setup_tcoords();
                GL.bufferData(GL.ARRAY_BUFFER, _tcoord_list, GL.DYNAMIC_DRAW);

                _setup_colors();
                GL.bufferData(GL.ARRAY_BUFFER, _color_list, GL.DYNAMIC_DRAW);

                #if phoenix_use_normals
                    _setup_normals();
                    GL.bufferData(GL.ARRAY_BUFFER, _normal_list, GL.DYNAMIC_DRAW);
                #end

            } //_bind_and_upload

            inline function _bind() {
                _setup_verts();
                _setup_tcoords();
                _setup_colors();
                #if phoenix_use_normals
                    _setup_normals();
                #end
            }

        if(_submit) {
            _bind_and_upload();
        } else {
            _bind();
        }

        GL.drawArrays(
            geom.primitive_type, 0,
            phoenix.utils.Rendering.get_elements_for_type(geom.primitive_type, _static_verts)
        );

        _pos_list = null;
        _tcoord_list = null;
        _color_list = null;
        _normal_list = null;

            //Disable attributes
        _disable_attributes();
            //increase the stats
        draw_calls++;
        static_batched_count++;

            //clear the geometry flags
        geom.dirty = false;
        geom.submitted = true;

    } //submit_static_geometry

    inline
    public function submit_current_vertex_list( type : PrimitiveType ) {

        if( pos_floats == 0 ) {
            return;
        }

        if( pos_floats > max_floats ) {
            throw "uh oh, somehow too many floats are being submitted (max:$max_floats, attempt:$pos_floats).";
        }

        _enable_attributes();

        var pb = GL.createBuffer();
        var cb = GL.createBuffer();
        var tb = GL.createBuffer();

        #if phoenix_use_normals
            var nb = GL.createBuffer();
        #end

        GL.bindBuffer(GL.ARRAY_BUFFER, pb );
        GL.vertexAttribPointer( 0, 4, GL.FLOAT, false, 0, 0 );
        GL.bufferData( GL.ARRAY_BUFFER , new Float32Array(pos_list.buffer, 0, pos_floats), GL.STREAM_DRAW);

        GL.bindBuffer(GL.ARRAY_BUFFER, tb );
        GL.vertexAttribPointer( 1, 4, GL.FLOAT, false, 0, 0 );
        GL.bufferData( GL.ARRAY_BUFFER , new Float32Array(tcoord_list.buffer, 0, tcoord_floats), GL.STREAM_DRAW);

        GL.bindBuffer(GL.ARRAY_BUFFER, cb );
        GL.vertexAttribPointer( 2, 4, GL.FLOAT, false, 0, 0 );
        GL.bufferData( GL.ARRAY_BUFFER , new Float32Array(color_list.buffer, 0, color_floats), GL.STREAM_DRAW);

        #if phoenix_use_normals
            GL.bindBuffer(GL.ARRAY_BUFFER, nb );
            GL.bufferData( GL.ARRAY_BUFFER , new Float32Array(normal_list.buffer, 0, normal_floats), GL.STREAM_DRAW);
            GL.vertexAttribPointer( 3, 4, GL.FLOAT, false, 0, 0 );
        #end

            //Draw
        GL.drawArrays(
            type, 0,
            phoenix.utils.Rendering.get_elements_for_type(type, pos_floats)
        );

            //Disable attributes
        _disable_attributes();

        GL.deleteBuffer(pb);
        GL.deleteBuffer(cb);
        GL.deleteBuffer(tb);

        #if phoenix_use_normals
            GL.deleteBuffer(nb);
        #end

        pos_floats = 0;
        tcoord_floats = 0;
        color_floats = 0;
        normal_floats = 0;

        draw_calls++;

    } //submit_current_vertex_list

//Batch related helper functions

    inline
    function geometry_batch( geom:Geometry ) {

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

        pos_floats       += geom.vertices.length * 4;
        tcoord_floats    += geom.vertices.length * 4;
        color_floats     += geom.vertices.length * 4;
        normal_floats    += geom.vertices.length * 4;

    } //geometry_batch


//Shader related attribute setup

    @:noCompletion
    inline
    public function _enable_attributes() {

            //Update the GL Matrices
        GL.uniformMatrix4fv( proj_attribute, false, view.proj_arr );
        GL.uniformMatrix4fv( view_attribute, false, view.view_inverse_arr );

    } //_enable_attributes

    @:noCompletion
    inline
    public function _disable_attributes() {

    } //_disable_attributes

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

            //by this point, both group and depth are equal
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

            //by this point, both group and depth are equal
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
            _debug('\t   geometry: ' + geom.id + ' / ' + geom.group + ' / ' + geom.depth + ' / ' + geom.uuid );
            _debug('\t\t' + geom.key);
        }
    }

    static inline var vert_attribute   : Int = 0;
    static inline var tcoord_attribute : Int = 1;
    static inline var color_attribute  : Int = 2;
    static inline var normal_attribute : Int = 3;

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

class BatchGroup {
    public function new(_pre, _post) {
        pre_render = _pre;
        post_render = _post;
    }
    public var pre_render : Batcher -> Void;
    public var post_render : Batcher -> Void;
}

package phoenix;

import snow.utils.ByteArray;
import phoenix.geometry.Geometry;
import phoenix.geometry.GeometryState;
import phoenix.geometry.Vertex;
import phoenix.Renderer;
import phoenix.BatchState;

import snow.render.opengl.GL;
import snow.utils.Float32Array;

import luxe.structural.BalancedBST;

import luxe.Log.log;
import luxe.Log._debug;

@:enum abstract PrimitiveType(Int) from Int to Int {

    var none            = 0;
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

    var add                     = GL.FUNC_ADD;
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

class Batcher {

    public var id : String;
    @:isVar public var layer (default, set) : Int = 0;
    public var enabled : Bool = true;

    public var geometry : BalancedBST< GeometryKey, Geometry >;
    public var groups : Map<Int, Array<BatchGroup> >;
    public var tree_changed : Bool = false;

    public var vertlist     : Float32Array;
    public var tcoordlist   : Float32Array;
    public var colorlist    : Float32Array;
    public var normallist   : Float32Array;

    public var static_vertlist : Float32Array;
    public var static_tcoordlist : Float32Array;
    public var static_colorlist : Float32Array;
    public var static_normallist : Float32Array;

        //The current indexes into the memory buffers
    public var vert_floats    : Int = 0;
    public var tcoord_floats  : Int = 0;
    public var color_floats   : Int = 0;
    public var normal_floats  : Int = 0;

        //The current indexes into the memory buffers
    public var static_vert_floats    : Int = 0;
    public var static_tcoord_floats  : Int = 0;
    public var static_color_floats   : Int = 0;
    public var static_normal_floats  : Int = 0;

        //the current number of active buffers in the ring
    public var buffer_count : Int = 6;

        //the index we are on
    public var buffer_index : Int = 0;
    public var max_verts : Int = 0;
    public var max_floats : Int = 0;
    public var vert_count : Int = 0;

    public var vertexBuffers : Array<GLBuffer>;
    public var tcoordBuffers : Array<GLBuffer>;
    public var vcolorBuffers : Array<GLBuffer>;
    // public var normalBuffers : Array<GLBuffer>;

    public var projectionmatrix_attribute : GLUniformLocation;
    public var modelviewmatrix_attribute : GLUniformLocation;

    public var vert_attribute   : Int = 0;
    public var tcoord_attribute : Int = 1;
    public var color_attribute  : Int = 2;
    // public var normal_attribute : Int = 3;

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
    @:noCompletion public var sequence : Int = -1;

    public function new( _r : Renderer, ?_name:String = '' ) {

        id = Luxe.utils.uniqueid();
        renderer = _r;
        sequence = ++_sequence_key;

        geometry = new BalancedBST<GeometryKey,Geometry>( geometry_compare );
        groups = new Map();

        max_verts = Std.int(Math.pow(2, 16));
        max_floats = max_verts << 2;

            //these are expecting elements in floats, so each vert etc has 4 floats
        vertlist = new Float32Array( max_floats );
        tcoordlist = new Float32Array( max_floats );
        colorlist = new Float32Array( max_floats );
        // normallist = new Float32Array( max_floats );

        static_vertlist = new Float32Array( max_floats );
        static_tcoordlist = new Float32Array( max_floats );
        static_colorlist = new Float32Array( max_floats );
        // static_normallist = new Float32Array( max_floats );

            //The default view so we see stuff
        view = renderer.camera;

            //Create the attribute buffers
        vertexBuffers = [];
        tcoordBuffers = [];
        vcolorBuffers = [];
        // normalBuffers = [];

        for(i in 0 ... buffer_count) {

            var _vb = GL.createBuffer();
            var _tb = GL.createBuffer();
            var _cb = GL.createBuffer();
            var _nb = GL.createBuffer();

    //VERTEX
            GL.bindBuffer(GL.ARRAY_BUFFER, _vb);
            GL.bufferData(GL.ARRAY_BUFFER, vertlist, GL.STATIC_DRAW);
    //TCOORD
            GL.bindBuffer(GL.ARRAY_BUFFER, _tb);
            GL.bufferData(GL.ARRAY_BUFFER, tcoordlist, GL.STATIC_DRAW);
    //COLOR
            GL.bindBuffer(GL.ARRAY_BUFFER, _cb);
            GL.bufferData(GL.ARRAY_BUFFER, colorlist, GL.STATIC_DRAW);
    //NORMALS
            // GL.bindBuffer(GL.ARRAY_BUFFER, _nb);
            // GL.bufferData(GL.ARRAY_BUFFER, normallist, GL.STATIC_DRAW);

            vertexBuffers.push(_vb);
            tcoordBuffers.push(_tb);
            vcolorBuffers.push(_cb);
            // normalBuffers.push(_nb);

        } //for the total buffer count


        GL.enableVertexAttribArray( vert_attribute );
        GL.enableVertexAttribArray( tcoord_attribute );
        GL.enableVertexAttribArray( color_attribute );
        // GL.enableVertexAttribArray( normal_attribute );

            //A default name
        if(_name.length == 0) {
            name = Luxe.utils.uniqueid();
        } else {
            name = _name;
        }

    }

    public function set_layer( _layer:Int ) : Int {

            //set the value
        layer = _layer;
            //re-sort the list
        renderer.batchers.sort( renderer.sort_batchers );

            //return value
        return layer;

    } //set_layer

    function toString() {
        return "Batcher(" + name + ")";
    }

        //this sorts the batchers in a list by layer
    public function compare(other:Batcher) {

        if(layer == other.layer) return 0;
        if(layer < other.layer) return -1;

        return 1;

    } //compare

    public function add_group(_group:Int, ?_pre_render:Batcher->Void, ?_post_render:Batcher->Void ) {

        if(!groups.exists(_group)) {
            groups.set(_group, new Array<BatchGroup>());
        }

        groups.get(_group).push( new BatchGroup(_pre_render, _post_render) );

    } //add_group

    public function compare_rule_to_string(r:Int) : String {
        switch(r) {
            case 0: {
                return "same";
            }
            case 1: {
                return "depth <";
            }
            case 2: {
                return "depth >";
            }

            case 3: {
                return "shader <";
            }
            case 4: {
                return "shader >";
            }
            case 5: {
                return "shader s._ >";
            }
            case 6: {
                return "shader _.s <";
            }

            case 7: {
                return "texture <";
            }
            case 8: {
                return "texture >";
            }
            case 9: {
                return "texture t._ >";
            }
            case 10: {
                return "texture _.t <";
            }

            case 11: {
                return "primitive <";
            }
            case 12: {
                return "primitive >";
            }
            case 13: {
                return "unclipped";
            }
            case 14: {
                return "clipped";
            }
            case 15: {
                return "timestamp <";
            }
            case 16: {
                return "timestamp >";
            }
            case 17: {
                return "timestamp ==";
            }
            case 18: {
                return "sequence <";
            }
            case 19: {
                return "sequence >";
            }
            case 20: {
                return "fallback";
            }
        }

        return "unknown";

    }

    public function compare_rule( a:GeometryKey, b:GeometryKey ) : Int {

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
    }

    public function geometry_compare( a:GeometryKey, b:GeometryKey ) : Int {

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

    public function shader_activate( _shader:Shader ) {

            //activate (GL.useProgram) the shader
        _shader.activate();

            //Matrices
        projectionmatrix_attribute  = _shader.projectionmatrix_attribute;
        modelviewmatrix_attribute   = _shader.modelviewmatrix_attribute;
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
    public var state : BatchState;
    public function batch( persist_immediate : Bool = false ) {

        //reset render stats before we start
        dynamic_batched_count = 0;
        static_batched_count = 0;
        visible_count = 0;

        vert_floats = 0;
        tcoord_floats = 0;
        color_floats = 0;
        normal_floats = 0;

            //The current batch state values
        state = new BatchState(this);
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
                    if(vert_floats > 0) {
                        submit_current_vertex_list( state.last_geom_state.primitive_type );
                    } //if vertlist.length > 0

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
        if(vert_floats > 0 && geom != null) {

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

    public function submit_static_geometry( geom:Geometry ) {

            //Don't bother when it's empty
        if( geom.vertices.length == 0 ) {
            return;
        }

            //and counts
        static_vert_floats = 0; static_tcoord_floats = 0; static_color_floats = 0; 
        // static_normal_floats = 0;

        if(!geom.submitted || geom.dirty) {

                //now batch the geometry into the static arrays
            geometry_batch_static( geom );

        } else {

            static_vert_floats    = geom.vertices.length * 4;
            static_tcoord_floats  = geom.vertices.length * 4;
            static_color_floats   = geom.vertices.length * 4;
            // static_normal_floats  = geom.vertices.length * 4;

        }

            //ensure the geometry has buffers already
        if(geom.static_vertex_buffer == null) {
            geom.static_vertex_buffer = GL.createBuffer();
            geom.static_tcoord_buffer = GL.createBuffer();
            geom.static_vcolor_buffer = GL.createBuffer();
            // geom.static_normal_buffer = GL.createBuffer();
        }

            //enable the shader attributes
        _enable_attributes();

            //set the vertices positions in the shader, but to static buffers
        GL.bindBuffer(GL.ARRAY_BUFFER, geom.static_vertex_buffer);
        GL.vertexAttribPointer(vert_attribute, 4, GL.FLOAT, false, 0, 0);

        if(!geom.submitted || geom.dirty) {
            GL.bufferData(GL.ARRAY_BUFFER, static_vertlist, GL.STATIC_DRAW);
        }

            //set the texture coordinates in the shader, but to static buffers
        GL.bindBuffer(GL.ARRAY_BUFFER, geom.static_tcoord_buffer);
        GL.vertexAttribPointer(tcoord_attribute, 4, GL.FLOAT, false, 0, 0);

        if(!geom.submitted || geom.dirty) {
            GL.bufferData(GL.ARRAY_BUFFER, static_tcoordlist, GL.STATIC_DRAW);
        }

            //set the color values in the shader, but to static buffers
        GL.bindBuffer(GL.ARRAY_BUFFER, geom.static_vcolor_buffer);
        GL.vertexAttribPointer(color_attribute, 4, GL.FLOAT, false, 0, 0);

        if(!geom.submitted || geom.dirty) {
            GL.bufferData(GL.ARRAY_BUFFER, static_colorlist, GL.STATIC_DRAW);
        }

        //     //set the normal directions in the shader, but to static buffers
        // GL.bindBuffer(GL.ARRAY_BUFFER, geom.static_normal_buffer);
        // GL.vertexAttribPointer(normal_attribute, 4, GL.FLOAT, false, 0, 0);

        // if(!geom.submitted || geom.dirty) {
        //     GL.bufferData(GL.ARRAY_BUFFER, static_normallist, GL.STATIC_DRAW);
        // }

            //Draw
        GL.drawArrays(
            geom.primitive_type, 0,
            phoenix.utils.Rendering.get_elements_for_type(geom.primitive_type, static_vert_floats)
        );

            //Disable attributes
        _disable_attributes();
            //increase the stats
        draw_calls++;
        static_batched_count++;

            //and counts
        static_vert_floats = 0;
        static_tcoord_floats = 0;
        static_color_floats = 0;
        // static_normal_floats = 0;

            //clear the geometry flags
        geom.dirty = false;
        geom.submitted = true;

    } //submit_static_buffer_object


    public function submit_current_vertex_list( type : PrimitiveType ) {

        if( vert_floats == 0 ) {
                //No verts?
            return;
        }

        if( vert_floats > max_floats ) {
            throw "uh oh, somehow too many floats are being submitted (max:$max_floats, attempt:$vert_floats).";
        }

            //Enable atttributes
        _enable_attributes();

        GL.bindBuffer(GL.ARRAY_BUFFER, vertexBuffers[buffer_index] );
        GL.vertexAttribPointer( 0, 4, GL.FLOAT, false, 0, 0 );
        GL.bufferSubData( GL.ARRAY_BUFFER , 0, new Float32Array(vertlist.buffer, 0, vert_floats) );

        GL.bindBuffer(GL.ARRAY_BUFFER, tcoordBuffers[buffer_index] );
        GL.vertexAttribPointer( 1, 4, GL.FLOAT, false, 0, 0 );
        GL.bufferSubData( GL.ARRAY_BUFFER , 0, new Float32Array(tcoordlist.buffer, 0, tcoord_floats) );

        GL.bindBuffer(GL.ARRAY_BUFFER, vcolorBuffers[buffer_index] );
        GL.vertexAttribPointer( 2, 4, GL.FLOAT, false, 0, 0 );
        GL.bufferSubData( GL.ARRAY_BUFFER , 0, new Float32Array(colorlist.buffer, 0, color_floats) );

        // GL.bindBuffer(GL.ARRAY_BUFFER, normalBuffers[buffer_index] );
        // GL.vertexAttribPointer( 3, 4, GL.FLOAT, false, 0, 0 );
        // GL.bufferSubData( GL.ARRAY_BUFFER , 0, new Float32Array(normallist.buffer, 0, normal_floats) );

            //Draw
        GL.drawArrays(
            type, 0,
            phoenix.utils.Rendering.get_elements_for_type(type, vert_floats)
        );

            //Disable attributes
        _disable_attributes();

        // cycle the buffers in use
        buffer_index++;
        if(buffer_index >= buffer_count) {
            buffer_index = 0;
        }

            //Reset counts
        vert_floats = 0; tcoord_floats = 0; color_floats = 0; normal_floats= 0;
            //Increase stats
        draw_calls++;

    } //submit_current_vertex_list

//Batch related helper functions

    function geometry_batch( geom:Geometry ) {

            //vert_floats is in element count (so/4)
        var _count_after = geom.vertices.length+(vert_floats/4);

            //submit the current batch if we exceed the max buffer size
        if(_count_after > max_verts) {
            submit_current_vertex_list( geom.primitive_type );
        }

        geom.batch(
            vert_floats,    tcoord_floats,  color_floats,   normal_floats,
            vertlist,       tcoordlist,     colorlist,      normallist
        );

        vert_floats      += geom.vertices.length * 4;
        tcoord_floats    += geom.vertices.length * 4;
        color_floats     += geom.vertices.length * 4;
        // normal_floats    += geom.vertices.length * 4;

    } //geometry_batch

    function geometry_batch_static( geom:Geometry ) {

        geom.batch(
            static_vert_floats,     static_tcoord_floats,   static_color_floats,    static_normal_floats,
            static_vertlist,        static_tcoordlist,      static_colorlist,       static_normallist
        );

        static_vert_floats      += geom.vertices.length * 4;
        static_tcoord_floats    += geom.vertices.length * 4;
        static_color_floats     += geom.vertices.length * 4;
        // static_normal_floats    += geom.vertices.length * 4;

    } //geometry_batch_static

//Shader related attribute setup

    @:noCompletion public function _enable_attributes() {

            //Update the GL Matrices
        GL.uniformMatrix4fv( projectionmatrix_attribute, false, view.projection_float32array );
        GL.uniformMatrix4fv( modelviewmatrix_attribute, false, view.view_inverse_float32array );

    } //_enable_attributes

    function _disable_attributes() {

            //Unset

    } //_disable_attributes

}

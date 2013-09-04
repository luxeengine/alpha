package phoenix;

import phoenix.geometry.Geometry;
import phoenix.geometry.GeometryState;
import phoenix.geometry.Vertex;
import phoenix.Renderer;
import phoenix.BatchState;

import lime.gl.GL;
import lime.gl.GLBuffer;
import lime.utils.Float32Array;

import luxe.structures.BinarySearchTree;

enum PrimitiveType {
    none;
    line_strip;
    line_loop;
    triangle_strip;
    triangles;
    triangle_fan;
}

enum BlendMode {
    zero; 
    one;  
    src_color;
    one_minus_src_color;
    src_alpha;          
    one_minus_src_alpha;
    dst_alpha;
    one_minus_dst_alpha; 
    dst_color;
    one_minus_dst_color;
    src_alpha_saturate;
}

class BatchGroup {
    public function new(_pre, _post) {
        pre_render = _pre;
        post_render = _post;
    }
    public var pre_render : Batcher -> Void;
    public var post_render : Batcher -> Void;
}

class Batcher {

    public var layer : Int = 0;
    public var enabled : Bool = true;

    public var geometry : BinarySearchTree<Geometry,Geometry>;
    public var groups : Map<Int, Array<BatchGroup> >;
    public var tree_changed : Bool = false;

    public var vert_list : Array<Float>;
    public var tcoord_list : Array<Float>;
    public var color_list : Array<Float>;
    public var normal_list : Array<Float>;

    public var vertexBuffer : GLBuffer;
    public var tcoordBuffer : GLBuffer;
    public var vcolorBuffer : GLBuffer;
    public var normalBuffer : GLBuffer;

    public var projectionmatrix_attribute : Dynamic; 
    public var modelviewmatrix_attribute : Dynamic;

    public var vert_attribute : Dynamic;
    public var tcoord_attribute : Dynamic;
    public var color_attribute : Dynamic;
    public var normal_attribute : Dynamic;
    public var tex0_attribute : Dynamic;

    public var renderer : Renderer;
    public var view : Camera;

    public var draw_calls : Int = 0;
    public var dynamic_batched_count : Int = 0;
    public var static_batched_count : Int = 0;
    public var enabled_count : Int = 0;

    public var log : Bool = false;
    public var name : String = '';

    public function new( _r : Renderer, ?_name:String = '' ) {

        renderer = _r;

        geometry = new BinarySearchTree<Geometry,Geometry>( geometry_compare );
        groups = new Map();

            //Our batch lists
        vert_list = new Array<Float>();
        tcoord_list = new Array<Float>();
        color_list = new Array<Float>();
        normal_list = new Array<Float>();

            //The default view so we see stuff
        view = renderer.default_camera;

            //Create the attribute buffers
        vertexBuffer = GL.createBuffer();
        tcoordBuffer = GL.createBuffer();
        vcolorBuffer = GL.createBuffer();
        normalBuffer = GL.createBuffer();

            //A default name
        if(_name.length == 0) {
            name = Luxe.utils.uuid();
        } else {
            name = _name;
        }

    }

    public function toString() {
        return "Batcher(" + name + ")";
    }

        //this sorts the batchers in a list by layer
    public function compare(other:Batcher) {
        if(layer == other.layer) return 0;
        if(layer < other.layer) return -1;
        return 1;
     }

    public function add_group(_group:Int, _pre_render:Batcher->Void, _post_render:Batcher->Void ) {
        if(!groups.exists(_group)) {
            groups.set(_group, new Array<BatchGroup>());
        }

        groups.get(_group).push( new BatchGroup(_pre_render, _post_render) );
    }

    public function l(v:Dynamic) {
        // trace(v);
    }


    public function blend_mode_from_BlendMode(_b:BlendMode) {

        switch(_b) {
            case zero:
                return GL.ZERO;
            case one:
                return GL.ONE;
            case src_color:
                return GL.SRC_COLOR;
            case one_minus_src_color:
                return GL.ONE_MINUS_SRC_COLOR;
            case src_alpha:
                return GL.SRC_ALPHA;
            case one_minus_src_alpha:
                return GL.ONE_MINUS_SRC_ALPHA;
            case dst_alpha:
                return GL.DST_ALPHA;
            case one_minus_dst_alpha:
                return GL.ONE_MINUS_DST_ALPHA;
            case dst_color:
                return GL.DST_COLOR;
            case one_minus_dst_color:
                return GL.ONE_MINUS_DST_COLOR;
            case src_alpha_saturate:
                return GL.SRC_ALPHA_SATURATE;
        }
    }

    public function blend_mode(?_src_mode:BlendMode = null, _dst_mode:BlendMode = null) {
        if(_src_mode == null) _src_mode = BlendMode.src_alpha;
        if(_dst_mode == null) _dst_mode = BlendMode.one_minus_src_alpha;

        var _src = blend_mode_from_BlendMode(_src_mode);
        var _dest = blend_mode_from_BlendMode(_dst_mode);

        GL.blendFunc(_src, _dest);
    }

    public function geometry_compare( a:Geometry, b:Geometry ) : Int {
        if(a == b) return 0;
        return a.compare( b );
    }


    public function add( _geom:Geometry, ?_force_add:Bool = false ) {
        
        if( geometry.find(_geom) == null || _force_add ) {
                //Only add if not already there
            if( !Lambda.has(_geom.batchers, this) ) {
                _geom.batchers.push(this);
            }
                //Insert into our list
            geometry.insert( _geom, _geom );

                //Make sure it is flagged
            _geom.added = true;

                //and this local test flag
            tree_changed = true;

        } else {
            trace("Warning : Attempting to add geometry to the same batcher twice. " + _geom);
        }
    } //add

    public function remove( _geom:Geometry, ?_remove_batcher_from_geometry:Bool = true ) {
        
        if(_remove_batcher_from_geometry) {
            _geom.batchers.remove(this);
            if(_geom.batchers.length == 0) {
                _geom.added = false;
            }
        } //_remove_batcher_from_geometry

        var _size = geometry.size();

        geometry.remove( _geom );

        tree_changed = true;

        var _size_after = geometry.size();

        if( _size_after != _size-1 ) {
            if(this.name == 'default_batcher') {
                trace("WARNING : geometry not found in list, won't be removed! " + _geom.short_id());
            }
        }

    } //remove2

    public function shader_activate( _shader:Shader ) {
            
            //activate (GL.useProgram) the shader
        _shader.activate(); 

            //Vert, UV, Normals
        vert_attribute = GL.getAttribLocation( _shader.program , "vertexPosition");
        tcoord_attribute = GL.getAttribLocation( _shader.program, "vertexTCoord");
        color_attribute = GL.getAttribLocation( _shader.program, "vertexColor");
        normal_attribute = GL.getAttribLocation( _shader.program, "vertexNormal");

            //Matrices
        projectionmatrix_attribute = GL.getUniformLocation( _shader.program, "projectionMatrix");
        modelviewmatrix_attribute = GL.getUniformLocation( _shader.program, "modelViewMatrix");

            //Textures
        tex0_attribute = GL.getUniformLocation( _shader.program, "tex0" );

            //for now todo
        GL.activeTexture(GL.TEXTURE0);
        GL.uniform1i(tex0_attribute, 0);

    }

        //Run the batcher over the current list of geometry
        //and submit it to the graphics card for drawing
    public function batch( persist_immediate : Bool = false ) {

            //reset render stats before we start
        dynamic_batched_count = 0;
        static_batched_count = 0;
        enabled_count = 0;

            //The current batch state values
        var state : BatchState = new BatchState(this);

            //The batch lists to submit
        var vertlist : Array<Float> = new Array<Float>();
        var tcoordlist : Array<Float> = new Array<Float>();
        var colorlist : Array<Float> = new Array<Float>();
        var normallist : Array<Float> = new Array<Float>();

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
                    if(vertlist.length > 0) {
                        submit_vertex_list( vertlist, tcoordlist, colorlist, normallist, state.last_geom_state.primitive_type );
                    } //if vertlist.length > 0

                } // state.update(geom)
                
                    // Now activate state changes (if any)
                state.activate(this);

                if(geom.enabled) {
                    //try

                    enabled_count++;

                        //Static batched geometry gets sent on it's own
                    if(geom.locked) {
                        submit_static_buffer_object(geom);
                    }
                        // Do not accumulate for tri strips, line strips, line loops, triangle fans, quad strips, or polygons 
                    else if( geom.primitive_type == PrimitiveType.line_strip ||
                             geom.primitive_type == PrimitiveType.line_loop ||
                             geom.primitive_type == PrimitiveType.triangle_strip ||
                             geom.primitive_type == PrimitiveType.triangle_fan ) {

                                // doing this with the same list is fine because the primitive type causes a batch break anyways.
                            geom.batch( vertlist, tcoordlist, colorlist, normallist );
                                // Send it on, this will also clear the list for the next geom so it doesn't acccumlate as usual.
                            submit_vertex_list( vertlist, tcoordlist, colorlist, normallist, geom.primitive_type );
                    }

                        // Accumulate, this is standard geometry 
                    else {
                        geom.batch( vertlist, tcoordlist, colorlist, normallist );
                        dynamic_batched_count++;
                    }   

                    //catch

                        // If the geometry is immediate get rid of it (unless the flag to keep immediate geometry)
                        // in the list was specified...i.e for drawing multiple passes etc
                    if( !persist_immediate && geom.immediate ) {
                        geom.drop();
                    } //!persist_immediate && geom.immediate

                } //geom.enabled

            } else { //!null && !dropped
                //todo: If there is null or dropped geometry shouldn't they be removed or maybe
                //stashed in a diff list? Although this is probably from the above
            }

        } //geom list

            //If there is anything left in the vertex buffer, submit it.
        if(vertlist.length > 0 && geom != null) {

                //Make sure the state matches this geometry
            state.update(geom);
                //And the state is active for renderering
            state.activate( this );

                //submit the geometry to be rendered
            submit_vertex_list( vertlist, tcoordlist, colorlist, normallist, state.last_geom_state.primitive_type );
        }    

            //disable any states set by the batches
        state.deactivate(this);
            //cleanup
        state = null;

    }

    public function draw( persist_immediate:Bool = false ) {    

            //Reset the draw count
        draw_calls = 0;

            //update camera if it changes anything
        view.process();

            //Set the viewport to the view todo:this x any y should be from the camera?
        GL.viewport( 0, 0, cast view.size.x, cast view.size.y );

            //apply geometries
        batch( persist_immediate );

    } //draw


    public function get_opengl_primitive_type( type:PrimitiveType ) {
        switch( type ) {
            case line_strip:
                return GL.LINE_STRIP;
            case line_loop:
                return GL.LINE_LOOP;
            case triangle_strip:
                return GL.TRIANGLE_STRIP;
            case triangles:
                return GL.TRIANGLES;
            case triangle_fan:            
                return GL.TRIANGLE_FAN;
            case none:
                return GL.TRIANGLE_STRIP;
        }
    }

    private function _enable_attributes() {

            //Update the GL Matrices
        GL.uniformMatrix4fv( projectionmatrix_attribute, false, view.projection_matrix.float32array() );
        GL.uniformMatrix4fv( modelviewmatrix_attribute, false, view.modelview_matrix.clone().getInverse(view.modelview_matrix).float32array() );

            //Set shader attributes
        GL.enableVertexAttribArray(vert_attribute);
        GL.enableVertexAttribArray(tcoord_attribute);
        GL.enableVertexAttribArray(color_attribute);
        GL.enableVertexAttribArray(normal_attribute);

    }

    private function _disable_attributes() {

            //Unset
        GL.disableVertexAttribArray(vert_attribute);
        GL.disableVertexAttribArray(tcoord_attribute);
        GL.disableVertexAttribArray(color_attribute);
        GL.disableVertexAttribArray(normal_attribute);

    }

    public function submit_static_buffer_object( geom:Geometry ) {        

        if( geom.vertices.length == 0 ) {
            return;
        }

        var vertlist : Array<Float> = new Array<Float>();
        var tcoordlist : Array<Float> = new Array<Float>();
        var colorlist : Array<Float> = new Array<Float>();
        var normallist : Array<Float> = new Array<Float>(); 

        geom.batch( vertlist, tcoordlist, colorlist, normallist );

            //check if the geometry has buffers
        if(geom.static_vertex_buffer == null) {
            geom.static_vertex_buffer = GL.createBuffer();
            geom.static_tcoord_buffer = GL.createBuffer();
            geom.static_vcolor_buffer = GL.createBuffer();
            geom.static_normal_buffer = GL.createBuffer();
        }

        _enable_attributes();

            //set the vertices positions in the shader, but to static buffers
        GL.bindBuffer(GL.ARRAY_BUFFER, geom.static_vertex_buffer);
        GL.vertexAttribPointer(vert_attribute, 3, GL.FLOAT, false, 0, 0);

        if(!geom.submitted || geom.dirty) {
            GL.bufferData(GL.ARRAY_BUFFER, new Float32Array(vertlist), GL.STATIC_DRAW);
        }

            //set the texture coordinates in the shader, but to static buffers
        GL.bindBuffer(GL.ARRAY_BUFFER, geom.static_tcoord_buffer);
        GL.vertexAttribPointer(tcoord_attribute, 2, GL.FLOAT, false, 0, 0);

        if(!geom.submitted || geom.dirty) {
            GL.bufferData(GL.ARRAY_BUFFER, new Float32Array(tcoordlist), GL.STATIC_DRAW);
        }

            //set the color values in the shader, but to static buffers
        GL.bindBuffer(GL.ARRAY_BUFFER, geom.static_vcolor_buffer);
        GL.vertexAttribPointer(color_attribute, 4, GL.FLOAT, false, 0, 0);

        if(!geom.submitted || geom.dirty) {
            GL.bufferData(GL.ARRAY_BUFFER, new Float32Array(colorlist), GL.STATIC_DRAW);
        }

            //set the normal directions in the shader, but to static buffers
        GL.bindBuffer(GL.ARRAY_BUFFER, geom.static_normal_buffer);
        GL.vertexAttribPointer(normal_attribute, 3, GL.FLOAT, false, 0, 0);

        if(!geom.submitted || geom.dirty) {
            GL.bufferData(GL.ARRAY_BUFFER, new Float32Array(normallist), GL.STATIC_DRAW);
        }

            //Draw
        GL.drawArrays( get_opengl_primitive_type(geom.primitive_type) , 0, Std.int(vertlist.length/3) );

            //Disable attributes
        _disable_attributes();
        
            //clear the vlist
        vertlist.splice(0, vertlist.length);    
        tcoordlist.splice(0, tcoordlist.length);    
        colorlist.splice(0, colorlist.length);    
        normallist.splice(0, normallist.length);
        vertlist = null;
        tcoordlist = null;
        colorlist = null;
        normallist = null;    

        draw_calls++;

            //clear the geometry flags
        geom.dirty = false;
        geom.submitted = true;
            //keep track 
        static_batched_count++;

    } //submit_static_buffer_object

    public function submit_vertex_list( 
        vertlist:Array<Float>, tcoordlist:Array<Float>, 
        colorlist:Array<Float>, normallist:Array<Float>, type : PrimitiveType ) {
            
            //Nothing useful here so just return
        if( vertlist.length == 0 ) {
            return;
        }

        l("\t\t\t\t\t\t data : vertexBuffer " + vertexBuffer);
        l("\t\t\t\t\t\t data : tcoordBuffer " + tcoordBuffer);
        l("\t\t\t\t\t\t data : vcolorBuffer " + vcolorBuffer);
        l("\t\t\t\t\t\t data : normalBuffer " + normalBuffer);
        l("\t\t\t\t\t\t data : vert_attribute " + vert_attribute);
        l("\t\t\t\t\t\t data : tcoord_attribute " + tcoord_attribute);
        l("\t\t\t\t\t\t data : color_attribute " + color_attribute);
        l("\t\t\t\t\t\t data : normal_attribute " + normal_attribute);

            //Enable atttributes
        _enable_attributes();

            //set the vertices positions in the shader
        GL.bindBuffer(GL.ARRAY_BUFFER, vertexBuffer);
        GL.vertexAttribPointer(vert_attribute, 3, GL.FLOAT, false, 0, 0);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(vertlist), GL.DYNAMIC_DRAW);

            //set the texture coordinates in the shader
        GL.bindBuffer(GL.ARRAY_BUFFER, tcoordBuffer);
        GL.vertexAttribPointer(tcoord_attribute, 2, GL.FLOAT, false, 0, 0);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(tcoordlist), GL.DYNAMIC_DRAW);        

            //set the color values in the shader
        GL.bindBuffer(GL.ARRAY_BUFFER, vcolorBuffer);
        GL.vertexAttribPointer(color_attribute, 4, GL.FLOAT, false, 0, 0);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(colorlist), GL.DYNAMIC_DRAW);        

            //set the normal directions in the shader
        GL.bindBuffer(GL.ARRAY_BUFFER, normalBuffer);
        GL.vertexAttribPointer(normal_attribute, 3, GL.FLOAT, false, 0, 0);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(normallist), GL.DYNAMIC_DRAW);        

            //Draw
        GL.drawArrays( get_opengl_primitive_type(type) , 0, Std.int(vertlist.length/3) );

            //Disable attributes
        _disable_attributes();
        
            //clear the vlist
        vertlist.splice(0, vertlist.length);    
        tcoordlist.splice(0, tcoordlist.length);    
        colorlist.splice(0, colorlist.length);    
        normallist.splice(0, normallist.length);    

        draw_calls++;

            //temp debug
        // trace('draw call increase, now at ' + draw_calls);
    }
}
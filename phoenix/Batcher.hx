package phoenix;

import lime.utils.ByteArray;
import phoenix.geometry.Geometry;
import phoenix.geometry.GeometryState;
import phoenix.geometry.Vertex;
import phoenix.Renderer;
import phoenix.BatchState;

import lime.gl.GL;
import lime.gl.GLBuffer;
import lime.utils.Float32Array;

import luxe.structural.BalancedBinarySearchTree;

enum PrimitiveType {
    none;
    line_strip;
    line_loop;
    triangle_strip;
    triangles;
    triangle_fan;
    points;
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

    public var geometry : BalancedBinarySearchTree< GeometryKey, Geometry >;
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
    public var verts    : Int = 0;
    public var tcoords  : Int = 0;
    public var colors   : Int = 0;
    public var normals  : Int = 0;

        //The current indexes into the memory buffers
    public var static_verts    : Int = 0;
    public var static_tcoords  : Int = 0;
    public var static_colors   : Int = 0;
    public var static_normals  : Int = 0;

        //the current number of active buffers in the ring
    public var buffer_count : Int = 8;

        //the index we are on
    public var buffer_index : Int = 0;

    public var vertexBuffers : Array<GLBuffer>;
    public var tcoordBuffers : Array<GLBuffer>;
    public var vcolorBuffers : Array<GLBuffer>;
    public var normalBuffers : Array<GLBuffer>;

    public var projectionmatrix_attribute : Dynamic; 
    public var modelviewmatrix_attribute : Dynamic;

    public var vert_attribute   : Int = 0;
    public var tcoord_attribute : Int = 1;
    public var color_attribute  : Int = 2;
    public var normal_attribute : Int = 3;

    public var tex0_attribute : Dynamic;
    public var tex1_attribute : Dynamic;
    public var tex2_attribute : Dynamic;
    public var tex3_attribute : Dynamic;
    public var tex4_attribute : Dynamic;
    public var tex5_attribute : Dynamic;
    public var tex6_attribute : Dynamic;
    public var tex7_attribute : Dynamic;      

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

        geometry = new BalancedBinarySearchTree<GeometryKey,Geometry>( geometry_compare );
        groups = new Map();

        vertlist = new Float32Array(65356);
        tcoordlist = new Float32Array(65356);
        colorlist = new Float32Array(65356);
        normallist = new Float32Array(65356);

        static_vertlist = new Float32Array(65356);
        static_tcoordlist = new Float32Array(65356);
        static_colorlist = new Float32Array(65356);
        static_normallist = new Float32Array(65356);

            //The default view so we see stuff
        view = renderer.default_camera;

            //Create the attribute buffers
        vertexBuffers = [];
        tcoordBuffers = [];
        vcolorBuffers = [];
        normalBuffers = [];

        for(i in 0 ... buffer_count) {

            var _vb = GL.createBuffer();
            var _tb = GL.createBuffer();
            var _cb = GL.createBuffer();
            var _nb = GL.createBuffer();

    //VERTEX
            GL.bindBuffer(GL.ARRAY_BUFFER, _vb);
            GL.bufferData(GL.ARRAY_BUFFER, vertlist, GL.DYNAMIC_DRAW);
    //TCOORD
            GL.bindBuffer(GL.ARRAY_BUFFER, _tb);
            GL.bufferData(GL.ARRAY_BUFFER, tcoordlist, GL.DYNAMIC_DRAW);
    //COLOR
            GL.bindBuffer(GL.ARRAY_BUFFER, _cb);
            GL.bufferData(GL.ARRAY_BUFFER, colorlist, GL.DYNAMIC_DRAW);        
    //NORMALS
            GL.bindBuffer(GL.ARRAY_BUFFER, _nb);
            GL.bufferData(GL.ARRAY_BUFFER, normallist, GL.DYNAMIC_DRAW);        

            vertexBuffers.push(_vb);
            tcoordBuffers.push(_tb);
            vcolorBuffers.push(_cb);
            normalBuffers.push(_nb);

        } //for the total buffer count
       

        GL.enableVertexAttribArray( vert_attribute );
        GL.enableVertexAttribArray( tcoord_attribute );
        GL.enableVertexAttribArray( color_attribute ); 
        GL.enableVertexAttribArray( normal_attribute );


            //A default name
        if(_name.length == 0) {
            name = Luxe.utils.uniqueid();
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

    } //compare

    public function add_group(_group:Int, _pre_render:Batcher->Void, _post_render:Batcher->Void ) {

        if(!groups.exists(_group)) {
            groups.set(_group, new Array<BatchGroup>());
        }

        groups.get(_group).push( new BatchGroup(_pre_render, _post_render) );

    } //add_group    

    public function blend_mode(?_src_mode:BlendMode = null, _dst_mode:BlendMode = null) {

        if(_src_mode == null) _src_mode = BlendMode.src_alpha;
        if(_dst_mode == null) _dst_mode = BlendMode.one_minus_src_alpha;

        var _src = phoenix.utils.Rendering.gl_blend_mode_from_BlendMode(_src_mode);
        var _dest = phoenix.utils.Rendering.gl_blend_mode_from_BlendMode(_dst_mode);

        GL.blendFunc(_src, _dest);

    } //set blendmode

    public function geometry_compare( a:GeometryKey, b:GeometryKey ) : Int {

        //check equality
        if(a.uuid == b.uuid) 
            { return 0; }

            //sort depth and group
        if( a.depth < b.depth )
            { return -1; }
        if( a.depth > b.depth )
            { return 1; }
        if( a.depth == b.depth && a.group < b.group )
            { return -1; }
        if( a.depth == b.depth && a.group > b.group )
            { return 1; }

            // sort clipping
        var clip_value : Int = -1;
            
            if(a.clip == true  && b.clip == true)  
                { clip_value =  0; }
            if(a.clip == false && b.clip == true)  
                { clip_value = -1; }
            if(a.clip == true  && b.clip == false) 
                { clip_value =  1; }

            //sort texture id's
        var textureid : Dynamic   = a.texture != null ? a.texture.id : 0;
        var b_textureid : Dynamic = b.texture != null ? b.texture.id : 0;

        if( a.depth == b.depth && a.group == b.group && textureid < b_textureid ) 
            { return -1; }
        if( a.depth == b.depth && a.group == b.group && textureid == b_textureid && a.primitive_type != b.primitive_type) 
            { return -1; }
        if( a.depth == b.depth && a.group == b.group && textureid == b_textureid && a.primitive_type == b.primitive_type && (clip_value >= 0)) 
            { return -1; }

            //if all else fails, make sure older values are preferred
        if( a.timestamp <= b.timestamp ) return -1;

            //otherwise push down the list
        return 1;

    } //geometry_compare

    public function add( _geom:Geometry, _force_add:Bool = false ) {
        
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

        } else {
            // trace("Warning : Attempting to add geometry to the same batcher twice. " + _geom);
        }
        
    } //add

    public function remove( _geom:Geometry, ?_remove_batcher_from_geometry:Bool = true ) {
        
        if(_remove_batcher_from_geometry) {
            _geom.batchers.remove(this);
            if(_geom.batchers.length == 0) {
                _geom.added = false;
            }
        } //_remove_batcher_from_geometry

        geometry.remove( _geom.key );

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
    public function batch( persist_immediate : Bool = false ) {

        //reset render stats before we start
        dynamic_batched_count = 0;
        static_batched_count = 0;
        enabled_count = 0;

        verts = 0;
        tcoords = 0;
        colors = 0;
        normals = 0;

        #if luxe_native
            vertlist.clear();
            tcoordlist.clear();
            colorlist.clear();
            normallist.clear();
        #end //luxe_native

            //The current batch state values
        var state : BatchState = new BatchState(this);
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
                    if(verts > 0) {
                        submit_current_vertex_list( state.last_geom_state.primitive_type );
                    } //if vertlist.length > 0

                } // state.update(geom)
                
                    // Now activate state changes (if any)
                state.activate(this);

                if(geom.enabled) {
                        //try
                    enabled_count++;

                        //Static batched geometry gets sent on it's own
                    if(geom.locked) {
                        submit_static_geometry( geom );
                    }

                        // Do not accumulate for tri strips, line strips, line loops, triangle fans, quad strips, or polygons 
                    else if( geom.primitive_type == PrimitiveType.line_strip ||
                             geom.primitive_type == PrimitiveType.line_loop ||
                             geom.primitive_type == PrimitiveType.triangle_strip ||
                             geom.primitive_type == PrimitiveType.triangle_fan ) {

                                // doing this with the same list is fine because the primitive type causes a batch break anyways.
                                // Send it on, this will also clear the list for the next geom so it doesn't acccumlate as usual.                            
                            geometry_batch(geom);
                            submit_current_vertex_list( geom.primitive_type );

                    } //if it's unbatchable

                        // Accumulate, this is standard geometry 
                    else {

                        // trace((geom.vertices.length*4)+(verts) + " / " + ((vertlist.byteLength/4)));
                            //if we have breached the max per batch, send it now                        
                        if((geom.vertices.length*4)+(verts) > ((vertlist.byteLength/4))) {
                            // vertlist = new Float32Array((vertlist.byteLength/4) * 2);
                            submit_current_vertex_list( geom.primitive_type );
                        }

                        geometry_batch( geom );

                        dynamic_batched_count++;

                    } //standard geometry


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
        if(verts > 0 && geom != null) {

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

    public function draw( persist_immediate:Bool = false ) {            

        //Reset the draw count
        draw_calls = 0;

            //update camera if it changes anything
        view.process(); 

            //Set the viewport to the view todo:this x any y should be from the camera?
        renderer.state.viewport( 0, 0, cast view.size.x, cast view.size.y );

            //apply geometries
        batch( persist_immediate );

    } //draw

    public function submit_static_geometry( geom:Geometry ) {        

            //Don't bother when it's empty
        if( geom.vertices.length == 0 ) {
            return;
        }

        #if luxe_native
            static_vertlist.clear();
            static_tcoordlist.clear();
            static_colorlist.clear();
            static_normallist.clear();
        #end //luxe_native

            //and counts
        static_verts = 0; static_tcoords = 0; static_colors = 0; static_normals = 0;

        if(!geom.submitted || geom.dirty) {

                //now batch the geometry into the static arrays
            geometry_batch_static( geom );

        } else {

            static_verts    = geom.vertices.length * 4;
            static_tcoords  = geom.vertices.length * 4;
            static_colors   = geom.vertices.length * 4;
            static_normals  = geom.vertices.length * 4;

        }

            //ensure the geometry has buffers already
        if(geom.static_vertex_buffer == null) {
            geom.static_vertex_buffer = GL.createBuffer();
            geom.static_tcoord_buffer = GL.createBuffer();
            geom.static_vcolor_buffer = GL.createBuffer();
            geom.static_normal_buffer = GL.createBuffer();
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

            //set the normal directions in the shader, but to static buffers
        GL.bindBuffer(GL.ARRAY_BUFFER, geom.static_normal_buffer);
        GL.vertexAttribPointer(normal_attribute, 4, GL.FLOAT, false, 0, 0);

        if(!geom.submitted || geom.dirty) {
            GL.bufferData(GL.ARRAY_BUFFER, static_normallist, GL.STATIC_DRAW);
        }


            //Draw
        GL.drawArrays( 
            phoenix.utils.Rendering.get_opengl_primitive_type(geom.primitive_type),              0, 
            phoenix.utils.Rendering.get_elements_for_type(geom.primitive_type, static_verts) 
        );

            //Disable attributes
        _disable_attributes();
            //increase the stats
        draw_calls++;
        static_batched_count++;

            //reset static state
        #if luxe_native
            static_vertlist.clear();
            static_tcoordlist.clear();
            static_colorlist.clear();
            static_normallist.clear();
        #end //luxe_native
        
            //and counts
        static_verts = 0; 
        static_tcoords = 0; 
        static_colors = 0; 
        static_normals = 0;

            //clear the geometry flags
        geom.dirty = false;
        geom.submitted = true;

    } //submit_static_buffer_object


    public function submit_current_vertex_list( type : PrimitiveType ) {

        if( verts == 0 ) {
                //No verts? 
            return;
        }

            //Enable atttributes
        _enable_attributes();

        GL.bindBuffer(GL.ARRAY_BUFFER, vertexBuffers[buffer_index] );
        GL.vertexAttribPointer( 0, 4, GL.FLOAT, false, 0, 0 );
        GL.bufferSubData( GL.ARRAY_BUFFER , 0, new Float32Array(vertlist.buffer, 0, (verts) ) );

        GL.bindBuffer(GL.ARRAY_BUFFER, tcoordBuffers[buffer_index] );
        GL.vertexAttribPointer( 1, 4, GL.FLOAT, false, 0, 0 );
        GL.bufferSubData( GL.ARRAY_BUFFER , 0, new Float32Array(tcoordlist.buffer, 0, (tcoords) ) );

        GL.bindBuffer(GL.ARRAY_BUFFER, vcolorBuffers[buffer_index] );
        GL.vertexAttribPointer( 2, 4, GL.FLOAT, false, 0, 0 );
        GL.bufferSubData( GL.ARRAY_BUFFER , 0, new Float32Array(colorlist.buffer, 0, (colors) ) );        

        GL.bindBuffer(GL.ARRAY_BUFFER, normalBuffers[buffer_index] );
        GL.vertexAttribPointer( 3, 4, GL.FLOAT, false, 0, 0 );
        GL.bufferSubData( GL.ARRAY_BUFFER , 0, new Float32Array(normallist.buffer, 0, (normals) ) );

            //Draw
        GL.drawArrays( 
            phoenix.utils.Rendering.get_opengl_primitive_type(type),     0, 
            phoenix.utils.Rendering.get_elements_for_type(type, verts) 
        );

            //Disable attributes
        _disable_attributes();

        // cycle the buffers in use
        buffer_index++;    
        if(buffer_index >= buffer_count) {
            buffer_index = 0;            
        }

            //Reset counts
        verts = 0; tcoords = 0; colors = 0; normals = 0;
            //Increase stats
        draw_calls++;

    } //submit_current_vertex_list

//Batch related helper functions

    private function geometry_batch( geom:Geometry ) { 

        geom.batch_into_float32array( 
            verts,      tcoords,        colors,     normals,
            vertlist,   tcoordlist,     colorlist,  normallist
        );

        verts      += geom.vertices.length * 4;
        tcoords    += geom.vertices.length * 4;
        colors     += geom.vertices.length * 4;
        normals    += geom.vertices.length * 4;

    } //geometry_batch
    
    private function geometry_batch_static( geom:Geometry ) { 

        geom.batch_into_float32array( 
            static_verts,       static_tcoords,     static_colors,      static_normals,
            static_vertlist,    static_tcoordlist,  static_colorlist,   static_normallist
        );

        static_verts      += geom.vertices.length * 4;
        static_tcoords    += geom.vertices.length * 4;
        static_colors     += geom.vertices.length * 4;
        static_normals    += geom.vertices.length * 4;

    } //geometry_batch_static

//Shader related attribute setup

    private function _enable_attributes() {

            //Update the GL Matrices
        GL.uniformMatrix4fv( projectionmatrix_attribute, false, view.projection_matrix.float32array() );
        GL.uniformMatrix4fv( modelviewmatrix_attribute, false, view.view_matrix.inverse().float32array() );

    } //_enable_attributes

    private function _disable_attributes() {

            //Unset

    } //_disable_attributes 

}
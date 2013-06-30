package phoenix;

import phoenix.geometry.Geometry;
import phoenix.geometry.GeometryState;
import phoenix.geometry.Vertex;
import phoenix.Renderer;
import phoenix.BatchState;

import lime.gl.GL;
import lime.gl.GLBuffer;
import lime.geometry.Matrix3D;
import lime.utils.Float32Array;

import phoenix.utils.BinarySearchTree;

enum PrimitiveType {
    none;
    line_strip;
    line_loop;
    triangle_strip;
    triangles;
    triangle_fan;
}

class BatchGroup {

}

class Batcher {

    public var layer : Float = 0.0;

    public var geometry : BinarySearchTree<Geometry>;

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
    public var batched_count : Int = 0;

    public var log : Bool = false;

    public function new( _r : Renderer ) {

        renderer = _r;

        geometry = new BinarySearchTree<Geometry>( geometry_compare );

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
        

         // Enable depth test
        GL.enable(GL.DEPTH_TEST);
        // Accept fragment if it closer to the camera than the former one
        GL.depthFunc(GL.LESS);         

    }

        //this sorts the batchers in a list by layer
    public function compare(other:Batcher) {
        if(layer < other.layer) return -1;
        if(layer == other.layer) return 0;
        return 1;
     }

    public function l(v:Dynamic) {
        // trace(v);
    }

    public function geometry_compare( a:Geometry, b:Geometry ) : Int {
        return a.compare( b );
    }


    public function add( _geom:Geometry ) {
        geometry.insert(_geom);
    }

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
        //and submit it to the graphics card for usage
    public function batch( persist_immediate : Bool = false ) {

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
            if(geom != null && !geom.dropped ) {

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

                        //VBO 
                    if(geom.locked) {
                        submit_vertex_buffer_object(geom);   
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
                        batched_count++;
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

            //Set the viewport
        GL.viewport( 0, 0, 960, 640 );
            
            //apply camera
        view.process();

            //apply geometries
        batch( persist_immediate );

    } //draw

    public function submit_vertex_buffer_object( geom:Geometry ) {

    }

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

            //Update the GL Matrices
        GL.uniformMatrix4fv( projectionmatrix_attribute, false, view.projection_matrix.float32array() );
        GL.uniformMatrix4fv( modelviewmatrix_attribute, false, view.modelview_matrix.float32array() );        

            //Set shader attributes
        GL.enableVertexAttribArray(vert_attribute);
        GL.enableVertexAttribArray(tcoord_attribute);
        GL.enableVertexAttribArray(color_attribute);
        GL.enableVertexAttribArray(normal_attribute);

            //set the vertices positions in the shader
        GL.bindBuffer(GL.ARRAY_BUFFER, vertexBuffer);
        GL.vertexAttribPointer(vert_attribute, 3, GL.FLOAT, false, 0, 0);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(vertlist), GL.STATIC_DRAW);

            //set the texture coordinates in the shader
        GL.bindBuffer(GL.ARRAY_BUFFER, tcoordBuffer);
        GL.vertexAttribPointer(tcoord_attribute, 2, GL.FLOAT, false, 0, 0);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(tcoordlist), GL.STATIC_DRAW);        

            //set the color values in the shader
        GL.bindBuffer(GL.ARRAY_BUFFER, vcolorBuffer);
        GL.vertexAttribPointer(color_attribute, 4, GL.FLOAT, false, 0, 0);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(colorlist), GL.STATIC_DRAW);        

            //set the normal directions in the shader
        GL.bindBuffer(GL.ARRAY_BUFFER, normalBuffer);
        GL.vertexAttribPointer(normal_attribute, 3, GL.FLOAT, false, 0, 0);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(normallist), GL.STATIC_DRAW);        

            //Draw
        GL.drawArrays( get_opengl_primitive_type(type) , 0, Std.int(vertlist.length/3) );

            //Unset
        GL.disableVertexAttribArray(vert_attribute);
        GL.disableVertexAttribArray(tcoord_attribute);
        GL.disableVertexAttribArray(color_attribute);
        GL.disableVertexAttribArray(normal_attribute);
        
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
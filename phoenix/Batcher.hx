package phoenix;

import phoenix.geometry.Geometry;
import phoenix.geometry.GeometryState;
import phoenix.geometry.Vertex;
import phoenix.Renderer;
import phoenix.BatchState;

import nmegl.gl.GL;
import nmegl.gl.GLBuffer;
import nmegl.geometry.Matrix3D;
import nmegl.utils.Float32Array;

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

    public var geometry : BinarySearchTree<Geometry>;

    public var vert_list : Array<Float>;
    public var tcoord_list : Array<Float>;

    public var vertexBuffer : GLBuffer;
    public var tcoordBuffer : GLBuffer;

    public var projectionmatrix_attribute : Dynamic; 
    public var modelviewmatrix_attribute : Dynamic;

    public var vert_attribute : Dynamic;
    public var tcoord_attribute : Dynamic;
    public var tex0_attribute : Dynamic;

    public var renderer : Renderer;
    public var view : Camera;

    public function new( _r : Renderer ) {

        renderer = _r;

        geometry = new BinarySearchTree<Geometry>( geometry_compare );

        vert_list = new Array<Float>();
        tcoord_list = new Array<Float>();

        view = renderer.default_camera;

        vertexBuffer = GL.createBuffer();
        tcoordBuffer = GL.createBuffer();


        vert_attribute = GL.getAttribLocation( renderer.default_shader.program , "vertexPosition");
        tcoord_attribute = GL.getAttribLocation( renderer.default_shader.program, "tcoordPosition");

        projectionmatrix_attribute = GL.getUniformLocation( renderer.default_shader.program, "projectionMatrix");
        modelviewmatrix_attribute = GL.getUniformLocation( renderer.default_shader.program, "modelViewMatrix");

        tex0_attribute = GL.getUniformLocation( renderer.default_shader.program, "tex0");
        
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

    public function stage() {

        l("\t\t\tstage start");

        var state : BatchState = new BatchState();
        var vertlist : Array<Float> = new Array<Float>();
        var tcoordlist : Array<Float> = new Array<Float>();

        l(" geometry list  : " + geometry.length );

            //Loop through the geometry set
        var geom : Geometry = null;

        for(_geom in geometry) {

                //grab the next one
            geom = _geom;

            if(geom != null && !geom.dropped ) {

                    //If the update will cause a state change, submit the vertices accumulated                
                if( state.update(geom) ) {
                    trace('state came back dirty so submitting it');
                    submit_vertex_list( vertlist, tcoordlist, state.last_state.primitive_type );
                }

                    // Now activate state changes (if any)
                state.activate(this);

                geom.state.str();

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

                            trace("It's a geometry that can't really accumulate in a batch.. ");
                                // doing this with the same list is fine because the primitive type causes a batch break anyways.
                            geom.batch( vertlist, tcoordlist );
                                // Send it on, this will also clear the list for the next geom so it doesn't acccumlate as usual.
                            submit_vertex_list( vertlist, tcoordlist, geom.primitive_type );
                    }

                        // Accumulate, this is standard geometry 
                    else {
                        geom.batch( vertlist, tcoordlist );
                    }   

                    //catch

                        // Remove it. todo
                    // if( !persist_immediate && geom.immediate ) geom->drop();        

                } //geom.enabled

            } //!null && !dropped
        } //geom list

            // If there is anything left in the vertex buffer, submit it.
        l("\t\t\t\t finalise");            
        
        if(vertlist.length > 0 && geom != null) {
            l("\t\t\t\t finalising");              
            state.update(geom);
            state.activate( this );

            l("\t\t\t\t Submitting the batch... " + vertlist.length  );

            submit_vertex_list( vertlist, tcoordlist, state.last_state.primitive_type );

            l("\t\t\t\t Submitted the batch... " + vertlist.length + " vertices with type " + state.last_state.primitive_type );
        }    

        l("\t\t\t\t finalised");


            l("\t\t\t\t cleanup");
        // cleanup
        state.deactivate(this);
        state = null;
            l("\t\t\t\t cleanuped");

        l("\t\t\tstage end");

    }

    public function draw() {    

        l("\t begin draw");

                    //Set the viewport for GL
            l("\t\t viewport");
        GL.viewport( 0, 0, 960, 640 );
            l("\t\t viewported");

            //stash all the geometry into lists to send to dl           
            l("\t\t stage");
        stage();
            l("\t\t staged");

            l("\t\t shader activate");
        renderer.default_shader.activate();
            l("\t\t shader activated");

            l("\t\t view process");
        view.process();
            l("\t\t view processed");

            //Update the GL Matrices
        GL.uniformMatrix3D( projectionmatrix_attribute, false, view.projection_matrix );
        GL.uniformMatrix3D( modelviewmatrix_attribute, false, view.modelview_matrix );

        l("\t end draw");

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

    public function submit_vertex_list( vertlist:Array<Float>, tcoordlist:Array<Float>, type : PrimitiveType ) {
            
            //Do nothing useful
        if( vertlist.length == 0 ) {
            l("doing nothing");
            return;
        }

                    l("\t\t\t\t\t\t data : vertexBuffer " + vertexBuffer);
                    l("\t\t\t\t\t\t data : tcoordBuffer " + tcoordBuffer);
                    l("\t\t\t\t\t\t data : vert_attribute " + vert_attribute);
                    l("\t\t\t\t\t\t data : tcoord_attribute " + tcoord_attribute);

            //Set shader attributes
        GL.enableVertexAttribArray(vert_attribute);
        GL.enableVertexAttribArray(tcoord_attribute);

            //Update the GL Arrays

            //set the vertices pointer in the shader
        GL.bindBuffer(GL.ARRAY_BUFFER, vertexBuffer);
        GL.vertexAttribPointer(vert_attribute, 3, GL.FLOAT, false, 0, 0);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(vertlist), GL.STATIC_DRAW);

            //set the texture coordinates in the shader
        GL.bindBuffer(GL.ARRAY_BUFFER, tcoordBuffer);
        GL.vertexAttribPointer(tcoord_attribute, 2, GL.FLOAT, false, 0, 0);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(tcoordlist), GL.STATIC_DRAW);        

                    l("\t\t\t\t\t\t drawing arrays " + vertlist.length + " as " + type);

            //Draw
        GL.drawArrays( get_opengl_primitive_type(type) , 0, Std.int(vertlist.length) );

                       l("\t\t\t\t\t\t disabling ");

            //Unset
        GL.disableVertexAttribArray(vert_attribute);
        GL.disableVertexAttribArray(tcoord_attribute);
        
                      l("\t\t\t\t\t\t clearing the vertex list");

            //clear the vlist
        vertlist.splice(0, vertlist.length);    
        tcoordlist.splice(0, tcoordlist.length);    

                l("\t\t\t\t\t\t vertlist.length " + vertlist.length);
                l("\t\t\t\t\t\t tcoordlist.length " + tcoordlist.length);
    }
}
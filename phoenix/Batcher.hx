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

            //set the vertices pointer in the shader
        GL.bindBuffer(GL.ARRAY_BUFFER, vertexBuffer);
        GL.vertexAttribPointer(vert_attribute, 3, GL.FLOAT, false, 0, 0);

            //set the texture coordinates in the shader
        GL.bindBuffer(GL.ARRAY_BUFFER, tcoordBuffer);
        GL.vertexAttribPointer(tcoord_attribute, 2, GL.FLOAT, false, 0, 0);


        vert_attribute = GL.getAttribLocation( renderer.default_shader.program , "vertexPosition");
        tcoord_attribute = GL.getAttribLocation( renderer.default_shader.program, "tcoordPosition");

        projectionmatrix_attribute = GL.getUniformLocation( renderer.default_shader.program, "projectionMatrix");
        modelviewmatrix_attribute = GL.getUniformLocation( renderer.default_shader.program, "modelViewMatrix");

        tex0_attribute = GL.getUniformLocation( renderer.default_shader.program, "tex0");
        
    }

    public function geometry_compare( a:Geometry, b:Geometry ) : Int {
        return a.compare( b );
    }


    public function add( _geom:Geometry ) {
        geometry.insert(_geom);
    }

    public function stage() {

        // vert_list.splice(0,vert_list.length);
        // tcoord_list.splice(0,tcoord_list.length);

        // GL.activeTexture(GL.TEXTURE0);

        // for(geom in geometry) {

        //     for(vert in geom.vertices) {
                
        //         if(geom.texture != null) {                    
        //             geom.texture.bind();
        //             renderer.default_shader.setUniformTexture("tex0", 0);
        //         }

        //         vert_list.push(vert.pos.x);
        //         vert_list.push(vert.pos.y);
        //         vert_list.push(vert.pos.z);

        //         tcoord_list.push(vert.uv[0].u);
        //         tcoord_list.push(vert.uv[0].v);
        //     }

        // }
        
        // GL.bindBuffer(GL.ARRAY_BUFFER, vertexBuffer);
        // GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(vert_list), GL.STATIC_DRAW);

        // GL.bindBuffer(GL.ARRAY_BUFFER, tcoordBuffer);
        // GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(tcoord_list), GL.STATIC_DRAW);

        var state : BatchState = new BatchState();
        var vlist : Array<Vertex> = new Array<Vertex>();

            //Loop through the geometry set
        var geom : Geometry = null;

        for(_geom in geometry) {

                //grab the next one
            geom = _geom;

            if(geom != null && !geom.dropped ) {

                    //If the update will cause a state change, submit the vertices accumulated
                if(state.update(geom)) {
                    submit_vertex_list( vlist, state.last_state.primitive_type );
                }

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
                            geom.batch( vlist );
                                // Send it on, this will also clear the list for the next geom so it doesn't acccumlate as usual.
                            submit_vertex_list( vlist, geom.primitive_type );
                    }

                        // Accumulate, this is standard geometry 
                    else {
                        geom.batch( vlist );
                    }   

                    //catch

                        // Remove it. todo
                    // if( !persist_immediate && geom.immediate ) geom->drop();        

                } //geom.enabled

            } //!null && !dropped
        } //geom list

            // If there is anything left in the vertex buffer, submit it.
        if(vlist.length > 0 && geom != null) {
            //std::cout<<"Submitting the batch... "<<vlist.size()<<" vertices with type "<<state.last().getPrimitiveType()<<std::endl;
            state.update(geom);
            state.activate( this );
            submit_vertex_list( vlist, state.last_state.primitive_type );
        }

        // cleanup
        state.deactivate(this);
        state = null;

    }

    public function draw() {    

                    //Set the viewport for GL
        GL.viewport( 0, 0, 960, 640 );

            //stash all the geometry into lists to send to dl           
        stage();

        renderer.default_shader.activate();

        view.process();

            //Update the GL Matrices
        GL.uniformMatrix3D( projectionmatrix_attribute, false, view.projection_matrix );
        GL.uniformMatrix3D( modelviewmatrix_attribute, false, view.modelview_matrix );

        var vert_size = 3;
        var tcoord_size = 2;


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
        }
    }

    public function submit_vertex_list( vlist:Array<Vertex>, type : PrimitiveType ) {
            
            //Do nothing useful
        if( vlist.length == 0 ) return;

            //Set shader attributes
        GL.enableVertexAttribArray(vert_attribute);
        GL.enableVertexAttribArray(tcoord_attribute);

            //Draw
        GL.drawArrays( get_opengl_primitive_type(type) , 0, vlist.length );

            //Unset
        GL.disableVertexAttribArray(vert_attribute);
        GL.disableVertexAttribArray(tcoord_attribute);
           
            //clear the vlist
        vlist.splice(0, vlist.length);    
    }
}
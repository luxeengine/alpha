package phoenix;

import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;
import phoenix.Renderer;

import nmegl.gl.GL;
import nmegl.gl.GLBuffer;
import nmegl.geometry.Matrix3D;
import nmegl.utils.Float32Array;

enum PrimitiveType {
    triangle_strip;
    triangles;
}

class BatchGroup {

}

class Batcher {

    public var groups : Map< Int, BatchGroup>;
    public var geometry : Array<Geometry>;

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

        geometry = new Array<Geometry>();
        vert_list = new Array<Float>();
        tcoord_list = new Array<Float>();
        groups = new Map();

        view = renderer.default_camera;

        vertexBuffer = GL.createBuffer();
        tcoordBuffer = GL.createBuffer();

        vert_attribute = GL.getAttribLocation( renderer.default_shader.program , "vertexPosition");
        tcoord_attribute = GL.getAttribLocation( renderer.default_shader.program, "tcoordPosition");

        projectionmatrix_attribute = GL.getUniformLocation( renderer.default_shader.program, "projectionMatrix");
        modelviewmatrix_attribute = GL.getUniformLocation( renderer.default_shader.program, "modelViewMatrix");

        tex0_attribute = GL.getUniformLocation( renderer.default_shader.program, "tex0");
        
    }



    public function add( _geom:Geometry ) {
        geometry.push(_geom);
    }

    public function stage() {

        vert_list.splice(0,vert_list.length);
        tcoord_list.splice(0,tcoord_list.length);

        GL.activeTexture(GL.TEXTURE0);

        for(geom in geometry) {

            for(vert in geom.vertices) {
                
                if(geom.texture != null) {                    
                    geom.texture.bind();
                    renderer.default_shader.setUniformTexture("tex0", 0);
                }

                vert_list.push(vert.pos.x);
                vert_list.push(vert.pos.y);
                vert_list.push(vert.pos.z);

                tcoord_list.push(vert.uv[0].u);
                tcoord_list.push(vert.uv[0].v);
            }

        }
        
        GL.bindBuffer(GL.ARRAY_BUFFER, vertexBuffer);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(vert_list), GL.STATIC_DRAW);

        GL.bindBuffer(GL.ARRAY_BUFFER, tcoordBuffer);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(tcoord_list), GL.STATIC_DRAW);

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

        GL.bindBuffer(GL.ARRAY_BUFFER, vertexBuffer);
        GL.vertexAttribPointer(vert_attribute, vert_size, GL.FLOAT, false, 0, 0);
        GL.bindBuffer(GL.ARRAY_BUFFER, tcoordBuffer);
        GL.vertexAttribPointer(tcoord_attribute, tcoord_size, GL.FLOAT, false, 0, 0);

        GL.enableVertexAttribArray(vert_attribute);
        GL.enableVertexAttribArray(tcoord_attribute);

        GL.drawArrays( GL.TRIANGLES, 0, Std.int(vert_list.length/vert_size) );

        GL.disableVertexAttribArray(vert_attribute);
        GL.disableVertexAttribArray(tcoord_attribute);

    } //draw

    public function draw_list( list:Array<Vertex>, type : PrimitiveType ) {
        
        GL.drawArrays(GL.TRIANGLE_STRIP, 0, list.length);       
    }
}
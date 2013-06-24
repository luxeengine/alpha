package phoenix;


import nmegl.gl.GL;
import nmegl.gl.GLBuffer;
import nmegl.geometry.Matrix3D;
import nmegl.utils.Float32Array;


enum ProjectionType {
    ortho;
    perspective;
    custom; 
}

class Camera {

    public var view_matrix : Matrix3D;
    public var projection_matrix : Matrix3D;
    public var modelview_matrix : Matrix3D;

    public function new( _projection : ProjectionType , options:Dynamic ) {

        if(options == null) {
            options = {
                x1 : 0, y1 : 0,
                x2 : 0, y2 : 0,
                near : 1000, 
                far: -1000
            };
        } else {

            if(options.x1   == null) { options.x1 = 0; }
            if(options.x2   == null) { options.x2 = 0; }
            if(options.y1   == null) { options.y1 = 0; }
            if(options.y2   == null) { options.y2 = 0; }
            if(options.near == null) { options.near = 1000; }
            if(options.far  == null) { options.far = -1000; }

        }

            //Orthographic projection
        if(_projection == ProjectionType.ortho) {

            trace('camera setting ortho: ' + options);

            set_ortho( 
                      options.x1, 
                      options.y1, 
                      options.x2, 
                      options.y2, 
                      options.near, 
                      options.far 
                    );

        } else
            //Perspective projection
        if(_projection == ProjectionType.perspective) {

            set_perspective(options);

        }
        
    }

    public function set_ortho( _x1:Float, _y1:Float, _x2:Float, _y2:Float, _near:Float, _far:Float) {

        projection_matrix = Matrix3D.createOrtho(_x1, _x2, _y2, _y1, _near, _far);
        // projection_matrix = Matrix3D.createOrtho(0, 960, 640, 0, 1000, -1000);
        
        modelview_matrix = Matrix3D.create2D( _x1, _y1, 1, 0);

    }

    public function set_perspective( options : Dynamic ) {

    }

}
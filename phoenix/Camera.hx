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

    public var projection_options : Dynamic;
    public var projection : ProjectionType;

    public var rotation : Float = 0.0;

    public function new( _projection : ProjectionType , options:Dynamic ) {

        projection = _projection;

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

        projection_options = options;

            //Orthographic projection
        if(_projection == ProjectionType.ortho) {

            trace('camera setting ortho: ' + projection_options);

            set_ortho( 
                      projection_options.x1, 
                      projection_options.y1, 
                      projection_options.x2, 
                      projection_options.y2, 
                      projection_options.near, 
                      projection_options.far 
                    );

        } else
            //Perspective projection
        if(_projection == ProjectionType.perspective) {

            set_perspective(projection_options);

        }
        
    }

    public function set_rotation(_rotation:Float) {

        rotation = _rotation;

        if(projection == ProjectionType.ortho) {
            modelview_matrix = Matrix3D.create2D( projection_options.x1, projection_options.y1, 1, rotation);
        }   

    }   

    public function set_ortho( _x1:Float, _y1:Float, _x2:Float, _y2:Float, _near:Float, _far:Float) {

        projection_matrix = Matrix3D.createOrtho(_x1, _x2, _y2, _y1, _near, _far);
        modelview_matrix = Matrix3D.create2D( _x1, _y1, 1, rotation);

    }

    public function set_perspective( options : Dynamic ) {

    }

}
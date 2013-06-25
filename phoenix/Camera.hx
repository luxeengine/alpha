package phoenix;


import lime.gl.GL;
import lime.gl.GLBuffer;
import lime.geometry.Matrix3D;
import lime.utils.Float32Array;

import phoenix.Vector;

enum ProjectionType {
    ortho;
    perspective;
    custom; 
}

class Camera {

    public var rr : Float = 0;
    public var pos : Vector;
    public var view_matrix : Matrix3D;
    public var projection_matrix : Matrix3D;
    public var modelview_matrix : Matrix3D;

    public var projection_options : Dynamic;
    public var projection : ProjectionType;

    public var rotation : Float = 0.0;

    public function new( _projection : ProjectionType , options:Dynamic ) {

        projection = _projection;
        pos = new Vector(0,0,0);        

        projection_options = options;

            //Orthographic projection
        if(_projection == ProjectionType.ortho) {

            trace('camera setting ortho: ' + projection_options);
            set_ortho( projection_options );

        } else
            //Perspective projection
        if(_projection == ProjectionType.perspective) {

            trace('camera setting perspective: ' + projection_options);
            set_perspective(projection_options);

        }
        
    }

    public function set_rotation(_rotation:Float) {

        rotation = _rotation;

        if(projection == ProjectionType.ortho) {
            modelview_matrix = Matrix3D.create2D( projection_options.x1, projection_options.y1, 1, rotation);
        }   

    }   

    public function make_perspective( _fov:Float, _aspect:Float, _near:Float, _far:Float ) {  

        var _ylimit = _near * Math.tan(_fov * Math.PI / 360);

        var A = -( _far + _near ) / ( _far - _near );  
        var B = -2 * _far * _near / ( _far - _near );  
        var C = (2 * _near) / ( (_ylimit * _aspect) * 2 );  
        var D = (2 * _near) / ( _ylimit * 2 );  
        
        return new Matrix3D([  
            C, 0, 0, 0,  
            0, D, 0, 0,  
            0, 0, A, -1,  
            0, 0, B, 0  
        ]);
    } 

    public function make_model_view() {  
        var _y = rr * (Math.PI / 180.0);  
        var A = Math.cos(_y);
        var B = -1 * Math.sin(_y);  
        var C = Math.sin(_y);  
        var D = Math.cos(_y);

        rr += 0.3;

        return new Matrix3D([  
            A,      0,      B,      0,  
            0,      1,      0,      0,  
            C,      0,      D,      0,  
            pos.x,  pos.y,  pos.z,  1  
        ]);  
    } 
    public function process() {
        if( projection == ProjectionType.perspective ) {
            set_perspective( projection_options );
        }
    }
    public function set_ortho( options:Dynamic = null ) {
        
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

        projection = ProjectionType.ortho;
        projection_options = options;

        projection_matrix = Matrix3D.createOrtho( options.x1, options.x2, options.y2, options.y1, options.near, options.far);
        modelview_matrix = Matrix3D.create2D( options.x1, options.y1, 1, rotation);

    }

    public function set_perspective( options:Dynamic = null ) {

        if(options == null) {
            options = {
                fov : 110.0,
                aspect : 1.0,
                near : 1,
                far : 1000
            };
        } else {
            if(options.fov == null)     { options.fov = 45; }
            if(options.aspect == null)  { options.aspect = 1; }
            if(options.near == null)    { options.near = 1; }
            if(options.far  == null)    { options.far = -1000; }
        }

        projection = ProjectionType.perspective;
        projection_options = options;

        projection_matrix = make_perspective( options.fov, options.aspect, options.near, options.far );
        modelview_matrix = make_model_view();
    }

}
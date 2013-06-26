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

    public var perspective_options : Dynamic;
    public var ortho_options : Dynamic;
    public var projection : ProjectionType;

    public var rotation : Float = 0.0;

    public function new( _projection : ProjectionType , options:Dynamic ) {

        projection = _projection;
        pos = new Vector(0,0,0);        

        ortho_options = {
            x1 : 0, y1 : 0,
            x2 : 0, y2 : 0,
            near : 1000, 
            far: -1000
        };        

        perspective_options = {
            fov : 60,
            aspect : 1.5,
            near:1,
            far:-1000
        };

            //Orthographic projection
        if(_projection == ProjectionType.ortho) {

            set_ortho( options );
            trace('camera setting ortho: ' + ortho_options);            

        } else
            //Perspective projection
        if(_projection == ProjectionType.perspective) {

            set_perspective(options);
            trace('camera setting perspective: ' + perspective_options);

        }
        
    }

    public function set_rotation(_rotation:Float) {

        rotation = _rotation;

        if(projection == ProjectionType.ortho) {
            modelview_matrix = Matrix3D.create2D( ortho_options.x1, ortho_options.y1, 1, rotation);
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
            set_perspective( perspective_options );
        }
    }
    public function set_ortho( options:Dynamic = null ) {
        
            // Cull triangles which normal is not towards the camera
        GL.disable(GL.CULL_FACE);

        merge_options( ortho_options, options );

        projection = ProjectionType.ortho;

        projection_matrix = Matrix3D.createOrtho( ortho_options.x1, ortho_options.x2, ortho_options.y2, ortho_options.y1, ortho_options.near, ortho_options.far);
        modelview_matrix = Matrix3D.create2D( ortho_options.x1, ortho_options.y1, 1, rotation);

    }

    public function merge_options( projection_options:Dynamic, options:Dynamic) {

        if(projection_options == null) {
            projection_options = {};
        }

        var fields = Reflect.fields(options);
        for(field in fields) {
            Reflect.setField(projection_options, field, Reflect.field(options, field));
        }
    }

    public function set_perspective( options:Dynamic = null ) {

        merge_options( perspective_options, options );

        projection = ProjectionType.perspective;

        projection_matrix = make_perspective( perspective_options.fov, perspective_options.aspect, perspective_options.near, perspective_options.far );
        modelview_matrix = make_model_view();

            // Cull triangles which normal is not towards the camera
        GL.enable(GL.CULL_FACE);
    }

}
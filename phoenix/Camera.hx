package phoenix;


import lime.gl.GL;
import lime.gl.GLBuffer;
import lime.geometry.Matrix3D;
import lime.utils.Float32Array;

import phoenix.Matrix4;

import phoenix.Quaternion;
import phoenix.Vector;

enum ProjectionType {
    ortho;
    perspective;
    custom; 
}

class Camera {
    
    public var pos : Vector;
    public var rotation : Quaternion;
    public var scale: Vector;
    public var size: Vector;

    public var view_matrix : Matrix3D;
    public var projection_matrix : Matrix4;
    public var modelview_matrix : Matrix4;

    public var perspective_options : Dynamic;
    public var ortho_options : Dynamic;
    public var projection : ProjectionType;

    public var target:Vector;
    public var up:Vector;

    public function new( _projection : ProjectionType , options:Dynamic ) {

        projection = _projection;
        
        pos = new Vector(0,0,0);
        rotation = new Quaternion(0,0,0,0);
        scale = new Vector(1,1,1);
        size = new Vector(Lab.screen.w, Lab.screen.h);

        up = new Vector(0,1,0);
        
        projection_matrix = new Matrix4();
        projection_matrix.identity();

        modelview_matrix = new Matrix4();
        modelview_matrix.identity();

        ortho_options = {
            x1 : 0, y1 : 0,
            x2 : size.x, y2 : size.y,
            near : 1000, 
            far: -1000
        };        

        perspective_options = {
            fov : 60,
            aspect : 1.5,
            near:0.1,
            far:100
        };

            //Orthographic projection
        if(_projection == ProjectionType.ortho) {

            set_ortho( options );
            //trace('camera setting ortho: ' + ortho_options);            

        } else
            //Perspective projection
        if(_projection == ProjectionType.perspective) {

            set_perspective(options);
            //trace('camera setting perspective: ' + perspective_options);

        }
        
    }

    public function process() {

        if( projection == ProjectionType.perspective ) {
            set_perspective( perspective_options );
        }

        if( projection == ProjectionType.ortho ) {
            set_ortho( ortho_options );
        }
    }

    public function set_ortho( options:Dynamic = null ) {
                        
        GL.disable(GL.CULL_FACE);
            //
        merge_options( ortho_options, options );
            //
        projection = ProjectionType.ortho;
            //
        projection_matrix = projection_matrix.makeOrthographic( ortho_options.x1, ortho_options.x2, ortho_options.y1, ortho_options.y2, ortho_options.near, ortho_options.far);
            //
        modelview_matrix = modelview_matrix.compose( pos, rotation, scale );

    } //set_ortho

    public function merge_options( projection_options:Dynamic, options:Dynamic) {

        if(projection_options == null) {
            projection_options = {};
        }

        var fields = Reflect.fields(options);
        for(field in fields) {
            Reflect.setField(projection_options, field, Reflect.field(options, field));
        }

    } //merge_options

    public function update_look_at() {

        var m1 = new Matrix4();
        
        m1.lookAt(target, pos, up);

        rotation.setFromRotationMatrix( m1 );

    } //update_look_at

    public function set_perspective( options:Dynamic = null ) {

        merge_options( perspective_options, options );

        projection = ProjectionType.perspective;

        projection_matrix = projection_matrix.makePerspective(perspective_options.fov, perspective_options.aspect, perspective_options.near, perspective_options.far );

                //If we have a target, override the rotation BEFORE we update the matrix 
            if(target != null) {
                update_look_at();
            }

        modelview_matrix = modelview_matrix.compose( pos, rotation, scale );

            // Cull triangles which normal is not towards the camera
        GL.enable(GL.CULL_FACE);
       
    } //set_perspective

} //Camera

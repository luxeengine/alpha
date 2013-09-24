package phoenix;


import lime.gl.GL;
import lime.gl.GLBuffer;
import lime.geometry.Matrix3D;
import lime.utils.Float32Array;

import phoenix.Matrix4;

import phoenix.Quaternion;
import phoenix.Vector;
import phoenix.Ray;

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

    public var projection_matrix : Matrix4;
    public var view_matrix : Matrix4;

    public var perspective_options : Dynamic;
    public var ortho_options : Dynamic;
    public var projection : ProjectionType;

    public var target:Vector;
    public var up:Vector;   

        //A phoenix camera will default to ortho set to screen size        

    public function new( ?options:Dynamic = null ) {

        if(options == null) options = {};

        projection = options.projection == null ? ProjectionType.ortho : options.projection;
        
        pos = new Vector(0,0,0);
        rotation = new Quaternion(0,0,0,0);
        scale = new Vector(1,1,1);
        size = new Vector(Luxe.screen.w, Luxe.screen.h);

        up = new Vector(0,1,0);
        
        projection_matrix = new Matrix4();
        projection_matrix.identity();

        view_matrix = new Matrix4();
        view_matrix.identity();

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

        switch (projection) {
            case ProjectionType.ortho:
                set_ortho( options );                
            case ProjectionType.perspective:                
                set_perspective( options );                
            case ProjectionType.custom:
                //nothing yet
        }        
        
    } //new 

    public function process() {

        switch(projection) {
            case ProjectionType.perspective:
                apply_perspective();
            case ProjectionType.ortho:
                apply_ortho();
            case ProjectionType.custom:
                //todo: nothing yet
        }

    } //process


    public function update_look_at() {

        var m1 = new Matrix4();
        
        m1.lookAt(target, pos, up);

        rotation.setFromRotationMatrix( m1 );

    } //update_look_at

    public function apply_ortho() {

        GL.disable(GL.CULL_FACE);
            //2D doesn't usually want the depth to interfere
        // GL.clear(GL.DEPTH_BUFFER_BIT);
        GL.disable(GL.DEPTH_TEST);
            //todo:This doesn't need to be rebuilt every frame
        projection_matrix = projection_matrix.makeOrthographic( ortho_options.x1, ortho_options.x2, ortho_options.y1, ortho_options.y2, ortho_options.near, ortho_options.far);
            //Rebuild the modelview, todo:dirtify this
        view_matrix = view_matrix.compose( pos, rotation, scale );        

    } //apply_ortho

    public function apply_perspective() {

            //Make the perspective matrix based on perspective_options
            //todo:This doesn't need to be rebuilt every frame
        projection_matrix = projection_matrix.makePerspective(perspective_options.fov, perspective_options.aspect, perspective_options.near, perspective_options.far );

            //If we have a target, override the rotation BEFORE we update the matrix 
        if(target != null) {
            update_look_at();
        } //target not null

            //Rebuild the modelview, todo:dirtify this
        view_matrix = view_matrix.compose( pos, rotation, scale );

            // Cull triangles which normal is not towards the camera
        GL.enable(GL.CULL_FACE);
        GL.enable(GL.DEPTH_TEST);
    }

    public function set_ortho( options:Dynamic = null ) {
            //
        _merge_options( ortho_options, options );
            //
        projection = ProjectionType.ortho;
            //
        apply_ortho();

    } //set_ortho

    public function set_perspective( options:Dynamic = null ) {

        _merge_options( perspective_options, options );

        projection = ProjectionType.perspective;

        apply_perspective();

    } //set_perspective

        //from 3D to 2D
    public function projectVector( _vector:Vector ) {

        var _transform = new Matrix4().multiplyMatrices( projection_matrix, view_matrix.inverse() );
        return _vector.clone().applyProjection( _transform );

    } //projectVector

        //from 2D to 3D 
    public function unprojectVector( _vector:Vector ) {

        var _inverted = new Matrix4().multiplyMatrices( projection_matrix, view_matrix.inverse() );
        return _vector.clone().applyProjection( _inverted.inverse() );

    } //unprojectVector


    public function screen_point_to_ray( _vector:Vector ) : Ray {
        
        return new Ray( _vector, this );

    } //screen_point_as_ray

    public function world_point_to_screen( _vector:Vector, ?_viewport:Rectangle=null ) : Vector {

        if(_viewport == null) {
            _viewport = new Rectangle(0,0,Luxe.screen.w, Luxe.screen.h);
        }

        var _projected = projectVector( _vector );
        
        var width_half = _viewport.w/2;
        var height_half = _viewport.h/2;

        return new Vector( 
             ( _projected.x * width_half ) + width_half, 
            -( _projected.y * height_half ) + height_half 
        );
        
    } //world_point_to_screen



    private function _merge_options( projection_options:Dynamic, options:Dynamic) {

        if(projection_options == null) {
            projection_options = {};
        }

        var fields = Reflect.fields(options);
        for(field in fields) {
            Reflect.setField(projection_options, field, Reflect.field(options, field));
        }

    } //_merge_options    

} //Camera

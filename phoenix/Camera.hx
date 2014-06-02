package phoenix;


import lime.gl.GL;
import lime.gl.GLBuffer;
import lime.utils.Float32Array;

import phoenix.Matrix4;

import phoenix.Quaternion;
import phoenix.Rectangle;
import phoenix.Transform;
import phoenix.Vector;
import phoenix.Ray;

import luxe.options.CameraOptions;

enum ProjectionType {
    ortho;
    perspective;
    custom; 
}


class Camera {
    
    public var name : String = 'camera';    

    @:isVar public var viewport (get,set) : Rectangle;    
    @:isVar public var center (get,set) : Vector;
    @:isVar public var zoom (default,set) : Float = 1.0;

    public var pos (get,set) : Vector;
    public var scale (get,set) : Vector;
    public var rotation (get,set) : Quaternion;

    public var transform : Transform;

    public var minimum_zoom : Float = 0.01;
    public var projection_matrix : Matrix4;
    public var view_matrix : Matrix4;

    var _origin_matrix_inv  : Matrix4;
    var _pos_matrix         : Matrix4;
    var _rot_matrix         : Matrix4;    

    public var perspective_options : ProjectionOptions;
    public var ortho_options : ProjectionOptions;
    public var projection : ProjectionType;

    public var target:Vector;
    public var up:Vector;

        //A phoenix camera will default to ortho set to screen size        
    public function new( ?options:CameraOptions ) {

            //have sane defaults 
        if(options == null) {
            options = default_camera_options();
        }

            //store the name if any
        if(options.name != null) {
            name = options.name;
        }

            //default to ortho unless specified otherwise
        if(options.projection != null) {
            projection = options.projection;
        } else {
            projection = ProjectionType.ortho;
        }

            //default to screensize or use given viewport
        if(options.viewport != null) {
            viewport = options.viewport;            
        } else {
            viewport = new Rectangle( 0, 0, Luxe.screen.w, Luxe.screen.h );
        }

        transform = new Transform();

            //init internals
        _origin_matrix_inv = new Matrix4();
        _pos_matrix = new Matrix4();
        _rot_matrix = new Matrix4();

        center = new Vector( viewport.w/2, viewport.h/2 );
        up = new Vector(0,1,0);
        
        projection_matrix = new Matrix4();
        view_matrix = new Matrix4();

        ortho_options = default_ortho_options();
        perspective_options = default_perspective_options();

        switch (projection) {
            case ProjectionType.ortho:
                set_ortho( options );
            case ProjectionType.perspective:
                set_perspective( options );
            case ProjectionType.custom:
                //:todo: not sure what I had in mind here ...
        }
        
    } //new 

    function default_ortho_options() : ProjectionOptions {

        return {
            x1 : 0, 
            y1 : 0,
            x2 : Luxe.screen.w, 
            y2 : Luxe.screen.h,
            near : 1000, 
            far: -1000
        };

    } //default_ortho_options 

    function default_camera_options() : CameraOptions {

        return {
            projection : ProjectionType.ortho,
            x1 : 0, 
            y1 : 0,
            x2 : Luxe.screen.w, 
            y2 : Luxe.screen.h,
            near : 1000, 
            far: -1000
        };

    } //default_camera_options 

    function default_perspective_options() : ProjectionOptions {

        return {
            fov : 60,
            aspect : 1.5,
            near : 0.1,
            far : 100
        };

    } //default_perspective_options
    
    public function process() {

        switch(projection) {
            case ProjectionType.perspective:
                apply_perspective();
            case ProjectionType.ortho:
                apply_ortho();
            case ProjectionType.custom:
                //:todo: not sure what I had in mind here ...
        }

    } //process


    public function update_look_at() {

        var m1 = new Matrix4();
        
        m1.lookAt(target, pos, up);

        rotation.setFromRotationMatrix( m1 );

    } //update_look_at

    function update_view_matrix() {

        switch(projection) {

            case ProjectionType.perspective:
                
                view_matrix = view_matrix.compose( pos, rotation, scale );

            case ProjectionType.ortho:

                // view_matrix
                //     .makeTranslation( center.x, center.y, center.z )
                //     .scale( scale )
                //     .multiply( _rot_matrix )
                //     .multiply( _origin_matrix_inv )
                //     .multiply( _pos_matrix );

                view_matrix = transform.world.matrix;

            case ProjectionType.custom:
                //:todo: not sure what I had in mind here ...
        }

    } //update_view_matrix

    public function apply_ortho() {

        Luxe.renderer.state.disable(GL.CULL_FACE);
            //2D doesn't usually want the depth to interfere
        // GL.clear(GL.DEPTH_BUFFER_BIT);
        Luxe.renderer.state.disable(GL.DEPTH_TEST);
        
            //:todo:This doesn't need to be rebuilt every frame
        projection_matrix = projection_matrix.makeOrthographic( 0, viewport.w, 0, viewport.h, ortho_options.near, ortho_options.far);
            //Rebuild the modelview, :todo:dirtify this
        update_view_matrix();

    } //apply_ortho

    public function apply_perspective() {

            //Make the perspective matrix based on perspective_options
            //:todo: This doesn't need to be rebuilt every frame
        projection_matrix = projection_matrix.makePerspective(perspective_options.fov, perspective_options.aspect, perspective_options.near, perspective_options.far );

            //If we have a target, override the rotation BEFORE we update the matrix 
        if(target != null) {
            update_look_at();
        } //target not null

            //Rebuild the modelview, todo:dirtify this
        update_view_matrix();

            // Cull triangles which normal is not towards the camera
        Luxe.renderer.state.enable(GL.CULL_FACE);
        Luxe.renderer.state.enable(GL.DEPTH_TEST);

    } //apply_perspective

    public function set_ortho( options:ProjectionOptions ) {
            
            //
        _merge_options( ortho_options, options );
            //
        projection = ProjectionType.ortho;
            //
        apply_ortho();

    } //set_ortho

    public function set_perspective( options:ProjectionOptions ) {

            //
        _merge_options( perspective_options, options );
            //
        projection = ProjectionType.perspective;
            //
        apply_perspective();

    } //set_perspective

        //from 3D to 2D
    public function projectVector( _vector:Vector ) {

        update_view_matrix();

        var _transform = new Matrix4().multiplyMatrices( projection_matrix, view_matrix.inverse() );
        return _vector.clone().applyProjection( _transform );

    } //projectVector

        //from 2D to 3D 
    public function unprojectVector( _vector:Vector ) {

        update_view_matrix();
        
        var _inverted = new Matrix4().multiplyMatrices( projection_matrix, view_matrix.inverse() );
        return _vector.clone().applyProjection( _inverted.inverse() );

    } //unprojectVector

    public function screen_point_to_ray( _vector:Vector ) : Ray {
        
        return new Ray( _vector, this );

    } //screen_point_as_ray

    public function screen_point_to_world( _vector:Vector ) : Vector {

        if( projection == ProjectionType.ortho ) {
            return ortho_screen_to_world(_vector);
        } else if( projection == ProjectionType.perspective ){
            return screen_point_to_ray( _vector ).end;
        }

            //given the default is ortho, for now
        return ortho_screen_to_world(_vector);

    } //screen_point_to_world

    public function world_point_to_screen( _vector:Vector, ?_viewport:Rectangle=null ) : Vector {

        if( projection == ProjectionType.ortho ) {
            return ortho_world_to_screen( _vector );
        } else if( projection == ProjectionType.perspective ) {
            return persepective_world_to_screen(_vector, _viewport);            
        }

            //given the default is ortho, for now
        return ortho_world_to_screen( _vector );

    } //world_point_to_screen

    function ortho_screen_to_world( _vector:Vector ) : Vector {

        update_view_matrix();

        return _vector.clone().applyMatrix4(view_matrix);

    } //ortho_screen_to_world

    function ortho_world_to_screen( _vector:Vector ) : Vector {

        update_view_matrix();

        return _vector.clone().applyMatrix4( view_matrix.inverse() );

    } //ortho_world_to_screen

    function persepective_world_to_screen( _vector:Vector, ?_viewport:Rectangle=null ) {

        if(_viewport == null) { _viewport = viewport; }

        var _projected = projectVector( _vector );
        
        var width_half = _viewport.w/2;
        var height_half = _viewport.h/2;

        return new Vector( 
             ( _projected.x * width_half ) + width_half, 
            -( _projected.y * height_half ) + height_half 
        );

    } //persepective_world_point_to_screen


        //0.5 = smaller , 2 = bigger
    function set_zoom( _p:Float ) : Float {
            
            //a temp value to manipulate
        var _new_zoom = _p;

            //new zoom value shouldn't be allowed beyond a minimum
            //but maybe this should be optional if you want negative zoom?
        if(_new_zoom < minimum_zoom) {
            _new_zoom = minimum_zoom;
        }

            //scale the visual view based on the value
        scale.x = 1/_new_zoom;
        scale.y = 1/_new_zoom;

            //return the real value
        return zoom = _new_zoom;

    } //set_zoom

    function set_center( _p:Vector ) : Vector {

            //update value
        center = _p;

            //and adjust the position for the new center, in world space
        transform.pos.x = _p.x - (viewport.w/2);
        transform.pos.y = _p.y - (viewport.h/2);

            //update the transform values
        transform.origin = center;
        
        return center;
    }

    function get_center() : Vector {
        return center;
    }

    function get_pos() : Vector {
        return transform.pos;
    }
    
    function get_rotation() : Quaternion {
        return transform.rotation;
    }

    function get_scale() : Vector {
        return transform.scale;
    }

    function get_viewport() : Rectangle {
        return viewport;
    }

    function set_viewport(_r:Rectangle) : Rectangle {

            //rework out the center
        if(center != null) {
                
                //update the center position
            center.x = ((_r.w/2) + pos.x);
            center.y = ((_r.h/2) + pos.y);
                //propagate those changes to the transform
            set_center(center);

        } //center != null

        return viewport = _r;
    
    } //set_viewport

    function set_rotation( _q:Quaternion ) : Quaternion {
        return transform.rotation = _q;
    } //set_rotation

    function set_scale( _s:Vector ) : Vector {
        return transform.scale = _s;
    } //set_scale

    function set_pos( _p:Vector ) : Vector {

        transform.pos = _p;

            //update the center accordingly 
        center.x = ((viewport.w/2) + _p.x);
        center.y = ((viewport.h/2) + _p.y);
            //propagate those changes to the transform
        set_center(center);

        return transform.pos;

    } //set_pos


    private function _merge_options( projection_options:ProjectionOptions, options:ProjectionOptions ) {

        if(options.aspect != null) {
            projection_options.aspect = options.aspect;
        }

        if(options.far != null) {
            projection_options.far = options.far;
        }

        if(options.fov != null) {
            projection_options.fov = options.fov;
        }

        if(options.near != null) {
            projection_options.near = options.near;
        }

        if(options.viewport != null) {
            projection_options.viewport = options.viewport;
        }

        if(options.x1 != null) {
            projection_options.x1 = options.x1;
        }

        if(options.x2 != null) {
            projection_options.x2 = options.x2;
        }

        if(options.y1 != null) {
            projection_options.y1 = options.y1;
        }

        if(options.y2 != null) {
            projection_options.y2 = options.y2;
        }

    } //_merge_options

} //Camera

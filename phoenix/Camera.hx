package phoenix;


import snow.render.opengl.GL;
import snow.utils.Float32Array;

import phoenix.Matrix;

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

    @:isVar public var near (default,set) : Float = 1000;
    @:isVar public var far (default,set) : Float = -1000;
        //specific to perspective
    @:isVar public var fov (default,set) : Float = 60;
    @:isVar public var aspect (default,set) : Float = 1.5;
    @:isVar public var target (default,set) : Vector;

        //we keep a local pos variable as an unaltered position
        //to keep the center relative to the viewport, and allow setting position as 0,0 not center
    @:isVar public var pos (get,set) : Vector;
        //the other transforms defer directly to the transform so aren't variables
    public var scale (get,set) : Vector;
    public var rotation (get,set) : Quaternion;
    public var transform : Transform;

    public var minimum_zoom : Float = 0.01;
    public var projection_matrix : Matrix;
    public var view_matrix : Matrix;
    public var view_matrix_inverse : Matrix;
        //if any, a rotation matrix for the look at rotation
    public var look_at_matrix : Matrix;

    public var options : CameraOptions;
    public var projection : ProjectionType;
    public var up : Vector;

    @:noCompletion public var projection_float32array : Float32Array;
    @:noCompletion public var view_inverse_float32array : Float32Array;

        //when the transform changes, the camera needs to refresh the view matrix
    var transform_dirty : Bool = true;
        //when the projection changes we need to update refresh the matrix
    var projection_dirty : Bool = true;
        //when the target changes we can update the look at matrix
    var look_at_dirty : Bool = true;
        //when we are still busy setting up
    var _setup : Bool = true;

        //A phoenix camera will default to ortho set to screen size
    public function new( ?_options:CameraOptions ) {

        transform = new Transform();

            //save for later
        options = _options;

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

        center = new Vector(Luxe.screen.w/2, Luxe.screen.h/2);
        pos = new Vector();

            //default to screensize or use given viewport
        if(options.viewport != null) {
            viewport = options.viewport;
        } else {
            viewport = new Rectangle( 0, 0, Luxe.screen.w, Luxe.screen.h );
        }

        up = new Vector(0,1,0);

        projection_matrix = new Matrix();
        view_matrix = new Matrix();
        view_matrix_inverse = new Matrix();
        look_at_matrix = new Matrix();

        transform.listen(on_transform_cleaned);

        apply_default_camera_options();

        switch (projection) {

            case ProjectionType.ortho:
                set_ortho( options );
            case ProjectionType.perspective:
                set_perspective( options );
            case ProjectionType.custom: {

            }

        } //switch projection

        _setup = false;

    } //new


//Public API


    public function set_ortho( _options:CameraOptions ) {

            //
        projection = ProjectionType.ortho;
            //
        _merge_options( _options );

    } //set_ortho

    public function set_perspective( _options:CameraOptions ) {

            //
        projection = ProjectionType.perspective;
            //
        _merge_options( _options );
            //reset the view origin
        transform.origin.set_xyz(0,0,0);

    } //set_perspective

        //from 3D to 2D
    public function project( _vector:Vector ) {

        update_view_matrix();

        var _transform = new Matrix().multiplyMatrices( projection_matrix, view_matrix_inverse );
        return _vector.clone().applyProjection( _transform );

    } //project

        //from 2D to 3D
    public function unproject( _vector:Vector ) {

        update_view_matrix();

        var _inverted = new Matrix().multiplyMatrices( projection_matrix, view_matrix_inverse );
        return _vector.clone().applyProjection( _inverted.getInverse(_inverted) );

    } //unproject

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


//Internal API


    @:noCompletion public function process() {

            //If we have a target, override the rotation
            //before we update the matrix, so it can be applied immediately if changing
            //:todo: target needs a test and should only update if the target changes
        if(target != null) {
            update_look_at();
        } //target not null

            //update transforms and projection
        update_projection_matrix();
        update_view_matrix();

            //apply states
        apply_state(GL.CULL_FACE, options.cull_backfaces);
        apply_state(GL.DEPTH_TEST, options.depth_test);

    } //process

//Transforms


    function on_transform_cleaned( t:Transform ) {

        transform_dirty = true;

    } //on_transform_cleaned

    function update_look_at() {

        if(look_at_dirty && target != null) {

            look_at_matrix.lookAt( target, pos, up );

            rotation.setFromRotationMatrix( look_at_matrix );

        } //dirty & !null

    } //update_look_at

    function update_view_matrix() {

        view_matrix = transform.world.matrix;

        if(!transform_dirty) {
            return;
        }

        view_matrix_inverse = view_matrix.inverse();
        view_inverse_float32array = view_matrix_inverse.float32array();

        transform_dirty = false;

    } //update_view_matrix

    function update_projection_matrix() {

        if(!projection_dirty) {
            return;
        }

        switch(projection) {

            case ProjectionType.perspective:
                projection_matrix.makePerspective( fov, aspect, near, far );
            case ProjectionType.ortho:
                projection_matrix.makeOrthographic( 0, viewport.w, 0, viewport.h, near, far );
            case ProjectionType.custom: {}

        } //switch

        projection_float32array = projection_matrix.float32array();

        projection_dirty = false;

    } //update_projection_matrix


//Helpers


    function apply_state(state:Int, value:Bool) {

        if(value) {
            Luxe.renderer.state.enable(state);
        } else {
            Luxe.renderer.state.disable(state);
        }

    } //apply_state

    function apply_default_camera_options() {

        switch (projection) {

            case ProjectionType.ortho: {

                if(options.cull_backfaces == null) {
                    options.cull_backfaces = false;
                }

                if(options.depth_test == null) {
                    options.depth_test = false;
                }

            } //ortho

            case ProjectionType.perspective: {

                if(options.cull_backfaces == null) {
                    options.cull_backfaces = true;
                }

                if(options.depth_test == null) {
                    options.depth_test = true;
                }

            } //perspective

            case ProjectionType.custom: {}

        } //switch

    } //apply_default_camera_options

    function default_camera_options() : CameraOptions {

        return {
            projection : ProjectionType.ortho,
            depth_test : false,
            cull_backfaces : false,
            near : 1000,
            far: -1000
        };

    } //default_camera_options


//Conversions


    function ortho_screen_to_world( _vector:Vector ) : Vector {

        update_view_matrix();

        return _vector.clone().transform(view_matrix);

    } //ortho_screen_to_world

    function ortho_world_to_screen( _vector:Vector ) : Vector {

        update_view_matrix();

        return _vector.clone().transform( view_matrix_inverse );

    } //ortho_world_to_screen

    function persepective_world_to_screen( _vector:Vector, ?_viewport:Rectangle=null ) {

        if(_viewport == null) { _viewport = viewport; }

        var _projected = project( _vector );

        var width_half = _viewport.w/2;
        var height_half = _viewport.h/2;

        return new Vector(
             ( _projected.x * width_half ) + width_half,
            -( _projected.y * height_half ) + height_half
        );

    } //persepective_world_point_to_screen


//Properties

    function set_target( _target:Vector ) : Vector {

        if(_target != null) {
            look_at_dirty = true;
        }

        return target = _target;

    } //set_target

    function set_fov( _fov:Float ) : Float {

        projection_dirty = true;
        options.fov = _fov;

        return fov = _fov;

    } //set_fov

    function set_aspect( _aspect:Float ) : Float {

        projection_dirty = true;
        options.aspect = _aspect;

        return aspect = _aspect;

    } //set_aspect

    function set_near( _near:Float ) : Float {

        projection_dirty = true;
        options.near = _near;

        return near = _near;

    } //set_near

    function set_far( _far:Float ) : Float {

        projection_dirty = true;
        options.far = _far;

        return far = _far;

    } //set_far


        //0.5 = smaller , 2 = bigger
    function set_zoom( _z:Float ) : Float {

            //a temp value to manipulate
        var _new_zoom = _z;

            //new zoom value shouldn't be allowed beyond a minimum
            //but maybe this should be optional if you want negative zoom?
        if(_new_zoom < minimum_zoom) {
            _new_zoom = minimum_zoom;
        }

        switch(projection) {

            case ProjectionType.ortho:

                    //scale the visual view based on the value
                transform.scale.x = 1/_new_zoom;
                transform.scale.y = 1/_new_zoom;

            case ProjectionType.perspective: {

                // :todo: nothing happens when zooming perspective

            }

            case ProjectionType.custom: {}

        } //switch projection

            //return the real value
        return zoom = _new_zoom;

    } //set_zoom

    var _refresh_pos : Bool = false;
    function set_center( _p:Vector ) : Vector {

        center = _p;

        switch(projection) {

            case ProjectionType.ortho:

                if(!_refresh_pos && !_setup) {
                        //setting the center is the same as setting
                        //the position relative to the viewport
                    pos.ignore_listeners = true;
                        pos.x = _p.x - (viewport.w/2);
                        pos.y = _p.y - (viewport.h/2);
                    pos.ignore_listeners = false;

                } //!_refresh_pos && !_setup

            case ProjectionType.perspective: {}

            case ProjectionType.custom: {}

        } //switch projection

        Vector.listen(center, _center_changed);

        return center;

    } //set_center

    function get_center() : Vector {
        return center;
    } //get_center

    function get_pos() : Vector {
        return pos;
    } //get_pos

    function get_rotation() : Quaternion {
        return transform.rotation;
    } //get_rotation

    function get_scale() : Vector {
        return transform.scale;
    } //get_scale

    function get_viewport() : Rectangle {
        return viewport;
    } //get_viewport

    function set_viewport(_r:Rectangle) : Rectangle {

        viewport = _r;

        switch(projection) {

            case ProjectionType.ortho:

                    //update the actual origin center of transform
                transform.origin = new Vector( _r.w/2, _r.h/2 );
                    //refresh the position and center etc
                set_pos(pos);

            case ProjectionType.perspective: {}

            case ProjectionType.custom: {}

        } //switch projection

        return viewport;

    } //set_viewport

    function set_rotation( _q:Quaternion ) : Quaternion {
        return transform.rotation = _q;
    } //set_rotation

    function set_scale( _s:Vector ) : Vector {
        return transform.scale = _s;
    } //set_scale

    function set_pos( _p:Vector ) : Vector {

        pos = _p;

        switch(projection) {

            case ProjectionType.ortho:

            var _cx = center.x;
            var _cy = center.y;

            if(viewport != null) {
                _cx = _p.x + (viewport.w/2);
                _cy = _p.y + (viewport.h/2);
            }

                _refresh_pos = true;
                    center.ignore_listeners = true;
                        center.x = _cx;
                        center.y = _cy;
                    center.ignore_listeners = false;
                _refresh_pos = false;

                transform.pos.x = _cx;
                transform.pos.y = _cy;

            case ProjectionType.perspective:

                transform.pos = pos;

            case ProjectionType.custom: {}

        } //switch projection

        Vector.listen(pos, _pos_changed);

        return pos;

    } //set_pos


    function _merge_options( _options:CameraOptions ) {

        if(options.aspect != null) {
            options.aspect = _options.aspect;
            aspect = options.aspect;
        }

        if(options.far != null) {
            options.far = _options.far;
            far = options.far;
        }

        if(options.fov != null) {
            options.fov = _options.fov;
            fov = options.fov;
        }

        if(options.near != null) {
            options.near = _options.near;
            near = options.near;
        }

        if(options.viewport != null) {
            options.viewport = _options.viewport;
            viewport = options.viewport;
        }

            //start at defaults
        apply_default_camera_options();

        if(_options.cull_backfaces != null) {
            options.cull_backfaces = _options.cull_backfaces;
        }

        if(_options.depth_test != null) {
            options.depth_test = _options.depth_test;
        }

    } //_merge_options

    function _pos_changed(v:Float) {

        set_pos(pos);

    } //_pos_changed

    function _center_changed(v:Float) {

        set_center(center);

    } //_center_changed

} //Camera

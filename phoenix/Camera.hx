package phoenix;


import phoenix.utils.Rendering;
import snow.modules.opengl.GL;
import snow.api.buffers.Float32Array;

import phoenix.Matrix;

import phoenix.Quaternion;
import phoenix.Rectangle;
import phoenix.Transform;
import phoenix.Vector;
import phoenix.Ray;

import luxe.options.CameraOptions;
import luxe.Log.*;

enum ProjectionType {
    ortho;
    perspective;
    custom;
}


class Camera {

    public var name : String = 'camera';

    @:isVar public var viewport (get,set) : Rectangle;
    @:isVar public var center   (get,set) : Vector;
    @:isVar public var zoom     (default,set) : Float = 1.0;

    @:isVar public var near     (default,set) : Float = 1000;
    @:isVar public var far      (default,set) : Float = -1000;
        //specific to perspective
    @:isVar public var fov      (default,set) : Float = 60;
    @:isVar public var fov_type (default,set) : FOVType = FOVType.horizontal;
    @:isVar public var aspect   (default,set) : Float = 1.5;
    @:isVar public var target   (default,set) : Vector;

        //we keep a local pos variable as an unaltered position
        //to keep the center relative to the viewport, and allow setting position as 0,0 not center
    @:isVar public var pos (get,set) : Vector;
        //the other transforms defer directly to the transform so aren't variables
    public var scale (get,set) : Vector;
    public var rotation (get,set) : Quaternion;
    public var transform : Transform;

    public var cull_backfaces: Bool = false;
    public var depth_test: Bool = false;

    public var minimum_zoom: Float = 0.01;
    public var projection_matrix: Matrix;
    public var view_matrix: Matrix;
    public var view_matrix_inverse: Matrix;
        //if any, a rotation matrix for the look at rotation
    public var look_at_matrix: Matrix;

    public var projection: ProjectionType;

        //:todo: Camera; Exposing wip ortho options
    public var ortho_left   (default, set): Null<Float>;
    public var ortho_right  (default, set): Null<Float>;
    public var ortho_top    (default, set): Null<Float>;
    public var ortho_bottom (default, set): Null<Float>;

    @:noCompletion public var proj_arr : Float32Array;
    @:noCompletion public var view_inverse_arr : Float32Array;

        //Internal rendering fov, always vertical
    var fov_y:Float;
        //when the transform changes, the camera needs to refresh the view matrix
    var transform_dirty : Bool = true;
        //when the projection changes we need to update refresh the matrix
    var projection_dirty : Bool = true;
        //when the target changes we can update the look at matrix
    var look_at_dirty : Bool = true;
        //when we are still busy setting up
    var setup_ : Bool = true;

        //A phoenix camera will default to ortho set to screen size
    public function new( ?_options:CameraOptions ) {

        transform = new Transform();
        projection_matrix = new Matrix();
        view_matrix = new Matrix();
        view_matrix_inverse = new Matrix();
        look_at_matrix = new Matrix();

            //order matters here
        def(_options, default_camera_options());
        projection = def(_options.projection, ProjectionType.ortho);
        center = new Vector(Luxe.screen.w/2, Luxe.screen.h/2);
        pos = new Vector();

        viewport = def(_options.viewport, new Rectangle(0, 0, Luxe.screen.w, Luxe.screen.h));

        if(_options.camera_name != null) {
            name = _options.camera_name;
        }

        transform.listen(on_transform_cleaned);

        switch (projection) {

            case ProjectionType.ortho:
                set_ortho( _options );
            case ProjectionType.perspective:
                set_perspective( _options );
            case ProjectionType.custom:

        }

        process();

        setup_ = false;

    } //new


//Public API


    public function set_ortho( _options:CameraOptions ) {

        projection = ProjectionType.ortho;

        _merge_options( _options );

    } //set_ortho

    public function set_perspective( _options:CameraOptions ) {

        projection = ProjectionType.perspective;

        _merge_options( _options );

        transform.origin.set_xyz(0,0,0);

    } //set_perspective

    public function project( _vector:Vector ) {

        update_matrices();

        var _transform = new Matrix().multiplyMatrices( projection_matrix, view_matrix_inverse );
        return _vector.clone().applyProjection( _transform );

    } //project

    public function unproject( _vector:Vector ) {

        update_matrices();

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

    @:noCompletion
    public function process() {

        update_matrices();

            //apply states
        apply_state(GL.CULL_FACE, cull_backfaces);
        apply_state(GL.DEPTH_TEST, depth_test);

    } //process

//Transforms

    inline function update_matrices() {
            
            //If we have a target, override the rotation
            //before we update the matrix, so it can be applied immediately if changing
        if(target != null) update_look_at();
        
            //update transforms and projection
        update_projection_matrix();
        update_view_matrix();

    } //update_matrices


    inline function on_transform_cleaned( t:Transform ) {

        transform_dirty = true;

    } //on_transform_cleaned

    var up_: Vector = new Vector(0,1,0);
    function update_look_at() {

        if(look_at_dirty && target != null) {

            look_at_matrix.lookAt( target, pos, up_ );

            rotation.setFromRotationMatrix( look_at_matrix );

        } //dirty & !null

    } //update_look_at

    function update_view_matrix() {

        view_matrix = transform.world.matrix;

        if(!transform_dirty) {
            return;
        }

        view_matrix_inverse = view_matrix.inverse();
        view_inverse_arr = view_matrix_inverse.float32array();

        transform_dirty = false;

    } //update_view_matrix

    function update_projection_matrix() {

        if(!projection_dirty) {
            return;
        }

        switch(projection) {

            case ProjectionType.custom:
                //

            case ProjectionType.perspective:
                projection_matrix.makePerspective( fov_y, aspect, near, far );

            case ProjectionType.ortho:

                var _l = 0.0;
                var _t = 0.0;
                var _r = viewport.w;
                var _b = viewport.h;

                if(ortho_left   != null) _l = ortho_left;
                if(ortho_right  != null) _r = ortho_right;
                if(ortho_top    != null) _t = ortho_top;
                if(ortho_bottom != null) _b = ortho_bottom;

                projection_matrix.makeOrthographic(_l, _r, _t, _b, near, far);

        } //switch

        proj_arr = projection_matrix.float32array();

        projection_dirty = false;

    } //update_projection_matrix


//Helpers


    inline function apply_state(state:Int, value:Bool) {

        if(value) {
            Luxe.renderer.state.enable(state);
        } else {
            Luxe.renderer.state.disable(state);
        }

    } //apply_state

    inline function apply_default_camera_options() {

        switch (projection) {

            case ProjectionType.ortho: {

                cull_backfaces = false;
                depth_test = false;

            } //ortho

            case ProjectionType.perspective: {

                cull_backfaces = true;
                depth_test = true;

            } //perspective

            case ProjectionType.custom: {}

        } //switch

    } //apply_default_camera_options

    inline function default_camera_options() : CameraOptions {

        return {
            projection : ProjectionType.ortho,
            depth_test : false,
            cull_backfaces : false,
            near : 1000,
            far: -1000
        };

    } //default_camera_options


//Conversions

    inline function ortho_screen_to_world( _vector:Vector ) : Vector {

        update_matrices();

        return _vector.clone().transform(view_matrix);

    } //ortho_screen_to_world

    inline function ortho_world_to_screen( _vector:Vector ) : Vector {

        update_matrices();

        return _vector.clone().transform( view_matrix_inverse );

    } //ortho_world_to_screen

    inline function persepective_world_to_screen( _vector:Vector, ?_viewport:Rectangle=null ) {

        def(_viewport, viewport);

        var _projected = project( _vector );

        var width_half = _viewport.w/2;
        var height_half = _viewport.h/2;

        return new Vector(
             ( _projected.x * width_half ) + width_half,
            -( _projected.y * height_half ) + height_half
        );

    } //persepective_world_point_to_screen


//Properties

    inline function set_target( _target:Vector ) : Vector {

        if(_target != null) {
            look_at_dirty = true;
        }

        return target = _target;

    } //set_target

    inline function set_fov( _fov:Float ) : Float {

        projection_dirty = true;

        if (fov_type == FOVType.horizontal) {
            fov_y = Rendering.fovx_to_y(_fov, aspect);
        } else {
            fov_y = _fov;
        }

        return fov = _fov;

    } //set_fov

    inline function set_fov_type(_fov_type:FOVType) : FOVType {

        fov_type = _fov_type;
            //trigger fov_y update
        set_fov(fov);

        return fov_type;

    } //set_fov_type

    inline function set_aspect( _aspect:Float ) : Float {

        projection_dirty = true;

        return aspect = _aspect;

    } //set_aspect

    inline function set_near( _near:Float ) : Float {

        projection_dirty = true;

        return near = _near;

    } //set_near

    inline function set_far( _far:Float ) : Float {

        projection_dirty = true;

        return far = _far;

    } //set_far

    inline function set_ortho_left( _val:Null<Float> ) : Null<Float> {

        projection_dirty = true;

        return ortho_left = _val;

    } //set_ortho_left

    inline function set_ortho_right( _val:Null<Float> ) : Null<Float> {

        projection_dirty = true;

        return ortho_right = _val;

    } //set_ortho_right

    inline function set_ortho_top( _val:Null<Float> ) : Null<Float> {

        projection_dirty = true;

        return ortho_top = _val;

    } //set_ortho_top

    inline function set_ortho_bottom( _val:Null<Float> ) : Null<Float> {

        projection_dirty = true;

        return ortho_bottom = _val;

    } //set_ortho_bottom

        //0.5 = smaller , 2 = bigger
    function set_zoom( _z:Float ) : Float {

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
                transform.scale.z = 1/_new_zoom;

            case ProjectionType.perspective: {

                // :todo: Camera; nothing happens when zooming perspective

            }

            case ProjectionType.custom: {

            }

        } //switch projection

            //return the real value
        return zoom = _new_zoom;

    } //set_zoom

    var refresh_pos_ : Bool = false;
    function set_center( _p:Vector ) : Vector {

        center = _p;

        switch(projection) {

            case ProjectionType.ortho:

                if(!refresh_pos_ && !setup_) {
                        //setting the center is the same as setting
                        //the position relative to the viewport
                    pos.ignore_listeners = true;
                        pos.x = _p.x - (viewport.w/2);
                        pos.y = _p.y - (viewport.h/2);
                    pos.ignore_listeners = false;

                    transform.pos.copy_from(_p);

                } //!refresh_pos_ && !setup_

            case ProjectionType.perspective: {}

            case ProjectionType.custom: {}

        } //switch projection

        Vector.Listen(center, _center_changed);

        return center;

    } //set_center

    inline function get_center() : Vector {

        return center;

    } //get_center

    inline function get_pos() : Vector {

        return pos;

    } //get_pos

    inline function get_rotation() : Quaternion {

        return transform.rotation;

    } //get_rotation

    inline function get_scale() : Vector {

        return transform.scale;

    } //get_scale

    inline function get_viewport() : Rectangle {

        return viewport;

    } //get_viewport

    function set_viewport(_r:Rectangle) : Rectangle {

        projection_dirty = true;

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

    inline function set_rotation( _q:Quaternion ) : Quaternion {

        return transform.rotation = _q;

    } //set_rotation

    inline function set_scale( _s:Vector ) : Vector {

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

                refresh_pos_ = true;
                    center.ignore_listeners = true;
                        center.x = _cx;
                        center.y = _cy;
                    center.ignore_listeners = false;
                refresh_pos_ = false;

                transform.pos.x = _cx;
                transform.pos.y = _cy;

            case ProjectionType.perspective:

                transform.pos = pos;

            case ProjectionType.custom: {}

        } //switch projection

        Vector.Listen(pos, _pos_changed);

        return pos;

    } //set_pos

    inline function _merge_options( _o:CameraOptions ) {

            //start at defaults for the type
        apply_default_camera_options();

        if(_o.aspect != null) aspect = _o.aspect;
        if(_o.far    != null) far    = _o.far;
        if(_o.fov    != null) fov    = _o.fov;
        if(_o.near   != null) near   = _o.near;

        if(_o.viewport       != null) viewport       = _o.viewport;
        if(_o.cull_backfaces != null) cull_backfaces = _o.cull_backfaces;
        if(_o.depth_test     != null) depth_test     = _o.depth_test;

            //for type, re-apply default, makes sure fov_y is correct
        if (_o.fov_type != null) {
            fov_type = _o.fov_type;
        } else {
            fov_type = FOVType.horizontal;
        }

    } //_merge_options

    inline function _pos_changed(v:Float) {

        set_pos(pos);

    } //_pos_changed

    inline function _center_changed(v:Float) {

        set_center(center);

    } //_center_changed

} //Camera

enum FOVType {
    vertical;
    horizontal;
} //FOVType

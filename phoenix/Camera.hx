package phoenix;


import lime.gl.GL;
import lime.gl.GLBuffer;
import lime.geometry.Matrix3D;
import lime.utils.Float32Array;

import phoenix.Matrix4;

import phoenix.Quaternion;
import phoenix.Rectangle;
import phoenix.Vector;
import phoenix.Ray;

enum ProjectionType {
    ortho;
    perspective;
    custom; 
}

class Camera {
    
    public var name : String = 'camera';    
    public var view_pos : Vector;
    public var rotation : Quaternion;
    public var scale: Vector;

    @:isVar public var viewport (get,set) : Rectangle;
    @:isVar public var pos (get,set) : Vector;
    @:isVar public var center (get,set) : Vector;
    @:isVar public var zoom (default,set) : Float = 1.0;

    public var minimum_zoom : Float = 0.01;
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
            
        pos = new Vector();
        view_pos = new Vector();

        rotation = new Quaternion();
        scale = new Vector(1,1,1);

        if(options.viewport == null) {
            viewport = new Rectangle( 0, 0, Luxe.screen.w, Luxe.screen.h );
        } else {
            viewport = options.viewport;
        }

        center = new Vector( viewport.w/2, viewport.h/2 );
        up = new Vector(0,1,0);
        
        projection_matrix = new Matrix4();
        projection_matrix.identity();

        view_matrix = new Matrix4();
        view_matrix.identity();

        ortho_options = {
            x1 : 0, y1 : 0,
            x2 : viewport.w, y2 : viewport.h,
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

            //reset positional offset for the actual view,
            //leaving the world position alone
        view_pos.x = center.x - ((viewport.w/2) * scale.x);
        view_pos.y = center.y - ((viewport.h/2) * scale.y);

            //return the real value
        return zoom = _new_zoom;

    } //set_zoom

    function set_center( _p:Vector ) : Vector {

        if(center == null) return center = _p;

            //adjust the center for the actual view
        view_pos.x = (_p.x - ((viewport.w/2) * scale.x));
        view_pos.y = (_p.y - ((viewport.h/2) * scale.y));

        pos.ignore_listeners = true;

                //and adjust the position for the new center, in world space
            pos.x = _p.x - (viewport.w/2);
            pos.y = _p.y - (viewport.h/2);

        pos.ignore_listeners = false;

        return center = _p;
    }

    function get_center() : Vector {
        return center;
    }

    function get_pos() : Vector {
        return pos;
    }

    function get_viewport() : Rectangle {
        return viewport;
    }

    function set_viewport(_r:Rectangle) : Rectangle {

            //rework out the center
        if(center != null) {
            center.x = ((_r.w/2) + pos.x);
            center.y = ((_r.h/2) + pos.y);
        }

        return viewport = _r;
    }

    function set_pos( _p:Vector ) : Vector {        

        if(pos != null) {
                //update the center accordingly 
            center.x = ((viewport.w/2) + _p.x);
            center.y = ((viewport.h/2) + _p.y);
                //and base the view on the new center position in world space, adjusted for zoom
            view_pos.x = (center.x - ((viewport.w/2) * scale.x));
            view_pos.y = (center.y - ((viewport.h/2) * scale.y));
        }

        pos = _p;

        _attach_listener(pos, _pos_change);

        return pos;

    } //set_pos

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

        Luxe.renderer.state.disable(GL.CULL_FACE);
            //2D doesn't usually want the depth to interfere
        // GL.clear(GL.DEPTH_BUFFER_BIT);
        Luxe.renderer.state.disable(GL.DEPTH_TEST);
        
            //todo:This doesn't need to be rebuilt every frame
        projection_matrix = projection_matrix.makeOrthographic( 0, viewport.w, 0, viewport.h, ortho_options.near, ortho_options.far);
            //Rebuild the modelview, todo:dirtify this
        view_matrix = view_matrix.compose( view_pos, rotation, scale );

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
        Luxe.renderer.state.enable(GL.CULL_FACE);
        Luxe.renderer.state.enable(GL.DEPTH_TEST);
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

    function ortho_screen_to_world( _vector:Vector ) : Vector {

        var _world_x = ( _vector.x * scale.x ) + view_pos.x;
        var _world_y = ( _vector.y * scale.y ) + view_pos.y;

        return new Vector( _world_x, _world_y );

    } //ortho_screen_to_world

    function ortho_world_to_screen( _vector:Vector ) : Vector {

        var _screen_x = ( _vector.x - view_pos.x ) / scale.x;
        var _screen_y = ( _vector.y - view_pos.y ) / scale.y;

        return new Vector( _screen_x, _screen_y );

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

    private function _merge_options( projection_options:Dynamic, options:Dynamic) {

        if(projection_options == null) {
            projection_options = {};
        }

        var fields = Reflect.fields(options);
        for(field in fields) {
            Reflect.setField(projection_options, field, Reflect.field(options, field));
        }

    } //_merge_options    

        //An internal callback for when x y or z on a transform changes
    private function _pos_change(_v:Float) { this.set_pos(pos); }
        //An internal callback for when x y or z on a transform changes
    // private function _scale_change(_v:Float) { this.set_scale(scale); }
        //An internal callback for when x y or z on a transform changes
    // private function _rotation_change(_v:Float) { this.set_rotation(rotation); }

        //An internal function to attach position 
        //changes to a vector, so we can listen for `pos.x` as well
    private function _attach_listener( _v : Vector, listener ) {
        _v.listen_x = listener; 
        _v.listen_y = listener; 
        _v.listen_z = listener;
    } //_attach_listener


} //Camera

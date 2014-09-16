package luxe;

import luxe.Rectangle;
import luxe.utils.Maths;
import luxe.Vector;
import luxe.Entity;
import luxe.tween.Actuate;
import luxe.tween.easing.Quad;
import phoenix.Camera.ProjectionType;
import phoenix.Quaternion;

import luxe.options.CameraOptions;

typedef ProjectionType = phoenix.Camera.ProjectionType;

class Camera extends Entity {

        /** The viewport size for this camera, proxy to the view */
    public var viewport (get,set) : Rectangle;
        /** The center point of this camera, proxy to the view */
    public var center (get,set) : Vector;
        /** The current zoom value this camera can be set to, proxy to the view */
    public var zoom (get,set) : Float;
        /** The minimum zoom value this camera can be set to, proxy to the view */
    public var minimum_zoom (get,set) : Float;

        /** the view camera this entity wraps */
    public var view : phoenix.Camera;
        /** if set, the camera will not move outside of this region (world space) */
    public var bounds : Rectangle;

        /** the current shake vector amounts in x,y,z */
    @:noCompletion public var shake_vector : Vector;
        /** the last shake amount */
    @:noCompletion public var shake_amount : Float;
        /** if true, shake is busy happening */
    @:noCompletion public var shaking : Bool = false;
        /** the threshold cutoff for shaking */
    @:noCompletion public var minimum_shake : Float = 0.1;

    var update_view_pos : Vector;

    var _final_pos : Vector;
    var _rotation_radian : Vector;
    var _rotation_cache : Quaternion;

        /** create a new camera with the given options */
    public function new( ?options:LuxeCameraOptions ) {

            //cache for later
        _rotation_radian = new Vector();
        _rotation_cache = new Quaternion();

        var _name = 'untitled camera';

        if(options != null) {
            if(options.name != null) {
                _name = options.name;
            }
        } else {
            options = {
                no_scene : false
            }
        }

            //Init the entity part
        super({
            name : _name,
            no_scene : options.no_scene
        });

                //Apply options
            view = options.view == null ? new phoenix.Camera( options ) : options.view;

            //Start with the transform
        _final_pos = view.pos;

    } //new

    function get_viewport() : Rectangle {
        return view.viewport;
    } //get_viewport

    function set_viewport( _v:Rectangle ) : Rectangle {
        return view.viewport = _v;
    } //set_viewport

    function get_center() : Vector {
        return view.center;
    } //get_center

    function set_center( _c:Vector ) : Vector {

        pos = new Vector(_c.x - (viewport.w/2), _c.y - (viewport.h/2));
        return view.center = _c;

    } //set_center

    function get_minimum_zoom() : Float {
        return view.minimum_zoom;
    } //get_minimum_zoom

    function set_minimum_zoom( _m:Float ) : Float {
        return view.minimum_zoom = _m;
    } //set_minimum_zoom

    function get_zoom() : Float {
        return view.zoom;
    } //get_zoom

    function set_zoom( _z:Float ) : Float {
        return view.zoom = _z;
    } //set_zoom

        /**Focus the camera on a specific point, for Ortho only.
        Use `.target` for a focus in perspective */
    public function focus( _p:Vector, _t:Float = 0.6, ?oncomplete:Void->Void=null ) {

        Actuate.tween(view.center, _t, { x:_p.x, y:_p.y }, true )
            .onComplete( oncomplete ).ease( Quad.easeInOut )
            .onUpdate( function() {
                pos = view.pos.clone();
                _final_pos.set_xyz( pos.x, pos.y, pos.z );
            });

    } //focus

        /** convert a screen point to world space for this camera. handles zoom, rotation, scale, etc */
    public function screen_point_to_world( _vector:Vector ) : Vector {

        return view.screen_point_to_world( _vector );

    } //screen_point_to_world

        /** convert a world point to screen space for this camera. handles zoom, rotation, scale, etc */
    public function world_point_to_screen( _vector:Vector, ?_viewport:Rectangle=null ) : Vector {

        return view.world_point_to_screen( _vector, _viewport );

    } //world_point_to_screen

    override function set_pos_from_transform(_pos:Vector) {

        super.set_pos_from_transform(_pos);

        if(bounds != null) {
            if(_pos.x < bounds.x) _pos.x = bounds.x;
            if(_pos.y < bounds.y) _pos.y = bounds.y;
            if(_pos.x > bounds.w-view.viewport.w) _pos.x = bounds.w-view.viewport.w;
            if(_pos.y > bounds.h-view.viewport.h) _pos.y = bounds.h-view.viewport.h;
        }

            //flag for update
        update_view_pos = _pos;

    } //set_pos_from_transform

    override function set_rotation_from_transform(_rotation:Quaternion) {

        super.set_rotation_from_transform(_rotation);

        if(view != null) {
            view.rotation = _rotation;
        }

    } //set_scale_from_transform

    override function set_scale_from_transform(_scale:Vector) {

        super.set_scale_from_transform(_scale);

        if(view != null) {
            view.scale = _scale;
        }

    } //set_scale_from_transform

        /** Shake the camera a given amount */
    public function shake(amount:Float) {

        shake_amount = amount;
        shaking = true;

    } //shake

        //Called by the scene the camera belongs to, or manually if you want
    @:noCompletion override public function update(dt:Float) {

            //add camera shake
        if(shaking) {

                //start at our base position
            _final_pos.set_xyz( transform.pos.x, transform.pos.y, transform.pos.z );

                //get a random direction
            shake_vector = Luxe.utils.geometry.random_point_in_unit_circle();

                //apply the shake amount scale
            shake_vector.x *= shake_amount;
            shake_vector.y *= shake_amount;
            shake_vector.z *= shake_amount;

                //fade the shake down
            shake_amount *= 0.9;

                //stop when it's too low
            if(shake_amount <= minimum_shake) {
                shake_amount = 0;
                shaking = false;
            }

                //add the shake to the final position and apply it to the view
            _final_pos.set_xyz(_final_pos.x+shake_vector.x, _final_pos.y+shake_vector.y, _final_pos.z+shake_vector.z);

                //tell it to update the view
            update_view_pos = _final_pos;

        } //shaking

        if(update_view_pos != null && view != null) {
            view.pos = update_view_pos.clone();
            update_view_pos = null;
        }

    } //update

} //Camera

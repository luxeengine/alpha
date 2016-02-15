package luxe;

import luxe.Log.*;
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

    /** A value to use when controlling the camera size property only. */
enum SizeMode {

        /** fit the size into the camera viewport (possible letter/pillar box) */
    fit;
        /** cover the viewport with the size (possible cropping) */
    cover;
        /** contain the size (stretch to fit the viewport)*/
    contain;

} //SizeMode

    /** An entity based camera class */
class Camera extends Entity {

        /** The viewport size for this camera, proxy to the view */
    public var viewport (get,set) : Rectangle;
        /** The center point of this camera, proxy to the view */
    public var center (get,set) : Vector;
        /** The current zoom value this camera can be set to, proxy to the view */
    public var zoom (get,set) : Float;
        /** The minimum zoom value this camera can be set to, proxy to the view */
    public var minimum_zoom (get,set) : Float;

        /** The virtual size of this camera. allows simple upscaling world coordinates, using `size_mode`. Note that this changes the view `scale` values and the `center` property. */
    @:isVar public var size (get,set) : Vector;
        /** When the size of the world is set using the `size` property, this controls how the scaling will apply. */
    @:isVar public var size_mode (get,set) : SizeMode;

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

    var _size_factor : Vector;
    var _final_pos : Vector;
    var _rotation_radian : Vector;
    var _rotation_cache : Quaternion;

        /** create a new camera with the given options */
    public function new( ?options:LuxeCameraOptions ) {

            //cache for later
        _size_factor = new Vector();
        _rotation_radian = new Vector();
        _rotation_cache = new Quaternion();
        size_mode = SizeMode.fit;

        var _name = 'untitled camera';

        if(options != null) {
            if(options.name != null) {
                _name = options.name;
                options.camera_name = '$_name.view';
            }
        } else {
            options = {
                no_scene : false
            }
        }

            //create or assign the underlying camera view
        view = def(options.view, new phoenix.Camera( options ));

            //Init the entity part
        super({
            name : _name,
            no_scene : options.no_scene
        });

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

            //assign the base zoom
        view.zoom = _z;

            //handle size mode scale factor
        if(size != null) {
            view.scale.x *= (1/_size_factor.x);
            view.scale.y *= (1/_size_factor.y);
        }

        return view.zoom;

    } //set_zoom

    function get_size() : Vector {
        return size;
    } //get_size

    function get_size_mode() : SizeMode {
        return size_mode;
    } //get_size

    function set_size_mode( _m:SizeMode ) : SizeMode {

        if(size_mode != null) {
            size_mode = _m;
            if(size != null) {
                set_size( size );
            }
        }

        return size_mode = _m;

    } //get_size

    var _connected = false;
    function _onwindowsized( _event:luxe.Screen.WindowEvent ) {
        if(size != null) {
                //:todo: set_xy handlers on viewport etc
                //:todo: disconnect on destroy when destroy exists for camera
            viewport = new Rectangle(viewport.x, viewport.y, _event.x, _event.y );
            set_size(size);
        }
    }

    function set_size( _size:Vector ) : Vector {

            //disable size
        if( _size == null ) {
            center = new Vector(viewport.w/2, viewport.h/2);
            size = _size;
            _size_factor.x = _size_factor.y = 1;
            set_zoom(zoom);
            _connected = false;
            Luxe.off(Luxe.Ev.windowsized, _onwindowsized);
            return size;
        }

        if(!_connected) {
            Luxe.on(Luxe.Ev.windowsized, _onwindowsized);
            _connected = true;
        }

            //setting the size is an explicit action,
            //making the center point fixed to the middle of the size,
            //and making the scale of the view a ratio between the viewport
            //size and the actual "world" size given
        var _ratio_x = viewport.w / _size.x;
        var _ratio_y = viewport.h / _size.y;
        var _shortest = Math.max( _ratio_x, _ratio_y );
        var _longest = Math.min( _ratio_x, _ratio_y );

        switch(size_mode) {

            case fit:{
                _ratio_x = _ratio_y = _longest;
            }

            case cover: {
                _ratio_x = _ratio_y = _shortest;
            }

            case contain: {
                //use actual size
            }

        } //size_mode

            //assign the scale values
        _size_factor.x = _ratio_x;
        _size_factor.y = _ratio_y;

        view.scale.x = 1/(_size_factor.x * zoom);
        view.scale.y = 1/(_size_factor.y * zoom);

            //set the center
        center = new Vector( _size.x/2, _size.y/2 );

            //return
        return size = _size.clone();

    } //set_size

        /**Focus the camera on a specific point, for Ortho only.
        Use `.target` for a focus in perspective */
    public function focus( _p:Vector, _t:Float = 0.6, ?oncomplete:Void->Void=null ) {

        Actuate.tween(view.center, _t, { x:_p.x, y:_p.y }, true )
            .onComplete( oncomplete ).ease( Quad.easeInOut )
            .onUpdate( function() {
                transform.pos.set_xy(view.pos.x, view.pos.y);
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

    // var cnt = 0;
    override function set_pos_from_transform(_pos:Vector) {

        var vw = view.viewport.w;
        var vh = view.viewport.h;
        var hvw = vw/2;
        var hvh = vh/2;

        var _px = _pos.x; var _py = _pos.y;

        if(bounds != null) {
            if(_px < bounds.x)        _px = bounds.x;
            if(_py < bounds.y)        _py = bounds.y;
            if(_px+hvw > bounds.w-vw) _px = bounds.w-vw-hvw;
            if(_py+hvh > bounds.h-vh) _py = bounds.h-vh-hvh;
        }

        var prev = _pos.ignore_listeners;
            _pos.ignore_listeners = true;
        _pos.set_xy(_px, _py);
            _pos.ignore_listeners = prev;

        super.set_pos_from_transform(_pos);

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

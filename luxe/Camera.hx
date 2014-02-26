package luxe;

import luxe.Rectangle;
import luxe.utils.Maths;
import luxe.Vector;
import luxe.Entity;
import luxe.tween.Actuate;
import luxe.tween.easing.Quad;
import phoenix.Camera.ProjectionType;
import phoenix.Quaternion;

typedef ProjectionType = phoenix.Camera.ProjectionType;

class Camera extends Entity {

	public var view : phoenix.Camera;

    @:isVar public var viewport (get,set) : Rectangle;
    @:isVar public var center (get,set) : Vector;
    @:isVar public var zoom (get,set) : Float = 1.0;
    @:isVar public var minimum_zoom (get,set) : Float = 0.01;

	public var bounds : Rectangle;

	public var shake_vector : Vector;
    public var shake_amount : Float;
    public var shaking : Bool = false;
    public var minimum_shake : Float = 0.1;

    var _final_pos : Vector;
    var _rotation_radian : Vector;
    var _rotation_cache : Quaternion;

	public function new(?options:Dynamic = null) {
			
		if(options == null) options = {};		

            //cache for later
        _rotation_radian = new Vector();
        _rotation_cache = new Quaternion();

        var _name = options.name == null ? 'untitled camera' : options.name;

			//Init the entity part
		super({
            name : _name,
            no_scene : options.no_scene
        });

				//Apply options
			view = options.view == null ? new phoenix.Camera(options) : options.view;

			//Update
        _final_pos = view.pos;

	} //new

    function get_viewport() : Rectangle {
        return view.viewport;
    }

    function set_viewport( _v:Rectangle ) : Rectangle {
        return view.viewport = _v;
    }

    function get_center() : Vector {
        return view.center;
    }

    function set_center( _c:Vector ) : Vector {
        return view.center = _c;
    }

    override function get_scale() : Vector {
        return view == null ? scale : view.scale;
    }

    override function set_scale( _c:Vector ) : Vector {
        return view == null ? scale = _c : view.scale = _c;
    }

    override function get_rotation() : Vector {

        // if(view != null) {
        //     rotation.ignore_listeners = true;
        //     rotation.setEulerFromQuaternion( view.rotation );
        //     rotation.ignore_listeners = false;
        // }

        return rotation;
        
    } //get_rotation

    override function set_rotation( _r:Vector ) : Vector {

        _rotation_radian.set( Maths.degToRad(_r.x), Maths.degToRad(_r.y), Maths.degToRad(_r.z) );
        _rotation_cache.setFromEuler( _rotation_radian );

            //set only if the view exists
        if(view != null) {
            view.rotation = _rotation_cache;
        }
            
            //store 
        rotation = _r;

            //listen for sub changes on properties
        _attach_listener( rotation, _rotation_change );

        return rotation;

    } //set_rotation

    function get_minimum_zoom() : Float {
        return view.minimum_zoom;
    }

    function set_minimum_zoom( _m:Float ) : Float {
        return view.minimum_zoom = _m;
    }

    function get_zoom() : Float {
        return view.zoom;
    }

    function set_zoom( _z:Float ) : Float {
        return view.zoom = _z;
    }

		///Focus the camera on a specific point, for Ortho atm
	public function focus( _p:Vector, _t:Float = 0.6, ?oncomplete:Void->Void=null ) {	

		var center_point_x = (_p.x/view.scale.x) - (viewport.w/2);
		var center_point_y = (_p.y/view.scale.y) - (viewport.h/2);

		Actuate.tween(pos, _t, { x:center_point_x, y:center_point_y }, true )
            .onComplete( oncomplete ).ease( Quad.easeInOut )
            .onUpdate( function() {
                _final_pos.set_xyz( pos.x, pos.y, pos.z );
                view.pos = _final_pos;
            });

	} //focus

    public function screen_point_to_world( _vector:Vector ) : Vector {
        return view.screen_point_to_world( _vector );
    } //screen_point_to_world

    public function world_point_to_screen( _vector:Vector, ?_viewport:Rectangle=null ) : Vector {
        return view.world_point_to_screen( _vector, _viewport );
    } //world_point_to_screen


    @:noCompletion public override function get_pos() : Vector {
        return pos;
    }

	@:noCompletion public override function set_pos(v:Vector) : Vector {
		
        if(view != null) {

            if(bounds != null) {
                if(v.x < bounds.x) v.x = bounds.x;
                if(v.y < bounds.y) v.y = bounds.y;
                if(v.x > bounds.w-view.viewport.x) v.x = bounds.w-view.viewport.x;
                if(v.y > bounds.h-view.viewport.y) v.y = bounds.h-view.viewport.y;
            }

            view.pos = v;
        }

		pos = v;

			//listen for sub changes on properties
		_attach_listener( pos, _pos_change );

		return pos;
	}

    public function shake(amount:Float) {
        shake_amount = amount;
        shaking = true;
    }

        //Called by the scene the camera belongs to, or manually if you want    
    @:noCompletion public function update(dt:Float) {    	       

    		//add camera shake
        if(shaking) {

                //start at our base position
            _final_pos.set_xyz( pos.x, pos.y, pos.z );

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

                //finally set the position to the camera
            view.pos = _final_pos;

        } //shaking

    } //update

    public override function get_serialize_data() : Dynamic {

        var _data : Dynamic = super.get_serialize_data();

        var _extra : Dynamic = {
            camera_type : view.projection.getName()            
        };
        
        if(bounds != null)                                  _extra.bounds = bounds.serialized;
        if(view.target != null)                             _extra.target = view.target.serialized;
        if(view.projection == ProjectionType.ortho)         _extra.camera_options = view.perspective_options;
        if(view.projection == ProjectionType.perspective)   _extra.camera_options = view.ortho_options;

        return _merge_properties(_data, _extra);

    } //get_serialize_data    

}



//     //check that we are within the given bounds
// if(bounds != null) {
//     if(final_pos.x < bounds.x) final_pos.x = bounds.x;
//     if(final_pos.y < bounds.y) final_pos.y = bounds.y;
//     if(final_pos.x > bounds.w-view.size.x) final_pos.x = bounds.w-view.size.x;
//     if(final_pos.y > bounds.h-view.size.y) final_pos.y = bounds.h-view.size.y;
// }

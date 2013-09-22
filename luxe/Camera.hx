package luxe;

import luxe.Rectangle;
import luxe.Vector;
import luxe.Entity;
import luxe.tween.Actuate;
import luxe.tween.easing.Quad;
import phoenix.Camera.ProjectionType;

typedef ProjectionType = phoenix.Camera.ProjectionType;

class Camera extends Entity {
	
	public var view : phoenix.Camera;
	private var view_position : Vector;

	public var bounds : Rectangle;

	public var shake_vector : Vector;
    public var shake_amount : Float;
    public var shaking : Bool = false;

	public function new(?options:Dynamic = null) {
			
		if(options == null) options = {};		

			//Init the entity part
		super();
			//Start with defaults
		name = 'untitled camera';

				//Apply options
			name = options.name == null ? name : options.name;
			view = options.view == null ? new phoenix.Camera(options) : options.view;

			//Update
		view_position = view.pos;

	}

		///Focus the camera on a specific point, for Ortho atm
	public function center( _p:Vector, _t:Float = 0.6, ?oncomplete:Void->Void=null ) {	

		var center_point_x = _p.x - (view.size.x/2);
		var center_point_y = _p.y - (view.size.y/2);

		Actuate.tween(view_position, _t, { x:center_point_x, y:center_point_y }, true ).onComplete( oncomplete ).ease( Quad.easeInOut );

	} //

	@:nocompletion public override function set_pos(v:Vector) : Vector {
		
		if(bounds != null) {
        	if(v.x < bounds.x) v.x = bounds.x;
        	if(v.y < bounds.y) v.y = bounds.y;
        	if(v.x > bounds.w-view.size.x) v.x = bounds.w-view.size.x;
        	if(v.y > bounds.h-view.size.y) v.y = bounds.h-view.size.y;
        }

		view_position = v;
		pos = v;

			//listen for sub changes on properties
		_attach_listener( pos, _pos_change );

		return pos;
	}

    public function shake(amount:Float) {
        shake_amount = amount;
        shaking = true;
    }

    public function update(dt:Float) {
    	
    		//start at our base position
    	var final_position = view_position.clone();
    		//add camera shake
        if(shaking) {
            shake_vector = Luxe.utils.geometry.random_point_in_unit_circle();
            shake_vector.x *= shake_amount;
            shake_vector.y *= shake_amount; 
            shake_vector.z *= shake_amount;         
            shake_amount *= 0.9;
            final_position = Vector.Add(final_position, shake_vector);
        } 

        	//check that we are within the given bounds
        if(bounds != null) {
        	if(final_position.x < bounds.x) final_position.x = bounds.x;
        	if(final_position.y < bounds.y) final_position.y = bounds.y;
        	if(final_position.x > bounds.w-view.size.x) final_position.x = bounds.w-view.size.x;
        	if(final_position.y > bounds.h-view.size.y) final_position.y = bounds.h-view.size.y;
        }

        	//add other modifiers


        	//finally, assign the position
        view.pos = final_position;
    }    

}
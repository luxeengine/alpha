package lab;

import lab.Vector;
import lab.Entity;
import phoenix.Camera.ProjectionType;

class Camera extends Entity {
	
	public var view : phoenix.Camera;
	private var view_position : Vector;

	public var shake_vector : Vector;
    public var shake_amount : Float;
    public var shaking : Bool = false;

	public function new(?options:Dynamic) {
		
		super();

		name = options.name == null ? 'untitled camera' : options.name;
		view_position = new Vector();


		if(options != null) {
			if(options.view != null) {
				view = options.view;
			}
		} else {
				//default to the main camera. 
			view = Lab.camera.view;
		}

		view_position = view.pos;

	}

	public override function set_pos(v:Vector) : Vector {		
		view_position = v;
		pos = v;

			//listen for sub changes
		// super.set_pos( pos );

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
            shake_vector = Lab.utils.geometry.random_point_in_unit_circle();
            shake_vector.x *= shake_amount;
            shake_vector.y *= shake_amount;            
            shake_amount *= 0.9;
            final_position = Vector.Add(final_position, shake_vector);
        } 
        	//add other modifiers

        	//finally, assign the position
        view.pos = final_position;
    }    

}
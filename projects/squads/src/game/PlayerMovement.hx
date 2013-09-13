
package game;

import luxe.Vector;
import luxe.Sprite;

import luxe.components.Components.Component;

class PlayerMovement extends Component {
	
	public var velocity : Vector;

	public var linear_drag : Float = 0.81;
	public var speed : Float = 70;

		//a value used to predict movement, so it can be 
		//cancelled or applied at the end of the physics update
	var next_pos : Vector;
	var skip_physics : Bool = false;

	public function init() {

		velocity = new Vector();
		next_pos = new Vector();

		entity.fixed_rate = 0.02;

	} //new

	public function fixed_update() {

			//50hz
		var _step:Float = 0.02;

//make sure we are at latest values
		skip_physics = false;
		next_pos.set(pos.x, pos.y);

//apply linear drag
		velocity.x *= linear_drag;
		velocity.y *= linear_drag;

//then apply velocity to position
		if(velocity.x != 0) {
			next_pos.x += velocity.x * _step;
		}
		if(velocity.y != 0) {
			next_pos.y += velocity.y * _step;
		}
//then we can perform collision and bounds checking
		
//and finally, if there was an actual change 
		if(!skip_physics) {
			pos = next_pos;
		}
		
	} //do_physics

} //Player
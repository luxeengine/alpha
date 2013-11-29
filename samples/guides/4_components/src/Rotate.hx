import luxe.components.Components.Component;
import luxe.Vector;

//This component will rotate the entity that it is attached to a small amount each frame.
//It is assumed that the entity is a Sprite! 

class Rotate extends Component {

	public var rotate_speed : Float = 10;
	public var max_rotate_speed : Float = 60;

    public function update(dt:Float) {

    		//changes to the transform inside of components affect the entity directly!
        rotation.z += rotate_speed * dt;

    }

}
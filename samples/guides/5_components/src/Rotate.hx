
import luxe.Vector;

import luxe.Component;
import luxe.Sprite;

//This component will rotate the entity that it is attached to a small amount each frame.
//It is assumed that the entity is a Sprite!

class Rotate extends Component {


    public var rotate_speed : Float = 10;
    public var max_rotate_speed : Float = 60;

    var sprite : Sprite;

    override function init() {
        sprite = cast entity;
    }

    override function update( dt:Float ) {

            //changes to the transform inside of components affect the entity directly!
        sprite.rotation_z += rotate_speed * dt;

    } //update

} //Rotate

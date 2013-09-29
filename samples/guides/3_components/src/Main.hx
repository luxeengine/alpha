
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;

class Main extends luxe.Game {

	var logo : Sprite;
	var rotator : Rotate;

    public function ready() {

    	logo = new Sprite({
            pos : new Vector(Luxe.screen.w/2, Luxe.screen.h/2),
            texture : Luxe.loadTexture('assets/luxelogo.png'),
        }); 

            //Now the important bit, we attach a component to an 
            //entity by calling .add(TypeOfComponent, 'NameOfComponent');
            //It is important to note that the name of the component must be set 
            //if you want to fetch it later using .get('NameOfComponent').
            //If no name is given, it uses a UUID.
        rotator = logo.add(Rotate, 'rotator');
        
        	//we don't need to reference the bounce component, so we just add it.
        logo.add(Bounce, 'bounce');

    } //ready

    public function onmousemove( e:MouseEvent ) {

    	var percent = e.pos.x / Luxe.screen.w;
    	var new_speed = percent * rotator.max_rotate_speed;

    		rotator.rotate_speed = new_speed;

    		// trace(rotator.rotate_speed);
    }

} //Main
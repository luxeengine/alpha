
import luxe.Input;
import luxe.Sprite;
import luxe.Text;
import luxe.Vector;
import luxe.Color;


class Main extends luxe.Game {


	var logo : Sprite;
	var rotator : Rotate;
    var delta_time_text : Text;


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

        delta_time_text = new luxe.Text({
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(60,60),
            font : Luxe.renderer.default_font,
            size : 20
        });

    } //ready

    public function update(dt:Float) {
            //Update the text each frame
        delta_time_text.text = 'dt : ' + dt + '\n average : ' + Luxe.debug.dt_average;

    } //update

    public function onmousemove( e:MouseEvent ) {

    	var percent = e.pos.x / Luxe.screen.w;
    	var new_speed = percent * rotator.max_rotate_speed;

    		rotator.rotate_speed = new_speed;

    } //onmousemove


} //Main

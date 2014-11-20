
import luxe.Input;
import luxe.Sprite;
import luxe.Text;
import luxe.Vector;
import luxe.Color;


class Main extends luxe.Game {


	var logo : Sprite;
	var rotator : Rotate;
    var delta_time_text : Text;


    override function ready() {

    	logo = new Sprite({
            pos : new Vector(Luxe.screen.w/2, Luxe.screen.h/2),
            texture : Luxe.loadTexture('assets/luxelogo.png'),
        });

        rotator = new Rotate({ name:'rotator' });
        logo.add(rotator);

        	//we don't need to reference the bounce component, so we just add it.
        logo.add(new Bounce({ name:'bounce' }));

        delta_time_text = new luxe.Text({
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(60,60),
            font : Luxe.renderer.font,
            point_size : 20
        });

    } //ready

    override function update(dt:Float) {
            //Update the text each frame
        delta_time_text.text = 'dt : ' + dt + '\n average : ' + Luxe.debug.dt_average;

    } //update

    override function onmousemove( e:MouseEvent ) {

    	var percent = e.pos.x / Luxe.screen.w;
    	var new_speed = percent * rotator.max_rotate_speed;

    		rotator.rotate_speed = new_speed;

    } //onmousemove

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main


import luxe.Vector;
import luxe.Input;
import luxe.Color;

class Main extends luxe.Game {


    public var delta_time_text : luxe.Text;


    override function ready() {

            //Create some text!
        delta_time_text = new luxe.Text({
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(10,10),
            font : Luxe.renderer.font,
            size : 20
        });

    } //ready

    override function onkeyup( e:KeyEvent ) {

            //quit when we press escape
        if(e.keycode == Key.ESCAPE) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update( dt:Float ) {

            //Update the text each frame
        delta_time_text.text = 'dt : ' + dt + '\n average : ' + Luxe.debug.dt_average;

    } //update

    override function destroyed() {

    } //destroyed


} //Main


import luxe.Vector;
import luxe.Input;
import luxe.Color;

import lime.gl.GL;
import lime.gl.GL.Ext;

class Main extends luxe.Game {


    public var delta_time_text : luxe.Text;


    public function ready() {

            //Create some text!
        delta_time_text = new luxe.Text({
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(10,10),
            font : Luxe.renderer.font,
            size : 20
        });

    } //ready
  
    public function onkeyup( e:KeyEvent ) {
        
            //quit when we press escape
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    public function update( dt:Float ) {

            //Update the text each frame
        delta_time_text.text = 'dt : ' + dt + '\n average : ' + Luxe.debug.dt_average;

    } //update

    public function destroyed() {

    } //destroyed


} //Main

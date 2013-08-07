
import lab.Vector;
import lab.Input;
import lab.Color;

import lime.gl.GL;
import lime.gl.GL.Ext;

class Main extends lab.Game {

    public var delta_time_text : lab.Text;

    public function ready() {

            //Create some text!
        delta_time_text = new lab.Text({
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(10,10),
            font : Lab.renderer.default_font,
            size : 20
        });

    } //ready
  
    public function onkeyup(e) {
        
            //quit when we press escape
        if(e.value == Input.Keys.escape) {
            Lab.shutdown();
        }

    } //onkeyup

    public function update(dt:Float) {

            //Update the text each frame
        delta_time_text.text = 'dt : ' + dt + '\n average : ' + Lab.debug.dt_average;

    } //update

    public function shutdown() {

    } //shutdown
}



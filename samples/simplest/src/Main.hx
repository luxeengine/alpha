
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
            font : Luxe.renderer.default_font,
            size : 20
        });

        trace( (function(ag,ad){}).length );


        // var do_test = function(_done:Void->Void) {
        //     var isasync = false;
        //     test( _done );
        // }

        // do_test(function(){
        //     trace('all complete');
        // });

    } //ready
  
    public function onkeyup(e) {
        
            //quit when we press escape
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    public function update(dt:Float) {

            //Update the text each frame
        delta_time_text.text = 'dt : ' + dt + '\n average : ' + Luxe.debug.dt_average;

    } //update

    public function shutdown() {

    } //shutdown
}



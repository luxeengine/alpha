
import lab.Color;
import lab.Rectangle;
import lab.Text;
import lab.Vector;
import lab.Input;

import MIControl;
import MICanvas;
import phoenix.BitmapFont.TextAlign;

class Main extends lab.Game {


    public var canvas : MICanvas;
    public var button : MIButton;

    public function ready() {
        
        canvas  = new MICanvas({
            bounds : new Rectangle( 100, 100, 760, 440 )
        });

        button = new MIButton({
            parent : canvas,
            name : 'click',
            bounds : new Rectangle( 10, 10, 100, 25 ),
            text : 'click me',
            text_size : 15,
            onclick : function(){ trace('hello world'); }
        });

    } //ready
    
    public function onmousemove(e) {
        canvas.onmousemove(e);
    }

    public function onmouseup(e) {
        canvas.onmouseup(e);
    }

    public function onmousedown(e) {
        canvas.onmousedown(e);
    }

    public function onkeyup(e) {
      if(e.value == Input.Keys.escape) {
        Lab.shutdown();
      }
    } //onkeyup

    public function update(dt:Float) {
        canvas.update(dt);
    } //update

    public function shutdown() {

    } //shutdown
}



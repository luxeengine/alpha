
import lab.Color;
import lab.Rectangle;
import lab.Text;
import lab.Vector;
import lab.Input;
import lab.Sprite;

import MIControl;
import MICanvas;
import phoenix.BitmapFont.TextAlign;

class Main extends lab.Game {


    public var canvas : MICanvas;
    public var button : MIButton;
    public var image : MIImage;
    public var scroller : MIScrollArea;

    public function ready() {
        
        canvas  = new MICanvas({
            bounds : new Rectangle( 50, 100, 810, 440 )
        });

        button = new MIButton({
            parent : canvas,
            name : 'click',
            bounds : new Rectangle( 10, 10, 100, 25 ),
            text : 'click me',
            text_size : 15,
            onclick : function(){ trace('hello world'); }
        });

        scroller = new MIScrollArea({
            parent : canvas,
            name : 'scrollarea',
            bounds : new Rectangle( 120, 10, 640, 360 )
        });

        image = new MIImage({
            parent : scroller,
            name : 'image',
            bounds : new Rectangle( 0, -360, 1280, 720 ),
            texture : Lab.loadTexture('assets/image.png'),
        });

        trace(scroller.children_bounds());

    } //ready
    
    public function onmousemove(e) {
        canvas.onmousemove(e);
    }

    public function onmouseup(e) {
        canvas.onmouseup(e);
    }

    public function onmousedown(e) {
        if(e.button == lime.InputHandler.MouseButton.wheel_up) {
            scroller.scrollx(-10);
        } else if(e.button == lime.InputHandler.MouseButton.wheel_down) {
            scroller.scrollx(10);
        }
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



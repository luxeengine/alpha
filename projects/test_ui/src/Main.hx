
import lab.Color;
import lab.Rectangle;
import lab.Text;
import lab.Vector;
import lab.Input;
import lab.Sprite;

import MIControl;
import MICanvas;
import phoenix.BitmapFont.TextAlign;
import phoenix.Rectangle;

class Main extends lab.Game {


    public var canvas : MICanvas;
    public var button : MIButton;
    public var image : MIImage;
    public var scroller : MIScrollArea;
    public var scroller1 : MIScrollArea;

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
            bounds : new Rectangle( 120, 10, 300, 360 )
        });        

        scroller1 = new MIScrollArea({
            parent : canvas,
            name : 'scrollarea1',
            bounds : new Rectangle( 430, 10, 300, 360 )
        });

        image = new MIImage({
            parent : scroller1,
            name : 'image',
            bounds : new Rectangle( 0, 0, 1280, 720 ),
            texture : Lab.loadTexture('assets/image.png'),
        });

        scroller1.scrolly(-360);

        for(i in 0 ... 5) {
            var l = new MIButton({
                parent : scroller,
                name : 'button' + (i+1),
                bounds : new Rectangle(50, i * 100, 100, 100 ),
                text : 'click me + '+ (i+1),
                text_size : 18,
                onclick : function(){ trace('click me + '+ (i+1)); }
            });
        }

        trace(scroller.children_bounds());
        trace(scroller1.children_bounds());

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



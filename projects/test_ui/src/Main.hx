
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
    public var button1 : MIButton;
    public var image : MIImage;
    public var scroller : MIScrollArea;
    public var scroller1 : MIScrollArea;
    public var itemlist : MIList;
    public var window : MIWindow;

    var s : Sprite;

    public function ready() {
        
        Lab.renderer.clear_color.set(1,1,1);

        canvas  = new MICanvas({
            bounds : new Rectangle( 0, 0, Lab.screen.w, Lab.screen.h )
        });

        button = new MIButton({
            parent : canvas,
            name : 'click',
            bounds : new Rectangle( 10, 10, 100, 35 ),
            text : 'click me',
            text_size : 15,
            onclick : function(){ trace('hello world'); }
        });

        itemlist = new MIList({
            parent : canvas,
            name : 'list1',
            bounds : new Rectangle(10,50, 100,380)
        });

        window = new MIWindow({
            parent : canvas,
            title : 'inspector',
            title_size : 15,
            bounds : new Rectangle(750, 20, 200, 300)
        });

        button1 = new MIButton({
            parent : window,
            name : 'click1',
            bounds : new Rectangle( 10, 10, 100, 35 ),
            text : 'clicked',
            text_size : 15,
            onclick : function(){ trace('window 1'); }
        });


        itemlist.add_item('items one');
        itemlist.add_items(['item','blah','some more','longer item','short','when do','iam','one','two','three','four','five','six','seven','eight','nine']);

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

        window.depth = 8;

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



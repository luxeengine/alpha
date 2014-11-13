
import luxe.Vector;
import luxe.Input;
import luxe.Text;
import luxe.Color;
import luxe.Rectangle;

class Main extends luxe.Game {


    override function ready() {

            //Some don't need to exist in the default scene
            //so we can tell it not to add them there with no_scene : true

            //Create three horizontally aligned texts, pos based

        var _size = 16.0;
        var _line_h = Luxe.renderer.font.height_of(' \n ', _size);
        var _y = 20.0;
        var _x = 270;

        var dim = new Color(1,1,1,0.4);
        var orange = new Color().rgb(0xff4b03);
        var red = new Color().rgb(0xf6007b);
        var blue = new Color().rgb(0x007bf6);
        var green = new Color().rgb(0x00f67b);

        Luxe.draw.line({
            p0:new Vector(_x,0),
            p1:new Vector(_x,_y+_line_h*4),
            color: dim
        });

        new Text({
            no_scene : true,
            text : "left\naside", align : left,
            pos : new Vector(_x, _y),
            point_size : _size,
            color: red
        });

        new Text({
            no_scene : true,
            text : "center\naligned", align : center,
            pos : new Vector(_x, _y+_line_h),
            point_size : _size,
            color: green
        });

        new Text({
            no_scene : true,
            text : "right\nalongside", align : right,
            pos : new Vector(_x, _y+_line_h*2),
            point_size : _size,
            color: blue
        });

        var _w = 220;
        var _h = 100;

        _x = 50;
        _y = _y+_line_h*4;

            //draw three boxes to test bounds based
        Luxe.draw.rectangle({x:_x,y:_y, w:_w,h:_h, color:red});
        Luxe.draw.rectangle({x:_x+(_w*1),y:_y,w:_w,h:_h, color:green});
        Luxe.draw.rectangle({x:_x+(_w*2),y:_y,w:_w,h:_h, color:blue});

        new Text({
            no_scene : true,
            text : "left && top\nalignment",
            bounds : new Rectangle(_x,_y,_w,_h),
            align : left, align_vertical : top,
            point_size : _size
        });

        new Text({
            no_scene : true,
            text : "right && center\nalignment",
            bounds : new Rectangle(_x+(_w*1),_y,_w,_h),
            align : right, align_vertical : center,
            point_size : _size
        });

        new Text({
            no_scene : true,
            text : "center && bottom\nalignment",
            bounds : new Rectangle(_x+(_w*2),_y,_w,_h),
            align : center, align_vertical : bottom,
            point_size : _size
        });

        var text = 'luxe is a free, open source cross platform rapid development haxe based game engine for deploying games on Mac, Windows, Linux, Android, iOS and WebGL.';
        var wrapped = Luxe.utils.text_wrap_column(text, '\n', 20);
            wrapped = StringTools.trim(wrapped);

        _size = 12;

        var _box_h = Luxe.renderer.font.height_of(wrapped, _size) * 1.4;
        var _box_w = Luxe.renderer.font.width_of(wrapped, _size) * 2;

        _y = _y+_h+20;
        var _pad = 18;

        Luxe.draw.rectangle({ x:_x,                   y:_y, w:_box_w, h:_box_h, color:red });
        Luxe.draw.rectangle({ x:_x+((_box_w+_pad)*1), y:_y, w:_box_w, h:_box_h, color:green });
        Luxe.draw.rectangle({ x:_x+((_box_w+_pad)*2), y:_y, w:_box_w, h:_box_h, color:blue });

        new Text({
            no_scene : true,
            color : red,
            text : 'right & top : \n' + wrapped, point_size : _size,
            bounds : new Rectangle(_x,_y,_box_w,_box_h),
            align : right, align_vertical : top,
        });

        new Text({
            no_scene : true,
            color : green,
            text : 'center & center : \n' + wrapped, point_size : _size,
            bounds : new Rectangle(_x+((_box_w+_pad)*1),_y,_box_w,_box_h),
            align : center, align_vertical : center,
        });

        new Text({
            no_scene : true,
            color : blue,
            text : 'left & bottom : \n' + wrapped, point_size : _size,
            bounds : new Rectangle(_x+((_box_w+_pad)*2),_y,_box_w,_box_h),
            align : left, align_vertical : bottom,
        });

            //This one wants to be in the scene, so that
            //it can update its components
        var font = Luxe.loadFont('font.fnt', 'assets/fonts/');

        font.onload = function(_){

            text_with_component = new Text({
                name : 'enginetext',
                color : orange,
                font : font,
                text : "luxeengine.com",
                pos : new Vector(Luxe.screen.mid.x, 10),
                align : center,
                size : 25
            });

            text_with_component.add(new BounceTest({ name:'bounce' }));

        }


    } //ready

    var text_with_component:Text;

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main

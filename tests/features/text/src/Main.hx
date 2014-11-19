
import luxe.Vector;
import luxe.Input;
import luxe.Text;
import luxe.Color;
import luxe.Rectangle;

import phoenix.BitmapFont;
import phoenix.Batcher;
import phoenix.geometry.TextGeometry;


class Main extends luxe.Game {

    var font : BitmapFont;
    var dttext : TextGeometry;
    var text : TextGeometry;
    var batcher : Batcher;


    override function config(c:luxe.AppConfig) {
        c.window.antialiasing = 2;
        return c;
    }

    override function ready() {

        batcher = Luxe.renderer.create_batcher({ name:'notmoving' });

        // Luxe.renderer.clear_color.set(1,1,1,1);
         var drag = Luxe.camera.add( new CameraDrag({name:'drag'}) );
            drag.zoom_speed = 0.05;

        font = Luxe.loadFont('cabin.fnt', 'assets/fonts/cabin/');
        font.onload = function(_){

            var unique = Luxe.renderer.shaders.bitmapfont.shader.clone();

                text = new TextGeometry({
                    color: new Color(1,1,1,1), text: 'luxe is a free, open source cross platform game engine',
                    pos: new Vector(30, 200), batcher:Luxe.renderer.batcher,
                    point_size: 32, font: Luxe.renderer.font, padding:0,
                    sdf: true, shader: unique
                });

                // text.outline = 0.1;
                text.glow_threshold = 0;
                text.glow_amount = 0;
                text.outline_color = new Color().rgb(0xff4b03);
                text.glow_color = new Color(1,1,1,1).rgb(0x9dc963);

            // for(i in 0 ... 16) {

            //     var _s = 8 + (i * 4);
            //     var _s_prev = 8 + (i-1 * 4);
            //     var _t = '${_s} : luxe is a free, open source cross platform game engine';
            //     var _text = new TextGeometry({
            //         color: new Color(1,1,1,1),
            //         text: _t,
            //         pos: new Vector(100,130 + (i * (1.1*font.height_of(_t, _s_prev)))),
            //         batcher:Luxe.renderer.batcher,
            //         point_size: _s,
            //         font: Luxe.renderer.font, padding:0,
            //         sdf: true
            //     });

            // }

            setup();
        }

        dttext = new TextGeometry({
            pos: new Vector(10,10),
            point_size: 16,
            batcher:batcher
        });

        s_b = new Rectangle(40,00,Luxe.screen.w-80,15);
        t_b = new Rectangle(40,40,Luxe.screen.w-80,15);
        o_b = new Rectangle(40,80,Luxe.screen.w-80,15);
        g_s = new Rectangle(40,120,Luxe.screen.w-80,15);
        g_e = new Rectangle(40,160,Luxe.screen.w-80,15);

        Luxe.draw.rectangle({ rect:s_b, batcher:batcher });
        Luxe.draw.rectangle({ rect:t_b, batcher:batcher });
        Luxe.draw.rectangle({ rect:o_b, batcher:batcher });
        Luxe.draw.rectangle({ rect:g_s, batcher:batcher });
        Luxe.draw.rectangle({ rect:g_e, batcher:batcher });

    } //ready

    var s_b : Rectangle;
    var t_b : Rectangle;
    var o_b : Rectangle;
    var g_s : Rectangle;
    var g_e : Rectangle;

    var ctrl = false;
    override function onmousemove( e:MouseEvent ) {
        if(text != null && Luxe.input.keydown(Key.lshift)) {
            var p = (e.pos.x-40) / (Luxe.screen.w-80);
            if(s_b.point_inside(e.pos)) {
                text.smoothness = p;
            }
            if(t_b.point_inside(e.pos)) {
                text.thickness = p;
            }
            if(o_b.point_inside(e.pos)) {
                text.outline = p;
            }
            if(g_s.point_inside(e.pos)) {
                text.glow_threshold = p;
            }
            if(g_e.point_inside(e.pos)) {
                text.glow_amount = p;
            }
        }
    }


    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

        if(text != null) {
            dttext.text = '$dt\nsmoothness:${text.smoothness}\nthickness:${text.thickness}\noutline:${text.outline}\nglow_threshold:${text.glow_threshold}\nglow_amount:${text.glow_amount}';
        }

    } //update


    function setup() {

            //Some don't need to exist in the default scene
            //so we can tell it not to add them there with no_scene : true

            //Create three horizontally aligned texts, pos based

        var _size = 16.0;
        var _line_h = Luxe.renderer.font.height_of(' \n ', _size);
        var _y = 420.0;
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

        var b = new Text({
            no_scene : true,
            text : "left\naside", align : left,
            pos : new Vector(_x, _y),
            point_size : _size,
            color: red,
            // font:font, sdf:true
        });

        b.smoothness = 0.1;
        b.thickness = 1;
        b.outline_color = new Color(1,1,1,1);
        b.outline = 0.1;

        new Text({
            no_scene : true,
            text : "center\naligned", align : center,
            pos : new Vector(_x, _y+_line_h),
            point_size : _size,
            color: green,
            font:font, sdf:true
        });

        new Text({
            no_scene : true,
            text : "right\nalongside", align : right,
            pos : new Vector(_x, _y+_line_h*2),
            point_size : _size,
            color: blue,
            font:font, sdf:true
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
                point_size : 25
            });

            text_with_component.add(new BounceTest({ name:'bounce' }));

        }


    } //ready

    var text_with_component:Text;


} //Main

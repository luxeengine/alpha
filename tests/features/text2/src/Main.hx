
import luxe.Input;
import luxe.Text;
import luxe.tween.Actuate;
import luxe.Vector;
import luxe.Color;
import luxe.Sprite;
import luxe.Component;
import luxe.Rectangle;

using luxe.utils.unifill.Unifill;

class Main extends luxe.Game {

    var text:Text;
    var disp:Text;
    var dragger:Sprite;
    var bounds_rect:phoenix.geometry.RectangleGeometry;

    var _line = "In olden times when wishing still helped one, there lived a king whose daughters were all beautiful, but the youngest was so beautiful that the sun itself, which has seen so much, was astonished whenever it shone in her face.  Close by the king's castle lay a great dark forest, and under an old lime tree in the forest was a well, and when the day was very warm, the king's child went out into the forest and sat down by the side of the cool fountain, and when she was bored she took a golden ball, and threw it up on high and caught it, and this ball was her favorite plaything.";

    override function config(config:luxe.AppConfig) {

        config.preload.fonts.push({ id:'assets/opensans/opensans.fnt' });
        config.preload.fonts.push({ id:'assets/jp/jp.fnt' });

        return config;

    } //config

    override function ready() {

        trace(_line);

        Luxe.renderer.clear_color.rgb(0x4f5b5c);

        var drag = Luxe.camera.add(new CameraDrag({name:'drag'}));
        drag.zoom_speed = 0.02;

        var col = new Color(1,1,1,0.4);
        var col2 = new Color(1,1,1,0.1);

        Luxe.draw.line({ p0:new Vector(Luxe.screen.mid.x, 0), p1:new Vector(Luxe.screen.mid.x, Luxe.screen.h), color:col });
        Luxe.draw.line({ p0:new Vector(0, Luxe.screen.mid.y), p1:new Vector(Luxe.screen.w, Luxe.screen.mid.y), color:col });
        Luxe.draw.line({ p0:new Vector(0, Luxe.screen.mid.y/2), p1:new Vector(Luxe.screen.w, Luxe.screen.mid.y/2), color:col2 });

        var font = Luxe.resources.font('assets/opensans/opensans.fnt');
        var fontjp = Luxe.resources.font('assets/jp/jp.fnt');


        var s = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿĀāĂăĄąĆćĈĉĊċČčĎďĐđĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħĨĩĪīĬĭĮįİıĲĳĴĵĶķĸĹĺĻļĽľĿŀŁłŃńŅņŇňŉŊŋŌōŎŏŐőŒœŔŕŖŗŘřŚśŜŝŞşŠšŢţŤťŦŧŨũŪūŬŭŮůŰűŲųŴŵŶŷŸŹźŻżŽžſƒƠơƯưǰǺǻǼǽǾǿȘșȚțȷʼˆˇˉ˘˙˚˛˜˝˳̣̀́̃̉̏΄΅Ά·ΈΉΊΌΎΏΐΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩΪΫάέήίΰαβγδεζηθικλμνξοπρςστυφχψωϊϋόύώϑϒϖЀЁЂЃЄЅІЇЈЉЊЋЌЍЎЏАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяѐёђѓєѕіїјљњћќѝўџѠѡѢѣѤѥѦѧѨѩѪѫѬѭѮѯѰѱѲѳѴѵѶѷѸѹѺѻѼѽѾѿҀҁ҂҃҄҅҆҈҉ҊҋҌҍҎҏҐґҒғҔҕҖҗҘҙҚқҜҝҞҟҠҡҢңҤҥҦҧҨҩҪҫҬҭҮүҰұҲҳҴҵҶҷҸҹҺһҼҽҾҿӀӁӂӃӄӅӆӇӈӉӊӋӌӍӎӏӐӑӒӓӔӕӖӗӘәӚӛӜӝӞӟӠӡӢӣӤӥӦӧӨөӪӫӬӭӮӯӰӱӲӳӴӵӶӷӸӹӺӻӼӽӾӿԀԁԂԃԄԅԆԇԈԉԊԋԌԍԎԏԐԑԒԓḀḁḾḿẀẁẂẃẄẅẠạẢảẤấẦầẨẩẪẫẬậẮắẰằẲẳẴẵẶặẸẹẺẻẼẽẾếỀềỂểỄễỆệỈỉỊịỌọỎỏỐốỒồỔổỖỗỘộỚớỜờỞởỠỡỢợỤụỦủỨứỪừỬửỮữỰựỲỳỴỵỶỷỸỹὍ           ​–—―‗‘’‚‛“”„†‡•…‰′″‹›‼⁄⁰⁴⁵⁶⁷⁸⁹ⁿ₣₤₧₫€℅ℓ№℠™Ω℮⅛⅜⅝⅞∂∆∏∑−√∞∫≈≠≤≥◊ﬀﬁﬂﬃﬄ﻿￼�';
        s = Luxe.utils.text_wrap_column(s, '\n', 20);

        var t = new Text({
            text: s,
            pos : new Vector(Luxe.screen.mid.x,Luxe.screen.mid.y),
            point_size : 16,
            font: font
        });


        var s2 = 'ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんゔ゛゜ゝゞァアィイゥウェエォオカガキギクグケゲコゴサザシジスズセゼソゾタダチヂッツヅテデトドナニヌネノハバパヒビピフブプヘベペホボポマミムメモャヤュユョヨラリルレロヮワヰヱヲンヴヵヶヷヸヹヺヽヾ';
        s2 = Luxe.utils.text_wrap_column(s2, '\n', 20);

        var t = new Text({
            text: s2,
            pos : new Vector(10,Luxe.screen.mid.y),
            point_size : 22,
            font: fontjp
        });


        var string = 'luxe|\t|is a free, open source cross platform rapid development haxe based game engine for deploying games on Mac, Windows, Linux, Android, iOS and WebGL.';
            // string = wrap(string, 30).join('\n');
        var bounds = new Rectangle(Luxe.screen.mid.x - 350, Luxe.screen.mid.y/2, 735, Luxe.screen.mid.y/2);

        bounds_rect = Luxe.draw.rectangle({ rect:bounds });

        text = new Text({
            text: string,
            bounds : bounds,
            bounds_wrap : true,
            // pos : new Vector(Luxe.screen.mid.x,Luxe.screen.mid.y/2),
            point_size : 16,
            letter_spacing : 4,
            line_spacing : -4,
            align: left,
            align_vertical: center,
            color: col
        });

        disp = new Text({
            text: '...',
            pos : new Vector(Luxe.screen.mid.x,10),
            point_size : 16,
            align: center,
            align_vertical: center,
        });

        dragger = new Sprite({
            pos : new Vector(bounds.x + bounds.w, bounds.y + bounds.h),
            size : new Vector(32,32),
            color : new Color(1,1,1,0.5)
        });

    } //ready

    var dragging = false;
    var drag_start : Vector;
    var drag_start_pos : Vector;

    override function onmouseup( e:MouseEvent ) {

        dragging = false;

    } //onmouseup

    override function onmousemove( e:MouseEvent ) {

        if(dragging) {

            var mp = Luxe.camera.screen_point_to_world(e.pos);

            var diffx = (mp.x - drag_start.x);
            var diffy = (mp.y - drag_start.y);

            dragger.pos.set_xy(drag_start_pos.x + diffx, drag_start_pos.y + diffy);

            var bw = dragger.pos.x - text.bounds.x;
            var bh = dragger.pos.y - text.bounds.y;

            text.bounds = new Rectangle(text.bounds.x, text.bounds.y, bw, bh );
            bounds_rect.set(text.bounds);

            // geometry clip_rect doesn't account for zoom/camera transform,
            // since it's clip space, it should be transformed internally.
            // text.geometry.clip_rect = text.bounds;

        } //dragging

    } //onmousemove

    override function onmousedown( e:MouseEvent ) {

        if(drag_start == null) {
            drag_start = new Vector();
            drag_start_pos = new Vector();
        }

        if(!dragging) {
            var mp = Luxe.camera.screen_point_to_world(e.pos);
            if(dragger.point_inside_AABB(mp)) {
                dragging = true;
                drag_start_pos.copy_from(dragger.pos);
                drag_start.copy_from(mp);
            }
        } //!dragging

    } //onmousedown

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.key_b) {
            text.bounds_wrap = !text.bounds_wrap;
        }

        if(e.keycode == Key.key_s) {
            text.point_size = switch(text.point_size) {
                case 16: 12;
                case 12: 24;
                case 24: 18;
                case 18: 16;
                case _: 16;
            }
            disp.text = 'point size: ${text.point_size}';
        }

        if(e.keycode == Key.key_l) {
            text.line_spacing = switch(text.line_spacing) {
                case -4: 16;
                case 16: 12;
                case 12: 24;
                case 24: 18;
                case 18: -4;
                case _: -4;
            }
            disp.text = 'line spacing: ${text.line_spacing}';
        }

        if(e.keycode == Key.key_c) {
            text.letter_spacing = switch(text.letter_spacing) {
                case 0: 16;
                case 16: 12;
                case 12: 24;
                case 24: 18;
                case 18: 0;
                case _: 0;
            }
            disp.text = 'letter spacing: ${text.letter_spacing}';
        }

        if(e.keycode == Key.key_a) {
            text.align = switch(text.align) {
                case right: center;
                case center: left;
                case left: right;
                case _: text.align;
            }

            var _a = switch(text.align) {
                case right:'right';
                case center:'center';
                case left:'left';
                case _:'';
            }

            disp.text = 'horizontal align: ${_a}';
        }

        if(e.keycode == Key.key_v) {
            text.align_vertical = switch(text.align_vertical) {
                case center: bottom;
                case bottom: top;
                case top: center;
                case _: text.align_vertical;
            }

            var _a = switch(text.align_vertical) {
                case center:'center';
                case bottom:'bottom';
                case top:'top';
                case _: '';
            }

            disp.text = 'vertical align: ${_a}';
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

    } //update


} //Main




/*
    for : http://luxeengine.com
    author : underscorediscovery
    desc : Simple camera drag + zoom component.

    Usage : apply to any luxe.Camera instance

        var drag = Luxe.camera.add( new CameraDrag({name:'drag'}) );
            drag.zoom_speed = 0.3;
            drag.button = MouseButton.left

    Options :
      zoom_speed : Float, how much to zoom on mouse wheel
      zoomable : Bool, if zooming is enabled at the time of scrolling
      draggable : Bool, if dragging is enabled at the time of mousedown
      button : MouseButton, the button to drag with

    Drag with button specified, zoom with scroll wheel.

*/
class CameraDrag extends Component {

    public var draggable : Bool = true;
    public var zoomable : Bool = true;
    public var zoom_speed : Float = 0.3;
    public var button : MouseButton;

    var dragging : Bool = false;
    var drag_start : Vector;
    var drag_start_pos : Vector;
    var camera : luxe.Camera;

    override function init() {
        drag_start = new Vector();
        drag_start_pos = new Vector();

        button = MouseButton.right;

        camera = cast entity;
        if(camera == null) throw "CameraDrag only applies to luxe.Camera type right now.";
    }

    override function onmousewheel(e:MouseEvent) {
        if(zoomable) {
            camera.zoom += e.y > 0 ? (zoom_speed*camera.zoom) : -(zoom_speed*camera.zoom);
        }
    }

    override function onmousedown(e:MouseEvent) {
        if(draggable) {
            if( !dragging && e.button == button ) {
                dragging = true;
                drag_start.set_xy(e.pos.x, e.pos.y);
                drag_start_pos.set_xy(pos.x, pos.y);
            }
        }
    }

    override function onmouseup(e:MouseEvent) {
        if(draggable) {
            if(e.button == button && dragging) {
                dragging = false;
            }
        }
    }

    override function onmousemove(e:MouseEvent) {
        if(draggable && dragging) {

            var diffx = (e.pos.x - drag_start.x)/camera.zoom;
            var diffy = (e.pos.y - drag_start.y)/camera.zoom;

                pos.set_xy(drag_start_pos.x - diffx, drag_start_pos.y - diffy);

        } //draggable
    } //onmousemove

} //CameraDrag

package states;

import luxe.Rectangle;
import luxe.Sprite;
import luxe.Text.TextAlign;
import luxe.Visual;
import luxe.Color;
import luxe.Vector;
import luxe.Input;
import luxe.States;
import luxe.tween.Actuate;
import phoenix.Color.ColorHSV;
import phoenix.geometry.CompositeGeometry;
import phoenix.geometry.LineGeometry;

class Menu extends State {
    
    public var game : Main;

    public var one      : Visual;
    public var two      : Visual;
    public var three    : Visual;
    public var four     : Visual;
    public var five     : Visual;

    public var bar      : Visual;

    var partition : Int = 0;
    var item_height : Int = 0;

    var one_rect    : Rectangle;
    var two_rect    : Rectangle;
    var three_rect  : Rectangle;
    var four_rect   : Rectangle;
    var five_rect   : Rectangle;

    public function init() {

        partition = Math.round(Luxe.screen.h * 0.1);

        var font_size = game.font.get_text_dimensions('M', new Vector(1,1));
        item_height = Std.int(font_size.y * 1.1);

        bar = new Visual({
            pos : new Vector(Luxe.screen.w - (partition * 2), 0),
            size : new Vector(partition, Luxe.screen.h),
            color : new ColorHSV(132,0.16,0.12,0)
        });

        create_items();

    } //init

    function create_items() {

        var sizew = Luxe.screen.w - (partition*2.2);

        var one_text = Luxe.draw.text({
            bounds : new Rectangle(0,0, sizew, partition),
            font : game.font,
            text : "ONE",
            size : 32,
            align : TextAlign.right,
        });

        var two_text = Luxe.draw.text({
            bounds : new Rectangle(0,0, sizew, partition),
            font : game.font,
            text : "TWO",
            size : 32,
            align : TextAlign.right,
        });

        var three_text = Luxe.draw.text({
            bounds : new Rectangle(0,0, sizew, partition),
            font : game.font,
            text : "THREE",
            size : 32,
            align : TextAlign.right,
        });

        var four_text = Luxe.draw.text({
            bounds : new Rectangle(0,0, sizew, partition),
            font : game.font,
            text : "FOUR",
            size : 32,
            align : TextAlign.right,
        });

        var five_text = Luxe.draw.text({
            bounds : new Rectangle(0,0, sizew, partition),
            font : game.font,
            text : "_______",
            size : 32,
            align : TextAlign.right,
        });

        one = new Visual({
            pos : new Vector(text_pos('ONE'), Luxe.screen.h - (item_height * 6)),
            geometry : one_text, texture : game.font.pages.get(0),
            depth : 2, color : new ColorHSV(132,0.16,0.12,0)
        });
        two = new Visual({
            pos : new Vector(text_pos('TWO'), Luxe.screen.h - (item_height * 5)),
            geometry : two_text, texture : game.font.pages.get(0),
            depth : 2, color : new ColorHSV(132,0.16,0.12,0)
        });
        three = new Visual({
            pos : new Vector(text_pos('THREE'), Luxe.screen.h - (item_height * 4)),
            geometry : three_text, texture : game.font.pages.get(0),
            depth : 2, color : new ColorHSV(132,0.16,0.12,0)
        });
        four = new Visual({
            pos : new Vector(text_pos('FOUR'), Luxe.screen.h - (item_height * 3)),
            geometry : four_text, texture : game.font.pages.get(0),
            depth : 2, color : new ColorHSV(132,0.16,0.12,0)
        });
        five = new Visual({
            pos : new Vector(text_pos('_______'), Luxe.screen.h - (item_height * 2)),
            geometry : five_text, texture : game.font.pages.get(0),
            depth : 2, color : new ColorHSV(0,1,0.82,0)
        });

        
        var rect_height = item_height*0.9;
        var rect_offset = item_height*0.1;

        one_rect = new Rectangle    (0, one.pos.y + rect_offset,    sizew, rect_height );
        two_rect = new Rectangle    (0, two.pos.y + rect_offset,    sizew, rect_height );
        three_rect = new Rectangle  (0, three.pos.y + rect_offset,  sizew, rect_height );
        four_rect = new Rectangle   (0, four.pos.y + rect_offset,   sizew, rect_height );
        five_rect = new Rectangle   (0, five.pos.y + rect_offset,   sizew, rect_height );

        // Luxe.draw.rectangle({ color : new Color(1,0,0,1), x:one_rect.x, y:one_rect.y, w:one_rect.w, h:one_rect.h });
        // Luxe.draw.rectangle({ color : new Color(1,0,0,1), x:two_rect.x, y:two_rect.y, w:two_rect.w, h:two_rect.h });
        // Luxe.draw.rectangle({ color : new Color(1,0,0,1), x:three_rect.x, y:three_rect.y, w:three_rect.w, h:three_rect.h });
        // Luxe.draw.rectangle({ color : new Color(1,0,0,1), x:four_rect.x, y:four_rect.y, w:four_rect.w, h:four_rect.h });
        // Luxe.draw.rectangle({ color : new Color(1,0,0,1), x:five_rect.x, y:five_rect.y, w:five_rect.w, h:five_rect.h });

    }

    function text_pos(string:String) : Int {
        var size = game.font.get_text_dimensions(string, new Vector(1,1));
        return Math.round(Luxe.screen.w - (partition*2.2) - size.x);
    }

    public function onkeydown(e:KeyEvent) {
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }
    } //onkeyup

    public function onmousemove( e:MouseEvent ) {
    }

    public function onmouseup( e:MouseEvent ) {     
    
        if(one_rect.point_inside(game.mouse)) {         
            // game.states.set('base');
        }

        if(two_rect.point_inside(game.mouse)) {
            game.states.set('base');
        }

        if(three_rect.point_inside(game.mouse)) {
            // game.states.set('three');
        }

        if(four_rect.point_inside(game.mouse)) {
            // game.states.set('four');
        }

        if(five_rect.point_inside(game.mouse)) {
            // game.states.set('five');
        }

    } //onmousedown

    public function enter() {

        Actuate.tween(one.color,    0.45, {a:0.15})     .delay(0.4);
        Actuate.tween(two.color,    0.30, {a:1 })       .delay(0.4+0.45);
        Actuate.tween(three.color,  0.30, {a:0.15})     .delay(0.4+0.45+0.30);
        Actuate.tween(four.color,   0.10, {a:0.15})     .delay(0.4+0.45+0.30+0.30);
        Actuate.tween(five.color,   0.05, {a:1})        .delay(0.4+0.45+0.30+0.30+0.20);

        Actuate.tween(bar.color, 0.45, {a:1}).delay(0.2);

        Actuate.tween(Luxe.renderer.clear_color, 0.2, {r:1,g:1,b:1}).delay(0.5);

    } //enter

    public function leave() {

        Actuate.tween(one.color,    0.35, {a:0})   .delay(0.0);
        Actuate.tween(two.color,    0.20, {a:0})   .delay(0.0+0.35);
        Actuate.tween(three.color,  0.20, {a:0})   .delay(0.0+0.35+0.20);
        Actuate.tween(four.color,   0.10, {a:0})   .delay(0.0+0.35+0.20+0.20);
        Actuate.tween(five.color,   0.05, {a:0})   .delay(0.0+0.35+0.20+0.20+0.10);

        Actuate.tween(bar.color, 0.45, {a:0}).delay(1.3);

    } //leave


}
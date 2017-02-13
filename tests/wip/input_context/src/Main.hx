package;
import luxe.Input;
import InputContext.InteractType;
import InputMap.InputEvent;
import InputMap.ScreenAxis;
import luxe.Input.InputEventType;
import luxe.Rectangle;
import phoenix.geometry.Geometry;
import phoenix.Color;

class Main extends luxe.Game {
    var left_map:InputMap;

    var right_group:InputGroup;

    var square:Geometry;

    override function ready() {

        left_map = new InputMap();

        left_map.bind_mouse_range('left_range', ScreenAxis.X, 0, 0.5, false, false, true);
        left_map.bind_key('left', Key.key_a);

        left_map.on(InteractType.down, input_down);
        left_map.on(InteractType.up, input_up);

        right_group = new InputGroup();

        var map = new InputMap();

        map.bind_mouse_range('right_range', ScreenAxis.X, 0.5, 1, false, false, true);
        right_group.add(map);

        map = new InputMap();
        map.bind_key('right', Key.key_k);

        right_group.add(map);

        right_group.on(InteractType.down, input_down);
        right_group.on(InteractType.up, input_up);
        right_group.unlisten();

        Luxe.draw.rectangle({
            x:0,
            y:0,
            w:Luxe.screen.w / 2,
            h:Luxe.screen.h
        });

        Luxe.draw.line({
            p0:new luxe.Vector(Luxe.screen.w / 2, 0),
            p1:new luxe.Vector(Luxe.screen.w / 2, Luxe.screen.h)
        });

        square = Luxe.draw.box({
            x:Luxe.screen.w * 0.25,
            y:Luxe.screen.h / 2,
            w:50,
            h:50
        });
    }

    override public function update(dt:Float) {
    }

    function input_down(_event:InputEvent) {
        switch(_event.name) {
            case 'left':
                trace('Left key pressed');
                square.color = Color.random();
            case 'right':
                trace('Right key pressed');
                square.color = Color.random();
        }
    }

    function input_up(_event:InputEvent) {
        switch(_event.name) {
            case 'left_range':
                trace('Left left area');
                left_map.unlisten();
                right_group.listen();
                square.transform.pos.x = Luxe.screen.w * 0.75;
            case 'right_range':
                trace('Left right area');
                right_group.unlisten();
                left_map.listen();
                square.transform.pos.x = Luxe.screen.w * 0.25;
        }
    }

    override function onkeyup(e:KeyEvent) {
        if(e.keycode == Key.escape)
            Luxe.shutdown();
    }
}

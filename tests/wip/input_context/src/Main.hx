package;
import luxe.Input;
import InputMap.InteractType;
import InputMap.InputEvent;
import InputMap.ScreenAxis;

class Main extends luxe.Game {
    var map:InputMap;
    override function ready() {
        map = new InputMap();

        map.bind_key('jump', Key.key_x);
        
        map.bind_mouse_button('jump', MouseButton.left);
        map.bind_mouse_range('left_move', ScreenAxis.X, 0, 0.5, true, true, true);
        map.bind_mouse_range('middle_move', ScreenAxis.Y, 0.25, 0.75, false, true, true);
        map.bind_mouse_wheel('wheel_change');
        
        map.bind_gamepad_button('jump', 0, null);
        map.bind_gamepad_range('run', 0, 0.8, 1.0, true, true, true);
        map.bind_gamepad_range('run', 0, -1.0, -0.8, true, true, true);
        map.bind_gamepad_range('hold_trigger', 5, 0.25, 0.75, false, true, true);

        map.bind_touch('jump');
        map.bind_touch_range('touch_move', ScreenAxis.X, 0.25, 0.75, false, true, true);

        map.on(InteractType.down, input_down);
        map.on(InteractType.up, input_up);
        map.on(InteractType.change, analog_changed);
    }

    override public function update(dt:Float) {
        if(map.inputdown('touch_move')) {
            trace('update | touch_move down ');
        }
        if(map.inputpressed('touch_move')) {
            trace('update | touch_move pressed');
        }
        if(map.inputreleased('touch_move')) {
            trace('update | touch_move released');
        }
    }

    function input_down(_event:InputEvent) {
        trace('down');
        trace(_event.name);
    }

    function input_up(_event:InputEvent) {
        trace('up');
        trace(_event.name);
    }

    var count:Int = 0;
    function analog_changed(_event:InputEvent) {
        if(count % 40 == 0) {
            trace('change');
            trace(_event.name);
        }
        count++;
    }

    override function onkeyup(e:KeyEvent) {
        if(e.keycode == Key.escape)
            Luxe.shutdown();
    }
}

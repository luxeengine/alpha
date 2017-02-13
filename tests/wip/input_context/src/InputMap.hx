package ;
import luxe.Emitter;
import luxe.Input;
import luxe.Rectangle;
import luxe.Vector;
import InputContext.InteractType;

class InputMap extends Emitter<InteractType> implements InputContext {
    var key_bindings:Map<Int, Array<String>>;

    var mouse_button_bindings:Map<MouseButton, Array<String>>;
        //Use string as key since we have to iterate over it anyway, and for remove we can at least just search entries for one event name (as compared to an array)
    var mouse_range_bindings:Map<String, Array<RangeBinding>>;
    var mouse_area_bindings:Map<String, Array<AreaBinding>>;
    var mouse_wheel_bindings:Array<String>;

    var gamepad_button_bindings:Map<Int, Array<GamepadButtonBinding>>;
    var gamepad_range_bindings:Map<String, Array<RangeBinding>>;
    var gamepad_axis_values:Map<Int, Float>; //Keeps track of previous values of gamepad axes for range checks

    var touch_bindings:Array<String>;
    var touch_range_bindings:Map<String, Array<RangeBinding>>;
    var touch_area_bindings:Map<String, Array<AreaBinding>>;

    var input_down:Map<String, Bool>;
    var input_pressed:Map<String, Bool>;
    var input_released:Map<String, Bool>;

    var general_events_flags:GeneralEventsFlags; //:todo: Rename with bind function

    var input_event:InputEvent;

    public function new() {
        super();

        key_bindings = new Map();
        mouse_button_bindings = new Map();
        mouse_range_bindings = new Map();
        mouse_area_bindings = new Map();
        mouse_wheel_bindings = [];
        gamepad_button_bindings = new Map();
        gamepad_range_bindings = new Map();
        gamepad_axis_values = new Map();
        touch_bindings = [];
        touch_range_bindings = new Map();
        touch_area_bindings = new Map();

        input_down = new Map();
        input_pressed = new Map();
        input_released = new Map();

        general_events_flags = {
            keys:false,
            mouse_buttons:false,
            mouse_move:false,
            mouse_wheel:false,
            touches:false,
            touch_move:false,
            gamepad_buttons:false,
            gamepad_axes:false
        }

        input_event = new InputEvent();

        listen(); //:todo: What's the timing with init of other systems here?
    }

    public function listen():Void {
        Luxe.on(luxe.Ev.keydown, onkey);
        Luxe.on(luxe.Ev.keyup, onkey);
        Luxe.on(luxe.Ev.mousedown, onmouse);
        Luxe.on(luxe.Ev.mouseup, onmouse);
        Luxe.on(luxe.Ev.mousemove, onmouse);
        Luxe.on(luxe.Ev.mousewheel, onmouse);
        Luxe.on(luxe.Ev.gamepaddown, ongamepad);
        Luxe.on(luxe.Ev.gamepadup, ongamepad);
        Luxe.on(luxe.Ev.gamepadaxis, ongamepad);
        Luxe.on(luxe.Ev.touchdown, ontouch);
        Luxe.on(luxe.Ev.touchmove, ontouch);
        Luxe.on(luxe.Ev.touchup, ontouch);
        Luxe.on(luxe.Ev.update, update);
    }

    public function unlisten():Void {
        Luxe.off(luxe.Ev.keydown, onkey);
        Luxe.off(luxe.Ev.keyup, onkey);
        Luxe.off(luxe.Ev.mousedown, onmouse);
        Luxe.off(luxe.Ev.mouseup, onmouse);
        Luxe.off(luxe.Ev.mousemove, onmouse);
        Luxe.off(luxe.Ev.mousewheel, onmouse);
        Luxe.off(luxe.Ev.gamepaddown, ongamepad);
        Luxe.off(luxe.Ev.gamepadup, ongamepad);
        Luxe.off(luxe.Ev.gamepadaxis, ongamepad);
        Luxe.off(luxe.Ev.touchdown, ontouch);
        Luxe.off(luxe.Ev.touchmove, ontouch);
        Luxe.off(luxe.Ev.touchup, ontouch);
    }

    //:todo: Add text input maybe?

    public function bind_key(_name:String, _key:Int) {
        if(!key_bindings.exists(_key)) {
            key_bindings.set(_key, []);
        }
        var names = key_bindings.get(_key);
        if(names.indexOf(_name) == -1) {
            names.push(_name);
        }
    }
        //Returns true/false if remove was successful or not
    public function unbind_key(_name:String, _key:Int):Bool {
        if(!key_bindings.exists(_key)) return false;

        var names = key_bindings.get(_key);
        return names.remove(_name);
    }

    public function bind_mouse_button(_name:String, _button:MouseButton) {
        if(!mouse_button_bindings.exists(_button)) {
            mouse_button_bindings.set(_button, []);
        }
        var names = mouse_button_bindings.get(_button);
        if(names.indexOf(_name) == -1) {
            names.push(_name);
        }
    }

    public function unbind_mouse_button(_name:String, _button:MouseButton) {
        if(!mouse_button_bindings.exists(_button)) return false;

        var names = mouse_button_bindings.get(_button);
        return names.remove(_name);
    }

        // Binds mouse move events to a range along an axis
    public function bind_mouse_range(_name:String, _axis:ScreenAxis, _start:Float, _end:Float, _change_emit:Bool, _enter_emit:Bool, _leave_emit:Bool) {
        //store info here, figure out how to store it by working back from the check state
        if(!mouse_range_bindings.exists(_name)) {
            mouse_range_bindings.set(_name, []);
        }

        var binding = {
            axis:_axis,
            start:_start,
            end:_end,
            change_emit:_change_emit,
            enter_emit:_enter_emit,
            leave_emit:_leave_emit
        }

        var bindings = mouse_range_bindings.get(_name);
        bindings.push(binding); //Doesn't check for duplicates, but duplicates don't mean much anyway (only possible in the rare case of all properties being equal)
    }

    public function unbind_mouse_range(_name:String, _axis:ScreenAxis, _start:Float, _end:Float, _change_emit:Bool, _enter_emit:Bool, _leave_emit:Bool):Bool {
        if(!mouse_range_bindings.exists(_name)) return false;

        var bindings = mouse_range_bindings.get(_name);
        var binding = Lambda.find(bindings, range_binding_compare.bind(_axis, _start, _end, _change_emit, _enter_emit, _leave_emit));
        if(binding != null) {
            bindings.remove(binding);
            return true;
        }
        else {
            return false;
        }
    }

    public function bind_mouse_area(_name:String, _rect:Rectangle, _change_emit:Bool, _enter_emit:Bool, _leave_emit:Bool) {
        if(!mouse_area_bindings.exists(_name)) {
            mouse_area_bindings.set(_name, []);
        }

        var binding = {
            rect:_rect,
            change_emit:_change_emit,
            enter_emit:_enter_emit,
            leave_emit:_leave_emit
        }
        var bindings = mouse_area_bindings.get(_name);
        bindings.push(binding);
    }

    public function unbind_mouse_area(_name:String, _rect:Rectangle, _change_emit:Bool, _enter_emit:Bool, _leave_emit:Bool) {
        if(!mouse_area_bindings.exists(_name)) return false;

        var bindings = mouse_area_bindings.get(_name);
        var binding = Lambda.find(bindings, area_binding_compare.bind(_rect, _change_emit, _enter_emit, _leave_emit));
        if(binding != null) {
            bindings.remove(binding);
            return true;
        }
        else {
            return false;
        }
    }

    //:todo: remaining unbind calls - You'd have to pass in all the details as passed in bind - maybe there's a better way of doing that?

    public function bind_mouse_wheel(_name:String) {
        if(mouse_wheel_bindings.indexOf(_name) == -1) {
            mouse_wheel_bindings.push(_name);
        }
    }

    public function unbind_mouse_wheel(_name:String):Bool {
        return mouse_wheel_bindings.remove(_name);
    }

        /** Bind a named input binding to a `Gamepad Button`. If no `Gamepad Id` is specified, any gamepad fires the named binding.*/
    public function bind_gamepad_button(_name:String, _button:Int, ?_id:Null<Int> = null) {
        if(!gamepad_button_bindings.exists(_button)) {
            gamepad_button_bindings.set(_button, []);
        }

        var bindings = gamepad_button_bindings.get(_button);
        if(Lambda.find(bindings, gamepad_button_binding_compare.bind(_name, _id)) == null) {
            bindings.push({
                name:_name,
                gamepad_id:_id
            });
        }
    }

    public function unbind_gamepad_button(_name:String, _button:Int, ?_id:Null<Int> = null):Bool {
        if(!gamepad_button_bindings.exists(_button)) return false;

        var bindings = gamepad_button_bindings.get(_button);
        var binding = Lambda.find(bindings, gamepad_button_binding_compare.bind(_name, _id));
        if(binding != null) {
            bindings.remove(binding);
            return true;
        }
        else {
            return false;
        }
    }

    public function bind_gamepad_range(_name:String, _axis:Int, _start:Float, _end:Float, _change_emit:Bool, _enter_emit:Bool, _leave_emit:Bool) { //:todo: better naming maybe?
        if(!gamepad_range_bindings.exists(_name)) {
            gamepad_range_bindings.set(_name, []);
        }

        var binding = {
            axis:_axis,
            start:_start,
            end:_end,
            change_emit:_change_emit,
            enter_emit:_enter_emit,
            leave_emit:_leave_emit
        }

        var bindings = gamepad_range_bindings.get(_name);
        bindings.push(binding);

        gamepad_axis_values.set(_axis, 0.0); //Have an initial previous value. Assuming 0.0
    }

    public function unbind_gamepad_range(_name:String, _axis:Int, _start:Float, _end:Float, _change_emit:Bool, _enter_emit:Bool, _leave_emit:Bool):Bool {
        if(!gamepad_range_bindings.exists(_name)) return false;

        var bindings = gamepad_range_bindings.get(_name);
        var binding = Lambda.find(bindings, range_binding_compare.bind(_axis, _start, _end, _change_emit, _enter_emit, _leave_emit));
        if(binding != null) {
            bindings.remove(binding);
            return true;
        }
        else {
            return false;
        }
    }

        //:todo: Gamepad areas? Only makes sense for analog sticks, do these always have the same axis values?

    public function bind_touch(_name:String) {
        if(touch_bindings.indexOf(_name) == -1) {
            touch_bindings.push(_name);
        }
    }

    public function unbind_touch(_name:String):Bool {
        return touch_bindings.remove(_name);
    }

    public function bind_touch_range(_name:String, _axis:ScreenAxis, _start:Float, _end:Float, _change_emit:Bool, _enter_emit:Bool, _leave_emit:Bool) {
        if(!touch_range_bindings.exists(_name)) {
            touch_range_bindings.set(_name, []);
        }

        var binding = {
            axis:_axis,
            start:_start,
            end:_end,
            change_emit:_change_emit,
            enter_emit:_enter_emit,
            leave_emit:_leave_emit
        }

        var bindings = touch_range_bindings.get(_name);
        bindings.push(binding); //Doesn't check for duplicates, but duplicates don't mean much anyway (only possible in the rare case of all properties being equal)
    }

    public function unbind_touch_range(_name:String, _axis:ScreenAxis, _start:Float, _end:Float, _change_emit:Bool, _enter_emit:Bool, _leave_emit:Bool) {
        if(!touch_range_bindings.exists(_name)) return false;

        var bindings = touch_range_bindings.get(_name);
        var binding = Lambda.find(bindings, range_binding_compare.bind(_axis, _start, _end, _change_emit, _enter_emit, _leave_emit));
        if(binding != null) {
            bindings.remove(binding);
            return true;
        }
        else {
            return false;
        }
    }

    public function bind_touch_area(_name:String, _rect:Rectangle, _change_emit:Bool, _enter_emit:Bool, _leave_emit:Bool) {
        if(!touch_area_bindings.exists(_name)) {
            touch_area_bindings.set(_name, []);
        }

        var binding = {
            rect:_rect,
            change_emit:_change_emit,
            enter_emit:_enter_emit,
            leave_emit:_leave_emit
        }

        var bindings = touch_area_bindings.get(_name);
        bindings.push(binding);
    }

    public function unbind_touch_area(_name:String, _rect:Rectangle, _change_emit:Bool, _enter_emit:Bool, _leave_emit:Bool) {
        if(!touch_area_bindings.exists(_name)) return false;

        var bindings = touch_area_bindings.get(_name);
        var binding = Lambda.find(bindings, area_binding_compare.bind(_rect, _change_emit, _enter_emit, _leave_emit));
        if(binding != null) {
            bindings.remove(binding);
            return true;
        }
        else {
            return false;
        }
    }

        /** Specifies whether the map will send through all events of a certain type. The generated input events will have name "" (empty string)*/
    public function bind_general_events(_keys:Bool, _mouse_buttons:Bool, _mouse_move:Bool, _mouse_wheel:Bool, _touches:Bool, _touch_move:Bool, _gamepad_buttons:Bool, _gamepad_axes:Bool) { //:todo: definitely rename this one, and turn into options typedef
        general_events_flags.keys = _keys;
        general_events_flags.mouse_buttons = _mouse_buttons;
        general_events_flags.mouse_move = _mouse_move;
        general_events_flags.mouse_wheel = _mouse_wheel;
        general_events_flags.touches = _touches;
        general_events_flags.touch_move = _touch_move;
        general_events_flags.gamepad_buttons = _gamepad_buttons;
        general_events_flags.gamepad_axes = _gamepad_axes;
    }

    public function inputdown(_name:String):Bool {
        return input_down.exists(_name);
    }

    public function inputpressed(_name:String):Bool {
        return input_pressed.exists(_name);
    }

    public function inputreleased(_name:String):Bool {
        return input_released.exists(_name);
    }

    function update(_) {
        for(_name in input_pressed.keys()) {
            if(input_pressed.get(_name)) {
                input_pressed.remove(_name);
            }
            else {
                input_pressed.set(_name, true);
            }
        }

        for(_name in input_released.keys()) {
            if(input_released.get(_name)) {
                input_released.remove(_name);
            }
            else {
                input_released.set(_name, true);
            }
        }
    }

    function onkey(_event:KeyEvent) {
        switch(_event.state) {
            case InteractState.down:
                check_key(_event, true);
            case InteractState.up:
                check_key(_event, false);
            default:
        }
    }

    function check_key(_event:KeyEvent, _down:Bool) {
        if(general_events_flags.keys) {
            if(_down) oninputevent('', InteractType.down, _event);
            else      oninputevent('', InteractType.up, _event);
        }

        if(!key_bindings.exists(_event.keycode)) return; // No bindings for this key

        if(_down && _event.repeat) return; //Don't re-trigger on repeat events

        for(name in key_bindings.get(_event.keycode)) {
            if(_down) {
                oninputevent(name, InteractType.down, _event);
            }
            else {
                oninputevent(name, InteractType.up, _event);
            }
        }
    }

    function onmouse(_event:MouseEvent) {
        switch(_event.state) {
            case InteractState.down:
                check_mouse_button(_event, true);
            case InteractState.up:
                check_mouse_button(_event, false);
            case InteractState.move:
                check_mouse_move(_event);
            case InteractState.wheel:
                check_mouse_wheel(_event);
            default:
        }
    }

    function check_mouse_button(_event:MouseEvent, _down:Bool) {
        if(general_events_flags.mouse_buttons) {
            if(_down) oninputevent('', InteractType.down, null, _event);
            else      oninputevent('', InteractType.up, null, _event);
        }

        if(!mouse_button_bindings.exists(_event.button)) return; // No bindings for this key

        for(name in mouse_button_bindings.get(_event.button)) {
            if(_down) {
                oninputevent(name, InteractType.down, null, _event);
            }
            else {
                oninputevent(name, InteractType.up, null, _event);
            }
        }
    }

    function check_mouse_move(_event:MouseEvent) {
        if(general_events_flags.mouse_move) oninputevent('', InteractType.change, null, _event);

        for(name in mouse_range_bindings.keys()) {
            var bindings = mouse_range_bindings.get(name);
            for(binding in bindings) {
                if(binding.axis == ScreenAxis.X) {
                    if(_event.x_rel == 0) continue;
                    check_range_event(_event.x / Luxe.screen.w, (_event.x - _event.x_rel) / Luxe.screen.w, name, binding, _event);
                }
                else {
                    if(_event.y_rel == 0) continue;
                    check_range_event(_event.y / Luxe.screen.h, (_event.y - _event.y_rel) / Luxe.screen.h, name, binding, _event);
                }
            }
        }

        for(name in mouse_area_bindings.keys()) {
            var bindings = mouse_area_bindings.get(name);
            for(binding in bindings) {
                var pos = _event.pos.clone().divide_xyz(Luxe.screen.w, Luxe.screen.h);
                var prev = _event.pos.clone().subtract_xyz(_event.x_rel, _event.y_rel);
                prev.divide_xyz(Luxe.screen.w, Luxe.screen.h);

                check_area_event(pos, prev, name, binding, _event);
            }
        }
    }

    function check_mouse_wheel(_event:MouseEvent) {
        if(general_events_flags.mouse_wheel) oninputevent('', InteractType.change, null, _event);

        for(name in mouse_wheel_bindings) {
            oninputevent(name, InteractType.change, null, _event);
        }
    }

    function ongamepad(_event:GamepadEvent) {
        switch(_event.type) {
            case GamepadEventType.button:
                if(_event.state == InteractState.down) {
                    check_gamepad_button(_event, true);
                }
                else {
                    check_gamepad_button(_event, false);
                }
            case GamepadEventType.axis:
                check_gamepad_axis(_event);
            default:
                //:todo: Doesn't handle add/remove/remap yet - should it?                
        }
    }

    function check_gamepad_button(_event:GamepadEvent, _down:Bool) {
        if(general_events_flags.gamepad_buttons) {
            if(_down) oninputevent('', InteractType.down, null, null, null, _event);
            else      oninputevent('', InteractType.up, null, null, null, _event);
        }

        if(!gamepad_button_bindings.exists(_event.button)) return;

        for(binding in gamepad_button_bindings.get(_event.button)) {
            if(!(binding.gamepad_id == null || binding.gamepad_id == _event.gamepad)) continue; //Skip if the binding was not for this gamepad

            if(_down) {
                oninputevent(binding.name, InteractType.down, null, null, null, _event);
            }
            else {
                oninputevent(binding.name, InteractType.up, null, null, null, _event);
            }
        }
    }

    function check_gamepad_axis(_event:GamepadEvent) {
        if(general_events_flags.gamepad_axes) oninputevent('', InteractType.change, null, null, null, _event);

        for(name in gamepad_range_bindings.keys()) {
            var bindings = gamepad_range_bindings.get(name);
            for(binding in bindings) {
                if(binding.axis != _event.axis) continue; //Not a binding for this axis
                check_range_event(_event.value, gamepad_axis_values.get(binding.axis), name, binding, null, null, _event);
            }
        }
        gamepad_axis_values.set(_event.axis, _event.value); //Update the previous value map
    }

    function ontouch(_event:TouchEvent) {
        switch(_event.state) {
            case InteractState.down:
                check_touch(_event, true);
            case InteractState.up:
                check_touch(_event, false);
            case InteractState.move:
                check_touch_move(_event);
            default:
        }
    }

    function check_touch(_event:TouchEvent, _down:Bool) {
        if(general_events_flags.touches) {
            if(_down) oninputevent('', InteractType.down, null, null, _event);
            else      oninputevent('', InteractType.up, null, null, _event);
        }

        for(name in touch_bindings) {
            if(_down) {
                oninputevent(name, InteractType.down, null, null, _event);
            }
            else {
                oninputevent(name, InteractType.up, null, null, _event);
            }
        }

        for(name in touch_range_bindings.keys()) { //:todo: Maybe debateable whether ranges should also be triggered by up/down events within that range.
            var bindings = touch_range_bindings.get(name);
            for(binding in bindings) {
                var pos:Float;
                if(binding.axis == ScreenAxis.X) {
                    pos = _event.x;
                }
                else {
                    pos = _event.y;
                }

                if(check_in_range(pos, binding.start, binding.end)) {
                    if(_down && binding.enter_emit) {
                        oninputevent(name, InteractType.down, null, null, _event);
                    }
                    else if(!_down && binding.leave_emit) {
                        oninputevent(name, InteractType.up, null, null, _event);
                    }
                }
            }
        }

        for(name in touch_area_bindings.keys()) {
            var bindings = touch_area_bindings.get(name);
            for(binding in bindings) {
                if(binding.rect.point_inside(_event.pos)) {
                    if(_down && binding.enter_emit) {
                        oninputevent(name, InteractType.down, null, null, _event);
                    }
                    else if(!_down && binding.leave_emit) {
                        oninputevent(name, InteractType.up, null, null, _event);
                    }
                }
            }
        }
    }

    function check_touch_move(_event:TouchEvent) {
        if(general_events_flags.touch_move) oninputevent('', InteractType.change, null, null, _event);

        for(name in touch_range_bindings.keys()) {
            var bindings = touch_range_bindings.get(name);
            for(binding in bindings) {
                if(binding.axis == ScreenAxis.X) {
                    if(_event.dx == 0) continue;
                    check_range_event(_event.x, _event.x - _event.dx, name, binding, null, _event, null);
                }
                else {
                    if(_event.dy == 0) continue;
                    check_range_event(_event.y, _event.y - _event.dy, name, binding, null, _event, null);
                }
            }
        }

        for(name in touch_area_bindings.keys()) {
            var bindings = touch_area_bindings.get(name);
            for(binding in bindings) {
                var prev = _event.pos.clone().subtract_xyz(_event.dx, _event.dy);
                check_area_event(_event.pos, prev, name, binding, null, _event, null);
            }
        }
    }

    function check_range_event(_pos:Float, _prev:Float, _name:String, _binding:RangeBinding, ?_mouse_event:MouseEvent, ?_touch_event:TouchEvent, ?_gamepad_event:GamepadEvent) {
        var in_range = check_in_range(_pos, _binding.start, _binding.end);
        var prev_in_range = check_in_range(_prev, _binding.start, _binding.end);

        emit_analog_event(in_range, prev_in_range, _name, _binding, _mouse_event, _touch_event, _gamepad_event);
    }

    inline function check_in_range(_val:Float, _start:Float, _end:Float):Bool {
        return (_start <= _val && _val <= _end);
    }

    function check_area_event(_pos:Vector, _prev:Vector, _name:String, _binding:AreaBinding, ?_mouse_event:MouseEvent, ?_touch_event:TouchEvent, ?_gamepad_event:GamepadEvent) {
        var in_range = _binding.rect.point_inside(_pos);
        var prev_in_range = _binding.rect.point_inside(_prev);

        emit_analog_event(in_range, prev_in_range, _name, _binding, _mouse_event, _touch_event, _gamepad_event);
    }

    function emit_analog_event(_in_range:Bool, _prev_in_range:Bool, _name:String, _binding:AnalogBindingBase, ?_mouse_event:MouseEvent, ?_touch_event:TouchEvent, ?_gamepad_event:GamepadEvent) {
        if(_binding.enter_emit && !_prev_in_range && _in_range) {
            oninputevent(_name, InteractType.down, null, _mouse_event, _touch_event, _gamepad_event);
        }
        if(_binding.change_emit && _in_range) {
            oninputevent(_name, InteractType.change, null, _mouse_event, _touch_event, _gamepad_event); //Emit change only in the range or always?
        }
        else if(_binding.leave_emit && _prev_in_range && !_in_range) {
            oninputevent(_name, InteractType.up, null, _mouse_event, _touch_event, _gamepad_event);
        }
    }

    function oninputevent(_name:String, _interact_type:InteractType, ?_key_event:KeyEvent, ?_mouse_event:MouseEvent, ?_touch_event:TouchEvent, ?_gamepad_event:GamepadEvent) {
        if(_key_event != null) {
            input_event.set_key(_name, InteractType.down, _key_event);
        }
        else if(_mouse_event != null) {
            input_event.set_mouse(_name, InteractType.down, _mouse_event);
        }
        else if(_touch_event != null) {
            input_event.set_touch(_name, InteractType.down, _touch_event);
        }
        else if(_gamepad_event != null) {
            input_event.set_gamepad(_name, InteractType.down, _gamepad_event);
        }
        else {
            input_event.set_unknown(_name, InteractType.down);
        }

        if(_interact_type == InteractType.down) {
                //down but not yet processed
            input_pressed.set(_name, false);
                //down is true immediately, since up removes it
            input_down.set(_name, true);
        }
        else if(_interact_type == InteractType.up) {
                //up but not yet processed
            input_released.set(_name, false);
                //remove down state
            input_down.remove(_name);
        }

        emit(_interact_type, input_event);
    }

    function range_binding_compare(_axis:Int, _start:Float, _end:Float, _change_emit:Bool, _enter_emit:Bool, _leave_emit:Bool, _val:RangeBinding):Bool {
        return _val.axis == _axis && _val.start == _start && _val.end == _end && _val.change_emit == _change_emit && _val.enter_emit == _enter_emit && _val.leave_emit == _leave_emit;
    }

    function area_binding_compare(_rect:Rectangle, _change_emit:Bool, _enter_emit:Bool, _leave_emit:Bool, _val:AreaBinding):Bool {
        return _rect.equal(_val.rect) && _val.change_emit == _change_emit && _val.enter_emit == _enter_emit && _val.leave_emit == _leave_emit;
    }

    function gamepad_button_binding_compare(_name:String, _id:Null<Int>, _val:GamepadButtonBinding) {
        return _val.name == _name && _val.gamepad_id == _id;
    }
}

@:enum
abstract ScreenAxis(Int) from Int to Int {
    var X = 0;
    var Y = 1;
}

typedef AnalogBindingBase = {
    var change_emit:Bool;
    var enter_emit:Bool;
    var leave_emit:Bool;
}

typedef RangeBinding = {
    > AnalogBindingBase,

    var axis:Int;
    var start:Float;
    var end:Float;
}

typedef AreaBinding = {
    > AnalogBindingBase,

    var rect:Rectangle;
}

typedef GamepadButtonBinding = {
    var name:String;
    var gamepad_id:Null<Int>;
}

typedef GeneralEventsFlags = {
    var keys:Bool;
    var mouse_buttons:Bool;
    var mouse_move:Bool;
    var mouse_wheel:Bool;
    var touches:Bool;
    var touch_move:Bool;
    var gamepad_buttons:Bool;
    var gamepad_axes:Bool;
}

/** Information about a named input event */
class InputEvent {

    public function new() {

    } //new

        /** The name of the input event */
    public var name (default, null): String;
        /** The type of input this event was generated for */
    public var input_type (default, null): InputEventType;
        /** The state of the event */
    public var interact_type (default, null): InteractType;
        /** null, unless type is `mouse` */
    public var mouse_event (default, null): MouseEvent;
        /** null, unless type is `key` */
    public var key_event (default, null): KeyEvent;
        /** null, unless type is `touch` */
    public var touch_event (default, null): TouchEvent;
        /** null, unless type is `gamepad` */
    public var gamepad_event (default, null): GamepadEvent;

    @:noCompletion
    public function set_key(_name:String, _interact_type:InteractType, _key_event:KeyEvent) {
        set_common(_name, InputEventType.key, _interact_type);
        set_events(_key_event, null, null, null);
    } //set_key

    @:noCompletion
    public function set_mouse(_name:String, _interact_type:InteractType, _mouse_event:MouseEvent) {
        set_common(_name, InputEventType.mouse, _interact_type);
        set_events(null, _mouse_event, null, null);
    } //set_mouse

    @:noCompletion
    public function set_touch(_name:String, _interact_type:InteractType, _touch_event:TouchEvent) {
        set_common(_name, InputEventType.touch, _interact_type);
        set_events(null, null, _touch_event, null);
    } //set_touch

    @:noCompletion
    public function set_gamepad(_name:String, _interact_type:InteractType, _gamepad_event:GamepadEvent) {
        set_common(_name, InputEventType.gamepad, _interact_type);
        set_events(null, null, null, _gamepad_event);
    } //set_gamepad

    @:noCompletion
    public function set_unknown(_name:String, _interact_type:InteractType) {
        set_common(_name, InputEventType.unknown, _interact_type);
        set_events(null, null, null, null);
    } //set_unknown

    function set_common(_name:String, _input_type:InputEventType, _interact_type:InteractType) {
        name = _name;
        input_type = _input_type;
        interact_type = _interact_type;
    } //set_common

    function set_events(_key_event:KeyEvent, _mouse_event:MouseEvent, _touch_event:TouchEvent, _gamepad_event:GamepadEvent) {
        key_event = _key_event;
        mouse_event = _mouse_event;
        touch_event = _touch_event;
        gamepad_event = _gamepad_event;
    } //set_events

} //InputEvent

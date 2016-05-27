package luxe;

import luxe.Engine;
import luxe.Log._debug;
import snow.types.Types;

@:allow(luxe.Engine)
class Input {

    var core : Engine;

    var key_bindings : Map<String, Map<Int,Bool> >;
    var mouse_bindings : Map<String, Map<Int,Bool> >;
    var gamepad_bindings: Map<String, Map<Int, Null<Int>> >;

    var _named_input_released : Map<String, Bool>;
    var _named_input_pressed : Map<String, Bool>;
    var _named_input_down : Map<String, Bool>;

    var key_event: KeyEvent;
    var text_event: TextEvent;
    var mouse_event: MouseEvent;
    var touch_event: TouchEvent;
    var gamepad_event: GamepadEvent;
    var input_event: InputEvent;
//

    function new( _core:Engine ) {

        core = _core;

        key_event = new KeyEvent();
        text_event = new TextEvent();
        mouse_event = new MouseEvent();
        touch_event = new TouchEvent();
        gamepad_event = new GamepadEvent();
        input_event = new InputEvent();

    } //new

//Public API
    //Input query

        /** immediate query of the pressed state of a named input. only true if pressed within one frame */
    public function inputpressed( _event:String ) : Bool {
        return _named_input_pressed.exists( _event );
    } //inputpressed

        /** immediate query of the released state of a named input. only true if released within one frame */
    public function inputreleased( _event:String ) : Bool {
        return _named_input_released.exists( _event );
    } //inputreleased

        /** immediate query of the down state of a named input. only true while the key is down */
    public function inputdown( _event:String ) : Bool {
        return _named_input_down.exists( _event );
    } //inputdown

 //Keys

        /** immediate query of the pressed state of a `keycode`, use `Key` for named keycodes. only true if pressed within one frame */
    public function keypressed( _code:Int ) : Bool {
        return core.app.input.keypressed( _code );
    } //keypressed

        /** immediate query of the released state of a `keycode`, use `Key` for named keycodes. only true if released within one frame */
    public function keyreleased( _code:Int ) : Bool{
        return core.app.input.keyreleased( _code );
    } //keyreleased

        /** immediate query of the down state of a `keycode`, use `Key` for named keycodes. only true while the key is down */
    public function keydown( _code:Int ) : Bool{
        return core.app.input.keydown( _code );
    } //keydown


        /** immediate query of the pressed state of a `scancode`, use `Scan` for named scancodes. only true if pressed within one frame */
    public function scanpressed( _code:Int ) : Bool {
        return core.app.input.scanpressed( _code );
    } //scanpressed

        /** immediate query of the released state of a `scancode`, use `Scan` for named scancodes. only true if released within one frame */
    public function scanreleased( _code:Int ) : Bool{
        return core.app.input.scanreleased( _code );
    } //scanreleased

        /** immediate query of the down state of a `scancode`, use `Scan` for named scancodes. only true while the key is down */
    public function scandown( _code:Int ) : Bool{
        return core.app.input.scandown( _code );
    } //scandown

    //Mouse

        /** immediate query of the pressed state of a mouse button. only true if pressed within one frame */
    public function mousepressed( _button:MouseButton ) : Bool {
        return core.app.input.mousepressed( _button );
    } //mousepressed

        /** immediate query of the released state of a mouse button. only true if released within one frame */
    public function mousereleased( _button:MouseButton ) : Bool{
        return core.app.input.mousereleased( _button );
    } //mousereleased

        /** immediate query of the down state of a mouse button. only true while the button is down. */
    public function mousedown( _button:MouseButton ) : Bool{
        return core.app.input.mousedown( _button );
    } //mousedown

    //Gamepad

        /** immediate query of the pressed state of a gamepad button. only true if pressed within one frame */
    public function gamepadpressed( _gamepad:Int, _button:Int ) : Bool {
        return core.app.input.gamepadpressed( _gamepad, _button );
    } //gamepadpressed

        /** immediate query of the released state of a gamepad button. only true if released within one frame */
    public function gamepadreleased( _gamepad:Int, _button:Int ) : Bool{
        return core.app.input.gamepadreleased( _gamepad, _button );
    } //gamepadreleased

        /** immediate query of the down state of a gamepad button. only true while the button is down */
    public function gamepaddown( _gamepad:Int, _button:Int ) : Bool{
        return core.app.input.gamepaddown( _gamepad, _button );
    } //gamepaddown

        /** immediate query of the axis value of a gamepad axis. */
    public function gamepadaxis( _gamepad:Int, _axis:Int ) : Float {
        return core.app.input.gamepadaxis( _gamepad, _axis );
    } //gamepadaxis


//Named event handlers
    //

        /** Bind a named input binding to a `Key` keycode */
    public function bind_key(_name:String, _key:Int) {

        if( !key_bindings.exists(_name) ) {
            key_bindings.set(_name, new Map<Int,Bool>() );
        }

        var _kb = key_bindings.get(_name);
            _kb.set( _key, true );

    } //bind_key

        /** Bind a named input binding to a `MouseButton` */
    public function bind_mouse(_name:String, _button:MouseButton) {

        if( !mouse_bindings.exists(_name) ) {
            mouse_bindings.set(_name, new Map<Int,Bool>());
        }

        var _mb = mouse_bindings.get(_name);
            _mb.set( _button, true );

    } //bind_mouse

    /** Bind a named input binding to a `Gamepad Button`. If no `Gamepad Id` is specified, any gamepad fires the named binding.*/
    public function bind_gamepad(_name:String, _gamepad_button:Int, ?_gamepad_id:Null<Int> = null) {

        if ( !gamepad_bindings.exists(_name) ) {
            gamepad_bindings.set(_name, new Map<Int, Null<Int>>());
        }

        var _gp = gamepad_bindings.get(_name);
            _gp.set ( _gamepad_button, _gamepad_id);

    } //bind_gamepad

//Internal

    function init() {

        key_bindings = new Map();
        mouse_bindings = new Map();
        gamepad_bindings = new Map();

        _named_input_down = new Map();
        _named_input_pressed = new Map();
        _named_input_released = new Map();

        _debug('\t input initialized.');

    } //init

    function destroy() {

        _debug('\t input shut down.');

    } //destroy

    function process() {
        //

           //remove any stale named pressed value
            //unless it wasn't alive for a full frame yet,
            //then flag it so that it may be
        for(_event in _named_input_pressed.keys()){

            if(_named_input_pressed.get(_event)){
                _named_input_pressed.remove(_event);
            } else {
                _named_input_pressed.set(_event, true);
            }

        } //each _named_input_pressed

            //remove any stale key released value
            //unless it wasn't alive for a full frame yet,
            //then flag it so that it may be
        for(_event in _named_input_released.keys()){

            if(_named_input_released.get(_event)){
                _named_input_released.remove(_event);
            } else {
                _named_input_released.set(_event, true);
            }

        } //each _named_input_released

    } //process

//pass through events from core

    //mouse

        function onmousedown(_x:Int, _y:Int, _button:Int, _timestamp:Float, _window_id:Int) {

            if(core.shutting_down) return;

            mouse_event.set_press(_x, _y, _button, InteractState.down, _timestamp, _window_id);

            check_named_mouse(mouse_event, true);

            core.emit(luxe.Ev.mousedown, mouse_event);

            core.game.onmousedown(mouse_event);

        } //onmousedown

        function onmouseup(_x:Int, _y:Int, _button:Int, _timestamp:Float, _window_id:Int) {

            if(core.shutting_down) return;

            mouse_event.set_press(_x, _y, _button, InteractState.up, _timestamp, _window_id);

            check_named_mouse(mouse_event);

            core.emit(luxe.Ev.mouseup, mouse_event);

            core.game.onmouseup(mouse_event);

        } //onmouseup

        function onmousemove(_x:Int, _y:Int, _x_rel:Int, _y_rel:Int, _timestamp:Float, _window_id:Int) {

            if(core.shutting_down) return;

            mouse_event.set_move(_x, _y, _x_rel, _y_rel, _timestamp, _window_id);

            core.emit(luxe.Ev.mousemove, mouse_event);

            core.game.onmousemove(mouse_event);

        } //onmousemove

        function onmousewheel(_x:Float, _y:Float, _timestamp:Float, _window_id:Int) {

            if(core.shutting_down) return;
            
            mouse_event.set_wheel(_x, _y, _timestamp, _window_id);

            check_named_mouse(mouse_event, false);
                
            core.emit(luxe.Ev.mousewheel, mouse_event);

            core.game.onmousewheel(mouse_event);

        } //onmousewheel

    //keys

        function onkeydown(_keycode:Int, _scancode:Int, _repeat:Bool, _mod:ModState, _timestamp:Float, _window_id:Int) : Void {

            if(core.shutting_down) return;

            key_event.set(_keycode, _scancode, _repeat, _mod, InteractState.down, _timestamp, _window_id);

            check_named_keys(key_event, true);

            core.emit(luxe.Ev.keydown, key_event);

            core.game.onkeydown(key_event);

        } //onkeydown

        function onkeyup(_keycode:Int, _scancode:Int, _repeat:Bool, _mod:ModState, _timestamp:Float, _window_id:Int) : Void {

            if(core.shutting_down) return;

            key_event.set(_keycode, _scancode, _repeat, _mod, InteractState.up, _timestamp, _window_id);

            check_named_keys(key_event);

            core.emit(luxe.Ev.keyup, key_event);

            core.game.onkeyup(key_event);

        } //onkeyup

        function ontextinput(_text:String, _start:Int, _length:Int, _etype:snow.types.TextEventType, _timestamp:Float, _window_id:Int) : Void {
            
            if(core.shutting_down) return;

            var _type = switch(_etype) {
                case te_edit: TextEventType.edit;
                case te_input: TextEventType.input;
                case _: return;
            }

            text_event.set(_text, _start, _length, _type, _timestamp, _window_id);

            core.emit(luxe.Ev.textinput, text_event);

            core.game.ontextinput(text_event);

        } //ontextinput

    //touch

        function ontouchdown(_x:Float, _y:Float, _dx:Float, _dy:Float, _touch_id:Int, _timestamp:Float) : Void {

            if(core.shutting_down) return;

            touch_event.set(_x, _y, _dx, _dy, _touch_id, InteractState.down, _timestamp);

            core.emit(luxe.Ev.touchdown, touch_event);

            core.game.ontouchdown(touch_event);

        } //ontouchdown

        function ontouchup(_x:Float, _y:Float, _dx:Float, _dy:Float, _touch_id:Int, _timestamp:Float) : Void {

            if(core.shutting_down) return;

            touch_event.set(_x, _y, _dx, _dy, _touch_id, InteractState.up, _timestamp);

            core.emit(luxe.Ev.touchup, touch_event);

            core.game.ontouchup(touch_event);

        } //ontouchup

        function ontouchmove(_x:Float, _y:Float, _dx:Float, _dy:Float, _touch_id:Int, _timestamp:Float) : Void {

            if(core.shutting_down) return;

            touch_event.set(_x, _y, _dx, _dy, _touch_id, InteractState.move, _timestamp);

            core.emit(luxe.Ev.touchmove, touch_event);

            core.game.ontouchmove(touch_event);

        } //ontouchmove

    //gamepad

        function ongamepadaxis(_gamepad:Int, _axis:Int, _value:Float, _timestamp:Float) : Void {
                
            if(core.shutting_down) return;

            gamepad_event.set_axis(_gamepad, _axis, _value, _timestamp);

            core.emit(luxe.Ev.gamepadaxis, gamepad_event);

            core.game.ongamepadaxis(gamepad_event);

        } //ongamepadaxis

        function ongamepaddown(_gamepad:Int, _button:Int, _value:Float, _timestamp:Float) : Void {
                
            if(core.shutting_down) return;

            gamepad_event.set_button(_gamepad, _button, _value, InteractState.down, _timestamp);

            check_named_gamepad_buttons(gamepad_event, true);

            core.emit(luxe.Ev.gamepaddown, gamepad_event);

            core.game.ongamepaddown(gamepad_event);

        } //ongamepaddown

        function ongamepadup(_gamepad:Int, _button:Int, _value:Float, _timestamp:Float) : Void {
                
            if(core.shutting_down) return;

            gamepad_event.set_button(_gamepad, _button, _value, InteractState.up, _timestamp);

            check_named_gamepad_buttons(gamepad_event, false);

            core.emit(luxe.Ev.gamepadup, gamepad_event);

            core.game.ongamepadup(gamepad_event);

        } //ongamepadup

        function ongamepaddevice(_gamepad:Int, _id:String, _etype:GamepadDeviceEventType, _timestamp:Float) : Void {
                
            if(core.shutting_down) return;

            var _type = switch(_etype) {
                case ge_device_added:    GamepadEventType.device_added;
                case ge_device_removed:  GamepadEventType.device_removed;
                case ge_device_remapped: GamepadEventType.device_remapped;
                case _:                  GamepadEventType.unknown;
            }

            gamepad_event.set_device(_gamepad, _id, _type, _timestamp);

            core.emit(luxe.Ev.gamepaddevice, gamepad_event);

            core.game.ongamepaddevice(gamepad_event);

        } //ongamepaddevice

    //input bindings

        function oninputdown(_name:String, ?_key_event:KeyEvent, ?_mouse_event:MouseEvent, ?_touch_event:TouchEvent, ?_gamepad_event:GamepadEvent) {
            
            if(core.shutting_down) return;

            if(_key_event != null) {
                input_event.set_key(_name, InteractState.down, _key_event);
            }
            else if(_mouse_event != null) {
                input_event.set_mouse(_name, InteractState.down, _mouse_event);
            }
            else if(_touch_event != null) {
                input_event.set_touch(_name, InteractState.down, _touch_event);
            }
            else if(_gamepad_event != null) {
                input_event.set_gamepad(_name, InteractState.down, _gamepad_event);
            }
            else {
                input_event.set_unknown(_name, InteractState.down);
            }

            core.emit(luxe.Ev.inputdown, input_event);

            core.game.oninputdown(input_event);

        } //oninputdown

        function oninputup(_name:String, ?_key_event:KeyEvent, ?_mouse_event:MouseEvent, ?_touch_event:TouchEvent, ?_gamepad_event:GamepadEvent) {
            
            if(core.shutting_down) return;

            if(_key_event != null) {
                input_event.set_key(_name, InteractState.up, _key_event);
            }
            else if(_mouse_event != null) {
                input_event.set_mouse(_name, InteractState.up, _mouse_event);
            }
            else if(_touch_event != null) {
                input_event.set_touch(_name, InteractState.up, _touch_event);
            }
            else if(_gamepad_event != null) {
                input_event.set_gamepad(_name, InteractState.up, _gamepad_event);
            }
            else {
                input_event.set_unknown(_name, InteractState.up);
            }

            core.emit(luxe.Ev.inputup, input_event);

            core.game.oninputup(input_event);

        } //oninputup

//internal

    function check_named_keys( e:KeyEvent, _down:Bool=false ) {

        var _fired : Array<String> = [];
        for(_name in key_bindings.keys()) {

            var _b = key_bindings.get(_name);
            var _is_down_repeat = _down && e.repeat;
            if(_b.exists(e.keycode) && !_is_down_repeat) {
                if( !Lambda.has(_fired, _name)) {
                    _fired.push(_name);
                }
            } //if the key fired is stored in a named binding

        } //for each binding

        for(_f in _fired) {
            if(_down) {

                    //down but not yet processed
                _named_input_pressed.set(_f, false);
                    //down is true immediate, cos up removes it
                _named_input_down.set(_f, true);

                oninputdown(_f, e);

            } else {

                    //up but not yet processed
                _named_input_released.set(_f, false);
                    //remove down state
                _named_input_down.remove(_f);

                oninputup(_f, e);

            } //if _down
        } //_f in _fired

    } //check_named_keys

    function check_named_mouse( e:MouseEvent, _down:Bool=false ) {

        var _fired : Array<String> = [];
        for(_name in mouse_bindings.keys()) {

            var _b = mouse_bindings.get(_name);
            if(_b.exists(e.button)) {
                if( !Lambda.has(_fired, _name)) {
                    _fired.push(_name);
                }
            } //if the key fired is stored in a named binding

        } //for each binding

        for(_f in _fired) {
            if(_down) {

                    //down but not yet processed
                _named_input_pressed.set( _f, false);
                    //down is true immediate, cos up removes it
                _named_input_down.set( _f, true);

                oninputdown(_f, e);

            } else {

                    //up but not yet processed
                _named_input_released.set( _f, false);
                    //remove down state
                _named_input_down.remove( _f );

                oninputup(_f, e);

            }
        } //_f in _fired

    } //check_named_keys

    function check_named_gamepad_buttons( e:GamepadEvent, _down:Bool=false ) {

        var _fired : Array<String> = [];
        for (_name in gamepad_bindings.keys()) {

            var _b = gamepad_bindings.get(_name);
            if (_b.exists(e.button)) {
                var _kb = _b.get(e.button);
                var _accepted_gamepad = _kb == null || _kb == e.gamepad;
                if ( !Lambda.has(_fired, _name) && _accepted_gamepad) {
                    _fired.push(_name);
                }
            } // if the button fired is stored in a named binding
        }

        for(_f in _fired) {
            if (_down) {

                //down but now yet processed
                _named_input_pressed.set( _f, false);
                // down is true immediate, because up removes it
                _named_input_down.set( _f, true);

                oninputdown(_f, e);

            } else {

                // up but not yet processed
                _named_input_released.set( _f, false);
                // remove down state
                _named_input_down.remove( _f );

                oninputup(_f, e);

            }
        } //_f in _fired

    } //check_named_gamepad_buttons

} //Input

    /** A modifier state for key events */
typedef ModState        =   snow.types.Types.ModState;
    /** A named list of keycodes. Use to compare against key event `keycode` values */
typedef Key             =   snow.systems.input.Keycodes.Keycodes;
    /** A named list of scancodes. Use to compare against key event `scancode` values */
typedef Scan            =   snow.systems.input.Keycodes.Scancodes;

/** A typed mouse button id */
@:enum abstract MouseButton(Int) from Int to Int {

/** no mouse buttons */
    var none = 0;
/** left mouse button */
    var left = 1;
/** middle mouse button */
    var middle = 2;
/** right mouse button */
    var right = 3;
/** extra button pressed (4) */
    var extra1 = 4;
/** extra button pressed (5) */
    var extra2 = 5;

} //MouseButton

/** A typed state for mouse, touch, or pressed/similar */
enum InteractState {

/** An unknown state */
    unknown;
/** An none state */
    none;
/** In a pressed state */
    down;
/** In a released state */
    up;
/** In a moving state */
    move;
/** A mouse wheel state */
    wheel;
/** A gamepad axis state */
    axis;

} //MouseState

/** A typed text event type */
enum TextEventType {

/** An unknown event */
    unknown;
/** An edit text typing event */
    edit;
/** An input text typing event */
    input;

} //TextEventType

/** Information about a keyboard event */
class KeyEvent {

    public function new() {

    } //new

        /** The `Scan` code value for this event */
    public var scancode (default, null): Int;
        /** The `Key` code value for this event */
    public var keycode (default, null): Int;
        /** The state of the key in this event */
    public var state (default, null): InteractState;
        /** The modifier state of this event */
    public var mod (default, null): ModState;
        /** If this value is bigger than 0 this is a key repeat event of a key held down */
    public var repeat (default, null): Bool;
        /** The time in seconds when this touch event occurred, use for deltas */
    public var timestamp (default, null): Float;
        /** The window id this event originated from */
    public var window_id (default, null): Int;

    @:noCompletion
    public function set(_keycode:Int, _scancode:Int, _repeat:Bool, _mod:ModState, _state:InteractState, _timestamp:Float, _window_id:Int) {

        mod = _mod;
        state = _state;
        repeat = _repeat;
        keycode = _keycode;
        scancode = _scancode;
        timestamp = _timestamp;
        window_id = _window_id;

    } //set

} //KeyEvent

/** Information about a touch event */
class TouchEvent {

    public function new() {

        pos = new luxe.Vector();

    } //new

        /** The state this touch event is in */
    public var state (default, null): InteractState;
        /** The time in seconds when this touch event occurred, use for deltas */
    public var timestamp (default, null): Float;
        /** The id of the touch that this event comes from, a finger id */
    public var touch_id (default, null): Int;
        /** The x position in the window of the touch event */
    public var x (default, null): Float;
        /** The x position in the window of the touch event */
    public var y (default, null): Float;
        /** The delta x value of the touch event, if the state is `moving` */
    public var dx (default, null): Float;
        /** The delta y value of the touch event, if the state is `moving` */
    public var dy (default, null): Float;
        /** A convenience vector access of the x and y position */
    public var pos (default, null): luxe.Vector;

    @:noCompletion
    public function set(_x:Float, _y:Float, _dx:Float, _dy:Float, _touch_id:Int, _state:InteractState, _timestamp:Float) {

        x = _x;
        y = _y;
        dx = _dx;
        dy = _dy;
        touch_id = _touch_id;
        timestamp = _timestamp;
        state = _state;

        pos.set_xy(_x, _y);

    } //set_press

} //TouchEvent

/** Information about a text input event */
class TextEvent {

    public function new() {

    } //new

        /** The text that this event has generated */
    public var text (default, null) : String;
        /** The type of text event */
    public var type (default, null) : TextEventType;
        /** The time in seconds when this touch event occurred, use for deltas */
    public var timestamp (default, null) : Float;
        /** The window id this event originated from */
    public var window_id (default, null) : Int;
        /** The start position, if the `type` is `edit` */
    public var start (default, null) : Int;
        /** The length position, if the `type` is `edit` */
    public var length (default, null) : Int;

    @:noCompletion
    public function set(_text:String, _start:Int, _length:Int, _type:TextEventType, _timestamp:Float, _window_id:Int) {

        text = _text;
        start = _start;
        length = _length;
        type = _type;
        timestamp = _timestamp;
        window_id = _window_id;

    } //set

} //TextEvent

/** A typed gamepad event type */
enum GamepadEventType {

    /** An unknown event */
    unknown;
    /** An axis change event */
    axis;
    /** A button event */
    button;
    /** A device added event */
    device_added;
    /** A device removed event */
    device_removed;
    /** A device was remapped */
    device_remapped;

} //GamepadEventType

/** Information about a gamepad event */
class GamepadEvent {

    public function new() {

    } //new

        /** The time in seconds when this gamepad event occurred, use for deltas */
    public var timestamp (default, null): Float;
        /** The type of gamepad event that this corresponds with */
    public var type (default, null): GamepadEventType;
        /** The state this event is in */
    public var state (default, null): InteractState;
        /** The id of the gamepad this event comes from */
    public var gamepad (default, null): Int;
        /** The button id, if the event `type` is `button` */
    public var button (default, null): Int;
        /** The axis id, if the event `type` is `axis` */
    public var axis (default, null): Int;
        /** The axis value, if the event `type` is `axis` */
    public var value (default, null): Float;
        /** The system id / name of the device, **only** if the event `type` is `device_added`,`device_removed` or `device_remapped` */
    public var id (default, null): String;

    @:noCompletion
    public function set_axis(_gamepad:Int, _axis:Int, _value:Float, _timestamp:Float) {

        id = null;
        button = -1;
        axis = _axis;
        value = _value;
        gamepad = _gamepad;
        timestamp = _timestamp;
        state = InteractState.axis;
        type = GamepadEventType.axis;

    } //set_axis

    @:noCompletion
    public function set_button(_gamepad:Int, _button:Int, _value:Float, _state:InteractState, _timestamp:Float) {

        id = null;
        axis = -1;
        state = _state;
        value = _value;
        button = _button;
        gamepad = _gamepad;
        timestamp = _timestamp;
        type = GamepadEventType.button;

    } //set_button

    @:noCompletion
    public function set_device(_gamepad:Int, _id:String, _type:GamepadEventType, _timestamp:Float) {

        id = _id;
        axis = -1;
        value = 0;
        button = -1;
        type = _type;
        gamepad = _gamepad;
        timestamp = _timestamp;
        state = InteractState.none;

    } //set_device

} //GamepadEvent

/** Information about a mouse event */
class MouseEvent {

    public function new() {
        pos = new luxe.Vector();
    }

        /** The time in seconds when this touch event occurred, use for deltas */
    public var timestamp (default, null) : Float = 0.0;
        /** The window id this event originated from */
    public var window_id (default, null) : Int = 1;
        /** The state this event is in */
    public var state (default, null) : InteractState;
        /** The button id, if the event `state` is `down` or `up` */
    public var button (default, null) : MouseButton;
        /** The x position in the window of the mouse event */
    public var x (default, null) : Int = 0;
        /** The y position in the window of the mouse event */
    public var y (default, null) : Int = 0;
        /** The relative x position if `state` is `move` or a window has grabbed state */
    public var x_rel (default, null) : Int = 0;
        /** The relative y position if `state` is `move` or a window has grabbed state */
    public var y_rel (default, null) : Int = 0;
        /** A convenience vector access of the x and y position */
    public var pos (default, null) : luxe.Vector;

    @:noCompletion
    public function set_press(_x:Int, _y:Int, _button:MouseButton, _state:InteractState, _timestamp:Float, _window_id:Int) {

        x = _x;
        y = _y;
        x_rel = 0;
        y_rel = 0;
        state = _state;
        button = _button;
        window_id = _window_id;
        timestamp = _timestamp;

        pos.set_xy(_x, _y);

    } //set_press

    @:noCompletion
    public function set_move(_x:Int, _y:Int, _x_rel:Int, _y_rel:Int, _timestamp:Float, _window_id:Int) {

        x = _x;
        y = _y;
        x_rel = _x_rel;
        y_rel = _y_rel;
        state = InteractState.move;
        button = MouseButton.none;
        window_id = _window_id;
        timestamp = _timestamp;

        pos.set_xy(_x, _y);

    } //set_move

    @:noCompletion
    public function set_wheel(_x:Float, _y:Float, _timestamp:Float, _window_id:Int) {

            //:todo: mouse wheel float value
        x = Math.floor(_x);
        y = Math.floor(_y);
        x_rel = 0;
        y_rel = 0;
        state = InteractState.wheel;
        button = MouseButton.none;
        window_id = _window_id;
        timestamp = _timestamp;

    } //set_wheel

} //MouseEvent

/** A type for a named input event */
enum InputEventType {

        /** An unknown input event */
    unknown;
        /** A mouse input event */
    mouse;
        /** A touch input event */
    touch;
        /** A key input event */
    keys;
        /** A gamepad input event */
    gamepad;

} //InputEventType

/** Information about a named input event */
class InputEvent {
    
    public function new() {

    } //new

        /** The name of the input event */
    public var name (default, null): String;
        /** The type of input this event was generated for */
    public var type (default, null): InputEventType;
        /** The state of the event */
    public var state (default, null): InteractState;
        /** null, unless type is `mouse` */
    public var mouse_event (default, null): MouseEvent;
        /** null, unless type is `keys` */
    public var key_event (default, null): KeyEvent;
        /** null, unless type is `touch` */
    public var touch_event (default, null): TouchEvent;
        /** null, unless type is `gamepad` */
    public var gamepad_event (default, null): GamepadEvent;

    @:noCompletion
    public function set_key(_name:String, _state:InteractState, _key_event:KeyEvent) {
        set_common(_name, InputEventType.keys, _state);
        set_events(_key_event, null, null, null);
    } //set_key

    @:noCompletion
    public function set_mouse(_name:String, _state:InteractState, _mouse_event:MouseEvent) {
        set_common(_name, InputEventType.mouse, _state);
        set_events(null, _mouse_event, null, null);
    } //set_mouse

    @:noCompletion
    public function set_touch(_name:String, _state:InteractState, _touch_event:TouchEvent) {
        set_common(_name, InputEventType.touch, _state);
        set_events(null, null, _touch_event, null);
    } //set_touch

    @:noCompletion
    public function set_gamepad(_name:String, _state:InteractState, _gamepad_event:GamepadEvent) {
        set_common(_name, InputEventType.gamepad, _state);
        set_events(null, null, null, _gamepad_event);
    } //set_gamepad

    @:noCompletion
    public function set_unknown(_name:String, _state:InteractState) {
        set_common(_name, InputEventType.unknown, _state);
        set_events(null, null, null, null);
    } //set_unknown

    function set_common(_name:String, _type:InputEventType, _state:InteractState) {
        name = _name;
        type = _type;
        state = _state;
    } //set_common

    function set_events(_key_event:KeyEvent, _mouse_event:MouseEvent, _touch_event:TouchEvent, _gamepad_event:GamepadEvent) {
        key_event = _key_event;
        mouse_event = _mouse_event;
        touch_event = _touch_event;
        gamepad_event = _gamepad_event;
    } //set_events

} //InputEvent

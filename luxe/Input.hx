package luxe;

import luxe.Core;
import luxe.Log._debug;
import snow.types.Types;

    /** A modifier state for key events */
typedef ModState        =   snow.types.Types.ModState;
    /** A named list of keycodes. Use to compare against key event `keycode` values */
typedef Key             =   snow.input.Keycodes.Keycodes;
    /** A named list of scancodes. Use to compare against key event `scancode` values */
typedef Scan            =   snow.input.Keycodes.Scancodes;

/** A typed mouse button id */
enum MouseButton {

/** no mouse buttons */
    none;
/** left mouse button */
    left;
/** middle mouse button */
    middle;
/** right mouse button */
    right;
/** extra button pressed (4) */
    extra1;
/** extra button pressed (5) */
    extra2;

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
typedef KeyEvent = {

        /** The `Scan` code value for this event */
    var scancode : Int;
        /** The `Key` code value for this event */
    var keycode : Int;
        /** The state of the key in this event */
    var state : InteractState;
        /** The modifier state of this event */
    var mod : ModState;
        /** If this value is bigger than 0 this is a key repeat event of a key held down */
    var repeat : Bool;
        /** The time in seconds when this touch event occurred, use for deltas */
    var timestamp : Float;
        /** The window id this event originated from */
    var window_id : Int;

} //KeyEvent

/** Information about a touch event */
typedef TouchEvent = {

        /** The state this touch event is in */
    var state : InteractState;
        /** The time in seconds when this touch event occurred, use for deltas */
    var timestamp : Float;
        /** The id of the touch that this event comes from, a finger id */
    var touch_id : Int;
        /** The x position in the window of the touch event */
    var x : Float;
        /** The x position in the window of the touch event */
    var y : Float;
        /** The delta x value of the touch event, if the state is `moving` */
    var dx : Float;
        /** The delta y value of the touch event, if the state is `moving` */
    var dy : Float;
        /** A convenience vector access of the x and y position */
    var pos : luxe.Vector;

} //TouchEvent

/** Information about a text input event */
typedef TextEvent = {

        /** The text that this event has generated */
    var text : String;
        /** The type of text event */
    var type : TextEventType;
        /** The time in seconds when this touch event occurred, use for deltas */
    var timestamp : Float;
        /** The window id this event originated from */
    var window_id : Int;
        /** The start position, if the `type` is `edit` */
    var start : Int;
        /** The length position, if the `type` is `edit` */
    var length : Int;

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
typedef GamepadEvent = {

        /** The time in seconds when this gamepad event occurred, use for deltas */
    var timestamp : Float;
        /** The type of gamepad event that this corresponds with */
    var type : GamepadEventType;
        /** The state this event is in */
    var state : InteractState;
        /** The id of the gamepad this event comes from */
    var gamepad : Int;
        /** The button id, if the event `type` is `button` */
    var button : Int;
        /** The axis id, if the event `type` is `axis` */
    var axis : Int;
        /** The axis value, if the event `type` is `axis` */
    var value : Float;

} //GamepadEvent

/** Information about a mouse event */
typedef MouseEvent = {

        /** The time in seconds when this touch event occurred, use for deltas */
    var timestamp : Float;
        /** The window id this event originated from */
    var window_id : Int;
        /** The state this event is in */
    var state : InteractState;
        /** The button id, if the event `state` is `down` or `up` */
    var button : MouseButton;
        /** The x position in the window of the mouse event */
    var x : Int;
        /** The y position in the window of the mouse event */
    var y : Int;
        /** The relative x position if `state` is `move` or a window has grabbed state */
    var xrel : Int;
        /** The relative y position if `state` is `move` or a window has grabbed state */
    var yrel : Int;
        /** A convenience vector access of the x and y position */
    var pos : luxe.Vector;

} //MouseEvent

/** A type for a named input event */
enum InputType {

        /** A mouse input event */
    mouse;
        /** A touch input event */
    touch;
        /** A key input event */
    keys;
        /** A gampad input event */
    gamepad;

} //InputType

/** Information about a named input event */
typedef InputEvent = {

        /** the name of the input event */
    var name : String;
        /** the type of input this event was generated for */
    var type  : InputType;
        /** The state of the event */
    var state : InteractState;
        /** null, unless type is `touch` */
    @:optional var touch_event : TouchEvent;
        /** null, unless type is `mouse` */
    @:optional var mouse_event : MouseEvent;
        /** null, unless type is `keys` */
    @:optional var key_event : KeyEvent;
        /** null, unless type is `gamepad` */
    @:optional var gamepad_event : GamepadEvent;

}

class Input {

    @:noCompletion public var core : Core;
    @:noCompletion public function new( _core:Core ) { core = _core; }

#if neko
    var key_bindings : Map<String, haxe.ds.EnumValueMap<Int,Bool> >;
    var mouse_bindings : Map<String, haxe.ds.EnumValueMap<MouseButton,Bool> >;
#else
    var key_bindings : Map<String, Map<Int,Bool> >;
    var mouse_bindings : Map<String, Map<MouseButton,Bool> >;
#end

    var _named_input_released : Map<String, Bool>;
    var _named_input_pressed : Map<String, Bool>;
    var _named_input_down : Map<String, Bool>;

    @:noCompletion public function init() {

        key_bindings = new Map();
        mouse_bindings = new Map();

        _named_input_down = new Map();
        _named_input_pressed = new Map();
        _named_input_released = new Map();

        _debug('\t input initialized.');

    } //init

    @:noCompletion public function destroy() {
        _debug('\t input shut down.');
    } //destroy

    @:noCompletion public function process() {

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

//Input query

        /** immediate query of the pressed state of a named input. only true if pressed within one frame */
    public function inputpressed( _event:String ) : Bool {
        return _named_input_pressed.exists( _event );
    } //inputpressed

        /** immediate query of the released state of a named input. only true if released within one frame */
    public function inputreleased( _event:String ) : Bool{
        return _named_input_released.exists( _event );
    } //inputreleased

        /** immediate query of the down state of a named input. only true while the key is down */
    public function inputdown( _event:String ) : Bool{
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
    public function mousepressed( _button:Int ) : Bool {
        return core.app.input.mousepressed( _button );
    } //mousepressed

        /** immediate query of the released state of a mouse button. only true if released within one frame */
    public function mousereleased( _button:Int ) : Bool{
        return core.app.input.mousereleased( _button );
    } //mousereleased

        /** immediate query of the down state of a mouse button. only true while the button is down. :todo: use `MouseButton` like it should be. */
    public function mousedown( _button:Int ) : Bool{
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

    function add_key_binding( _name:String, _value:Int ) {

        if( !key_bindings.exists(_name) ) {
            key_bindings.set(_name, new Map<Int,Bool>() );
        } //if the map doesn't exist yet

        var kb = key_bindings.get(_name);
            kb.set( _value, true );

    } //add_key_binding

    function add_mouse_binding( _name:String, _value:MouseButton ) {

        if( !mouse_bindings.exists(_name) ) {
            mouse_bindings.set(_name, new Map<MouseButton,Bool>());
        } //if the map doesn't exist yet

        var mb = mouse_bindings.get(_name);
            mb.set( _value, true );

    } //add_key_binding

        /** add a named input binding to a `Key` keycode, a `MouseButton`. :todo: add gamepad  */
    public function add<T>( _name:String, _binding_value:T ) {

        if(Std.is(_binding_value, Int)) {
                //if key value, add it
            add_key_binding(_name, cast _binding_value);

        } else if(Std.is(_binding_value, MouseButton)) {
                //if mouse value, add as mouse value
            add_mouse_binding(_name, cast _binding_value);
        }

    } //add



    @:noCompletion public function check_named_keys( e:KeyEvent, _down:Bool=false ) {

        var _fired : Array<String> = [];
        for(_name in key_bindings.keys()) {

            var _b = key_bindings.get(_name);
            if(_b.exists(e.keycode) && !e.repeat) {
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

                core.oninputdown( _f, {
                    name : _f,
                    type : InputType.keys,
                    state : InteractState.down,
                    key_event : e
                });

            } else {

                    //up but not yet processed
                _named_input_released.set( _f, false);
                    //remove down state
                _named_input_down.remove( _f );

                core.oninputup( _f, {
                    name : _f,
                    type : InputType.keys,
                    state : InteractState.up,
                    key_event : e
                });

            } //if _down
        } //_f in _fired

    } //check_named_keys

    @:noCompletion public function check_named_mouse( e:MouseEvent, _down:Bool=false ) {

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
                core.oninputdown( _f, {
                    name : _f,
                    type : InputType.mouse,
                    state : InteractState.down,
                    mouse_event : e
                });
            } else {
                core.oninputup( _f, {
                    name : _f,
                    type : InputType.mouse,
                    state : InteractState.up,
                    mouse_event : e
                });
            }
        } //_f in _fired

    } //check_named_keys

} //Input

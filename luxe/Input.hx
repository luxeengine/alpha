package luxe;

import luxe.Core;
import luxe.Log._debug;
import snow.types.Types;

typedef ModState        =   snow.types.Types.ModState;
typedef Key             =   snow.input.Keycodes.Keycodes;
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

        /** The `snow.input.Scan` code value for this event */
    var scancode : Int;
        /** The `snow.input.Key` code value for this event */
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
        /** The axis id, if the event `type` is `button` */
    var axis : Int;
        /** The axis value, if the event `type` is `axis` */
    var value : Float;

} //GamepadEvent

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

enum InputType {

    mouse;
    touch;
    keys;
    gamepad;

} //InputType

typedef InputEvent = {
    name             : String,
    type             : InputType,
    state            : InteractState,
    ?touch_event     : TouchEvent,
    ?mouse_event     : MouseEvent,
    ?key_event       : KeyEvent,
    ?gamepad_event   : GamepadEvent
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

    @:noCompletion public function init() {

        key_bindings = new Map();
        mouse_bindings = new Map();

        _debug('\t input initialized.');

    } //init

    @:noCompletion public function destroy() {
        _debug('\t input shut down.');
    } //destroy

    @:noCompletion public function process() {

    } //process

//Input query

    public function keypressed( _code:Int ) : Bool {
        return core.app.input.keypressed( _code );
    } //keypressed

    public function keyreleased( _code:Int ) : Bool{
        return core.app.input.keyreleased( _code );
    } //keyreleased

    public function keydown( _code:Int ) : Bool{
        return core.app.input.keydown( _code );
    } //keydown

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
                core.oninputdown( _f, {
                    name : _f,
                    type : InputType.keys,
                    state : InteractState.down,
                    key_event : e
                });
            } else {
                core.oninputup( _f, {
                    name : _f,
                    type : InputType.keys,
                    state : InteractState.up,
                    key_event : e
                });
            }
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

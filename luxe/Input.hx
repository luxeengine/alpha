package luxe;

import luxe.Core;
import luxe.Log._debug;

typedef Key         =   snow.input.Keycodes.Keycodes;
typedef Scan        =   snow.input.Keycodes.Scancodes;

typedef MouseButton     =   snow.types.Types.MouseButton;
typedef PressedState    =   snow.types.Types.PressedState;
typedef TouchState      =   snow.types.Types.TouchState;

    //Event types
typedef KeyEvent = snow.types.Types.KeyEvent;
typedef GamepadEvent = snow.types.Types.GamepadEvent;

typedef TouchEvent = {
    > snow.types.Types.TouchEvent,
    var pos : luxe.Vector;
} //TouchEvent

typedef MouseEvent = {
    > snow.types.Types.MouseEvent,
    var pos : luxe.Vector;
} //MouseEvent

enum InputType {
    mouse;
    touch;
    keys;
    gamepad;
}

enum InputState {
    down;
    up;
}

typedef InputEvent = {
    name             : String,
    type             : InputType,
    state            : InputState,
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
            if(_b.exists(e.keycode)) {
                if( !Lambda.has(_fired, _name)) {
                    _fired.push(_name);
                }
            } //if the key fired is stored in a named binding

        } //for each binding

        for(_f in _fired) {
            if(_down) {
                // core.oninputdown( _f, {
                //     name : _f,
                //     type : InputType.keys,
                //     state : InputState.down,
                //     key_event : e
                // });
            } else {
                // core.oninputup( _f, {
                //     name : _f,
                //     type : InputType.keys,
                //     state : InputState.up,
                //     key_event : e
                // });
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
                // core.oninputdown( _f, {
                //     name : _f,
                //     type : InputType.mouse,
                //     state : InputState.down,
                //     mouse_event : e
                // });
            } else {
                // core.oninputup( _f, {
                //     name : _f,
                //     type : InputType.mouse,
                //     state : InputState.up,
                //     mouse_event : e
                // });
            }
        } //_f in _fired

    } //check_named_keys

} //Input

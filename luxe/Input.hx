package luxe;

import luxe.Core;
import luxe.Log._debug;

    //Button and key types
typedef KeyValue    = lime.helpers.Keys.KeyValue;
typedef MouseButton = lime.InputHandler.MouseButton;
typedef MouseState  = lime.InputHandler.MouseState;
typedef TouchState  = lime.InputHandler.TouchState;
typedef ButtonState  = lime.InputHandler.ButtonState;

    //Event types
typedef KeyEvent = lime.InputHandler.KeyEvent;
typedef GamepadEvent = lime.InputHandler.GamepadEvent;
typedef GamepadButtonEvent = lime.InputHandler.GamepadButtonEvent;
typedef GamepadAxisEvent = lime.InputHandler.GamepadAxisEvent;

typedef TouchEvent = {
    > lime.InputHandler.TouchEvent,
    var pos : luxe.Vector;
} //TouchEvent

typedef MouseEvent = {
    > lime.InputHandler.MouseEvent,
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
    
    public static var Keys      : lime.helpers.Keys;
    public static var Gamepad   : lime.helpers.Gamepad;

    @:noCompletion public var core : Core;
    @:noCompletion public function new( _core:Core ) { core = _core; }

#if neko
    var key_bindings : Map<String, haxe.ds.EnumValueMap<KeyValue,Bool> >;
    var mouse_bindings : Map<String, haxe.ds.EnumValueMap<MouseButton,Bool> >;
#else
    var key_bindings : Map<String, Map<KeyValue,Bool> >;
    var mouse_bindings : Map<String, Map<MouseButton,Bool> >;  
#end

    @:noCompletion public function init() {

        Keys = new lime.helpers.Keys();
        Gamepad = new lime.helpers.Gamepad();
        key_bindings = new Map();
        mouse_bindings = new Map();        
        
            //Default to 360 for now
        Gamepad.apply_360_profile();

        _debug(':: luxe :: \t Input Initialized.');

    } //init

    @:noCompletion public function destroy() {
        _debug(':: luxe :: \t Input shut down.');
    } //destroy

    @:noCompletion public function process() {
        
    } //process

#if input_lazy

    public function keypressed( _value:KeyValue ) : Bool {
        return core.lime.input.keypressed(_value);
    }

    public function keyreleased( _value:KeyValue ) : Bool{
        return core.lime.input.keyreleased(_value);
    }

    public function keydown( _value:KeyValue ) : Bool{
        return core.lime.input.keydown(_value);
    }

#end

//Named event handlers

    function add_key_binding( _name:String, _value:KeyValue ) {
        
        if( !key_bindings.exists(_name) ) {
            key_bindings.set(_name, new Map<KeyValue,Bool>() );
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
        
        if(Std.is(_binding_value, KeyValue)) {
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
            if(_b.exists(e.key)) {
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
                    state : InputState.down,
                    key_event : e
                });  
            } else {
                core.oninputup( _f, {
                    name : _f,
                    type : InputType.keys,
                    state : InputState.up,
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
                    state : InputState.down,
                    mouse_event : e
                });
            } else {
                core.oninputup( _f, {
                    name : _f,
                    type : InputType.mouse,
                    state : InputState.up,
                    mouse_event : e
                });                
            } 
        } //_f in _fired

    } //check_named_keys

//Keyboard

    @:noCompletion public function onchar(_event:KeyEvent) {
    } //onchar

    @:noCompletion public function onkeydown(_event:KeyEvent) {
    } //onkeydown

    @:noCompletion public function onkeyup(_event:KeyEvent) {
    } //onkeyup

    @:noCompletion public function gotinputfocus(_event:KeyEvent) {
    } //gotinputfocus

    @:noCompletion public function lostinputfocus(_event:KeyEvent) {
    } //lostinputfocus

//Mouse
    
    @:noCompletion public function mousemove(_event:MouseEvent) {
    } //mousemove

    @:noCompletion public function mousedown(_event:MouseEvent) {
    } //mousedown

    @:noCompletion public function mouseclick(_event:MouseEvent) {
    } //mouseclick

    @:noCompletion public function mouseup(_event:MouseEvent) {
    } //mouseup

//Touch

    
    @:noCompletion public function touchbegin(_event:TouchEvent) {
    } //touchbegin

    @:noCompletion public function touchmove(_event:TouchEvent) {
    } //touchmove

    @:noCompletion public function touchend(_event:TouchEvent) {
    } //touchend

    @:noCompletion public function touchtap(_event:TouchEvent) {
    } //touchtap

//Gamepad

    @:noCompletion public function gamepadaxis(_event:GamepadEvent) {
    } //gamepadaxis

    @:noCompletion public function gamepadball(_event:GamepadEvent) {
    } //gamepadball

    @:noCompletion public function gamepadhat(_event:GamepadEvent) {
    } //gamepadhatmove

    @:noCompletion public function gamepadbuttondown(_event:GamepadEvent) {
    } //gamepadbuttondown

    @:noCompletion public function gamepadbuttonup(_event:GamepadEvent) {
    } //joybuttonup


} //Input

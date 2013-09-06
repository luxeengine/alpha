package luxe;

import luxe.Core;

    //button and key types
typedef KeyValue = lime.utils.Keys.KeyValue;
typedef MouseButton = lime.InputHandler.MouseButton;
typedef MouseState = lime.InputHandler.MouseState;
typedef TouchState = lime.InputHandler.TouchState;

    //event types
typedef KeyEvent = lime.InputHandler.KeyEvent;
typedef TouchEvent = lime.InputHandler.TouchEvent;
typedef MouseEvent = lime.InputHandler.MouseEvent;
typedef GamepadEvent = lime.InputHandler.GamepadEvent;

class Input {
    
    public var core : Core;
    public function new( _core:Core ) { core = _core; }
    public static var Keys : lime.utils.Keys;
    public static var Gamepad : lime.utils.Gamepad;

    var key_bindings : Map<String, Map<KeyValue,Bool> >;
    var mouse_bindings : Map<String, Map<MouseButton,Bool> >;    

    @:noCompletion public function startup() {
        Keys = new lime.utils.Keys();
        Gamepad = new lime.utils.Gamepad();
        key_bindings = new Map();
        mouse_bindings = new Map();        
        
            //Default to 360 for now
        Gamepad.apply_360_profile();

        core._debug(':: luxe :: \t Input Initialized.');
    }

    @:noCompletion public function shutdown() {
        core._debug(':: luxe :: \t Input shut down.');
    }

    @:noCompletion public function process() {
        //todo, poll for gamepad disconnects and reconnects
    }    

//Named event handlers

    function add_key_binding( _name:String, _value:KeyValue ) {
        
        if( !key_bindings.exists(_name) ) {
            key_bindings.set(_name, new Map());   
        } //if the map doesn't exist yet

        key_bindings.get(_name).set( _value, true );

    } //add_key_binding

    function add_mouse_binding( _name:String, _value:MouseButton ) {
        
        if( !mouse_bindings.exists(_name) ) {
            mouse_bindings.set(_name, new Map());   
        } //if the map doesn't exist yet

        mouse_bindings.get(_name).set( _value, true );

    } //add_key_binding

    public function add( _name:String, _event:Dynamic ) {
            
        if(Std.is(_event, KeyValue)) {
                //if key value, add it
            add_key_binding(_name, cast _event);
        } else if(Std.is(_event, MouseButton)) { 
                //if mouse value, add as mouse value
            add_mouse_binding(_name, cast _event);
        }
    }

    @:noCompletion public function check_named_keys( e:KeyEvent ) {

        var _fired : Array<String> = [];
        for(_name in key_bindings.keys()) {

            var _b = key_bindings.get(_name);
            if(_b.exists(e.key)) {
                if( !Lambda.has(_fired, _name) ) {
                    _fired.push(_name);
                }
            } //if the key fired is stored in a named binding

        } //for each binding

        for(_f in _fired) {
            if(core.host.oninput != null) core.host.oninput(_f,e); 
        } //_f in _fired

    } //check_named_keys

    @:noCompletion public function check_named_mouse( e:MouseEvent ) {

        var _fired : Array<String> = [];
        for(_name in mouse_bindings.keys()) {

            var _b = mouse_bindings.get(_name);
            if(_b.exists(e.button)) {
                if( !Lambda.has(_fired, _name) ) {
                    _fired.push(_name);
                }
            } //if the key fired is stored in a named binding

        } //for each binding

        for(_f in _fired) {
            if(core.host.oninput != null) core.host.oninput(_f,e); 
        } //_f in _fired

    } //check_named_keys


//Keyboard

    @:noCompletion public function onchar(_event:KeyEvent) {
    }

    @:noCompletion public function onkeydown(_event:KeyEvent) {
    }

    @:noCompletion public function onkeyup(_event:KeyEvent) {
    }

    @:noCompletion public function gotinputfocus(_event:KeyEvent) {
    }   

    @:noCompletion public function lostinputfocus(_event:KeyEvent) {
    }

//Mouse
    
    @:noCompletion public function mousemove(_event:MouseEvent) {
    }

    @:noCompletion public function mousedown(_event:MouseEvent) {
    }

    @:noCompletion public function mouseclick(_event:MouseEvent) {
    }

    @:noCompletion public function mouseup(_event:MouseEvent) {
    }

//Touch

    
    @:noCompletion public function touchbegin(_event:TouchEvent) {
    }

    @:noCompletion public function touchmove(_event:TouchEvent) {
    }

    @:noCompletion public function touchend(_event:TouchEvent) {
    }

    @:noCompletion public function touchtap(_event:TouchEvent) {
    }

//Joystick

    @:noCompletion public function joyaxismove(_event:Dynamic) {
    }

    @:noCompletion public function joyballmove(_event:Dynamic) {
    }

    @:noCompletion public function joyhatmove(_event:Dynamic) {
    }

    @:noCompletion public function joybuttondown(_event:Dynamic) {
    }

    @:noCompletion public function joybuttonup(_event:Dynamic) {
    }

}

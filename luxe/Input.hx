package luxe;

import luxe.Core;

    //Button and key types
typedef KeyValue    = lime.helpers.Keys.KeyValue;
typedef MouseButton = lime.InputHandler.MouseButton;
typedef MouseState  = lime.InputHandler.MouseState;
typedef TouchState  = lime.InputHandler.TouchState;

    //Event types
typedef KeyEvent = lime.InputHandler.KeyEvent;
typedef GamepadEvent = lime.InputHandler.GamepadEvent;

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

typedef InputEvent = {
    type            : InputType,
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

        core._debug(':: luxe :: \t Input Initialized.');
    } //init

    @:noCompletion public function destroy() {
        core._debug(':: luxe :: \t Input shut down.');
    }

    @:noCompletion public function process() {
        //todo, poll for gamepad disconnects and reconnects
    }    

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

    public function add( _name:String, _event:Dynamic ) {
            
        if(Std.is(_event, KeyValue)) {
                //if key value, add it
            add_key_binding(_name, cast _event);
        } else if(Std.is(_event, MouseButton)) { 
                //if mouse value, add as mouse value
            add_mouse_binding(_name, cast _event);
        }
    }

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
                    type : InputType.keys,
                    key_event : e
                });  
            } else {
                core.oninputup( _f, {
                    type : InputType.keys,
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
                    type : InputType.mouse,
                    mouse_event : e
                });
            } else {
                core.oninputup( _f, {
                    type : InputType.mouse,
                    mouse_event : e
                });                
            } 
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

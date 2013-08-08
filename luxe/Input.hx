package luxe;

import luxe.Core;

typedef MouseButton = lime.InputHandler.MouseButton;
typedef MouseState = lime.InputHandler.MouseState;
typedef TouchState = lime.InputHandler.TouchState;

typedef TouchEvent = lime.InputHandler.TouchEvent;
typedef MouseEvent = lime.InputHandler.MouseEvent;
typedef GamepadEvent = lime.InputHandler.GamepadEvent;

class Input {
    
    public var core : Core;
    public function new( _core:Core ) { core = _core; }
    public static var Keys : lime.utils.Keys;
    public static var Gamepad : lime.utils.Gamepad;

    public function startup() {
        Keys = new lime.utils.Keys();
        Gamepad = new lime.utils.Gamepad();
        
            //Default to 360 for now
        Gamepad.apply_360_profile();

        core._debug(':: luxe :: \t Input Initialized.');
    }

    public function shutdown() {
        core._debug(':: luxe :: \t Input shut down.');
    }

    public function process() {
        //todo, poll for gamepad disconnects and reconnects
    }    


//Keyboard

    public function onchar(_event:Dynamic) {
    }

    public function onkeydown(_event:Dynamic) {
    }

    public function onkeyup(_event:Dynamic) {
    }

    public function gotinputfocus(_event:Dynamic) {
    }   

    public function lostinputfocus(_event:Dynamic) {
    }

//Mouse
    
    public function mousemove(_event:MouseEvent) {
    }

    public function mousedown(_event:MouseEvent) {
    }

    public function mouseclick(_event:MouseEvent) {
    }

    public function mouseup(_event:MouseEvent) {
    }

//Touch

    
    public function touchbegin(_event:TouchEvent) {
    }

    public function touchmove(_event:TouchEvent) {
    }

    public function touchend(_event:TouchEvent) {
    }

    public function touchtap(_event:TouchEvent) {
    }

//Joystick

    public function joyaxismove(_event:Dynamic) {
    }

    public function joyballmove(_event:Dynamic) {
    }

    public function joyhatmove(_event:Dynamic) {
    }

    public function joybuttondown(_event:Dynamic) {
    }

    public function joybuttonup(_event:Dynamic) {
    }

}

package luxe;

import luxe.Core;
import luxe.Input;
import snow.App;
import luxe.AppConfig;

@:noCompletion
@:keepSub
class Game {


    @:noCompletion public var _luxe : Core;

        /** Empty constructor. Use `ready` instead. */
    public function new() {}
        /** Called by luxe to request config changes, override this to change the defaults.
            This happens before ready, so the values are available when ready is called. */
    public function config( config:AppConfig ) : AppConfig  { return config; }
        /** Your entry point. Called for you when you can initialize your application */
    public function ready() {}
        /** Your update loop. Called every frame for you. The dt value depends on the timing configuration (see the {App Guide}) */
    public function update(dt:Float) {}
        /** Your exit point. Called for you when you should shut down your application */
    public function destroyed() {}

        /** Called when the application is about to render */
    public function pre_render() {}
        /** Called when the application is rendering */
    public function render() {}
        /** Called when the application is done rendering */
    public function post_render() {}

        /** Called when a named input down event occurs */
    public function oninputdown( _name:String, e:InputEvent ) {}
        /** Called when a named input up event occurs */
    public function oninputup( _name:String, e:InputEvent ) {}

        /** Called for you when a mouse button is pressed */
    public function onmousedown( event:MouseEvent ) {}
        /** Called for you when a mouse button is released */
    public function onmouseup( event:MouseEvent ) {}
        /** Called for you when the mouse wheel moves */
    public function onmousewheel( event:MouseEvent ) {}
        /** Called for you when the mouse moves */
    public function onmousemove( event:MouseEvent ) {}

        /** Called for you when a key is pressed down */
    public function onkeydown( event:KeyEvent ) {}
        /** Called for you when a key is released */
    public function onkeyup( event:KeyEvent ) {}
        /** Called for you when text input is happening. Use this for textfields, as it handles the complexity of unicode etc. */
    public function ontextinput( event:TextEvent ) {}

        /** Called for you when a touch is released, use the `touch_id` to track which */
    public function ontouchdown( event:TouchEvent ) {}
        /** Called for you when a touch is first pressed, use the `touch_id` to track which */
    public function ontouchup( event:TouchEvent ) {}
        /** Called for you when a touch is moved, use the `touch_id` to track which */
    public function ontouchmove( event:TouchEvent ) {}

        /** Called for you when a connected gamepad axis moves, use `gamepad` to determine gamepad id */
    public function ongamepadaxis( event:GamepadEvent ) {}
        /** Called for you when a connected gamepad button is pressed, use `gamepad` to determine gamepad id */
    public function ongamepadbuttondown( event:GamepadEvent ) {}
        /** Called for you when a connected gamepad button is released, use `gamepad` to determine gamepad id */
    public function ongamepadbuttonup( event:GamepadEvent ) {}
        /** Called for you when a gamepad is connected or disconnected, use `gamepad` to determine gamepad id */
    public function ongamepaddevice( event:GamepadEvent ) {}

} //Game

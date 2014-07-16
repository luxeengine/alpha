package luxe;

import luxe.Core;
import luxe.Input;

@:noCompletion @:keepSub class Game extends snow.App {

    @:noCompletion public var _luxe : Core;

        /** Called when the application is about to render */
    public function pre_render() {}
        /** Called when the application is rendering */
    public function render() {}
        /** Called when the application is done rendering */
    public function post_render() {}

        /** Called when a named input down event occurs */
    public function inputdown( _name:String, e:InputEvent ) {}
        /** Called when a named input up event occurs */
    public function inputup( _name:String, e:InputEvent ) {}

        /** Called for you when a mouse button is pressed */
    public function mousedown( event:MouseEvent ) {}
        /** Called for you when a mouse button is released */
    public function mouseup( event:MouseEvent ) {}
        /** Called for you when the mouse wheel moves */
    public function mousewheel( event:MouseEvent ) {}
        /** Called for you when the mouse moves */
    public function mousemove( event:MouseEvent ) {}

        /** Called for you when a key is pressed down */
    public function keydown( event:KeyEvent ) {}
        /** Called for you when a key is released */
    public function keyup( event:KeyEvent ) {}
        /** Called for you when text input is happening. Use this for textfields, as it handles the complexity of unicode etc. */
    public function textinput( event:TextEvent ) {}

        /** Called for you when a touch is released, use the `touch_id` to track which */
    public function touchdown( event:TouchEvent ) {}
        /** Called for you when a touch is first pressed, use the `touch_id` to track which */
    public function touchup( event:TouchEvent ) {}
        /** Called for you when a touch is moved, use the `touch_id` to track which */
    public function touchmove( event:TouchEvent ) {}

        /** Called for you when a connected gamepad axis moves, use `gamepad` to determine gamepad id */
    public function gamepadaxis( event:GamepadEvent ) {}
        /** Called for you when a connected gamepad button is pressed, use `gamepad` to determine gamepad id */
    public function gamepadbuttondown( event:GamepadEvent ) {}
        /** Called for you when a connected gamepad button is released, use `gamepad` to determine gamepad id */
    public function gamepadbuttonup( event:GamepadEvent ) {}
        /** Called for you when a gamepad is connected or disconnected, use `gamepad` to determine gamepad id */
    public function gamepaddevice( event:GamepadEvent ) {}

} //Game

package luxe;

import luxe.Core;
import luxe.Objects;
import luxe.Input;
import luxe.Screen;
import snow.App;

@:noCompletion
@:keepSub
class Game extends Emitter<Int> {

    @:noCompletion public var app : Core;

        /** Empty constructor. Use `ready` instead. */
    public function new() {
        super();
    }

        /** Called by luxe to request config changes, override this to change the defaults.
            This happens before ready, so the values are available when ready is called. */
    public function config( _config:luxe.AppConfig ) : luxe.AppConfig  { return _config; }
        /** Your entry point. Called for you when you can initialize your application */
    public function ready() {}
        /** Your update loop. Called every frame for you. The dt value depends on the timing configuration (see the {App Guide}) */
    public function update(dt:Float) {}

        /** very low level event handler from snow core. Often handled by the subsystems and by luxe, so check there first! */
    @:noCompletion public function onevent( event:snow.types.Types.SystemEvent ) { }

       /** Your exit point. Called for you when you should shut down your application */
   @:noCompletion public function ondestroy() {}

       /** Called when the application is about to render */
   @:noCompletion public function onprerender() {}
       /** Called when the application is rendering */
   @:noCompletion public function onrender() {}
       /** Called when the application is done rendering */
   @:noCompletion public function onpostrender() {}

       /** Called when a named input down event occurs */
   @:noCompletion public function oninputdown( _name:String, e:InputEvent ) {}
       /** Called when a named input up event occurs */
   @:noCompletion public function oninputup( _name:String, e:InputEvent ) {}

       /** Called for you when a mouse button is pressed */
   @:noCompletion public function onmousedown( event:MouseEvent ) {}
       /** Called for you when a mouse button is released */
   @:noCompletion public function onmouseup( event:MouseEvent ) {}
       /** Called for you when the mouse wheel moves */
   @:noCompletion public function onmousewheel( event:MouseEvent ) {}
       /** Called for you when the mouse moves */
   @:noCompletion public function onmousemove( event:MouseEvent ) {}

       /** Called for you when a key is pressed down */
   @:noCompletion public function onkeydown( event:KeyEvent ) {}
       /** Called for you when a key is released */
   @:noCompletion public function onkeyup( event:KeyEvent ) {}
       /** Called for you when text input is happening. Use this for textfields, as it handles the complexity of unicode etc. */
   @:noCompletion public function ontextinput( event:TextEvent ) {}

       /** Called for you when a touch is first pressed, use the `touch_id` to track which */
   @:noCompletion public function ontouchdown( event:TouchEvent ) {}
       /** Called for you when a touch is released, use the `touch_id` to track which */
   @:noCompletion public function ontouchup( event:TouchEvent ) {}
       /** Called for you when a touch is moved, use the `touch_id` to track which */
   @:noCompletion public function ontouchmove( event:TouchEvent ) {}

       /** Called for you when a connected gamepad axis moves, use `gamepad` to determine gamepad id */
   @:noCompletion public function ongamepadaxis( event:GamepadEvent ) {}
       /** Called for you when a connected gamepad button is pressed, use `gamepad` to determine gamepad id */
   @:noCompletion public function ongamepaddown( event:GamepadEvent ) {}
       /** Called for you when a connected gamepad button is released, use `gamepad` to determine gamepad id */
   @:noCompletion public function ongamepadup( event:GamepadEvent ) {}
       /** Called for you when a gamepad is connected or disconnected, use `gamepad` to determine gamepad id */
   @:noCompletion public function ongamepaddevice( event:GamepadEvent ) {}

       /** Called for you when a window is moved, with the data containing the new x/y position */
   @:noCompletion public function onwindowmoved( event:WindowEvent ) {}
       /** Called for you when a window is resized by the user, with the data containing the new x/y size */
   @:noCompletion public function onwindowresized( event:WindowEvent ) {}
       /** Called for you when a window is resized by the system or code or the user, with the data containing the new x/y size */
   @:noCompletion public function onwindowsized( event:WindowEvent ) {}
       /** Called for you when a window is minimized. */
   @:noCompletion public function onwindowminimized( event:WindowEvent ) {}
       /** Called for you when a window is restored. */
   @:noCompletion public function onwindowrestored( event:WindowEvent ) {}

} //Game

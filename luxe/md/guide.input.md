
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[View all guides](guide.html)

---

## Handling input in luxe

_This tutorial assumes you are familiar with the basics of [getting started with luxe](guide.one.html)._

###Different types of input
---
luxe supports all common types of input out of the box:

- Touch input
- Mouse input
- Gamepad/Joystick input
- Keyboard input

###Accessing input events
---
Your Game class has a bunch of functions that can (and will) be called when an event happens. Other classes that typically require input events _also_ receive them, like `Component` and `State` all have the same functions to override and handle the events as needed.

All possible functions and descriptions are listed below.

#### Events are fired immediately

The reason that these event handlers are a function is because the call is direct, and happens immediately when the event propogates from the system.

As soon as luxe obtains an input event from the **system** it will immediately call these functions - this is to avoid unnessary delays in handling touches or key presses and minimize latency wherever possible.

### Event types

Most input events are typically modelled around how the platform or OS handles the input events. Each type of event has a typed structure containing the details of the event that happened.    


#### Specific event types
---
For example, here is a touch event :

    typedef TouchEvent = {
        var state : TouchState;
        var flags : Int;
        var ID : Int;
        var x : Float;
        var y : Float;
        var raw : Dynamic;
    };

**The raw property**   
You may also note the `raw` property.   
Sometimes you need to know some value from the OS/platform that luxe is not explicitly exposing. This simply helps prevent leaky abstractions on the platform specific events.

&nbsp;

## Named input 
---
Sometimes it is convenient to bind multiple events to the same handler.   

Sometimes a person playing the game will want to use W/A/S/D and sometimes they would prefer the arrow keys. The combinations of sensible defaults for this can quickly escalate, and gets relatively complex over different locales and keyboard layouts.

Instead, binding an event to a name and using the name is more flexible.

For this reason, luxe offers a named input binding system, where multiple events (even of different types) can be bound to a single identity and handler, so you can handle them accordingly.

Let's use a common example where the jump key might be `Z`, `Space`, and `Right Mouse`.

    Luxe.input.bind_key('jump', KeyValue.key_Z);
    Luxe.input.bind_key('jump', KeyValue.space);
    Luxe.input.bind_mouse('jump', MouseButton.right);

#### Handling the named input

Now that you have the named input bound, you can listen for the event using `oninputdown` or `oninputup`.

    public function oninputup( event_name:String, event:InputEvent ) {
    
        switch( event_name ) {
            case 'jump':
                player.jump();
        } //switch
    
    }

You can make the assumption here that all types of input mapped to jump, should call jump directly. But - the event is typed as InputEvent, and contains the following information :

    typedef InputEvent = {
        type             : InputType,
        ?touch_event     : TouchEvent,
        ?mouse_event     : MouseEvent,
        ?key_event       : KeyEvent,
        ?gamepad_event   : GamepadEvent
    } 

When the event originates from a mouse event, the `event.type` will be `InputType.mouse`, and the `event.mouse_event` will be populated with the originating event. Any other event structure (key_event, gamepad_event etc) will be null. Only the event matching the type will not be.

    enum InputType {
        mouse;
        touch;
        keys;
        gamepad;
    }

---

## Additional information
---

<a name="handlers"> </a>
Here is a full list of functions, with descriptions :
    

```

//Named input

       /** Called when a named input down event occurs */
   public function oninputdown( _name:String, e:InputEvent ) {}
       /** Called when a named input up event occurs */
   public function oninputup( _name:String, e:InputEvent ) {}

//Mouse

       /** Called for you when a mouse button is pressed */
   public function onmousedown( event:MouseEvent ) {}
       /** Called for you when a mouse button is released */
   public function onmouseup( event:MouseEvent ) {}
       /** Called for you when the mouse wheel moves */
   public function onmousewheel( event:MouseEvent ) {}
       /** Called for you when the mouse moves */
   public function onmousemove( event:MouseEvent ) {}

//Keyboard

       /** Called for you when a key is pressed down */
   public function onkeydown( event:KeyEvent ) {}

       /** Called for you when a key is released */
   public function onkeyup( event:KeyEvent ) {}

       /** Called for you when text input is happening.
           Use this for textfields, as it handles the complexity
           of unicode and other platform specific details. */
   public function ontextinput( event:TextEvent ) {}

//Touch

       /** Called for you when a touch is first pressed,
            use the `touch_id` to track which */
   public function ontouchdown( event:TouchEvent ) {}

       /** Called for you when a touch is released,
            use the `touch_id` to track which */
   public function ontouchup( event:TouchEvent ) {}

       /** Called for you when a touch is moved,
            use the `touch_id` to track which */
   public function ontouchmove( event:TouchEvent ) {}

//Gamepad

       /** Called for you when a connected gamepad axis moves, 
            use `gamepad` to determine gamepad id */
   public function ongamepadaxis( event:GamepadEvent ) {}

       /** Called for you when a connected gamepad button is pressed, 
            use `gamepad` to determine gamepad id */
   public function ongamepaddown( event:GamepadEvent ) {}

       /** Called for you when a connected gamepad button is released, 
            use `gamepad` to determine gamepad id */
   public function ongamepadup( event:GamepadEvent ) {}

       /** Called for you when a gamepad is connected or disconnected, 
            use `gamepad` to determine gamepad id */
   public function ongamepaddevice( event:GamepadEvent ) {}

```

---

###[Back to guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   

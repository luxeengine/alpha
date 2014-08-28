
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[To the prev guide](guide.sprites.html)
###[To the next guide](guide.basiccomponents.html)
###[View all guides](guide.html)

---

## Handling input in luxe

_This tutorial assumes you are familiar with the basics of [getting started with luxe](guide.gettingstarted.html), and [displaying stuff](guide.sprites.html) on screen._

###Different types of input
---
Luxe supports all common types of input out of the box:

- Touch/Multitouch input (on mobile devices)
- Mouse input
- Gamepad/Joystick input
- Keyboard input

###Accessing input events
---
Your Game class has a bunch of functions that can (and will) be called when an event happens. The reason that this is a function (and not say, an event) is because a function call is immediate.

As soon as luxe obtains an input event from the system it will immediately call your code to handle it. This is to avoid unnessary delays in handling touches or key/gamepad press and minimize latency when making games.


### The specific event types
---
Each type of event have a typed event structure, for the details of the event.    
For example, here is a touch event :

    typedef TouchEvent = {
        var state : TouchState;
        var flags : Int;
        var ID : Int;
        var x : Float;
        var y : Float;
        var raw : Dynamic;
    };

You may also note the `raw` property.   
Sometimes you need to know some value from the OS/platform that luxe is not explicitly exposing.

For this purpose all of the events (MouseEvent, TouchEvent, GamepadEvent, KeyEvent) pass a property through the event object.
This is the exact event structure, untouched, low level (you can use `trace(event.raw)` to dump it's contents.

## Named input 
--- 
Sometimes it is convenient to bind multiple events to the same piece of code. Sometimes a person playing the game will want to use W/A/S/D and sometimes they would prefer the arrow keys. The combinations of sensible defaults for this can quickly escalate.

It is always useful to be able to refer to an input binding by name (rather than the exact key) for things like customisable key binding screens.

For these reasons, luxe offers a named input binding system, where multiple events (even of different types) can be bound to a single spot, so you can handle them accordingly.

Let's use a common example where the jump key might be Z, Space, and Right Mouse.

    Luxe.input.add('jump', KeyValue.key_Z);
    Luxe.input.add('jump', KeyValue.space);
    Luxe.input.add('jump', MouseButton.right);

### handling the named input
---

Now that you have the named input bound, you can listen for the event using `oninputdown` or `oninputup`.

    public function oninputup( event_name:String, event:InputEvent ) {

        switch( event_name ) {
            case 'jump':
                player.jump();
        } //switch

    } 

You can make the assumption here that all types of input mapped to jump, should call jump directly. But - the even is typed as InputEvent, and contains the following information :

    typedef InputEvent = {
        type             : InputType,
        ?touch_event     : TouchEvent,
        ?mouse_event     : MouseEvent,
        ?key_event       : KeyEvent,
        ?gamepad_event   : GamepadEvent
    } 

When the event originates from a mouse event, the `event.type` will be `InputType.mouse`, and the `event.mouse_event` will be populated with the originating event.

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
Here is a full list of functions, with commented descriptions :
    
    //Keyboard
        
        public function onkeydown( event:KeyEvent ) {
            //as soon as a key is pushed down
        }

        public function onkeyup( event:KeyEvent ) {
            //as soon as a key is released
        }

    //Mouse    

        public function onmousedown( event:MouseEvent ) {
            //as soon as a mouse button is pushed down
        }

        public function onmouseup( event:MouseEvent ) {
            //as soon as a mouse button is released
        }

        public function onmousemove( event:MouseEvent ) {
            //every time the mouse moves
        }

    //Touch    

        public function ontouchbegin( event:TouchEvent ) {
            //as soon as a touch is detected (event contains a unique touch ID)
        }

        public function ontouchend( event:TouchEvent ) {
            //as soon as a touch is released (event contains a unique touch ID, to know which)
        }

        public function ontouchmove( event:TouchEvent ) {
            //as soon as a touch is moved (event contains a unique touch ID, to know which)
        }

    //Gamepad    

        public function ongamepadaxis( event:GamepadEvent ) {
            //when a gamepad axis changes
        }
        
        public function ongamepadball( event:GamepadEvent  ) {
            //when a gamepad ball changes
        }

        public function ongamepadhat( event:GamepadEvent  ) {
            //when a gamepad hat is pressed (D-pad)
        }    

        public function ongamepadbuttondown( event:GamepadEvent ) {
            //when a gamepad button is pressed down
        }    

        public function ongamepadbuttonup( event:GamepadEvent ) {
            //when a gamepad button is released
        }

    //Input    

        public function oninputup( named_input:String, e:InputEvent ) {
            //called when a bound named input event is released  
        } 
        
        public function oninputdown( named_input:String, e:InputEvent ) {
            //called when a bound named input event is pressed
        }

---

###[To the prev guide](guide.gettingstarted.html)
###[To the next guide](guide.basiccomponents.html)
###[Back to guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   

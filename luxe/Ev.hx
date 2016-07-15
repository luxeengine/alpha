package luxe;

/** A core event enum for the core luxe events.
    Used with `on` and `off` handlers, with strict types to Ev
    :todo: Ev and enum naming */
@:keep
@:enum abstract Ev(Int) from Int to Int {

        /** An `unknown` core event. 
            emit handler arg: _ */
    var unknown         = 0;
        /** A `ready` core event. 
            emit handler arg: _ */
    var ready           = 1;
        /** An `init` core event. 
            emit handler arg: _ */
    var init            = 2;
        /** A `reset` core event. 
            emit handler arg: _ */
    var reset           = 3;
        /** A `tickstart` core event. 
            emit handler arg: _ */
    var tickstart       = 4;
        /** A `tickend` core event. 
            emit handler arg: _ */
    var tickend         = 5;
        /** A `update` core event. 
            emit handler arg: `delta:Float` */
    var update          = 6;
        /** A `fixedupdate` core event. 
            emit handler arg: _ */
    var fixedupdate     = 7;
        /** A `destroy` core event. 
            emit handler arg: _ */
    var destroy         = 8;
        /** A `prerender` core event. 
            emit handler arg: _ */
    var prerender       = 9;
        /** A `render` core event. 
            emit handler arg: _ */
    var render          = 10;
        /** A `postrender` core event. 
            emit handler arg: _ */
    var postrender      = 11;
        /** A `keydown` core event. 
            emit handler arg: `event:KeyEvent` */
    var keydown         = 12;
        /** A `keyup` core event. 
            emit handler arg: `event:KeyEvent` */
    var keyup           = 13;
        /** A `textinput` core event. 
            emit handler arg: `event:TextEvent` */
    var textinput       = 14;
        /** A `inputdown` core event. 
            emit handler arg: `event:InputEvent` */
    var inputdown       = 15;
        /** A `inputup` core event. 
            emit handler arg: `event:InputEvent` */
    var inputup         = 16;
        /** A `mousedown` core event. 
            emit handler arg: `event:MouseEvent` */
    var mousedown       = 17;
        /** A `mouseup` core event. 
            emit handler arg: `event:MouseEvent` */
    var mouseup         = 18;
        /** A `mousemove` core event. 
            emit handler arg: `event:MouseEvent` */
    var mousemove       = 19;
        /** A `mousewheel` core event. 
            emit handler arg: `event:MouseEvent` */
    var mousewheel      = 20;
        /** A `touchdown` core event. 
            emit handler arg: `event:TouchEvent` */
    var touchdown       = 21;
        /** A `touchup` core event. 
            emit handler arg: `event:TouchEvent` */
    var touchup         = 22;
        /** A `touchmove` core event. 
            emit handler arg: `event:TouchEvent` */
    var touchmove       = 23;
        /** A `gamepadaxis` core event. 
            emit handler arg: `event:GamepadEvent` */
    var gamepadaxis     = 24;
        /** A `gamepaddown` core event. 
            emit handler arg: `event:GamepadEvent` */
    var gamepaddown     = 25;
        /** A `gamepadup` core event. 
            emit handler arg: `event:GamepadEvent` */
    var gamepadup       = 26;
        /** A `gamepaddevice` core event. 
            emit handler arg: `event:GamepadEvent` */
    var gamepaddevice   = 27;
        /** A `window` core event. 
            emit handler arg: `event:WindowEvent` */
    var window          = 28;
        /** A `windowmoved` core event. 
            emit handler arg: `event:WindowEvent` */
    var windowmoved     = 29;
        /** A `windowresized` core event. 
            emit handler arg: `event:WindowEvent` */
    var windowresized   = 30;
        /** A `windowsized` core event. 
            emit handler arg: `event:WindowEvent` */
    var windowsized     = 31;
        /** A `windowminimized` core event. 
            emit handler arg: `event:WindowEvent` */
    var windowminimized = 32;
        /** A `windowrestored` core event. 
            emit handler arg: `event:WindowEvent` */
    var windowrestored  = 33;
        /** internal */
        //this is not a typo, it should match
    var last            = 33;

} //Ev

package luxe;

/** A core event enum for the core luxe events.
    Used with `on` and `off` handlers, with strict types to Ev
    :todo: Ev and enum naming */
@:keep
@:enum abstract Ev(Int) from Int to Int {

    var unknown         = 0;
    var ready           = 1;
    var init            = 2;
    var reset           = 3;
    var tickstart       = 4;
    var tickend         = 5;
    var update          = 6;
    var fixedupdate     = 7;
    var destroy         = 8;
    var prerender       = 9;
    var render          = 10;
    var postrender      = 11;
    var keydown         = 12;
    var keyup           = 13;
    var textinput       = 14;
    var inputdown       = 15;
    var inputup         = 16;
    var mousedown       = 17;
    var mouseup         = 18;
    var mousemove       = 19;
    var mousewheel      = 20;
    var touchdown       = 21;
    var touchup         = 22;
    var touchmove       = 23;
    var gamepadaxis     = 24;
    var gamepaddown     = 25;
    var gamepadup       = 26;
    var gamepaddevice   = 27;

    var window          = 28;
    var windowmoved     = 29;
    var windowresized   = 30;
    var windowsized     = 31;
    var windowminimized = 32;
    var windowrestored  = 33;
        //this is not a typo, it should match
    var last            = 33;

} //Ev

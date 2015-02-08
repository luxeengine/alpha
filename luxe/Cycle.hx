package luxe;

@:enum abstract Cycle(Int) from Int to Int {
    var unknown         = 0;
    var ready           = 1;
    var init            = 2;
    var reset           = 3;
    var update          = 4;
    var fixedupdate     = 5;
    var destroy         = 6;
    var prerender       = 7;
    var render          = 8;
    var postrender      = 9;
    var keydown         = 10;
    var keyup           = 11;
    var textinput       = 12;
    var inputdown       = 13;
    var inputup         = 14;
    var mousedown       = 15;
    var mouseup         = 16;
    var mousemove       = 17;
    var mousewheel      = 18;
    var touchdown       = 19;
    var touchup         = 20;
    var touchmove       = 21;
    var gamepadaxis     = 22;
    var gamepaddown     = 23;
    var gamepadup       = 24;
    var gamepaddevice   = 25;

    var window          = 26;
    var windowmoved     = 27;
    var windowresized   = 28;
    var windowsized     = 29;
    var windowminimized = 30;
    var windowrestored  = 31;
}

package luxe;

import luxe.Vector;

@:allow(luxe.Core)
class Screen {

    @:isVar public var w (default,null) : Float;
    @:isVar public var h (default,null) : Float;
    @:isVar public var mid (get,null) : Vector;
    @:isVar public var size (get,null) : Vector;

        /** Access to the mouse cursor, position, visibility, locking etc. */
    public var cursor : Cursor;

    @:noCompletion public var core : Core;

    @:allow(luxe.Core)
    function new( ?_core:Core, _x:Int, _y:Int, _w:Int, _h:Int ) {

        core = _core;
        cursor = new Cursor(this);

        w = _w;
        h = _h;

        mid = new Vector( Math.round(w/2), Math.round(h/2) );
        size = new Vector(w, h);

    } //new

    function toString() {
        return 'luxe.Screen({ w:$w, h:$h })';
    }

//Public API

        /** Returns true if the given point falls within the bounds of the w/h of the screen. */
    public function point_inside( _p:Vector ) {

        if( _p.x < 0 )    return false;
        if( _p.y < 0 )    return false;
        if( _p.x > w )  return false;
        if( _p.y > h )  return false;

        return true;

    } //point_inside

        /** Returns true if the given point as floats fall within the bounds of the w/h of the screen. */
    public function point_inside_xy( _x:Float, _y:Float ) {

        if( _x < 0 )    return false;
        if( _y < 0 )    return false;
        if( _x > w )  return false;
        if( _y > h )  return false;

        return true;

    } //point_inside_xy

//Internal

    var internal = false;
    @:noCompletion function internal_resized(_w:Float, _h:Float) {

        w = _w;
        h = _h;

        internal = true;

            size.x = _w;
            size.y = _h;
            mid.x = _w/2;
            mid.y = _h/2;

        internal = false;

    } //set_size


//getters/setters

    function get_mid() : Vector {

        if(internal) return mid;
        return mid.clone();

    } //get_mid

    function get_size() : Vector {

        if(internal) return size;
        return size.clone();

    } //get_size


} //Screen






class Cursor {

        /** The visibility of the cursor. (get/set) */
    @:isVar public var visible (get,set): Bool = true;
        /** Grabbing the cursor locks it to the window bounds. On web this is analogous to `lock`. (get/set) */
    @:isVar public var grab (get,set): Bool = false;
        /** Locking the cursor hides it, and enables the `xrel`/`yrel`   
            values on the mouse move events. This changes the mouse to   
            allow movement without it stopping at the bounds.   
            On `web`, this must come from a user initiated action, and asks their permission. (get/set) */
    @:isVar public var lock (get,set): Bool = false;
        /** The current mouse position. Setting this has no effect on `web` (and cannot). */
    @:isVar public var pos (get,set): Vector;

        /** The screen this cursor relates to. */
    var screen : Screen;
    var ignore : Bool = false;

    @:allow(luxe.Screen)
    function new( _screen:Screen ) {

        screen = _screen;
        pos = new Vector();

    } //new

    @:allow(luxe.Core)
    function set_internal( _pos:Vector ) {

        ignore = true;
            pos = _pos;
        ignore = false;

    } //set_internal

//getters/setters

    function get_visible() : Bool {

        return visible;

    } //get_visible

    function set_visible( _visible:Bool ) : Bool {

        screen.core.app.windowing.enable_cursor( _visible );

        return visible = _visible;

    } //set_visible

    function get_grab() : Bool {

        return grab;

    } //get_grab

    function get_lock() : Bool {

        return lock;

    } //get_lock

    function set_grab( _grab:Bool ) : Bool {

        screen.core.app.window.grab = _grab;

        return grab = _grab;

    } //set_grab

    function set_lock( _lock:Bool ) : Bool {

        screen.core.app.windowing.enable_cursor_lock(_lock);

        return lock = _lock;

    } //set_lock

    function get_pos() : Vector {

        return pos;

    } //get_pos

    function set_pos( _p:Vector ) : Vector {

        if(pos != null && _p != null && !ignore) {
            screen.core.app.window.set_cursor_position( Std.int(_p.x), Std.int(_p.y) );
        }

        return pos = _p;

    } //set_pos


} //Cursor

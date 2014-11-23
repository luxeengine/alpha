package luxe;

import luxe.Vector;

@:allow(luxe.Core)
class Screen {

    public var x : Float;
    public var y : Float;
    public var w : Float;
    public var h : Float;

    public var cursor : Cursor;
    public var core : Core;

    @:isVar public var mid (get,null) : Vector;
    @:isVar public var size (get,null) : Vector;

    public function new( ?_core:Core, _x:Int, _y:Int, _w:Int, _h:Int ) {

        core = _core;
        cursor = new Cursor(this);

        x = _x;
        y = _y;
        w = _w;
        h = _h;

        mid = new Vector( Math.round(w/2), Math.round(h/2) );
        size = new Vector(w, h);

    } //new

    function toString() {
        return 'luxe.Screen({ x:$x, y:$y, w:$w, h:$h })';
    }


    function get_mid() : Vector {

        return mid.clone();

    } //get_mid

    @:noCompletion function internal_resized(_w:Float, _h:Float) {

        w = _w;
        h = _h;
        size.set_xy(w, h);
        mid.set_xy(w/2, h/2);

    } //set_size

    function get_size() : Vector {

        return size.clone();

    } //get_size

    public function point_inside(_p:Vector) {

        if( _p.x < x )    return false;
        if( _p.y < y )    return false;
        if( _p.x > x+w )  return false;
        if( _p.y > y+h )  return false;

        return true;

    } //point_inside


} //Screen



class Cursor {


    var screen : Screen;

    @:isVar public var visible (get,set): Bool = true;
    @:isVar public var grab (get,set): Bool = false;
    @:isVar public var lock (get,set): Bool = false;
    @:isVar public var pos (get,set): Vector;


    public function new( _screen:Screen ) {

        screen = _screen;
        pos = new Vector();

    } //new


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

        if(pos != null) {
            pos.set_xy( Luxe.mouse.x, Luxe.mouse.y );
        }

        return pos;

    } //get_pos

    function set_pos( _p:Vector ) : Vector {

        if(pos != null) {

            screen.core.app.window.set_cursor_position( Std.int(_p.x), Std.int(_p.y) );

        }

        return pos = _p;

    } //set_pos

} //Cursor

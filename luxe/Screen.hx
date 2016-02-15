package luxe;

import luxe.Rectangle;
import luxe.Vector;


typedef WindowEventType = snow.types.Types.WindowEventType;

/** The data related to the specific window event. */
typedef WindowEventData = {
        /** The x data for the event, if applicable */
    @:optional var x:Int;
        /** The y data for the event, if applicable */
    @:optional var y:Int;

} //WindowEventData


/** A window event */
typedef WindowEvent = snow.types.Types.WindowEvent;



@:allow(luxe.Core)
@:allow(luxe.Cursor)
class Screen {

        /** Convenience: Returns *a new vector*, the middle of the screen, rounded as (w/2, h/2) */
    public var mid (get,null) : Vector;
        /** Convenience: Returns *a new vector*, the size of the screen */
    public var size (get,null) : Vector;
        /** Convenience: Returns *a new rectangle*, the bounds of the screen (0, 0, w, h) */
    public var bounds (get,null) : Rectangle;

        /** Returns the screen width as an Int */
    public var w (get,null) : Int;
        /** Returns the screen height as an Int */
    public var h (get,null) : Int;
        /** Returns the screen device pixel ratio, a scaling factor for high DPI devices.
            Note that Luxe.screen (and the snow framework below it) only deals with real pixels, not device pixels.
            Luxe and snow only ever deal with drawable area in real pixels. Which is to say: If you need device pixels, you divide the real pixel size by this value. */
    public var device_pixel_ratio (get,null) : Float;

        /** Convenience: Returns the screen width as a Float */
    @:isVar public var width (default,null) : Float;
        /** Convenience: Returns the screen height as a Float */
    @:isVar public var height (default,null) : Float;

        /** Access to the mouse cursor, position, visibility, locking etc. */
    public var cursor : Cursor;

    var core : Core;

    @:allow(luxe.Core)
    function new(_core:Core, _w:Int, _h:Int) {

        core = _core;
        cursor = new Cursor(this);

        width = _w;
        height = _h;

    } //new

    function toString() {
        return 'luxe.Screen({ w:$w, h:$h })';
    }

//Public API

        /** Returns true if the given point falls within the bounds of the w/h of the screen. */
    public function point_inside( _p:Vector ) {

        if( _p.x < 0 )  return false;
        if( _p.y < 0 )  return false;
        if( _p.x > width )  return false;
        if( _p.y > height )  return false;

        return true;

    } //point_inside

        /** Returns true if the given point as floats fall within the bounds of the w/h of the screen. */
    public function point_inside_xy( _x:Float, _y:Float ) {

        if( _x < 0 )  return false;
        if( _y < 0 )  return false;
        if( _x > width )  return false;
        if( _y > height )  return false;

        return true;

    } //point_inside_xy

//Internal

    function internal_resized(_w:Float, _h:Float) {

        width = _w;
        height = _h;

    } //set_size

//getters/setters

        //:todo:immutable: create immutable types, that way these can be cached instead of new

    function get_mid() : Vector return new Vector( Math.round(w/2), Math.round(h/2) );
    function get_size() : Vector return new Vector( w, h );
    function get_bounds() : Rectangle return new Rectangle( 0, 0, w, h );
    function get_w() : Int return Std.int(width);
    function get_h() : Int return Std.int(height);
    function get_device_pixel_ratio() return core.app.runtime.window_device_pixel_ratio();

} //Screen






class Cursor {

        /** Locking the cursor hides it, and enables the `xrel`/`yrel`   
            values on the mouse move events. This changes the mouse to   
            allow movement without it stopping at the bounds.   
            On `web`, this must come from a user initiated action, and asks their permission. (get/set) */
    @:isVar public var grab (get,set): Bool = false;
        /** The current mouse position. `read only` */
    @:isVar public var pos (get,null): Vector;

        /** The screen this cursor relates to. */
    var screen : Screen;
    var ignore : Bool = false;

    @:allow(luxe.Screen)
    function new( _screen:Screen ) {

        screen = _screen;
        pos = new Vector();

    } //new

    @:allow(luxe.Core)
    inline function set_internal(_x:Float, _y:Float) {

            //this has to be a new value because if it's cached, 
            //it sends in references that get kept by user code
            //or accidentally modified by .operation calls
            //this is temporary till embers immutable stuff
            //:todo:immutable: Vector types
        ignore = true;

            pos = new luxe.Vector(_x, _y);

        ignore = false;

    } //set_internal

//getters/setters

    function get_grab() : Bool {

        return grab;

    } //get_grab

    function set_grab( _grab:Bool ) : Bool {

        screen.core.app.runtime.window_grab(_grab);

        return grab = _grab;

    } //set_grab

    function get_pos() : Vector {

        return pos;

    } //get_pos

} //Cursor

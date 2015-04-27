package ;

import phoenix.BitmapFont;
import phoenix.geometry.Geometry;
import phoenix.Texture;
import phoenix.Shader;
import phoenix.Batcher;

import luxe.resource.Resource;

import luxe.Rectangle;
import luxe.Vector;
import luxe.Screen;

@:keep
class Luxe {

        /** Direct access to the core engine */
    public static var core      : luxe.Core;
        /** Access to the core debug features */
    public static var debug     : luxe.Debug;
        /** Access to the io features */
    public static var io        : luxe.IO;
        /** Access to the drawing features */
    public static var draw      : luxe.Draw;
        /** Access to the audio features */
    public static var audio     : luxe.Audio;
        /** Access to the timing features */
    public static var timer     : luxe.Timer;
        /** Access to the global event system */
    public static var events    : luxe.Events;
        /** Access to the input features */
    public static var input     : luxe.Input;
        /** Access to the default luxe scene */
    public static var scene     : luxe.Scene;
        /** Access to the different utilities */
    public static var utils     : luxe.utils.Utils;
        /** Access to the physics bindings, if any */
    public static var physics   : luxe.Physics;
        /** Access to the default camera */
    public static var camera    : luxe.Camera;
        /** Access to the default resource manager  */
    public static var resources : luxe.Resources;
        /** Access to the rendering system */
    public static var renderer  : phoenix.Renderer;

        /** Direct access to the underlying snow app API, note that `core:luxe.Core` is a snow app in itself. */
    public static var snow(get, never) : snow.Snow;
        /** The current time in seconds, highest precision from the platform. */
    public static var time(get, never) : Float;
        /** Access to information about the game window (sizes, cursor etc) */
    public static var screen(get, never) : Screen;
        /** The version of the engine  */
    public static var version : String = 'dev';
        /** The version + build meta information, generated at compile time from a macro (luxe.BuildVersion) */
    public static var build : String = luxe.macros.BuildVersion.latest();

//Timing information proxy to the snow App timing

        /** the scale of time */
    public static var timescale (get,set) : Float;
        /** if this is non zero this will be passed in */
    public static var fixed_delta (get,set) : Float;
        /** if this is non zero, updates will be forced to this rate */
    public static var update_rate (get,set) : Float;
        /** the maximum frame time */
    public static var max_frame_time (get,set) : Float;

//Timing information

        /** the time the last frame took to run */
    public static var dt (get,set) : Float;
        /** the simulated time the last frame took to run, relative to scale etc */
    public static var delta_sim (get,set) : Float;
        /** the start time of the last frame */
    public static var last_frame_start (get,set) : Float;
        /** the current simulation time */
    public static var current_time (get,set) : Float;
        /** the start time of this frame */
    public static var cur_frame_start (get,set) : Float;
        /** the alpha time for a render between frame updates */
    public static var alpha (get,set) : Float;

        /** listen for core events */
    public static function on<T>(event:Ev, handler:T->Void ) {
        core.emitter.on(event, handler);
    }

        /** stop listening for core events */
    public static function off<T>(event:Ev, handler:T->Void ) {
        return core.emitter.off(event, handler);
    }

        /** shutdown the engine and quit */
    public static function shutdown() {

        core.shutdown();

    } //shutdown

        /** show/hide the debug console programmatically */
    public static function showConsole(_show:Bool) {

        core.show_console( _show );

    } //showConsole

//Internal

        /** the snow app instance */
    static inline function get_snow() : snow.Snow return core.app;
        /** the screen instance */
    static inline function get_screen() : luxe.Screen return core.screen;
        /** the current time */
    static inline function get_time() : Float return core.app.time;
        /** the scale of time */
    static inline function get_timescale() : Float return core.timescale;
        /** if this is non zero this will be passed in */
    static inline function get_fixed_delta() : Float return core.fixed_delta;
        /** if this is non zero, updates will be forced to this rate */
    static inline function get_update_rate() : Float return core.update_rate;
        /** the maximum frame time */
    static inline function get_max_frame_time() : Float return core.max_frame_time;
        /** the time the last frame took to run */
    static inline function get_dt() : Float return core.delta_time;
        /** the simulated time the last frame took to run, relative to scale etc */
    static inline function get_delta_sim() : Float return core.delta_sim;
        /** the start time of the last frame */
    static inline function get_last_frame_start() : Float return core.last_frame_start;
        /** the current simulation time */
    static inline function get_current_time() : Float return core.current_time;
        /** the start time of this frame */
    static inline function get_cur_frame_start() : Float return core.cur_frame_start;
        /** the alpha time for a render between frame updates */
    static inline function get_alpha() : Float return core.alpha;

        /** the scale of time */
    static inline function set_timescale( value:Float ) : Float return core.timescale = value;
        /** if this is non zero this will be passed in */
    static inline function set_fixed_delta( value:Float ) : Float return core.fixed_delta = value;
        /** if this is non zero, updates will be forced to this rate */
    static inline function set_update_rate( value:Float ) : Float return core.update_rate = value;
        /** the maximum frame time */
    static inline function set_max_frame_time( value:Float ) : Float return core.max_frame_time = value;
        /** the time the last frame took to run */
    static inline function set_dt( value:Float ) : Float return core.delta_time = value;
        /** the simulated time the last frame took to run, relative to scale etc */
    static inline function set_delta_sim( value:Float ) : Float return core.delta_sim = value;
        /** the start time of the last frame */
    static inline function set_last_frame_start( value:Float ) : Float return core.last_frame_start = value;
        /** the current simulation time */
    static inline function set_current_time( value:Float ) : Float return core.current_time = value;
        /** the start time of this frame */
    static inline function set_cur_frame_start( value:Float ) : Float return core.cur_frame_start = value;
        /** the alpha time for a render between frame updates */
    static inline function set_alpha( value:Float ) : Float return core.alpha = value;



} //Luxe




/** A core event enum for the core luxe events.
    Used with `on` and `off` handlers, with strict types to Ev */
@:keep
@:enum abstract Ev(Int) from Int to Int {

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
        //this is not a typo, it should match
    var last            = 31;

} //Ev

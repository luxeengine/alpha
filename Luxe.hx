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
import snow.Snow;

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


//Update frame information

        /** the time the last frame took to run, `read only` */
    public static var dt (get,never) : Float;
        /** the start time of this frame, `read only` */
    public static var frame_start (get,never) : Float;
        /** the start time of the last frame, `read only` */
    public static var frame_start_prev (get,never) : Float;
       /** the maximum frame time, `read/write` */
    public static var frame_max_delta (get,set) : Float;
        /** if this is non zero, updates will be forced to this rate. `read/write` */
    public static var update_rate (get,set) : Float;

//Tick information

        /** The time at the start of this tick */
    public static var tick_start (get, never) : Float;
        /** The time at the start of the previous tick */
    public static var tick_start_prev (get, never) : Float;
        /** The amount of time the last tick took */
    public static var tick_delta (get, never) : Float;

//Simulated (i.e timescaled) time

        /** the scale of time, `read/write` */
    public static var timescale (get,set) : Float;
        /** the current simulation time, `read only` */
    public static var sim_time (get,never) : Float;
        /** the simulated time the last frame took to run, relative to scale, `read only` */
    public static var sim_delta (get,never) : Float;
        /** if this is non zero this will be passed in as delta time, `read/write` */
    public static var fixed_delta (get,set) : Float;
    
//Fixed time step options

        /** set to try, to use a "fix your timestep approach", `read/write` */
    public static var fixed_timestep (get,set) : Bool;
        /** the alpha time for a render between frame updates, `read only` */
    public static var fixed_alpha (get,never) : Float;
        /** fixed simulation update rate, `read/write` */
    public static var fixed_frame_time (get,set) : Float;

        /** listen for core events */
    public static function on<T>(event:Ev, handler:T->Void ) : Void {
        core.emitter.on(event, handler);
    }

        /** stop listening for core events */
    public static function off<T>(event:Ev, handler:T->Void ) : Bool {
        return core.emitter.off(event, handler);
    }

        /** Call a function at the start of the next frame */
    public static inline function next( func: Void->Void ) : Void {

        Snow.next(func);

    } //next

        /** shutdown the engine and quit */
    public static inline function shutdown() : Void {

        core.shutdown();

    } //shutdown

        /** show/hide the debug console programmatically */
    public static inline function showConsole(_show:Bool) : Void {

        core.show_console( _show );

    } //showConsole

//Internal

    static inline function get_snow()                       return core.app;
    static inline function get_screen()                     return core.screen;
    static inline function get_time()                       return core.app.time;
 
    static inline function get_dt()                         return core.frame_delta;
    static inline function get_frame_start()                return core.frame_start;
    static inline function get_frame_start_prev()           return core.frame_start_prev;
    static inline function get_frame_max_delta()            return core.frame_max_delta;
    static inline function get_update_rate()                return core.update_rate;
    static inline function get_tick_start()                 return core.tick_start;
    static inline function get_tick_start_prev()            return core.tick_start_prev;
    static inline function get_tick_delta()                 return core.tick_delta;
    static inline function get_timescale()                  return core.timescale;
    static inline function get_sim_time()                   return core.sim_time;
    static inline function get_sim_delta()                  return core.sim_delta;
    static inline function get_fixed_delta()                return core.fixed_delta;
    static inline function get_fixed_timestep()             return core.fixed_timestep;
    static inline function get_fixed_alpha()                return core.fixed_alpha;
    static inline function get_fixed_frame_time()           return core.fixed_frame_time;

    static inline function set_timescale(_val:Float)        return core.timescale = _val;
    static inline function set_fixed_delta(_val:Float)      return core.fixed_delta = _val;
    static inline function set_update_rate(_val:Float)      return core.update_rate = _val;
    static inline function set_fixed_timestep(_val:Bool)    return core.fixed_timestep = _val;
    static inline function set_frame_max_delta(_val:Float)  return core.frame_max_delta = _val;
    static inline function set_fixed_frame_time(_val:Float) return core.fixed_frame_time = _val;

} //Luxe




/** A core event enum for the core luxe events.
    Used with `on` and `off` handlers, with strict types to Ev */
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

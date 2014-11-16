package ;

import snow.utils.ByteArray;
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

        /** The last known mouse position */
    public static var mouse     : Vector;

        /** Direct access to the core engine */
    public static var core      : luxe.Core;
        /** Access to the core debug features */
    public static var debug     : luxe.Debug;
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
    public static var resources : luxe.resource.ResourceManager;
        /** Access to the rendering system */
    public static var renderer  : phoenix.Renderer;

        /** The current time in seconds, highest precision from the platform. */
    @:isVar public static var time(get, never) : Float;
        /** Access to information about the game window (sizes, cursor etc) */
    @:isVar public static var screen(get, never) : Screen;
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
    public static function on<T>(event:String, handler:T->Void ) {
        core.emitter.on(event, handler);
    }

        /** stop listening for core events */
    public static function off<T>(event:String, handler:T->Void ) {
        return core.emitter.off(event, handler);
    }

    static function get_screen() {

        return core.screen;

    } //get_screen

    static function get_time() : Float {

        return core.app.time;

    } //get_time

        /** shutdown the engine and quit */
    public static function shutdown() {

        core.shutdown();

    } //shutdown

        /** show/hide the debug console programmatically */
    public static function showConsole(_show:Bool) {

        core.show_console( _show );

    } //showConsole

        /** Load a text resource */
    public static function loadJSON( _id:String, ?_onload:JSONResource->Void, ?_async:Bool=false ) : JSONResource {

        var res = new JSONResource( _id, null, Luxe.resources );

        core.app.assets.text(_id, {
            async:_async,
            onload : function( _asset:snow.assets.AssetText) {

                res.json = luxe.utils.JSON.parse(_asset.text);

                if(_onload != null) {
                    _onload( res );
                } //_onload

                Luxe.resources.cache(res);

            } //onload
        }); //app.assets.text

        return res;

    } //loadJSON

    public static function loadText( _id:String, ?_onload:TextResource->Void, ?_async:Bool=false ) : TextResource {

        var res = new TextResource( _id, null, Luxe.resources );

        core.app.assets.text(_id, {
            async:_async,
            onload : function( _asset:snow.assets.AssetText) {

                res.text = _asset.text;

                if(_onload != null) {
                    _onload( res );
                } //_onload

                Luxe.resources.cache(res);

            } //onload
        }); //app.assets.text

        return res;

    } //loadText

        /** Load a bytes/data resource */
    public static function loadData( _id:String, ?_onload:DataResource->Void, ?_async:Bool=false ) : DataResource {

        var res = new DataResource( _id, null, Luxe.resources);

        core.app.assets.bytes(_id, {
            async: _async,
            onload: function( _asset:snow.assets.AssetBytes ) {

                res.data = _asset.bytes;

                if(_onload != null) {
                    _onload( res );
                }

                Luxe.resources.cache(res);

            } //onload
        }); //app.assets.bytes

        return res;

    } //loadData

        /** Load a sound resource */
    public static function loadSound( _name:String, _id:String, ?_is_music:Bool = false, ?_onload:SoundResource->Void ) : SoundResource {

        var existing = Luxe.resources.find_sound(_id);
        if(existing != null) {

            luxe.Log.log('sound at ${_id} was already a registered resource, returning existing instance');

            if(_onload != null) {
                _onload( existing );
            } //_onload

            return existing;
        }

        Luxe.audio.create( _id, _name, _is_music );

        var res = new SoundResource( _id, _name, Luxe.resources );

            if(_onload != null) {
                _onload( res );
            } //_onload

        Luxe.resources.cache(res);

        return res;

    } //loadData

        /** Load a texture/image resource */
    public static function loadTexture( _id:String, ?_onload:Texture->Void, ?_silent:Bool=false ) : Texture {

        return Texture.load( _id, _onload, _silent );

    } //loadTexture

        /** Load multiple texture/image resources, useful for preloading */
    public static function loadTextures( _ids:Array<String>, ?_onload:Array<Texture>->Void, ?_silent:Bool=false ) : Void {

        var total_count : Int = _ids.length;
        var loaded_count : Int = 0;
        var loaded : Array<Texture> = [];

        var on_single_texture_complete = function( texture:Texture ) {

            loaded.push( texture );
            loaded_count++;

            if(loaded_count == total_count) {
                _onload(loaded);
            }

        }

        for(_id in _ids) {
            loadTexture( _id, on_single_texture_complete, _silent );
        }

    } //loadTextures

        /** Load a font resource */
    public static function loadFont( _id:String, ?_path:String, ?_onload : BitmapFont->Void ) : BitmapFont {

        return BitmapFont.load({ id:_id, path:_path, onload:_onload });

    } //loadFont

        /** Load a shader resource */
    public static function loadShader( ?_ps_id:String='default', ?_vs_id:String='default', ?_onload:Shader->Void ) : Shader {

        return Shader.load(_ps_id, _vs_id, _onload);

    } //loadShader

//Utility features

        /** Open the system default browser with the given URL */
    public static function openURL( _url:String ) {

        core.app.io.url_open( _url );

    } //openURL

//Internal

        /** the scale of time */
    static inline function get_timescale() : Float {
        return core.timescale;
    }
        /** if this is non zero this will be passed in */
    static inline function get_fixed_delta() : Float {
        return core.fixed_delta;
    }
        /** if this is non zero, updates will be forced to this rate */
    static inline function get_update_rate() : Float {
        return core.update_rate;
    }
        /** the maximum frame time */
    static inline function get_max_frame_time() : Float {
        return core.max_frame_time;
    }
        /** the time the last frame took to run */
    static inline function get_dt() : Float {
        return core.delta_time;
    }
        /** the simulated time the last frame took to run, relative to scale etc */
    static inline function get_delta_sim() : Float {
        return core.delta_sim;
    }
        /** the start time of the last frame */
    static inline function get_last_frame_start() : Float {
        return core.last_frame_start;
    }
        /** the current simulation time */
    static inline function get_current_time() : Float {
        return core.current_time;
    }
        /** the start time of this frame */
    static inline function get_cur_frame_start() : Float {
        return core.cur_frame_start;
    }
        /** the alpha time for a render between frame updates */
    static inline function get_alpha() : Float {
        return core.alpha;
    }


        /** the scale of time */
    static inline function set_timescale( value:Float ) : Float {
        return core.timescale = value;
    }
        /** if this is non zero this will be passed in */
    static inline function set_fixed_delta( value:Float ) : Float {
        return core.fixed_delta = value;
    }
        /** if this is non zero, updates will be forced to this rate */
    static inline function set_update_rate( value:Float ) : Float {
        return core.update_rate = value;
    }
        /** the maximum frame time */
    static inline function set_max_frame_time( value:Float ) : Float {
        return core.max_frame_time = value;
    }
        /** the time the last frame took to run */
    static inline function set_dt( value:Float ) : Float {
        return core.delta_time = value;
    }
        /** the simulated time the last frame took to run, relative to scale etc */
    static inline function set_delta_sim( value:Float ) : Float {
        return core.delta_sim = value;
    }
        /** the start time of the last frame */
    static inline function set_last_frame_start( value:Float ) : Float {
        return core.last_frame_start = value;
    }
        /** the current simulation time */
    static inline function set_current_time( value:Float ) : Float {
        return core.current_time = value;
    }
        /** the start time of this frame */
    static inline function set_cur_frame_start( value:Float ) : Float {
        return core.cur_frame_start = value;
    }
        /** the alpha time for a render between frame updates */
    static inline function set_alpha( value:Float ) : Float {
        return core.alpha = value;
    }



} //Luxe

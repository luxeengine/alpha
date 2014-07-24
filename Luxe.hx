package ;

import snow.utils.ByteArray;
import phoenix.BitmapFont;
import phoenix.geometry.Geometry;
import phoenix.Texture;
import phoenix.Shader;
import phoenix.Batcher;

import luxe.Resource.DataResource;
import luxe.Resource.JSONResource;
import luxe.Resource.TextResource;
import luxe.Resource.SoundResource;

import luxe.Rectangle;
import luxe.Vector;
import luxe.Screen;


class Luxe {

        /** The last known mouse position */
    public static var mouse             : Vector;

        /** The time the last frame took to run */
    public static var dt        : Float;
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
    public static var resources : luxe.ResourceManager;
        /** Access to the rendering system */
    public static var renderer  : phoenix.Renderer;

        /** The current time in seconds, highest precision from the platform */
    @:isVar public static var time(get, never) : Float;
        /** Access to information about the game window (sizes, cursor etc) */
    @:isVar public static var screen(get, never) : Screen;
        /** The version of the engine  */
    public static var version : String = 'dev';
        /** The version + build meta information, generated at compile time from a macro (luxe.BuildVersion) */
    public static var build : String = luxe.BuildVersion.latest();


    static function get_screen() {

        return core.screen;

    } //get_screen

    static function get_time() : Float {


        return core.app.time;

    } //get_time

        /** shutdown the engine and quit */
    public static function shutdown() {

        core.app.shutdown();

    } //shutdown

        /** show/hide the debug console programmatically */
    public static function showConsole(_show:Bool) {

        core.show_console( _show );

    } //showConsole

        /** Load a text resource */
    public static function loadJSON( _id:String, ?_onloaded:JSONResource->Void ) : JSONResource {

        var raw = core.app.assets.text(_id).text;
        var json = luxe.utils.JSON.parse(raw);
        var res = new JSONResource( _id, json, Luxe.resources );

            if(_onloaded != null) {
                _onloaded( res );
            } //_onloaded

        return res;

    } //loadJSON

    public static function loadText( _id:String, ?_onloaded:TextResource->Void ) : TextResource {

        var string = core.app.assets.text(_id).text;
        var res = new TextResource( _id, string, Luxe.resources );

            if(_onloaded != null) {
                _onloaded( res );
            } //_onloaded

        return res;

    } //loadText

        /** Load a bytes/data resource */
    public static function loadData( _id:String, ?_onloaded:DataResource->Void ) : DataResource {

        var bytes = core.app.assets.bytes(_id).bytes;
        var res = new DataResource( _id, bytes, Luxe.resources);

            if(_onloaded != null) {
                _onloaded( res );
            } //_onloaded

        return res;

    } //loadData

        /** Load a sound resource */
    public static function loadSound( _name:String, _id:String, ?_is_music:Bool = false, ?_onloaded:SoundResource->Void ) : SoundResource {

        // Luxe.audio.create( _name, _id, _is_music );

        // var res = new SoundResource( _name, _id, Luxe.resources );

        //     if(_onloaded != null) {
        //         _onloaded( res );
        //     } //_onloaded

        // return res;
        return null;

    } //loadData

        /** Load a texture/image resource */
    public static function loadTexture( _id:String, ?_onloaded:Texture->Void, ?_silent:Bool=false ) : Texture {

        return Texture.load( _id, _onloaded, _silent );

    } //loadTexture

        /** Load multiple texture/image resources, useful for preloading */
    public static function loadTextures( _ids:Array<String>, ?_onloaded:Array<Texture>->Void, ?_silent:Bool=false ) : Void {

        renderer.load_textures( _ids, _onloaded, _silent );

    } //loadTextures

        /** Load a font resource */
    public static function loadFont( _id:String, ?_path:String, ?_onloaded : BitmapFont->Void ) : BitmapFont {

        return BitmapFont.load(_id, _path, _onloaded);

    } //loadFont

        /** Load a shader resource */
    public static function loadShader( ?_ps_id:String='default', ?_vs_id:String='default', ?_onloaded:Shader->Void ) : Shader {

        return Shader.load(_ps_id, _vs_id, _onloaded);

    } //loadShader

//Utility features

        /** Open the system browser with the given URL */
    public static function openURL( _url:String ) {

        // core.lime.window.openURL( _url );

    } //openURL

        /** Open the system folder dialog picker */
    public static function fileDialogFolder(_title:String, _text:String) : String {

        // return core.lime.window.fileDialogFolder(_title,_text);
        return '';

    } //fileDialogFolder

        /** Open the system file open dialog picker */
    public static function fileDialogOpen(_title:String, _text:String) : String {

        // return core.lime.window.fileDialogOpen(_title,_text);
        return '';

    } //fileDialogOpen

        /** Open the system file save dialog picker */
    public static function fileDialogSave(_title:String, _text:String) : String {

        // return core.lime.window.fileDialogSave(_title,_text);
        return '';

    } //fileDialogSave


} //Luxe

package luxe;

import luxe.Core;

@:allow(luxe.Core)
class IO {

    public var core : Core;

    function new( _core:Core ) {
        core = _core;
    } //new

//Path specifics
#if luxe_native
    public var app_path (get,never) : String;
    public var app_path_prefs (get,never) : String;
#end

//Utility features

        /** Open the system default browser with the given URL.
            supported: mac/window/linux/iOS/web
            pending: android https://github.com/underscorediscovery/snow/issues/25 */
    public inline function url_open( _url:String ) {

        core.app.io.url_open( _url );

    } //url_open

        /** Save a string value by key, with an optional slot.
            Works on all targets as a simple save/load mechanism.
            Data saved is plain text but obscured with basic encoding.
            Any further obfuscation can be done on the value prior to saving.
            Returns false if the save failed, errors being logged. */
    public inline function string_save( _key:String, _value:String, _slot:Int = 0 ) : Bool {

        return core.app.io.string_save(_key, _value, _slot);

    } //string_save

        /** Load a string value by key, with an optional slot.
            Works on all targets as a simple save/load mechanism.
            Returns the string or null if the key was invalid, or the slot was not found. */
    public inline function string_load( _key:String, _slot:Int = 0 ) : String {

        return core.app.io.string_load(_key, _slot);

    } //string_load

//Internal

#if luxe_native

    function get_app_path() {

        return core.app.io.module.app_path();

    } //get_app_path

    function get_app_path_prefs() {

        return core.app.io.module.app_path_prefs();

    } //get_app_path

#end

    function init() {

    } //init

} //IO

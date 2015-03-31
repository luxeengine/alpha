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
    public function url_open( _url:String ) {

        core.app.io.url_open( _url );

    } //url_open

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

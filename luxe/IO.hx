package luxe;

import luxe.Core;

class IO {

    public var core : Core;

    @:allow(luxe.Core)
    function new( _core:Core ) {
        core = _core;
    } //new

//Path specifics

    public var app_path (get,never) : String;
    public var app_path_prefs (get,never) : String;

//Utility features

        /** Open the system default browser with the given URL.
            supported: mac/window/linux/iOS/web
            pending: android https://github.com/underscorediscovery/snow/issues/25 */
    public function url_open( _url:String ) {

        core.app.io.url_open( _url );

    } //url_open

//Internal

    function get_app_path() {

        return core.app.io.app_path();

    } //get_app_path

    function get_app_path_prefs() {

        return core.app.io.app_path_prefs();

    } //get_app_path

    @:allow(luxe.Core)
    function init() {

    } //init

} //IO

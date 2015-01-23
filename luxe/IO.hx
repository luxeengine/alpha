package luxe;

import luxe.Core;

class IO {

    public var core : Core;

    @:allow(luxe.Core)
    function new( _core:Core ) {
        core = _core;
    } //new

//Utility features

        /** Open the system default browser with the given URL.
            supported: mac/window/linux/iOS/web
            pending: android https://github.com/underscorediscovery/snow/issues/25 */
    public function url_open( _url:String ) {

        core.app.io.url_open( _url );

    } //url_open

//Internal

    @:allow(luxe.Core)
    function init() {

    } //init

} //IO

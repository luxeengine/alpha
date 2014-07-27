import {{project.app.main}};

import luxe.Core;
import snow.Snow;
import snow.types.Types;

class LuxeApp {

    public static var _game : {{project.app.main}};
    public static var _core : Core;
    public static var _snow : Snow;

    public static function main () {

            //Create the runtime
        _snow = new Snow();
            //Create the app class, give it to the bootstrapper
        _game = new {{project.app.main}}();
            //Create the core luxe runtime
        _core = new Core( _game );

            //Create the main config
        var _config : SnowConfig = {

            host            : _core,
            run_loop        : true

        };

            //Start up, but give the host as the luxe core
        _snow.init( _config );

    } //main

} //LuxeApp
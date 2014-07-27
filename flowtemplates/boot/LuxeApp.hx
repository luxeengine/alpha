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

        var _snow_config : SnowConfig = {
            config_custom_assets : {{toString snow.config.custom_assets}},
            config_custom_runtime : {{toString snow.config.custom_runtime}},
            config_runtime_path : '{{toString snow.config.runtime_path}}',
            config_assets_path : '{{toString snow.config.assets_path}}'
        };

            //Start up, giving luxe as the host
        _snow.init( _snow_config, _core );

    } //main

} //LuxeApp
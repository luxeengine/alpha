import {{project.app.main}};

import luxe.Core;
import luxe.AppConfig;

import snow.Snow;
import snow.types.Types;

class LuxeApp {

    public static var _game : {{project.app.main}};
    public static var _core : Core;
    public static var _snow : Snow;
    public static var _conf : AppConfig;

    public static function main () {

        //Start with sane defaults

        _conf = {
            window: {
                width: 960,
                height: 640,
                fullscreen: false,
                resizable: true,
                borderless: false,
                title: 'luxe app'
            }
        } //_conf

        {{#luxe}}
        //Apply the values if they are set
          {{~#window}}
            {{#width~}} _conf.window.width = {{.}}; {{~/width}}
            {{#height~}} _conf.window.height = {{.}}; {{~/height}}
            {{#if (not_undefined fullscreen)~}} _conf.window.fullscreen = {{toString fullscreen}}; {{~/if}}
            {{#if (not_undefined resizable)~}} _conf.window.resizable = {{toString resizable}}; {{~/if}}
            {{#if (not_undefined borderless)~}} _conf.window.borderless = {{toString borderless}}; {{~/if}}
            {{#title~}} _conf.window.title = '{{toString .}}'; {{~/title}}
          {{~/window~}}
        {{/luxe}}

            //Create the runtime
        _snow = new Snow();
            //Create the app class, give it to the bootstrapper
        _game = new {{project.app.main}}();
            //Create the core luxe runtime
        _core = new Core( _game, _conf );

        var _snow_config : SnowConfig = {
            has_loop : {{toString snow.config.has_loop}},
            config_custom_assets : {{toString snow.config.custom_assets}},
            config_custom_runtime : {{toString snow.config.custom_runtime}},
            config_runtime_path : '{{toString snow.config.runtime_path}}',
            config_assets_path : '{{toString snow.config.assets_path}}'
        };

            //Start up, giving luxe as the host
        _snow.init( _snow_config, _core );

    } //main

} //LuxeApp
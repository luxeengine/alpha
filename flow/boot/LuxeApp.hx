import {{project.app.main}};

import luxe.Core;
import luxe.AppConfig;

import snow.Snow;
import snow.types.Types;

class LuxeApp {

    public static var _game : {{project.app.main}};
    public static var _snow : Snow;
    public static var _conf : luxe.AppConfig;

    public static function main () {

        //Start with sane defaults

        _conf = {
            headless: false,
            window: {
                width: 960,
                height: 640,
                fullscreen: false,
                resizable: true,
                borderless: false,
                title: 'luxe app'
            }
        } //_conf

        #if mobile
            _conf.window.fullscreen = true;
            _conf.window.borderless = true;
        #end //mobile

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

            //Create the app class, give it to the bootstrapper
        _game = new {{project.app.main}}();
            //Create the snow + luxe runtime
        _snow = new Snow(new Core(_game, _conf));

    } //main

} //LuxeApp
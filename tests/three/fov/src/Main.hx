package;

import luxe.Input;
import phoenix.Camera;

class Main extends luxe.Game {

     override function config(config:luxe.AppConfig) {

        config.render.depth = 24;

        return config;

    } //config

    override function ready() {

        Luxe.camera.view.set_perspective( {
           near:0.1,
           far:1000,
           fov_type:FOVType.vertical,
           fov:60,
           aspect:Luxe.screen.w / Luxe.screen.h
        });

        Luxe.camera.pos.z = 2;
        Luxe.draw.rectangle( {
            x:0,
            y:0,
            w:1,
            h:1
        });


    } //ready

    override public function onkeyup(event:KeyEvent) {

        if(event.keycode == Key.escape) {
            Luxe.shutdown();
        }

        if (event.keycode == Key.space) {

            Luxe.camera.view.fov_type = switch(Luxe.camera.view.fov_type) {
                case horizontal: Luxe.camera.view.fov_type = vertical;
                case vertical: Luxe.camera.view.fov_type = horizontal;
            }

        }

        if (event.keycode == Key.up) {
            Luxe.camera.view.fov += 10;
        }

        else if (event.keycode == Key.down) {
            Luxe.camera.view.fov -= 10;

        }

    } //onkeydown

} //Main

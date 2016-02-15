
import luxe.Input;
import luxe.Entity;

import luxe.components.render.MeshComponent;
import luxe.Vector;

class Main extends luxe.Game {


    var tower:Entity;

     override function config(config:luxe.AppConfig) {

        config.preload.textures.push({ id:'assets/tower.jpg' });
        config.preload.texts.push({ id:'assets/tower.obj' });

        config.render.depth = 24;

        return config;

    } //config

    override function ready() {

        Luxe.camera.view.set_perspective({
            far:1000, near:0.1, aspect:Luxe.screen.w/Luxe.screen.h
        });

            //move up and back a bit
        Luxe.camera.pos.set_xyz(0,0.5,2);

            //create an empty entity
        tower = new Entity({ name:'tower' });

            //attach a mesh component
        var mesh = new MeshComponent({
            file : 'assets/tower.obj',
            texture : Luxe.resources.texture('assets/tower.jpg')
        });

        tower.add(mesh);

    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    var y : Float = 0.0;

    override function update(dt:Float) {

        y += 90 * dt;
        tower.rotation.setFromEuler(new Vector(0,y,0).radians());

    } //update


} //Main

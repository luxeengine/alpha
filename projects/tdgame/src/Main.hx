
import luxe.Color;
import luxe.components.cameras.FlyCamera;

import luxe.Entity;
import luxe.Mesh;
import luxe.Rectangle;
import luxe.Vector;
import luxe.Input;
import luxe.Camera;

import phoenix.Batcher;
import luxe.utils.Maths;

    //Game specifics
import TDCamera;
import Level;

class Main extends luxe.Game {

    public var game_camera : Camera;

    public var hud_view : Batcher;
    public var hud_camera : Camera;

    var level : Level;

    public function ready() {

            //Create the camera, low FOV for ortho-like perspective 
        game_camera = new Camera({ name:'game_camera' });
        game_camera.view = new phoenix.Camera({
            projection: ProjectionType.perspective,
            fov:30, 
            near:0.1, far:1000,
            aspect:Luxe.screen.w/Luxe.screen.h
        });

            //Move it up and backward, so we can see the level
        game_camera.pos = new Vector(0,22,13);
            //Face downward a bit
        game_camera.view.rotation.setFromEuler(new Vector(Maths.degToRad(-60),0,0));

            //Set the default renderer to use this camera
        Luxe.renderer.default_batcher.view = game_camera.view;

            //Now create a new camera to handle the HUD/2D elements
        hud_camera = new luxe.Camera({name:'hudview'});
            //And a renderer to handle the geometry for us
        hud_view = new Batcher(Luxe.renderer, 'hud_view');
            //Make it use our new camera
        hud_view.view = hud_camera.view;
            //Set it to render after the default (layer 1)
        hud_view.layer = 2;
            //And make sure the renderer manages it for us
        Luxe.renderer.add_batch(hud_view);

            //Now, we can create our level
        var _level = Luxe.scene.create(Entity, 'level');
            level = _level.add(Level, 'level');
            level.game = this;

            //And we can attach our TDCamera component to the game camera
        var td_cam = game_camera.add(TDCamera, 'TDCamera');
            td_cam.camera = game_camera;

            //And add it to the scene
        Luxe.scene.add(game_camera);

            //Draw an axis for debug
        // Luxe.draw.axis3D();

    } //ready

    public function onkeydown( e:KeyEvent ) {
        
    }

    public function onkeyup( e:KeyEvent ) {
        
        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    public function update(dt:Float) {

        

    } //update

} //Main



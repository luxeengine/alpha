
import luxe.Rectangle;
import luxe.Vector;
import luxe.Input;
import luxe.Sprite;
import luxe.Color;

import phoenix.Batcher;
import phoenix.Camera;
import phoenix.Texture;
import phoenix.RenderTexture;

class Main extends luxe.Game {


    var target_texture : RenderTexture;
    var batcher : Batcher;
    var camera : Camera;
    var example : Sprite;
    var display_sprite : Sprite;


        //In this test, we render the 'example' sprite into a render texture,
        //and then display that texture on 'display_sprite'.

    override function ready() {

        var _get = Luxe.resources.load_texture('assets/image.jpg');

        _get.then(onloaded);

    } //ready

    function onloaded(image:Texture) {

            //create a render target of a fixed size
        target_texture = new RenderTexture({ id:'rtt', width:512, height:512 });

            //create a new batcher to draw from, but don't add to the main rendering
        batcher = Batcher.create({ name:'target_batcher' });
            //The batcher camera should match the size of the texture if we want it to look right for this example
        batcher.view.viewport = new Rectangle(0,0,512,512);

            //Create a sprite, and add it to our custom batcher here instead.
        example = new Sprite({
            texture : image,
            pos : new Vector(256,256),
            batcher : batcher
        });

            //using onload like this lets you work with web late loading textures,
            //on desktop it will always call this, so it will work across all targets
        display_sprite = new Sprite({
            texture : target_texture,
            size : new Vector(512,512),
            pos : Luxe.screen.mid
        });

            //listen for the start and end of the batcher
        batcher.on(prerender, before);
        batcher.on(postrender, after);

    } //onloaded

    function before(_) {

            //Set the rendering target to the texture
        Luxe.renderer.target = target_texture;
                //clear the texture to an obvious color
        Luxe.renderer.clear(new Color().rgb(0xff4b03));

    } //before

    function after(_) {

            //reset the target back to no target (i.e the screen)
        Luxe.renderer.target = null;

    } //after

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update( dt:Float ) {

        if(example != null) {

                //we can rotate the example sprite,
                // it would be "inside" the texture rotating
            example.rotation_z += 40 * dt;

        }

    } //update

} //Main

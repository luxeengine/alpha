
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


        //In this test, we render 'example' into a render texture,
        //and then display that texture on 'display'.

    override function ready() {

        var _get = Luxe.resources.load_texture('assets/image.jpg');

        _get.then(onloaded);

    } //ready

    function onloaded(image:Texture) {

            //create a render target of a fixed size
        target_texture = new RenderTexture({ id:'rtt', width:512, height:512 });

            //create a new batcher to draw from, but don't add to the main rendering
        batcher = Luxe.renderer.create_batcher({
            name:'target_batcher',
            no_add : true
        });

            //camera should match the size of the texture if we want it to look right for this example
        batcher.view.viewport = new Rectangle(0,0,512,512);

            //Create a sprite, but don't add it to the default batcher,
            //add it to our custom batcher here instead.
        example = new Sprite({
            texture : image,
            pos : new Vector(256,256),
            size : new Vector(512,512),
            batcher : batcher
        });

            //enable this if you want to see how the above is rendering "outside" of the target.
            //we set it to false above because we want to call batch.draw() ourselves.
            //by adding to the renderer, it will also render it as well.
        // Luxe.renderer.add_batch(batcher);

            //using onload like this lets you work with web late loading textures,
            //on desktop it will always call this, so it will work across all targets
        display_sprite = new Sprite({
            texture : target_texture,
            size : new Vector(512,512),
            pos : Luxe.screen.mid
        });

    } //onloaded

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function onprerender() {

            //wait for onloaded
        if(display_sprite == null) return;

            //Set the current rendering target
        Luxe.renderer.target = target_texture;

                //clear the texture!
            Luxe.renderer.clear(new Color().rgb(0xff4b03));
                //draw the geometry inside our batcher
            batcher.draw();

            //reset the target back to no target (i.e the screen)
        Luxe.renderer.target = null;

    } //onprerender

    override function update( dt:Float ) {

        if(example != null) {

                //we can rotate the example sprite,
                // it would be "inside" the texture rotating
            example.rotation_z += 40 * dt;

        }

    } //update

} //Main

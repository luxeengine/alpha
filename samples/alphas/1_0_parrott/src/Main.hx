
import luxe.Input;
import luxe.Color;
import luxe.Sprite;
import luxe.Vector;
import luxe.Text;

import phoenix.Batcher.BlendMode;
import phoenix.RenderTexture;
import phoenix.Texture;
import phoenix.Batcher;
import phoenix.Shader;

class Main extends luxe.Game {

    var final_output : RenderTexture;
    var final_batch : Batcher;
    var final_view : Sprite;
    var final_shader : Shader;

    var instructions : Text;

    override function config( config:luxe.AppConfig ) {

        config.window.title = 'alpha-1.0+parrott';
        config.window.resizable = false;

        #if luxe_doc_sample
            config.window.width = 700;
            config.window.height = 467;
        #end

        return config;

    } //config

    override function ready() {

            /** This is where we will draw to, the render texture */
        final_output = new RenderTexture(Luxe.resources, Luxe.screen.size);
            /** This is a batcher separate from the default rendering so we can control when it draws */
        final_batch = Luxe.renderer.create_batcher({ no_add:true });

            /** This is the shader we will apply to the overall drawing */
        final_shader = Luxe.loadShader('assets/lowres.glsl');
            //set the default shader grid size so it shows something at least
        final_shader.set_float('grid_size', Luxe.screen.size.x*0.2 );

            /**
                To display the whole default rendering into a texture,
                we still need a final place to draw that texture.
                This sprite is drawn manually after "normal" rendering using
                the final_batch to do the work - and it is using the render target
                as its texture so we can see what the full render+shader is doing.
            */

        final_view = new Sprite({
            centered : false,
            pos : new Vector(0,0),
            size : Luxe.screen.size,
            texture : final_output,
            shader : final_shader,
            batcher : final_batch
        });

            /**
                Create some instructions text, this won't blend correctly but thats ok,
                The important notes are that it's depth is above the final view sprite,
                that its using the final_batch (unaffected by the "full view" shader).
            */

        instructions = new Text({
            text : 'press [s] to toggle view shader\npress [t] to toggle text state\nmouse/touch x axis changes amount',
            align : TextAlign.right,
            pos : new Vector(Luxe.screen.w - 16, 16),
            batcher : final_batch,
            depth : 2,
            point_size : 20
        });


            //set clear to white in the main render
        Luxe.renderer.clear_color.rgb(0x121212);

            //now start the demo specific code
        new Parrott();

    } //ready


        //This is called for you before any default rendering happens.
        //Usually, what would be preferable than applying shaders to the entire scene,
        //is to control the batches and render your shaded batchers in this function.
        //If you don't, your HUD, menus and so on will get affected by all the shading
        //not usually what you want. This method of rendering the whole default batch is just for
        //learning reference sake :}

    override function onprerender() {

            //set to the custom render target
        Luxe.renderer.target = final_output;
        Luxe.renderer.clear(new Color(0,0,0,1));

    } //onprerender

    override function onpostrender() {

            //set back to the default window target
        Luxe.renderer.target = null;

            //clear to a bright red so we can see any weirdness
        Luxe.renderer.clear(new Color(1,0,0,1));

            //control the blending for this sprite, because the drawing writes
            //alpha values into the texture, making parts of the texture see through
            //if we draw this on a red background, it would show through.
            //comment this line to see it happen (like open the debug console)
        Luxe.renderer.blend_mode(BlendMode.src_alpha, BlendMode.zero);

            //now we draw the custom view sprite using the batcher
        final_batch.draw();

            //reset the blending
        Luxe.renderer.blend_mode();

    } //onpostrender

    function change_size( x:Float ) {

        var min = 32;
        var max = Math.floor(Luxe.screen.w * 0.2);
        var val = min+ Math.round( (x/Luxe.screen.w) * (max-min) );

            //update the value inside the shader to the new value
        final_shader.set_float('grid_size', val);

    } //change_size

    override function ontouchmove( e:TouchEvent ) {

        change_size( e.x * Luxe.screen.w );

    } //ontouchmove

    override function onmousemove( e:MouseEvent ) {
        #if !mobile
            change_size(e.pos.x);
        #end
    } //onmousemove

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.key_s) {
            if(final_view.shader == final_shader) {
                final_view.shader = Luxe.renderer.shaders.textured.shader;
            } else {
                final_view.shader = final_shader;
            }
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

} //Main


import luxe.Input;
import luxe.Text;
import luxe.Color;
import luxe.Rectangle;
import phoenix.BitmapFont;
import phoenix.geometry.TextGeometry;

class Main extends luxe.Game {


    override function config(config:luxe.AppConfig) {

        config.preload.fonts.push({ id:'assets/fonts/font.fnt' });

        return config;

    } //config
    
    var text : TextGeometry;

    override function ready() {

        Luxe.renderer.clear_color.rgb(0xffffff);

    	//Fonts are currently created with BMFont compatible generators,
    	//see http://luxeengine.com/docs/guide.fonts.html for details

        var font = Luxe.resources.font('assets/fonts/font.fnt');

            //now that we have some fonts, lets write something
        Luxe.draw.text({
            font: font,
            text : "LIKES SIMPLE",
            bounds : new Rectangle(0, 0, Luxe.screen.w * 0.99, Luxe.screen.h * 0.98),
            color : new Color().rgb(0x242424),
            align : TextAlign.right,
            align_vertical : TextAlign.bottom,
            point_size : 32
        });

        Luxe.draw.text({
            font: font,
            text : "LUXE\n", //the newline is cheating for alignment
            bounds : new Rectangle(0, 0, Luxe.screen.w * 0.99, Luxe.screen.h * 0.98),
            color : new Color().rgb(0xff4b03),
            align : TextAlign.right,
            align_vertical : TextAlign.bottom,
            point_size : 32
        });

        text = Luxe.draw.text({
            font: font,
            text : "press the F key",
            pos : Luxe.screen.mid,
            color : new Color().rgb(0x1d1d1d),
            align : TextAlign.center,
            align_vertical : TextAlign.center,
            point_size : 24
        });

    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.key_f) {

                //It's important to know when setting the font
                //that the shader for SDF based fonts and plain fonts
                //are not the same, and the sdf flag should be set accordingly!
            if(text.font == Luxe.renderer.font) {

                text.sdf = false;
                text.shader = Luxe.renderer.shaders.textured.shader;
                text.font = Luxe.resources.font('assets/fonts/font.fnt');
                trace('set to custom font');
            
            } else {
            
                text.sdf = true;
                text.shader = Luxe.renderer.shaders.bitmapfont.shader;
                text.font = Luxe.renderer.font;
                trace('set to default font');
            
            }
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main

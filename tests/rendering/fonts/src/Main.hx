
import luxe.Input;
import luxe.Text;
import luxe.Color;
import luxe.Rectangle;
import phoenix.BitmapFont;

class Main extends luxe.Game {


    override function ready() {

    	//Fonts are currently created with BMFont compatible generators,
    	//see http://luxeengine.com/docs/guide.fonts.html for details

    	Luxe.renderer.clear_color.rgb(0xffffff);

    	var get = Luxe.resources.load_font('assets/fonts/font.fnt');

        get.then(function(font:BitmapFont) {

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
                text : "LUXE\n",
                bounds : new Rectangle(0, 0, Luxe.screen.w * 0.99, Luxe.screen.h * 0.98),
                color : new Color().rgb(0xff4b03),
                align : TextAlign.right,
                align_vertical : TextAlign.bottom,
                point_size : 32
            });

        }); //onload


    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main

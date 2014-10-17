
import luxe.Input;
import luxe.Text;
import luxe.Color;
import luxe.Rectangle;

class Main extends luxe.Game {


    override function ready() {

    	//Fonts are currently created with BMFont compatible generators
    	//But soon more options will be added
    	//www.angelcode.com/products/bmfont/
        //http://renderhjs.net/shoebox/bitmapFont.htm

    	Luxe.renderer.clear_color = new Color();

    		//the reason the second option is a folder is because you keep the fonts, and their loose png files separate
    		//this allows you to specify sub folders etc easily.
    	var font = Luxe.loadFont('font.fnt', 'assets/fonts/' );

        font.onload = function(_) {

            snow.Snow.next(function(){
                    //now that we have some fonts, lets write something
                font.draw_text({
                    text : "LIKES SIMPLE",
                    bounds : new Rectangle(0, 0, Luxe.screen.w * 0.99, Luxe.screen.h * 0.98),
                    color : new Color().rgb(0x242424),
                    align : TextAlign.right,
                    align_vertical : TextAlign.bottom,
                    size : 32,
                    immediate : false
                });

                font.draw_text({
                    text : "LUXE\n",
                    bounds : new Rectangle(0, 0, Luxe.screen.w * 0.99, Luxe.screen.h * 0.98),
                    color : new Color().rgb(0xff4b03),
                    align : TextAlign.right,
                    align_vertical : TextAlign.bottom,
                    size : 32,
                    immediate : false
                });

            });
        }


    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main

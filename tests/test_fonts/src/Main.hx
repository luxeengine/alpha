
import luxe.Input;
import luxe.Text;
import luxe.Color;
import luxe.Rectangle;

class Main extends luxe.Game {

    public function ready() {

    	//Fonts are currently created with BMFont compatible generators
    	//But soon more options will be added 
    	//www.angelcode.com/products/bmfont/

    	Luxe.renderer.clear_color = new Color();

    		//the reason the second option is a folder is because you keep the fonts, and their loose png files separate
    		//this allows you to specify sub folders etc easily.
    	var font = Luxe.loadFont('ostrich_sans_black.fnt', 'assets/fonts/' );

    		//now that we have some fonts, lets write something
    	font.draw_text({
    		text : "likes simple ",
    		bounds : new Rectangle(0, 0, Luxe.screen.w , Luxe.screen.h),
    		color : new Color().rgb(0x242424),
    		align : TextAlign.right,
    		align_vertical : TextAlign.bottom,
    		size : 62,
    		immediate : false
    	});

    	font.draw_text({
    		text : "luxe,\n",
    		bounds : new Rectangle(0, 0, Luxe.screen.w - (font.get_text_dimensions('likes simple ', new luxe.Vector(1,1) ).x), Luxe.screen.h),
    		color : new Color().rgb(0xff4b03),
    		align : TextAlign.right,
    		align_vertical : TextAlign.bottom,
    		size : 62,
    		immediate : false
    	});


    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main
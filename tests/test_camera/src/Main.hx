
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import luxe.Text;
import luxe.Rectangle;
import phoenix.Batcher;
import phoenix.Camera;

class Main extends luxe.Game {

    public function ready() {

    	var level_texture = Luxe.loadTexture('assets/level.png');

    	var level_sprite = new Sprite({
            texture : level_texture,
            pos : new Vector(Luxe.screen.w/2,Luxe.screen.h/2)
        });

        level_texture.onload = function(tt) {

            level_texture.filter = phoenix.Texture.FilterType.nearest;
            level_sprite.scale = new Vector(Luxe.screen.w/240,Luxe.screen.h/160);

        } //level tex on load


        //We now set the camera bounds, so you can't escape past them
        var midx = Luxe.screen.w/4;
        var midy = Luxe.screen.h/4;

        Luxe.camera.bounds = new Rectangle(-midx, -midy, Luxe.screen.w + midx, Luxe.screen.h+midy);

        //To demonstrate multiple camera views, 
        //first we create a second batcher, as this will use a new camera

        var hud_batcher = new Batcher(Luxe.renderer, 'hud_batcher');
        	//we then create a second camera for it, default options
       	var hud_view = new Camera();
       		//then assign it
       	hud_batcher.view = hud_view;
       		//the default batcher is stored at layer 1, we want to be above it
       	hud_batcher.layer = 2;
       		//the add it to the renderer
       	Luxe.renderer.add_batch(hud_batcher);


       		//Now draw some text and the bar
        var small_amount = Luxe.screen.h * 0.05;

        Luxe.draw.box({
        	x : 0, y : Luxe.screen.h - small_amount,
        	w : Luxe.screen.w, h: small_amount,
        	color : new Color().rgb(0xf0f0f0),
        		//here is the key, we don't store it in the default batcher, we make a second batcher with a different camera
        	batcher : hud_batcher
        });

        Luxe.draw.text({
        	text : 'A HUD!',
        	size : small_amount * 0.75,
        	bounds : new Rectangle(small_amount/2, Luxe.screen.h - small_amount, Luxe.screen.w, small_amount),
        	color : new Color().rgb(0xff4b03),
        	batcher : hud_batcher,
        	align_vertical : TextAlign.center
        });


    } //ready

    public function onmouseup( e:MouseEvent ) {
    	if(e.button == MouseButton.left) {
    		Luxe.camera.shake( 2+(Std.random(30) ));
    	} else {
				//any other button centers the camera on the position we clicked
			Luxe.camera.center( e.pos.clone().add(Luxe.camera.pos), 0.5+(2*Math.random()) );
    	}
    }

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main
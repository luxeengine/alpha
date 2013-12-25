
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import luxe.Text;
import luxe.Rectangle;
import phoenix.Batcher;
import phoenix.Camera;

class Main extends luxe.Game {

    var hud_batcher:Batcher;

    public function ready() {

    	var level_texture = Luxe.loadTexture('assets/level.png');

    	var level_sprite = new Sprite({
            texture : level_texture,
            pos : new Vector(0,0),
            centered : false
        });

        level_texture.onload = function(tt) {

            level_texture.filter = phoenix.Texture.FilterType.nearest;
            level_sprite.scale = new Vector(Luxe.screen.w/240,Luxe.screen.h/160);

        } //level tex on load


        //We now set the camera bounds, so you can't escape past them
        var midx = Luxe.screen.w/4;
        var midy = Luxe.screen.h/4;
        
        view_mouse = new Vector();
        world_mouse = new Vector();

        // Luxe.camera.bounds = new Rectangle(-midx, -midy, Luxe.screen.w + midx, Luxe.screen.h+midy);

        //To demonstrate multiple camera views, 
        //first we create a second batcher, as this will use a new camera

        hud_batcher = new Batcher(Luxe.renderer, 'hud_batcher');
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

        Luxe.draw.line({
            p0 : new Vector(Luxe.screen.w/2, 0),
            p1 : new Vector(Luxe.screen.w/2, Luxe.screen.h),
            color : new Color(1,1,1,0.3),
            batcher : hud_batcher
        });
        Luxe.draw.line({
            p0 : new Vector(0, Luxe.screen.h/2),
            p1 : new Vector(Luxe.screen.w, Luxe.screen.h/2),
            color : new Color(1,1,1,0.3),
            batcher : hud_batcher
        });

    } //ready

    public function onmousemove( e:MouseEvent ) {
        view_mouse = Vector.Add( e.pos, Luxe.camera.pos );
        world_mouse = Vector.DivideVector( view_mouse, Luxe.camera.scale ).add(Luxe.camera.pos);
    }

    public function onmouseup( e:MouseEvent ) {

    	if(e.button == MouseButton.left) {
    		Luxe.camera.shake( 2+(Std.random(100) ));
    	} else if(e.button == MouseButton.right) {
            Luxe.camera.focus( Vector.Add( e.pos, Luxe.camera.pos ) );
    	} else if(e.button == MouseButton.wheel_up ) {
                //wheel_up
            Luxe.camera.zoom += 0.1;
        } else if(e.button == MouseButton.wheel_down ) {
                //wheel_down
            Luxe.camera.zoom -= 0.1;
        }
    }

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.left) {
            Luxe.camera.pos.x -= 960;
        }
        if(e.key == KeyValue.right) {
            Luxe.camera.pos.x += 960;
        }
        if(e.key == KeyValue.up) {
            Luxe.camera.pos.y -= 640;
        }
        if(e.key == KeyValue.down) {
            Luxe.camera.pos.y += 640;
        }

        if(e.key == KeyValue.key_1) {
            Luxe.camera.zoom = 1;
        }
        if(e.key == KeyValue.key_2) {
            Luxe.camera.zoom = 2;
        }
        if(e.key == KeyValue.key_3) {
            Luxe.camera.zoom = 0.5;
        }
        if(e.key == KeyValue.key_4) {
            Luxe.camera.center = new Vector(480,960);
        }
        if(e.key == KeyValue.key_5) {
            Luxe.camera.center = new Vector(480,320);
        }
        if(e.key == KeyValue.key_6) {
            trace(Luxe.camera.pos + " / " + Luxe.camera.view.view_pos);            
        }

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }

        world_mouse = Vector.Add( view_mouse, Luxe.camera.pos );
        
    } //onkeyup

    var view_mouse : Vector;
    var world_mouse : Vector;
    public function update(dt:Float) {
        // Luxe.camera.view.rotation.z += luxe.utils.Maths.degToRad(10 * dt);
        Luxe.draw.text({
            batcher : hud_batcher,
            immediate : true,
            pos:new Vector(10,10),
            color:new Color().rgb(0xff4b03),
            text : 'world mouse : ' + world_mouse.x + ',' + world_mouse.y
        });
    } //update

} //Main
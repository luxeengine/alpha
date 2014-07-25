
import luxe.Input;
import luxe.Quaternion;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import luxe.Text;
import luxe.Rectangle;
import phoenix.Batcher;
import luxe.Camera;
import phoenix.geometry.LineGeometry;

class Main extends luxe.Game {


    var hud_batcher:Batcher;

        //for 4 views, you want 4 unique batchers
    var batcher_1 : Batcher;
    var batcher_2 : Batcher;
    var batcher_3 : Batcher;
    var batcher_4 : Batcher;
        //and 4 unique views to render these batchers
    var camera_1 : Camera;
    var camera_2 : Camera;
    var camera_3 : Camera;
    var camera_4 : Camera;
        //for mouse based control of the current view
    var current_camera : Camera;


    override function ready() {

    	var level_texture = Luxe.loadTexture('assets/level.png');

        var midx = Luxe.screen.w/2;
        var midy = Luxe.screen.h/2;

        screen_mouse = new Vector();
        view_mouse = new Vector();
        world_mouse = new Vector();

        create_hud();

            //create unique cameras
        camera_1 = new Camera({ name : 'camera1' });
        camera_2 = new Camera({ name : 'camera2' });
        camera_3 = new Camera({ name : 'camera3' });
        camera_4 = new Camera({ name : 'camera4' });

        current_camera = camera_1;

            //create the unique batchers
        batcher_1 = Luxe.renderer.create_batcher({ name:'viewport1', camera:camera_1.view });
        batcher_2 = Luxe.renderer.create_batcher({ name:'viewport2', camera:camera_2.view });
        batcher_3 = Luxe.renderer.create_batcher({ name:'viewport3', camera:camera_3.view });
        batcher_4 = Luxe.renderer.create_batcher({ name:'viewport4', camera:camera_4.view });

            //we move batcher one on top, because when holding
            //space bar it's view will follow the mouse, and
            //it was created first so we reorder using the layer
        batcher_1.layer = 3;

            //set the unique viewports
        camera_1.viewport = new Rectangle( 0,       0,      midx, midy );
        camera_2.viewport = new Rectangle( midx,    0,      midx, midy );
        camera_3.viewport = new Rectangle( 0,       midy,   midx, midy );
        camera_4.viewport = new Rectangle( midx,    midy,   midx, midy );

            //add the sprite to the first one
        var level_sprite = new Sprite({

            texture : level_texture,
            pos : new Vector(0,0),
            centered : false,
            batcher : batcher_1

        }); //level_sprite

        camera_2.pos.x = 480;
        camera_3.pos.x = 960;
        camera_4.pos.x = 1440;

        camera_2.pos.y = 320;
        camera_3.pos.y = 640;
        camera_4.pos.y = 960;

        camera_2.rotation = z_rot(12);
        camera_3.rotation = z_rot(45);
        camera_4.rotation = z_rot(30);

        camera_2.zoom = 0.9;
        camera_3.zoom = 0.2;
        camera_4.zoom = 0.5;

        level_texture.onload = function(tt) {
                //set it
            level_texture.filter = phoenix.Texture.FilterType.nearest;
            level_sprite.scale = new Vector((midx)/240,(midy)/160);

                //and then to the rest
            batcher_2.add( level_sprite.geometry );
            batcher_3.add( level_sprite.geometry );
            batcher_4.add( level_sprite.geometry );

        } //level tex on load

        for(b in Luxe.renderer.batchers) {
            trace(b.name + ' / ' + b.layer);
        }

    } //ready

    function create_hud() {

            //For the hud, it has a unique batcher, layer 4 is > the batcher_1, and the default(1)
        hud_batcher = Luxe.renderer.create_batcher({ name:'hud_batcher', layer:4 });

            //Now draw some text and the bar
        var small_amount = Luxe.screen.h * 0.05;

            //draw a bar on the bottom
        Luxe.draw.box({
            x : 0, y : Luxe.screen.h - small_amount,
            w : Luxe.screen.w, h: small_amount,
            color : new Color().rgb(0xf0f0f0),
                //here is the key, we don't store it in the default batcher, we store it in our new custom batcher
            batcher : hud_batcher
        });

        Luxe.draw.text({
            text : 'A HUD!',
            size : small_amount * 0.55,
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

    } //create_hud

    function z_rot(_r:Float) {
        return new Quaternion().setFromEuler(new Vector(0,0,_r).radians());
    }

    var drag_time : Float = 0;
    var drag_allowance : Float = 0.2;
    var mouse_down : Bool = false;
    var dragging : Bool = false;
    var drag_start : Vector;
    var drag_start_rotation : Float;
    var camera_start_rotation : Float;

    var view_move : Bool = false;

    override function onmousemove( e:MouseEvent ) {

        if(view_move) {
            camera_1.viewport.x = e.pos.x;
            camera_1.viewport.y = e.pos.y;
        }

        screen_mouse = e.pos;
        world_mouse = current_camera.screen_point_to_world( e.pos );
        view_mouse = current_camera.world_point_to_screen( world_mouse );

        if( mouse_down && !dragging && Luxe.time > drag_time ) {
            dragging = true;
            drag_start = e.pos;
            drag_start_rotation = world_mouse.rotationTo(current_camera.center);
            camera_start_rotation = current_camera.rotation.toeuler().z;
        }

        if(dragging) {

                //get the rotation to the mouse
            var r_to_mouse = world_mouse.rotationTo(current_camera.center);
                //wrap it to 0, 360
            r_to_mouse = luxe.utils.Maths.wrap_angle(r_to_mouse, -720, 720);
                //and the difference between them
            var r_diff = (r_to_mouse - drag_start_rotation) * 0.5;
                //now add to the original
            var new_r = camera_start_rotation - r_diff;
                //and set the rotation on camera
            current_camera.rotation = z_rot(new_r);

        } else {

                //work out which quadrant we are in
            var quadx = Math.floor( e.pos.x / 480 );
            var quady = Math.floor( e.pos.y / 320 );

            if(quadx == 0 && quady == 0) {
                current_camera = camera_1;
            } else if(quadx == 1 && quady == 0) {
                current_camera = camera_2;
            } else if(quadx == 0 && quady == 1) {
                current_camera = camera_3;
            } else if(quadx == 1 && quady == 1) {
                current_camera = camera_4;
            }
        }

    }

    override function onmousedown( e:MouseEvent ) {
        if(e.button == MouseButton.left) {
            mouse_down = true;
            drag_time = Luxe.time + drag_allowance;
        }
    }

    override function onmousewheel( e:MouseEvent ) {

        if(e.y < 0) {
                //wheel_up
            current_camera.zoom += 0.1;
        } else if(e.y > 0) {
                //wheel_down
            current_camera.zoom -= 0.1;
        }

    } //onmousewheel

    override function onmouseup( e:MouseEvent ) {

    	if(e.button == MouseButton.left) {
            mouse_down = false;
            dragging = false;
                //did dragging time happen?
            if(Luxe.time < drag_time) {
                current_camera.shake( 2+(Std.random(100) ));
            } else {
                //do nothing
            }
    	} else if(e.button == MouseButton.right) {
            current_camera.focus( world_mouse );
    	}

    } //onmouseup

    override function onkeydown( e:KeyEvent ) {
        if(e.keycode == Key.SPACE) {
            view_move = true;
        }
    }

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.SPACE) {
            view_move = false;
            camera_1.viewport.x = 0;
            camera_1.viewport.y = 0;
        }


        if(e.keycode == Key.LEFT) {
            current_camera.pos.x -= 480;
        }
        if(e.keycode == Key.RIGHT) {
            current_camera.pos.x += 480;
        }
        if(e.keycode == Key.UP) {
            current_camera.pos.y -= 320;
        }
        if(e.keycode == Key.DOWN) {
            current_camera.pos.y += 320;
        }

        if(e.keycode == Key.KEY_1) {
            current_camera.zoom = 1;
        }
        if(e.keycode == Key.KEY_2) {
            current_camera.zoom = 2;
        }
        if(e.keycode == Key.KEY_3) {
            current_camera.zoom = 0.5;
        }
        if(e.keycode == Key.KEY_4) {
            current_camera.center = new Vector(240,480);
        }
        if(e.keycode == Key.KEY_5) {
            current_camera.center = new Vector(240,160);
        }
        if(e.keycode == Key.KEY_6) {
            current_camera.rotation = z_rot(0);
        }
        if(e.keycode == Key.KEY_7) {
            current_camera.rotation = z_rot(45);
        }
        if(e.keycode == Key.KEY_8) {
            current_camera.rotation = z_rot(90);
        }
        if(e.keycode == Key.KEY_9) {
            current_camera.rotation = z_rot(180);
        }

        if(e.keycode == Key.ESCAPE) {
            Luxe.shutdown();
        }

        world_mouse = current_camera.screen_point_to_world( screen_mouse );

    } //onkeyup

    var screen_mouse : Vector;
    var view_mouse : Vector;
    var world_mouse : Vector;

    override function update(dt:Float) {

        Luxe.draw.text({
            batcher : hud_batcher,
            immediate : true,
            pos:new Vector(10,10),
            color:new Color().rgb(0xff4b03),
            text : 'world mouse : ' + world_mouse.x + ',' + world_mouse.y + '\n' + 'view mouse : ' + view_mouse.x + ',' + view_mouse.y
        });

    } //update


} //Main


import luxe.Input;
import luxe.Quaternion;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import luxe.Text;
import luxe.Rectangle;
import phoenix.Batcher;
import phoenix.Camera;
import phoenix.geometry.LineGeometry;

class Main extends luxe.Game {


    var hud_batcher:Batcher;

    var line_one : LineGeometry;
    var line_two : LineGeometry;

    override function config(config:luxe.GameConfig) {

        config.preload.textures.push({ id:'assets/level.png' });

        return config;

    } //config

    override function ready() {

        var level_texture = Luxe.resources.texture('assets/level.png');

        var level_sprite = new Sprite({
            texture : level_texture,
            pos : new Vector(0,0),
            centered : false
        });

        level_texture.filter_min = level_texture.filter_mag = phoenix.Texture.FilterType.nearest;
        level_sprite.scale = new Vector(Luxe.screen.w/240,Luxe.screen.h/160);

        screen_mouse = new Vector();
        view_mouse = new Vector();
        world_mouse = new Vector();

        create_hud();

    } //ready

    function create_hud() {

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
            point_size : small_amount * 0.75,
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

        line_one = Luxe.draw.line({
            p0 : new Vector(Luxe.screen.w/2, 0),
            p1 : new Vector(Luxe.screen.w/2, Luxe.screen.h),
            color : new Color(1,1,1,0.5).rgb(0xff440b),
            batcher : hud_batcher
        });

        line_two = Luxe.draw.line({
            p0 : new Vector(0, Luxe.screen.h/2),
            p1 : new Vector(Luxe.screen.w, Luxe.screen.h/2),
            color : new Color(1,1,1,0.5).rgb(0xff440b),
            batcher : hud_batcher
        });

    } //create_hud

    override function onmousemove( e:MouseEvent ) {

        screen_mouse = e.pos;
        world_mouse = Luxe.camera.screen_point_to_world( e.pos );
        view_mouse = Luxe.camera.world_point_to_screen( world_mouse );

        if( mouse_down && !dragging && Luxe.time > drag_time ) {
            dragging = true;
            drag_start = e.pos;
            drag_start_rotation = e.pos.rotationTo(Luxe.screen.mid);
            camera_start_rotation = Luxe.camera.rotation.toeuler().z;
        }

            //change lines crosshair
        line_one.p0 = new Vector( 0, screen_mouse.y );
        line_one.p1 = new Vector( Luxe.screen.w, screen_mouse.y );

        line_two.p0 = new Vector( screen_mouse.x, 0 );
        line_two.p1 = new Vector( screen_mouse.x, Luxe.screen.h );

        if(dragging) {
                //get the rotation to the mouse
            var r_to_mouse = e.pos.rotationTo(Luxe.screen.mid);
                //wrap it to 0, 360
            r_to_mouse = luxe.utils.Maths.wrap_angle(r_to_mouse, -720, 720);
                //and the difference between them
            var r_diff = (r_to_mouse - drag_start_rotation) * 0.5;
                //now add to the original
            var new_r = camera_start_rotation - r_diff;
                //and set the rotation on camera
            Luxe.camera.rotation = z_rot(new_r);
        }
    }

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

    override function onmousedown( e:MouseEvent ) {
        if(e.button == MouseButton.left) {
            mouse_down = true;
            drag_time = Luxe.time + drag_allowance;
        }
    }

    override function onmousewheel( e:MouseEvent ) {
        if(e.y < 0) {
                //wheel_up
            Luxe.camera.zoom += 0.1;
        } else if(e.y > 0) {
                //wheel_down
            Luxe.camera.zoom -= 0.1;
        }
    }

    override function onmouseup( e:MouseEvent ) {

        if(e.button == MouseButton.left) {
            mouse_down = false;
            dragging = false;
                //did dragging time happen?
            if(Luxe.time < drag_time) {
                // Luxe.camera.shake( 4+(Std.random(100) ));
                Luxe.camera.shake( 100 );
            } else {
                //do nothing
            }
        } else if(e.button == MouseButton.right) {
            Luxe.camera.focus( world_mouse );
        }
    }

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.left) {
            Luxe.camera.pos.x -= 960;
        }
        if(e.keycode == Key.right) {
            Luxe.camera.pos.x += 960;
        }
        if(e.keycode == Key.up) {
            Luxe.camera.pos.y -= 640;
        }
        if(e.keycode == Key.down) {
            Luxe.camera.pos.y += 640;
        }

        if(e.keycode == Key.key_1) {
            Luxe.camera.zoom = 1;
        }
        if(e.keycode == Key.key_2) {
            Luxe.camera.zoom = 2;
        }
        if(e.keycode == Key.key_3) {
            Luxe.camera.zoom = 0.5;
        }
        if(e.keycode == Key.key_4) {
            Luxe.camera.center = new Vector(480,960);
        }
        if(e.keycode == Key.key_5) {
            Luxe.camera.center = new Vector(480,320);
        }
        if(e.keycode == Key.key_6) {
            Luxe.camera.rotation = z_rot(0);
        }
        if(e.keycode == Key.key_7) {
            Luxe.camera.rotation = z_rot(45);
        }
        if(e.keycode == Key.key_8) {
            Luxe.camera.rotation = z_rot(90);
        }
        if(e.keycode == Key.key_9) {
            Luxe.camera.rotation = z_rot(180);
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

        world_mouse = Luxe.camera.screen_point_to_world( screen_mouse );

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

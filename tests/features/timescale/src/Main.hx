
import luxe.Vector;
import luxe.Input;
import luxe.Color;
import luxe.Sprite;

import phoenix.geometry.Geometry;

class Main extends luxe.Game {


    var shift_scale = false;

    var player : Sprite;
    var box : Geometry;

    var vel : Vector;
    var floor_y : Float = 500;
    var jump_vel : Float = 300;
    var movespeed : Float = 150;

    var left : Bool = false;
    var right : Bool = false;


    override function ready() {

            //draw a line for the ground
        Luxe.draw.line({
            p0 : new Vector(0,floor_y),
            p1 : new Vector(Luxe.screen.w, floor_y),
            color : new Color().rgb(0xf6007b)
        });

        box = Luxe.draw.box({
            x:76, y:28, w:18, h:18,
            color : new Color().rgb(0xcc0000)
        });

        Luxe.draw.text({
            pos : new Vector(100, 20),
            color : new Color().rgb(0xf6007b),
            text : 'Press S to toggle time scale control\nMouse x position controls scale',
            point_size : 18
        });

        player = new Sprite({
            pos : new Vector( Luxe.screen.w / 2, floor_y ),
            size : new Vector( 20, 40 ),
            color : new Color().rgb(0xf6007b),
            origin : new Vector( 10, 40 )
        });

        Luxe.input.bind_key( 'jump', Key.key_w );
        Luxe.input.bind_key( 'jump', Key.key_z );
        Luxe.input.bind_key( 'jump', Key.space );
        Luxe.input.bind_key( 'jump', Key.up );
        Luxe.input.bind_gamepad( 'jump', 0 );

        vel = new Vector(0,0);

        // Luxe.fixed_timestep = 1/Luxe.core.config.fps;

    } //ready

    override function oninputdown( e:InputEvent ) {

        if(e.name == 'jump') {
            jump();
        } //jump pressed

    } //oninput

    function jump() {

        if(player.pos.y >= floor_y) {
            vel.y = -jump_vel;
        } //player is on the ground

    } //jump

    override function onmousemove( e:MouseEvent ) {

        if(shift_scale) {
            var _scale = (e.x/Luxe.screen.w);
            Luxe.timescale = _scale;
        }

    } //onmousemove

    override function ongamepadaxis( e:GamepadEvent ) {

        var dead = 0.21;

        if((e.value > dead && e.value > 0) || (e.value < 0 && e.value < -dead) ) {
                //left
            if(e.axis == 0) {
                if(e.value < 0) left = true;
                if(e.value > 0) right = true;
            }

        } else {
            if(e.axis == 0) {
                left = false;
                right = false;
            }
        }

    } //ongamepadaxis

    override function onkeydown( e:KeyEvent ) {

        if(e.keycode == Key.left || e.keycode == Key.key_a) { left = true; }
        if(e.keycode == Key.right || e.keycode == Key.key_d) { right = true; }

    } //onkeydown

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.left || e.keycode == Key.key_a) { left = false; }
        if(e.keycode == Key.right || e.keycode == Key.key_d) { right = false; }

        if(e.keycode == Key.key_s) {
            shift_scale = !shift_scale;
            if(shift_scale) {
                box.color.rgb(0x00cc00);
            } else {
                box.color.rgb(0xcc0000);
                Luxe.timescale = 1;
            }
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update( dt:Float ) {

        if(left) {
            vel.x = -movespeed;
        }
        if(right) {
            vel.x = movespeed;
        }

        if(vel.x != 0) {
            vel.x *= ( 0.85 );

            player.pos.x += (vel.x * dt);

            if(player.pos.x < 10) {
                player.pos.x = 10;
            }
            if(player.pos.x > Luxe.screen.w-10 ) {
                player.pos.x = Luxe.screen.w-10;
            }
        }

        if(vel.y != 0) {

            if(player.pos.y < floor_y) {
                vel.y -= -980.0 * dt;
            }

            player.pos.y += vel.y * dt;

            if(player.pos.y > floor_y) {
                player.pos.y = floor_y;
                vel.y = 0;
            }

        } //if theres a velocity

    } //update

} //Main

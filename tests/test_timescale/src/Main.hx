
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

    public function ready() {

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
            size : 18
        }); 

        player = new Sprite({
            pos : new Vector( Luxe.screen.w / 2, floor_y ),
            size : new Vector( 20, 40 ),
            color : new Color().rgb(0xf6007b),
            origin : new Vector( 10, 40 )
        });

        Luxe.input.add('jump', KeyValue.key_W );
        Luxe.input.add('jump', KeyValue.key_Z );
        Luxe.input.add('jump', KeyValue.space );
        Luxe.input.add('jump', KeyValue.up );

        vel = new Vector(0,0);

    } //ready
  
    public function oninput( name:String ) {
        
        if(name == 'jump') {
            if(player.pos.y >= floor_y) {
                vel.y = -jump_vel;
            } //player is on the ground
        } //jump pressed

    } //oninput

    public function onmousemove( e:MouseEvent ) {
        
        if(shift_scale) {
            var _scale = (e.x/Luxe.screen.w);
            Luxe.timescale = _scale;
        }

    } //onmousemove

    public function onkeydown(e) {
        if(e.value == Input.Keys.left || e.value == Input.Keys.key_A) { left = true; }
        if(e.value == Input.Keys.right || e.value == Input.Keys.key_D) { right = true; }

    }

    public function onkeyup(e) {

        if(e.value == Input.Keys.left || e.value == Input.Keys.key_A) { left = false; }
        if(e.value == Input.Keys.right || e.value == Input.Keys.key_D) { right = false; }

        if(e.value == Input.Keys.key_S) {
            shift_scale = !shift_scale;
            if(shift_scale) {
                box.color.rgb(0x00cc00);
            } else {
                box.color.rgb(0xcc0000);
                Luxe.timescale = 1;
            }
        }

        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }
    } //onkeyup

    public function update(dt:Float) {

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

    public function shutdown() {

    } //shutdown
}



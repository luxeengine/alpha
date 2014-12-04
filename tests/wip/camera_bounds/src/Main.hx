
import luxe.Input;
import luxe.Vector;
import luxe.Rectangle;
import luxe.Color;
import luxe.Text;

class Main extends luxe.Game {

    var vel : Vector;
    var speed = 500;
    var dampen = 0.9;
    var info : Text;


    override function ready() {

        vel = new Vector();

        var bounds = new Rectangle(-Luxe.screen.mid.x, -Luxe.screen.mid.y, Luxe.screen.size.x+Luxe.screen.mid.x, Luxe.screen.size.y+Luxe.screen.mid.y);
        var bounds_inner = new Rectangle(bounds.x+10, bounds.y+10, bounds.w-20, bounds.h-20);

        Luxe.draw.rectangle({
            x: bounds.x, y: bounds.y, w: bounds.w, h: bounds.h,
            color: new Color(1,0,0,1)
        });

        Luxe.draw.rectangle({
            x: bounds_inner.x, y: bounds_inner.y, w: bounds_inner.w, h: bounds_inner.h,
            color: new Color(0.2,0.8,1.0,1)
        });

        for( i in 1 ... 8 ) {
            Luxe.draw.rectangle({
                x: bounds_inner.x - (i * (0.05*bounds_inner.x)),
                y: bounds_inner.y - (i * (0.05*bounds_inner.y)),
                w: bounds_inner.w - (1 * (0.1*bounds_inner.w)),
                h: bounds_inner.h - (1 * (0.1*bounds_inner.h)),
                color: new Color(1,0,0,0.5 - (0.3 * (i/8)))
            });
        }

        Luxe.camera.bounds = bounds;

        info = new Text({
            text:'info',
            pos: new Vector(10,10),
            point_size: 14,
            batcher: Luxe.renderer.create_batcher()
        });

    } //ready

    override function onmousewheel( e:MouseEvent ) {
        Luxe.camera.zoom += e.y < 0 ? 0.1 : -0.1;
    }

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

        if(Luxe.input.keydown(Key.left))    vel.x = -speed;
        if(Luxe.input.keydown(Key.right))   vel.x =  speed;
        if(Luxe.input.keydown(Key.up))      vel.y = -speed;
        if(Luxe.input.keydown(Key.down))    vel.y =  speed;

        if(vel.x != 0) vel.x *= dampen;
        if(vel.y != 0) vel.y *= dampen;

        if(Math.abs(vel.x) < 0.1) vel.x = 0;
        if(Math.abs(vel.y) < 0.1) vel.y = 0;

        Luxe.camera.pos.add_xyz(vel.x*dt, vel.y*dt);

        info.text = '${Luxe.camera.pos.x}, ${Luxe.camera.pos.y}\n${Luxe.camera.viewport}\n${Luxe.camera.center}\n${Luxe.camera.bounds}';

    } //update


} //Main

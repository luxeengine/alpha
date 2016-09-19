package states;

import luxe.Vector;
import luxe.Input;
import luxe.Color;

import luxe.collision.Collision;
import luxe.collision.shapes.*;
import luxe.collision.data.*;

class Rays extends luxe.States.State {

    var beam: Ray;
    var others: Array<Ray>;
    var colors: Array<Color>;
    var results: Results<RayIntersection>;

    var flip = false;

    override function onenter<T>(_:T) {

        others = [];
        colors = [
            new Color(),
            new Color().rgb(0x00e7b3),
            new Color().rgb(0x00b1dd),
            new Color().rgb(0xa0e300)
        ];

        var message = 'press F to flip start point\n';
            message += 'press 1 to toggle the beam infinite state\n';
            message += 'press 2 to toggle the other infinite states\n';
            message += 'press 3 to toggle the first infinite state\n';

        Main.display(message);

        beam = new Ray( new Vector(50,300), new Vector(600,400), not_infinite );

        for(i in 0 ... colors.length) {
            var sx = (i+1) * 120;
            var ray = new Ray( new Vector(sx, 100), new Vector(sx, 500), not_infinite );
            others.push(ray);
            Main.rays.push(ray);
        }

        Main.rays.push(beam);

            //allocate a precreated list of results, to avoid allocating every time
        results = new Results<RayIntersection>(colors.length);

    }

    override function onleave<T>(_:T) {

        beam = null;
        others = null;

    }

    override function onmousemove( e:MouseEvent ) {
        if(beam != null) {
            beam.end.x = e.pos.x;
            beam.end.y = e.pos.y;
        }
    }

    function print_infinite(label:String, ray:Ray) {
        switch(ray.infinite) {
            case not_infinite: 
                trace('`$label` infinite: nope');
            case infinite_from_start: 
                trace('`$label` infinite: from start');
            case infinite: 
                trace('`$label` infinite: in both directions');
        }
    }

    function toggle_infinite(ray:Ray) {
        if(ray != null) {
            ray.infinite = switch(ray.infinite) {
                case not_infinite: 
                    infinite_from_start;
                case infinite_from_start: 
                    infinite;
                case infinite: 
                    not_infinite;
            }
        }
    }

    override function onkeyup(e:KeyEvent) {
        
        if(e.keycode == Key.key_1) {
            toggle_infinite(beam);
            print_infinite('beam', beam);
        }

        if(e.keycode == Key.key_2) {
            var first = true;
            for(o in others) {
                toggle_infinite(o);
                if(first) {
                    print_infinite('others', others[0]);
                    first = false;
                }
            }
        }

        if(e.keycode == Key.key_3) {
            toggle_infinite(others[0]);
            print_infinite('others', others[0]);
        }

        if(e.keycode == Key.key_f) {
            if(beam != null) {
                flip = !flip;
                if(flip) {
                    beam.start.x = 100+(colors.length * 120);
                } else {
                    beam.start.x = 50;
                }
            }
        }
    }

    override function update(dt:Float) {

        var colls = Collision.rayWithRays(beam, others, results);

        Luxe.draw.text({
            point_size:15,
            pos:new Vector(Luxe.screen.w - 10, 10),
            align: right,
            text: 'Hit ${colls.length} rays',
            immediate:true,
        });

        var bstart = new Vector(beam.start.x, beam.start.y);

        var textYval = 30;
        var idx = flip ? (colors.length-1) : 0;

        for (c in colls) {
            var rend = new Vector(c.ray2.end.x, c.ray2.end.y);
            var rstart = new Vector(c.ray2.start.x, c.ray2.start.y);

            Luxe.draw.line({
                p0: rstart,
                p1: rstart.clone().add_xyz( c.ray2.dir.x * c.u2, c.ray2.dir.y * c.u2 ),
                color: colors[idx],
                batcher: Main.thicker,
                immediate: true
            });

            Luxe.draw.line({
                p0: bstart,
                p1: bstart.clone().add_xyz( c.ray1.dir.x * c.u1, c.ray1.dir.y * c.u1 ),
                color: colors[idx],
                batcher: Main.thicker,
                depth: (others.length*2) - idx,
                immediate: true
            });

            Luxe.draw.text({
                point_size:13,
                pos:new Vector(Luxe.screen.w - 10,textYval),
                align: right,
                color: colors[idx],
                text: 'hit start %: ${c.u2}',
                immediate:true,
            });

            textYval += 30;
            if(flip) {
                idx--;
            } else {
                idx++;
            }
        }

    } //update

}

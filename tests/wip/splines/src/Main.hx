package;

import luxe.Color;
import luxe.Vector;
import luxe.Input;
import phoenix.geometry.LineGeometry;

class Main extends luxe.Game {
    var y:Float = 200;
    var x:Float = 100;
    var geom:SplineGeometry;

    var pointNum:Int = 0;
    var c:Color = new Color().rgb(0x5E6CF0);
    override function ready() {
        geom = new SplineGeometry( {
            p0:new Vector(0, 100, 0),
            p1:new Vector(x, y, 0),
            p2:new Vector(200, 0, 0),
            p3:new Vector(300, 100, 0),
            batcher:Luxe.renderer.batcher
        });
    }

    override function onkeyup(e:KeyEvent) {
        if(e.keycode == Key.escape)
            Luxe.shutdown();
    }

    override public function onkeydown(event:KeyEvent) {
        switch(event.keycode) {
            case Key.key_t:
                geom.lineWidth += 0.5;
            case Key.key_g:
                geom.lineWidth -= 0.5;
            case Key.left:
                pointNum--;
                if (pointNum < 0) pointNum = 0;
            case Key.right:
                pointNum++;
                if (pointNum > 3) pointNum = 3;
        }
    }

    override function update(dt:Float) {
        if (Luxe.input.keydown(Key.key_a) || Luxe.input.keydown(Key.key_d) || Luxe.input.keydown(Key.key_w) || Luxe.input.keydown(Key.key_s)) {
            var v:Vector = new Vector();
            if (Luxe.input.keydown(Key.key_w)) {
                v.y -= 200 * dt;

            }
            else if (Luxe.input.keydown(Key.key_s)) {
                v.y += 200 * dt;
            }

            if (Luxe.input.keydown(Key.key_d)) {
                v.x += 200 * dt;
            }
            else if (Luxe.input.keydown(Key.key_a)) {
                v.x -= 200 * dt;
            }
            var point:Vector;
            if (pointNum == 0) {
                point = geom.p0;
                point.add(v);
                geom.p0 = point;
            }
            else if (pointNum == 1) {
                point = geom.p1;
                point.add(v);
                geom.p1 = point;
            }
            else if (pointNum == 2) {
                point = geom.p2;
                point.add(v);
                geom.p2 = point;
            }
            else if (pointNum == 3) {
                point = geom.p3;
                point.add(v);
                geom.p3 = point;
            }
        }

        if (Luxe.input.keydown(Key.up)) {
            geom.DistPerPoint += 5;
            trace(geom.DistPerPoint);
        }
        else if (Luxe.input.keydown(Key.down)) {
            geom.DistPerPoint -= 5;
            trace(geom.DistPerPoint);
        }

        if (Luxe.input.keydown(Key.key_r)) {
            geom.MinPoints += 1;
            trace(geom.MinPoints);
        }
        else if (Luxe.input.keydown(Key.key_f)) {
            geom.MinPoints -= 1;
            trace(geom.MinPoints);
        }

        Luxe.draw.circle( {
            r:4,
            x:geom.p0.x,
            y:geom.p0.y,
            color:c,
            immediate:true
        });
        Luxe.draw.circle( {
            r:4,
            x:geom.p1.x,
            y:geom.p1.y,
            color:c,
            immediate:true
        });
        Luxe.draw.circle( {
            r:4,
            x:geom.p2.x,
            y:geom.p2.y,
            color:c,
            immediate:true
        });
        Luxe.draw.circle( {
            r:4,
            x:geom.p3.x,
            y:geom.p3.y,
            color:c,
            immediate:true
        });

    }
}

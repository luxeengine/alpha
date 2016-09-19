package states;

import luxe.Vector;
import luxe.Input;
import luxe.Color;

import phoenix.geometry.LineGeometry;

import luxe.collision.Collision;
import luxe.collision.shapes.*;
import luxe.collision.data.*;

using luxe.collision.data.RayCollision.RayCollisionHelper;

class RayAndShape extends luxe.States.State {

    var beam:Ray;

    var intersect:LineGeometry;
    var before:LineGeometry;
    var after:LineGeometry;
    var colors:Array<Color>;

    override function onenter<T>(_:T) {

        Main.display('press space to toggle infinite state\npress 1 to move the beam start');

        beam = new Ray( new Vector(420,300), new Vector(400,100), not_infinite );

        Main.rays.push(beam);
        Main.shapes.push(new Circle(600,400,50));
        Main.shapes.push(new Circle(200,400,50));
        Main.shapes.push(Polygon.rectangle(600,200,50,50));
        Main.shapes.push(Polygon.rectangle(200,200,50,50));

        colors = [
            new Color().rgb(0xffffff),
            new Color(1,1,1,0.5)
        ];

        intersect = Luxe.draw.line({ depth:100, batcher: Main.thicker, p0:new Vector(), p1:new Vector(), color:new Color().rgb(0xffffff) });
        before = Luxe.draw.line({ depth:100, batcher: Main.thicker, p0:new Vector(), p1:new Vector(), color:new Color().rgb(0x00f67b) });
        after = Luxe.draw.line({ depth:100, batcher: Main.thicker, p0:new Vector(), p1:new Vector(), color:new Color().rgb(0x7b00f6) });

    } //onenter

    override function onleave<T>(_:T) {

        beam = null;
        intersect.drop();
        before.drop();
        after.drop();

        intersect = null;
        before = null;
        after = null;

    } //onleave

     override function onkeyup(e:KeyEvent) {
        
        if(e.keycode == Key.key_1) {
            if(beam.start.y == 300) {
                beam.start.y = 200;
            } else if(beam.start.y == 200) {
                beam.start.y = 380;
            } else {
                beam.start.y = 300;
            }
        }

        if(e.keycode == Key.space) {
            if(beam != null) {
                    //cycle infinite mode
                beam.infinite = switch(beam.infinite) {
                    case not_infinite: infinite_from_start;
                    case infinite_from_start: infinite;
                    case infinite: not_infinite;
                }
            }
        }

    } //onkeyup

    override function onmousemove( e:MouseEvent ) {
        if(beam != null) {
            if(beam.infinite == infinite || beam.infinite == infinite_from_start) { //:todo: check later if correct behaviour
                var end = new Vector(e.pos.x, e.pos.y);
                end.subtract_xyz(beam.start.x, beam.start.y);
                end.normalize();
                end.multiplyScalar(9999);
                beam.end.x = end.x;
                beam.end.y = end.y;
            } else {
                beam.end.x = e.pos.x;
                beam.end.y = e.pos.y;
            }
        }
    }

    override function update(dt:Float) {

        if(Main.shapes.length <= 0) return;

        var colls = Collision.rayWithShapes(beam, Main.shapes);

        Luxe.draw.text({
            point_size:15,
            pos:new Vector(Luxe.screen.w - 10, 10),
            align: right,
            text: 'Hit ${colls.length} shapes',
            immediate:true,
        });

        var textYval = 30;

        for (c in colls) {
            var hitstartx = c.hitStartX();
            var hitstarty = c.hitStartY();
            var hitendx = c.hitEndX();
            var hitendy = c.hitEndY();

            Luxe.draw.ring({ immediate:true, x:hitstartx, y:hitstarty, r:4, color:colors[1] });
            Luxe.draw.ring({ immediate:true, x:hitendx, y:hitendy, r:4, color:colors[1] });

            if(c.end >= 1.0) {
                Luxe.draw.line({
                    p0: new Vector(hitstartx, hitstarty),
                    p1: new Vector(c.ray.end.x, c.ray.end.y),
                    color: colors[0],
                    batcher: Main.thicker,
                    immediate: true
                });
            } else {
                Luxe.draw.line({
                    p0: new Vector(hitstartx, hitstarty),
                    p1: new Vector(hitendx, hitendy),
                    color: colors[0],
                    batcher: Main.thicker,
                    immediate: true
                });
            }
            

            Luxe.draw.text({
                point_size:13,
                pos:new Vector(Luxe.screen.w - 10,textYval),
                align: right,
                text: 'hit start %: ${c.start}\n end %: ${c.end}',
                immediate:true,
            });

            textYval += 30;

        } //each collision

    } //update

} //RayAndShape

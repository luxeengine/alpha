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

    override function onenter<T>(_:T) {

        Main.display('pink = ray\ngreen = before hit\nwhite = intersection\npurple = after hit');

        beam = new Ray( new Vector(450,300), new Vector(400,100), false );

        Main.rays.push(beam);
        Main.shapes.push(new Circle(600,400,50));
        Main.shapes.push(new Circle(200,400,50));
        Main.shapes.push( Polygon.rectangle(600,200,50,50));
        Main.shapes.push( Polygon.rectangle(200,200,50,50));

        intersect = Luxe.draw.line({ depth:100, group:3, p0:new Vector(), p1:new Vector(), color:new Color().rgb(0xffffff) });
        before = Luxe.draw.line({ depth:100, group:2, p0:new Vector(), p1:new Vector(), color:new Color().rgb(0x00f67b) });
        after = Luxe.draw.line({ depth:100, group:2, p0:new Vector(), p1:new Vector(), color:new Color().rgb(0x7b00f6) });

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

    override function onmousemove( e:MouseEvent ) {
        if(beam != null) {
            beam.end.x = e.pos.x;
            beam.end.y = e.pos.y;
        }
    }

    override function update(dt:Float) {

        if(Main.shapes.length <= 0) return;

        var colls = Collision.rayWithShapes(beam, Main.shapes);

        Luxe.draw.text({
            point_size:15,
            pos:new Vector(Luxe.screen.w - 10,10),
            align: right,
            text: 'Hit ${colls.length} shapes',
            immediate:true,
        });

        var textYval = 30;
        if(colls.length > 0) {

            for (c in colls) {
                var hitstart = c.hitStart();
                var hitend = c.hitEnd();
                var raystart = c.ray.start;
                var rayend = c.ray.end;

                intersect.p0 = hitstart;
                intersect.p1 = hitend;

                before.p0 = raystart;
                before.p1 = hitstart;

                after.p0 = hitend;
                after.p1 = rayend;

                Luxe.draw.text({
                    point_size:13,
                    pos:new Vector(Luxe.screen.w - 10,textYval),
                    align: right,
                    text: 'hit start %: ${c.start}\n end %: ${c.end}',
                    immediate:true,
                });
                textYval += 30;
            }

        }

    } //update

} //RayAndShape
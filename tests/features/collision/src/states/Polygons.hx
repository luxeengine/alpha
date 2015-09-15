package states;

import luxe.Vector;
import luxe.Input;
import luxe.Color;

import luxe.collision.Collision;
import luxe.collision.shapes.*;
import luxe.collision.data.*;

class Polygons extends luxe.States.State {

    var fixed : Array<Shape>;
    var mover : Polygon;
    var colors : Array<Color>;

    override function onenter<T>(_:T) {

        colors = [ new Color(1,1,1,0.5), new Color(1,1,1,0.5).rgb(0x007bf6) ];

        fixed = [
            Polygon.triangle(100, Luxe.screen.mid.y, 50),
            Polygon.rectangle(300, Luxe.screen.mid.y, 100, 60),
            Polygon.create(500, Luxe.screen.mid.y, 5, 50),
            Polygon.create(600, Luxe.screen.mid.y, 8, 50),
        ];


        mover = Polygon.square(10, 100, 50);

        for(fix in fixed) Main.shapes.push(fix);
        Main.shapes.push(mover);

        var text =  '\nThe white polygon is the position the separation would result in.\n';
            text += 'Hold down left or right mouse to rotate the box.';

        Main.display(text);

    } //onenter

    override function onleave<T>(_:T) {

        for(fix in fixed) fix.destroy();
        fixed = null;

        mover.destroy();
        mover = null;

    } //onleave


    override function onmousemove(e:MouseEvent) {

        mover.position = e.pos;

    } //onmousemove

    override function onrender() {

        if( Luxe.input.mousedown(MouseButton.left) ) {
            mover.rotation += 50 * Luxe.dt;
        }

        if( Luxe.input.mousedown(MouseButton.right) ) {
            mover.rotation -= 50 * Luxe.dt;
        }

        var collisions = Collision.shapeWithShapes(mover, fixed);

        if(collisions.length == 0) return;

        var index = 0;
        for(coll in collisions) {

            Main.drawer.drawShapeCollision(coll);

            //draw a ghost shape where the collision would resolve to
            //we do that by using the separation data, and add it to the "shape1"
            //position, above, that shape1 is mover

            var sep = coll.separation;
            var mover_separated_pos = new Vector( coll.shape1.position.x + sep.x, coll.shape1.position.y + sep.y );

            var r = Luxe.draw.rectangle({
                immediate: true,
                color: colors[index],
                batcher: Main.thicker,
                x: mover_separated_pos.x,
                y: mover_separated_pos.y,
                w: 50, h: 50,
                origin: new Vector(25,25)
            });

            var rot_radians = luxe.utils.Maths.radians(mover.rotation);
            r.transform.rotation.setFromEuler(new Vector(0,0,rot_radians));

            index++;

        }

    }

}

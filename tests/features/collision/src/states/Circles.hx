package states;

import luxe.Vector;
import luxe.Input;
import luxe.Color;

import luxe.collision.Collision;
import luxe.collision.shapes.*;
import luxe.collision.data.*;

class Circles extends luxe.States.State {

    var fixed : Circle;
    var mover : Circle;
    var result : ShapeCollision;

    override function onenter<T>(_:T) {

        result = new ShapeCollision();
        fixed = new Circle(Luxe.screen.mid.x, Luxe.screen.mid.y, 50);
        mover = new Circle(Luxe.screen.mid.x, Luxe.screen.mid.y - 100, 50);

        Main.shapes.push(fixed);
        Main.shapes.push(mover);

        var text =  '\nThe white circle is the position the separation would result in.\n';
            text += 'This is done by adding coll.separation to coll.shape1.position\n\n';
            text += 'The pink + is the separation vector drawn by the drawer,\n';
            text += 'The pink line is the unitVector, the normalized axis of the separation.';

        Main.display(text);

    } //onenter

    override function onleave<T>(_:T) {

        result = null;

        fixed.destroy();
        fixed = null;

        mover.destroy();
        mover = null;

    } //onleave

    override function onmousemove(e:MouseEvent) {

        mover.position = e.pos;

    } //onmousemove

    override function onrender() {

        var coll = Collision.shapeWithShape(mover, fixed, result);

        if(coll != null) {
            Main.drawer.drawShapeCollision(result);

            //draw a ghost shape where the collision would resolve to
            //we do that by using the separation data, and add it to the "shape1"
            //position, above, that shape1 is mover

            Luxe.draw.ring({
                immediate: true,
                color: new Color(1,1,1,0.4),
                batcher: Main.thicker,
                x: result.shape1.position.x + result.separationX,
                y: result.shape1.position.y + result.separationY,
                r: mover.transformedRadius
            });

        }

    }

}

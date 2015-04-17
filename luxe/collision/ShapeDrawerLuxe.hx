package luxe.collision;

import luxe.collision.ShapeDrawer;
import luxe.collision.shapes.Circle;
import luxe.Vector;
import luxe.Log.*;

class ShapeDrawerLuxe extends ShapeDrawer {

    static var color = new luxe.Color().rgb(0xf6007b); //0xff4b03

    override public function drawCircle( circle:Circle ) {

        assertnull(circle);

        Luxe.draw.ring({
            x: circle.position.x,
            y: circle.position.y,
            r: circle.transformedRadius,
            color: color,
            depth: 20,
            immediate: true
        });

    }

    override public function drawLine( p0:Vector, p1:Vector, ?startPoint:Bool = true ) {

        assertnull(p0);
        assertnull(p1);

        Luxe.draw.line({
            p0 : new luxe.Vector(p0.x, p0.y),
            p1 : new luxe.Vector(p1.x, p1.y),
            color : color,
            depth : 20,
            immediate : true
        });

    } //drawLine

} //ShapeDrawerLuxe

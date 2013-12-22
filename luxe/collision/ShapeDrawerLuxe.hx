package luxe.collision;

import luxe.collision.ShapeDrawer;
import luxe.collision.math.Vector2D;

import luxe.Vector;
import luxe.Color;

class ShapeDrawerLuxe extends ShapeDrawer {
    override public function drawLine( start:Vector2D, end:Vector2D ) {
        Luxe.draw.line({
            p0 : new Vector(start.x,start.y),
            p1 : new Vector(end.x, end.y),
            color : new Color().rgb(0xff4b03),
            depth : 20,
            immediate : false
        });
    }
}
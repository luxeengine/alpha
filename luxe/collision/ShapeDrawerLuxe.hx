package luxe.collision;

import luxe.collision.ShapeDrawer;

import luxe.Vector;
import luxe.Color;

class ShapeDrawerLuxe extends ShapeDrawer {

    override public function drawLine( start:Vector, end:Vector, ?color:Color, ?immediate:Bool = false ) {

        if(color == null) {
            color = new Color().rgb(0xff4b03);
        }

        Luxe.draw.line({
            p0 : start,
            p1 : end,
            color : color,
            depth : 20,
            immediate : immediate
        });

    }

}
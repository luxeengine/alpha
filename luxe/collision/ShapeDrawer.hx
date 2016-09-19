package luxe.collision;

import luxe.collision.shapes.*;
import luxe.collision.data.*;
import luxe.Vector;

/** To implement your own debug drawing class, you only need to override drawLine function and implement it
    the rest is handled internally. You can override specifics if you want, but it's not required */
class ShapeDrawer {

//Public API

    public function new() {

    } //new

        /** Draw a line between p0 and p1. Implement this function at minimum in custom drawing handlers */
    public function drawLine( p0x:Float, p0y:Float, p1x:Float, p1y:Float, ?startPoint:Bool = true ) {

    } //drawLine

        /** Draw a `Shape`, it will determine the type and draw it for you. */
    public function drawShape( shape:Shape ) {

        if(Std.is(shape, Polygon)) {
            drawPolygon(cast shape);
        } else {
            drawCircle(cast shape);
        }

    } //drawShape

        /** Draw a `Polygon` */
    public function drawPolygon( poly:Polygon ) {

        drawVertList(poly.transformedVertices);

    } //drawPolygon

        /** Draw a circle `Shape` */
    public function drawCircle( circle:Circle ) {
            //from :
        //http://slabode.exofire.net/circle_draw.shtml

        var _smooth : Float = 10;
        var _steps : Int = Std.int(_smooth * Math.sqrt( circle.transformedRadius ));

            //Precompute the value based on segments
        var theta = 2 * 3.1415926 / _steps;

        var tangential_factor = Math.tan( theta );
        var radial_factor = Math.cos( theta );

        var x : Float = circle.transformedRadius;
        var y : Float = 0;

        var _verts : Array<Vector> = [];

        for( i in 0 ... _steps ) {

            var __x = x + circle.x;
            var __y = y + circle.y;

            _verts.push(new Vector(__x,__y));

                var tx = -y;
                var ty = x;

                x += tx * tangential_factor;
                y += ty * tangential_factor;

                x *= radial_factor;
                y *= radial_factor;

        } //for

            //now draw it
        drawVertList( _verts );

    } //drawCircle

    public function drawPoint( x:Float, y:Float, size:Float = 4 ) {

        var xs = x - size;
        var xe = x + size;
        var ys = y;
        var ye = y;

        drawLine(xs, ys, xe, ye);

        xs = xe = x;
        ys = y - size;
        ye = y + size;

        drawLine(xs, ys, xe, ye);

    } //drawPoint

    public function drawShapeCollision( c:ShapeCollision, ?length:Float = 30 ) {

        //origins

        drawPoint(c.shape1.position.x, c.shape1.position.y);
        drawPoint(c.shape2.position.x, c.shape2.position.y);

        //unit vectors

        drawLine( c.shape1.position.x, c.shape1.position.y, c.shape1.position.x + (c.unitVectorX * length), c.shape1.position.y + (c.unitVectorY * length) );

        //ghosts

        drawPoint(c.shape1.position.x + c.separationX, c.shape1.position.y + c.separationY);
        
        if(c.otherOverlap != 0.0) {
            drawLine(c.shape1.position.x, c.shape1.position.y, c.shape1.position.x + (c.otherUnitVectorX * length), c.shape1.position.y + (c.otherUnitVectorY * length));
            drawPoint(c.shape1.position.x + c.otherSeparationX, c.shape1.position.y + c.otherSeparationY);
        }

    } //drawShapeCollision


//Internal API


        /** Draw a list of points as lines */
    function drawVertList( _verts : Array<Vector> ) {

        var _count : Int = _verts.length;

        if(_count == 2) {
            drawLine(_verts[0].x, _verts[0].y, _verts[1].x, _verts[1].y, true);
            return;
        }

        if(_count == 1) {
            drawPoint(_verts[0].x, _verts[0].y);
            return;
        }

            //start the polygon by drawing this start point
        drawLine(_verts[0].x, _verts[0].y, _verts[1].x, _verts[1].y, true);

            //draw the rest of the points
        for(i in 1 ... _count-1) {
            drawLine(_verts[i].x, _verts[i].y, _verts[i+1].x, _verts[i+1].y, false);
        }
            //join last point to first point
        drawLine(_verts[_count-1].x, _verts[_count-1].y, _verts[0].x, _verts[0].y, false);

    } //drawVertList


} //ShapeDrawer

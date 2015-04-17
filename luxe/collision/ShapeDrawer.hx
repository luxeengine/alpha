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
    public function drawLine( p0:Vector, p1:Vector, ?startPoint:Bool = true ) {

    } //drawLine

        /** Draw a `Shape`, it will determine the type and draw it for you. */
    public function drawShape( shape:Shape ) {

        if(Std.is(shape, Polygon)) {
            drawPolygon(cast(shape, Polygon));
            return;
        } else { //circle
            drawCircle(cast(shape, Circle));
            return;
        }

    } //drawShape

        /** Draw a `Polygon` */
    public function drawPolygon( poly:Polygon ) {

        var v : Array<Vector> = poly.transformedVertices.copy();

        drawVertList( v );

    } //drawPolygon

        /** Draw a `Vector` (with magnitude) */
    public function drawVector( v:Vector, start:Vector, ?startPoint:Bool = true ) {

        drawLine( start, v );

    } //drawVector

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

            _verts.push( new Vector(__x,__y));

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

    public function drawPoint( point:Vector, size:Float = 4 ) {

        var xs = point.x - size;
        var xe = point.x + size;
        var ys = point.y;
        var ye = point.y;

        drawLine( new Vector(xs, ys), new Vector(xe, ye) );

        xs = xe = point.x;
        ys = point.y - size;
        ye = point.y + size;

        drawLine( new Vector(xs, ys), new Vector(xe, ye) );

    } //drawPoint

    public function drawShapeCollision( data:ShapeCollision, ?length:Float = 30 ) {

        var shape1_o = new Vector(data.shape1.position.x, data.shape1.position.y);
        var shape2_o = new Vector(data.shape2.position.x, data.shape2.position.y);

        //origins

        drawPoint(shape1_o);
        drawPoint(shape2_o);

        //unit vectors

        var unit_line_end = new Vector( shape1_o.x + (data.unitVector.x * length), shape1_o.y + (data.unitVector.y * length) );

        drawLine( shape1_o, unit_line_end );

        //ghosts

        var shape1p = shape1_o.clone().add(data.separation);

        drawPoint(shape1p);

    } //drawShapeCollision


//Internal API


        /** Draw a list of points as lines */
    function drawVertList( _verts : Array<Vector> ) {

        var _count : Int = _verts.length;
        if(_count < 3) {
            throw "cannot draw polygon with < 3 verts as this is a line or a point.";
        }

            //start the polygon by drawing this start point
        drawLine( _verts[0], _verts[1], true );

            //draw the rest of the points
        for(i in 1 ... _count-1) {
            drawLine( _verts[i], _verts[i+1], false );
        }
            //join last point to first point
        drawLine( _verts[_count-1], _verts[0], false );

    } //drawVertList


} //ShapeDrawer

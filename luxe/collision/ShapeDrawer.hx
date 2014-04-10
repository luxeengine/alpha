package luxe.collision;

import luxe.collision.shapes.Circle;
import luxe.collision.shapes.Polygon;

import luxe.Color;
import luxe.Vector;

class ShapeDrawer {

    public function new() {}

        //To implement your own shape drawing class, you only need to override this function and implement it
        //the rest is handled internally, or you can override specifics if you want.
    public function drawLine( p0:Vector, p1:Vector, ?color:Color, ?immediate:Bool = false ) {
        
    } //drawLine

    public function drawPolygon( poly:Polygon, ?color:Color, ?immediate:Bool = false ) {

        var v : Array<Vector> = poly.transformedVertices.copy();
        
        drawVertList( v, color, immediate );

    } //drawPolygon

    public function drawVector( v:Vector, start:Vector, ?color:Color, ?immediate:Bool = false  ) {
        
        drawLine( start, v, color, immediate );

    } //drawVector

    private function drawVertList( _verts : Array<Vector>, ?color:Color, ?immediate:Bool = false ) {

        var _count : Int = _verts.length;
        if(_count < 3) {
            throw "cannot draw polygon with < 3 verts as this is a line or a point.";
        }

            //start at one, and draw from 1 to 0 (backward)
        for(i in 1 ... _count) {
            drawLine( _verts[i], _verts[i-1], color, immediate );
        }

            //finish the polygon by drawing the final point to the first point
        drawLine( _verts[_count-1], _verts[0], color, immediate );

    } //drawVertList

    public function drawCircle( circle:Circle, ?color:Color, ?immediate:Bool = false ) {
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
        drawVertList( _verts, color, immediate );

    } //drawCircle


} //ShapeDrawer
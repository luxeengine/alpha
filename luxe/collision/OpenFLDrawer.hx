package hxcollision;

import flash.display.Graphics;

import hxcollision.shapes.Circle;
import hxcollision.shapes.Polygon;
import hxcollision.math.Vector2D;

class OpenFLDrawer extends ShapeDrawer {
        
    public var graphics : Graphics;

    public function new( _graphics : Graphics ) {
        super();
        graphics = _graphics;
    } //new

        //To implement your own shape drawing class, you only need to override this drawLine function and implement it
        //the rest is handled internally, or you can override specifics if you want (like drawCircle is custom here, by choice. Not required!)

    public override function drawLine( p0:Vector2D, p1:Vector2D ) {
        
        if(graphics != null) {
            graphics.moveTo( p0.x, p0.y );
            graphics.lineTo( p1.x, p1.y);
        } //graphics != null

    } //drawLine

    public override function drawCircle( circle:Circle ) { 

        if(graphics != null) {
            graphics.drawCircle( circle.x, circle.y, circle.transformedRadius );
        } //graphics != null

    } //drawCircle

} //OpenFLDrawer
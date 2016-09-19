package luxe.collision.shapes;

import luxe.Vector;
import luxe.collision.shapes.*;
import luxe.collision.data.*;
import luxe.collision.sat.*;

/** A circle collision shape */
class Circle extends Shape {

        /** The radius of this circle. Set on construction */
    public var radius( get_radius, never ) : Float;
        /** The transformed radius of this circle, based on the scale/rotation */
    public var transformedRadius( get_transformedRadius, never ) : Float;

    var _radius:Float;

    public function new(x:Float, y:Float, radius:Float) {

        super( x, y );
        _radius = radius;
        name = 'circle ' + _radius;

    } //new

        /** Test for collision against a shape. */
    override public function test( shape:Shape, ?into:ShapeCollision ) : ShapeCollision {

        return shape.testCircle( this, into, true );

    } //test

        /** Test for collision against a circle. */
    override public function testCircle( circle:Circle, ?into:ShapeCollision, flip:Bool = false ) : ShapeCollision {

        return SAT2D.testCircleVsCircle( this, circle, into, flip );

    } //testCircle

        /** Test for collision against a polygon. */
    override public function testPolygon( polygon:Polygon, ?into:ShapeCollision, flip:Bool = false ) : ShapeCollision {

        return SAT2D.testCircleVsPolygon( this, polygon, into, flip );

    } //testPolygon

        /** Test for collision against a ray. */
    override public function testRay( ray:Ray, ?into:RayCollision ) : RayCollision {

        return SAT2D.testRayVsCircle(ray, this, into);

    } //testRay

//Internal API

    function get_radius():Float {

        return _radius;

    } //get_radius

    function get_transformedRadius():Float {

        return _radius * scaleX;

    } //get_transformedRadius

} //Circle

package luxe.collision.shapes;

import luxe.Vector;
import luxe.collision.shapes.*;
import luxe.collision.data.*;
import luxe.collision.sat.*;

/** A polygonal collision shape */
class Polygon extends Shape {

        /** The transformed (rotated/scale) vertices cache */
    public var transformedVertices ( get, never ) : Array<Vector>;
        /** The vertices of this shape */
    public var vertices ( get, never ) : Array<Vector>;

    var _transformedVertices : Array<Vector>;
    var _vertices : Array<Vector>;


        /** Create a new polygon with a given set of vertices at position x,y. */
    public function new( x:Float, y:Float, vertices:Array<Vector> ) {

        super( x,y );

        name = 'polygon(sides:${vertices.length})';

        _transformedVertices = new Array<Vector>();
        _vertices = vertices;

    } //new

        /** Test for a collision with a shape. */
    override public function test( shape:Shape, ?into:ShapeCollision ) : ShapeCollision {

        return shape.testPolygon(this, into, true);

    } //test

        /** Test for a collision with a circle. */
    override public function testCircle( circle:Circle, ?into:ShapeCollision, flip:Bool = false ) : ShapeCollision {

        return SAT2D.testCircleVsPolygon( circle, this, into, !flip );

    } //testCircle

        /** Test for a collision with a polygon. */
    override public function testPolygon( polygon:Polygon, ?into:ShapeCollision, flip:Bool = false ) : ShapeCollision {

        return SAT2D.testPolygonVsPolygon( this, polygon, into, flip );

    } //testPolygon

        /** Test for a collision with a ray. */
    override public function testRay( ray:Ray, ?into:RayCollision ) : RayCollision {

        return SAT2D.testRayVsPolygon(ray, this);

    } //testRay

        /** Destroy this polygon and clean up. */
    override public function destroy() : Void {

        var _count : Int = _vertices.length;

        for(i in 0 ... _count) {
            _vertices[i] = null;
        }

        _transformedVertices = null;
        _vertices = null;

        super.destroy();

    } //destroy

//Public static API

        /** Helper to create an Ngon at x,y with given number of sides, and radius.
            A default radius of 100 if unspecified. Returns a ready made `Polygon` collision `Shape` */
    public static function create( x:Float, y:Float, sides:Int, radius:Float=100):Polygon {

        if(sides < 3) {
            throw 'Polygon - Needs at least 3 sides';
        }

        var rotation:Float = (Math.PI * 2) / sides;
        var angle:Float;
        var vector:Vector;
        var vertices:Array<Vector> = new Array<Vector>();

        for(i in 0 ... sides) {
            angle = (i * rotation) + ((Math.PI - rotation) * 0.5);
            vector = new Vector();
            vector.x = Math.cos(angle) * radius;
            vector.y = Math.sin(angle) * radius;
            vertices.push(vector);
        }

        return new Polygon(x,y,vertices);

    } //create

        /** Helper generate a rectangle at x,y with a given width/height and centered state.
            Centered by default. Returns a ready made `Polygon` collision `Shape` */
    public static function rectangle(x:Float, y:Float, width:Float, height:Float, centered:Bool = true):Polygon {

        var vertices:Array<Vector> = new Array<Vector>();

        if(centered) {

            vertices.push( new Vector( -width / 2, -height / 2) );
            vertices.push( new Vector(  width / 2, -height / 2) );
            vertices.push( new Vector(  width / 2,  height / 2) );
            vertices.push( new Vector( -width / 2,  height / 2) );

        } else {

            vertices.push( new Vector( 0, 0 ) );
            vertices.push( new Vector( width, 0 ) );
            vertices.push( new Vector( width, height) );
            vertices.push( new Vector( 0, height) );

        }

        return new Polygon(x,y,vertices);

    } //rectangle

        /** Helper generate a square at x,y with a given width/height with given centered state.
            Centered by default. Returns a ready made `Polygon` collision `Shape` */
    public static inline function square(x:Float, y:Float, width:Float, centered:Bool = true) : Polygon {

        return rectangle(x, y, width, width, centered);

    } //square

        /** Helper generate a triangle at x,y with a given radius.
            Returns a ready made `Polygon` collision `Shape` */
    public static function triangle(x:Float, y:Float, radius:Float) : Polygon {

        return create(x, y, 3, radius);

    } //triangle

//Internal

    function get_transformedVertices() : Array<Vector> {

        if(!_transformed) {
            _transformedVertices = new Array<Vector>();
            _transformed = true;

            var _count : Int = _vertices.length;

            for(i in 0..._count) {
                _transformedVertices.push( _vertices[i].clone().transform( _transformMatrix ) );
            }
        }

        return _transformedVertices;
    }

    function get_vertices() : Array<Vector> {
        return _vertices;
    }

} //Polygon

package luxe.collision.shapes;

import luxe.collision.shapes.Shape;
import luxe.Vector;

/** A polygon collision shape */
class Polygon extends Shape {
    
        /** Create a new polygon with a given set of vertices at position x,y. */
    public function new( x:Float, y:Float, vertices:Array<Vector> ) {

        super( x,y );
        
        name = vertices.length + 'polygon';

        _vertices = vertices;           
    
    } //new
        
        /** Destroy this polygon and clean up. */
    override public function destroy() : Void {

        var _count : Int = _vertices.length;
        for(i in 0 ... _count) {
            _vertices[i] = null;
        }

        _vertices = null;
        super.destroy();

    } //destroy

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
    public static function square(x:Float, y:Float, width:Float, centered:Bool = true):Polygon {
        return rectangle(x, y, width, width, centered);
    } //square

        /** Helper generate a triangle at x,y with a given radius. 
            Returns a ready made `Polygon` collision `Shape` */
    public static function triangle(x:Float, y:Float, radius:Float):Polygon {
        return create(x, y, 3, radius);
    } //triangle

} //Polygon


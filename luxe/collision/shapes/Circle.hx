package luxe.collision.shapes;

import luxe.collision.shapes.Shape;

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

//Internal API

    function get_radius():Float {
        
        return _radius;

    } //get_radius
    
    function get_transformedRadius():Float {
        
        return _radius * scaleX;

    } //get_transformedRadius

} //Circle

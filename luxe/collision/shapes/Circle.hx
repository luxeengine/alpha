package luxe.collision.shapes;

import luxe.collision.shapes.Shape;
    
class Circle extends Shape {

    public var radius               ( get, never ) : Float;
    public var transformedRadius    ( get, never ) : Float;

    var _radius:Float;
    
    public function new(x:Float, y:Float, radius:Float) {

        super( x, y );
        _radius = radius;
        name = 'circle ' + _radius;
        
    } //new

    function get_radius():Float {
        return _radius;
    } //get_radius
    
    function get_transformedRadius():Float {
        return _radius * scaleX;
    } //get_transformedRadius

} //Circle

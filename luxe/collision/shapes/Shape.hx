package luxe.collision.shapes;

import luxe.Vector;
import luxe.Quaternion;
import luxe.collision.shapes.*;
import luxe.collision.data.*;

/** A base collision shape */
class Shape {


        /** The state of this shape, if inactive can be ignored in results */
    public var active : Bool = true;
        /** The name of this shape, to help in debugging */
    public var name : String = 'shape';
        /** A generic data object where you can store anything you want, for later use */
    public var data : Dynamic;
        /** A list of tags to use for marking shapes with data for later use, by key/value */
    public var tags : Map<String, String>;
        /** The position of this shape */
    public var position ( get, set ) : Vector;
        /** The x position of this shape */
    public var x ( get, set ) : Float;
        /** The y position of this shape */
    public var y ( get, set ) : Float;
        /** The rotation of this shape, in degrees */
    public var rotation ( get, set ) : Float;
        /** The scale in the x direction of this shape */
    public var scaleX ( get, set ) : Float;
        /** The scale in the y direction of this shape */
    public var scaleY ( get, set ) : Float;

    var _position : Vector;
    var _rotation : Float = 0;
    var _rotation_radians : Float = 0;
    var _rotation_quat : Quaternion;
    var _scale : Vector;

    var _scaleX : Float = 1;
    var _scaleY : Float = 1;

    var _transformed : Bool = false;
    var _transformMatrix : Matrix;


//Public API


       /** Create a new shape at give position x,y */
    public function new( _x:Float, _y:Float ) {

        tags = new Map();

        _position = new Vector(_x,_y);
        _scale = new Vector(1,1);
        _rotation_quat = new Quaternion();
        _rotation = 0;

        _scaleX = 1;
        _scaleY = 1;

        _transformMatrix = new Matrix();
        _transformMatrix.makeTranslation( _position.x, _position.y, 0 );

    } //new

//Implemented in subclasses

        /** Test this shape against another shape. */
    public function test( shape:Shape ) : ShapeCollision return null;
        /** Test this shape against a circle. */
    public function testCircle( circle:Circle, flip:Bool = false ) : ShapeCollision return null;
        /** Test this shape against a polygon. */
    public function testPolygon( polygon:Polygon, flip:Bool = false ) : ShapeCollision return null;
        /** Test this shape against a ray. */
    public function testRay( ray:Ray ) : RayCollision return null;

        /** clean up and destroy this shape */
    public function destroy():Void {

        _position = null;
        _scale = null;
        _transformMatrix = null;
        _rotation_quat = null;

    } //destroy

//Getters/Setters

    function refresh_transform() {

        _rotation_quat.setFromEuler( new Vector(0,0,_rotation_radians) );

        _transformMatrix.compose( _position, _rotation_quat, _scale );
        _transformed = false;

    }

//.position

    function get_position() : Vector {
        return _position;
    }

    function set_position( v : Vector ) : Vector {
        _position = v;
        refresh_transform();
        return _position;
    }

//.x

    function get_x() : Float {
        return _position.x;
    }

    function set_x(x : Float) : Float {
        _position.x = x;
        refresh_transform();
        return _position.x;
    }

//.y

    function get_y() : Float {
        return _position.y;
    }

    function set_y(y : Float) : Float {
        _position.y = y;
        refresh_transform();
        return _position.y;
    }

//.rotation

    function get_rotation() : Float {
        return _rotation;
    }

    function set_rotation( v : Float ) : Float {

        _rotation_radians = v * (Math.PI / 180);

        refresh_transform();

        return _rotation = v;

    } //set_rotation

//.scaleX

    function get_scaleX():Float {
        return _scaleX;
    }

    function set_scaleX( scale : Float ) : Float {
        _scaleX = scale;
        _scale.x = _scaleX;
        refresh_transform();
        return _scaleX;
    }

//.scaleY

    function get_scaleY():Float {
        return _scaleY;
    }

    function set_scaleY(scale:Float) : Float {
        _scaleY = scale;
        _scale.y = _scaleY;
        refresh_transform();
        return _scaleY;
    }

}

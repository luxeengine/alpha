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
    var _rotation_euler : Vector;
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
        _rotation_euler = new Vector();
        _rotation = 0;

        _scaleX = 1;
        _scaleY = 1;

        Vector.Listen(_position, _pos_changed);

        _transformMatrix = new Matrix();
        _transformMatrix.makeTranslation( _position.x, _position.y, 0 );

    } //new

//Implemented in subclasses

        /** Test this shape against another shape. */
    public function test( shape:Shape, ?into:ShapeCollision ) : ShapeCollision return null;
        /** Test this shape against a circle. */
    public function testCircle( circle:Circle, ?into:ShapeCollision, flip:Bool = false ) : ShapeCollision return null;
        /** Test this shape against a polygon. */
    public function testPolygon( polygon:Polygon, ?into:ShapeCollision, flip:Bool = false ) : ShapeCollision return null;
        /** Test this shape against a ray. */
    public function testRay( ray:Ray, ?into:RayCollision ) : RayCollision return null;

        /** clean up and destroy this shape */
    public function destroy():Void {

        _position = null;
        _scale = null;
        _transformMatrix = null;
        _rotation_quat = null;
        _rotation_euler = null;

    } //destroy

//Getters/Setters

    function refresh_transform() {

        if(_position == null) return;

        _rotation_euler.z = _rotation_radians;
        _rotation_quat.setFromEuler(_rotation_euler);

        _transformMatrix.compose( _position, _rotation_quat, _scale );
        _transformed = false;

    }

//.position

    inline function get_position() : Vector {
        return _position;
    }

    inline function set_position( v : Vector ) : Vector {

        _position = v;
        refresh_transform();

        if(_position != null) Vector.Listen(_position, _pos_changed);

        return _position;

    } //set_position

//.x

    inline function get_x() : Float {
        return _position.x;
    }

    inline function set_x(x : Float) : Float {
        _position.ignore_listeners = true;
        _position.x = x;
        refresh_transform();
        _position.ignore_listeners = false;
        return _position.x;
    }

//.y

    inline function get_y() : Float {
        return _position.y;
    }

    inline function set_y(y : Float) : Float {
        _position.ignore_listeners = true;
        _position.y = y;
        refresh_transform();
        _position.ignore_listeners = false;
        return _position.y;
    }

//.rotation

    inline function get_rotation() : Float {
        return _rotation;
    }

    inline function set_rotation( v : Float ) : Float {

        _rotation_radians = v * (Math.PI / 180);

        refresh_transform();

        return _rotation = v;

    } //set_rotation

//.scaleX

    inline function get_scaleX():Float {
        return _scaleX;
    }

    inline function set_scaleX( scale : Float ) : Float {
        _scaleX = scale;
        _scale.x = _scaleX;
        refresh_transform();
        return _scaleX;
    }

//.scaleY

    inline function get_scaleY():Float {
        return _scaleY;
    }

    inline function set_scaleY(scale:Float) : Float {
        _scaleY = scale;
        _scale.y = _scaleY;
        refresh_transform();
        return _scaleY;
    }


//internal

    inline function _pos_changed(_)     refresh_transform();

}

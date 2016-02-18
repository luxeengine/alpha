package phoenix;

import luxe.utils.Maths;
import luxe.Log.*;

class Vector {

    @:isVar public var x (default, set) : Float = 0;
    @:isVar public var y (default, set) : Float = 0;
    @:isVar public var z (default, set) : Float = 0;
    @:isVar public var w (default, default) : Float = 0;

    @:isVar public var length        (get, set) : Float;
    @:isVar public var lengthsq      (get, null) : Float;
    @:isVar public var angle2D       (get, set) : Float;
    @:isVar public var normalized    (get, null) : Vector;
    @:isVar public var inverted      (get, null) : Vector;

    public var ignore_listeners : Bool = false;

    @:isVar public var listen_x(default,default) : Float -> Void;
    @:isVar public var listen_y(default,default) : Float -> Void;
    @:isVar public var listen_z(default,default) : Float -> Void;

    var _construct = false;

    public inline function new( _x:Float = 0, _y:Float = 0, _z:Float = 0, _w:Float = 0 ) {

        _construct = true;

            x = _x;
            y = _y;
            z = _z;
            w = _w;

        _construct = false;

    } //new

    public inline function copy_from( _other:Vector ) {

        set( _other.x, _other.y, _other.z, _other.w );

        return this;

    } //copy_from

    public inline function set( _x:Float, _y:Float, _z:Float, _w:Float ) {

        var prev = ignore_listeners;

        ignore_listeners = true;

            x = _x;
            y = _y;
            z = _z;
            w = _w;

        ignore_listeners = prev;

        if(listen_x != null && !ignore_listeners) listen_x(x);
        if(listen_y != null && !ignore_listeners) listen_y(y);
        if(listen_z != null && !ignore_listeners) listen_z(z);

        return this;

    } //set

    public inline function set_xy( _x:Float, _y:Float ) {

        var prev = ignore_listeners;

        ignore_listeners = true;

            x = _x;
            y = _y;

        ignore_listeners = prev;

        if(listen_x != null && !ignore_listeners) listen_x(x);
        if(listen_y != null && !ignore_listeners) listen_y(y);

        return this;

    } //set_xy

    public inline function set_xyz( _x:Float, _y:Float, _z:Float ) {

        var prev = ignore_listeners;

        ignore_listeners = true;

            x = _x;
            y = _y;
            z = _z;

        ignore_listeners = prev;

        if(listen_x != null && !ignore_listeners) listen_x(x);
        if(listen_y != null && !ignore_listeners) listen_y(y);
        if(listen_z != null && !ignore_listeners) listen_z(z);

        return this;

    } //set_xyz

        //_t is between 0 and 1
    public inline function lerp_xy( _dest_x:Float, _dest_y:Float, _t: Float ) {

        set_xy(
            Maths.lerp(x, _dest_x, _t),
            Maths.lerp(y, _dest_y, _t)
        );

        return this;

    } //lerp_xy

        //_t is between 0 and 1
    public inline function lerp_xyz( _dest_x:Float, _dest_y:Float, _dest_z:Float, _t: Float ) {

        set_xyz(
            Maths.lerp(x, _dest_x, _t),
            Maths.lerp(y, _dest_y, _t),
            Maths.lerp(z, _dest_z, _t)
        );

        return this;

    } //lerp_xyz

        //_t is between 0 and 1
    public inline function lerp( _other:Vector, _t: Float ) {

        set_xyz(
            Maths.lerp(x, _other.x, _t),
            Maths.lerp(y, _other.y, _t),
            Maths.lerp(z, _other.z, _t)
        );

        return this;

    } //lerp

    public inline function weighted_average_xy( _dest_x:Float, _dest_y:Float, _slowness:Float ) {

        set_xy(
            Maths.weighted_avg(x, _dest_x, _slowness),
            Maths.weighted_avg(y, _dest_y, _slowness)
        );

        return this;

    } //weighted_average_xy

    public inline function weighted_average_xyz( _dest_x:Float, _dest_y:Float, _dest_z:Float, _slowness:Float ) {

        set_xyz(
            Maths.weighted_avg(x, _dest_x, _slowness),
            Maths.weighted_avg(y, _dest_y, _slowness),
            Maths.weighted_avg(z, _dest_z, _slowness)
        );

        return this;

    } //weighted_average_xyz

    public inline function int() {

        set_xyz( Math.round(x), Math.round(y), Math.round(z) );

        return this;

    } //int

    public inline function int_x() {

        x = Math.round(x);

        return this;

    } //int_z

    public inline function int_y() {

        y = Math.round(y);

        return this;

    } //int_y

    public inline function int_z() {

        z = Math.round(z);

        return this;

    } //int_y

    inline function toString() {

        return "{ x:"+x + ", y:" + y + ", z:" + z  + " }" ;

    } //toString

    public inline function equals(other:Vector) {
        return (x == other.x && y == other.y && z == other.z && w == other.w);
    }

    public inline function clone() {
        return new Vector(x, y, z, w);
    } //clone

    public inline function normalize() {
        return divideScalar( length );
    } //normalize

    public inline function dot(other:Vector) {

        return x * other.x + y * other.y + z * other.z;

    } //dot


    public inline function cross( a:Vector, b:Vector ) {

        set_xyz( a.y * b.z - a.z * b.y,
                 a.z * b.x - a.x * b.z,
                 a.x * b.y - a.y * b.x );

        return this;

    } //cross

    public function invert() : Vector {

            set_xyz(-x, -y, -z);

        return this;

    } //invert

//Static Functions

    public static inline function Add(a:Vector, b:Vector) {
        return new Vector(
            a.x + b.x,
            a.y + b.y,
            a.z + b.z
        );
    } //Add

    public static inline function Subtract(a:Vector, b:Vector) {
        return new Vector(
            a.x - b.x,
            a.y - b.y,
            a.z - b.z
        );
    } //Subtract

    public static inline function MultiplyVector(a:Vector, b:Vector) : Vector {
        return new Vector(
            a.x * b.x,
            a.y * b.y,
            a.z * b.z
        );
    } //MultiplyVector

    public static inline function DivideVector(a:Vector, b:Vector) {
        return new Vector(
            a.x / b.x,
            a.y / b.y,
            a.z / b.z
        );
    } //DivideVector

    public static function Multiply(a:Vector, b:Float) {
        return new Vector(
            a.x * b,
            a.y * b,
            a.z * b
        );
    } //Multiply

    public static inline function Divide(a:Vector, b:Float) {
        return new Vector(
            a.x / b,
            a.y / b,
            a.z / b
        );
    } //Divide

    public static inline function AddScalar(a:Vector, b:Float) {
        return new Vector(
            a.x + b,
            a.y + b,
            a.z + b
        );
    } //AddScalar

    public static inline function SubtractScalar(a:Vector, b:Float) {
        return new Vector(
            a.x - b,
            a.y - b,
            a.z - b
        );
    } //SubtractScalar

    public static inline function Cross(a:Vector, b:Vector) {
        return new Vector(
             a.y * b.z - a.z * b.y,
             a.z * b.x - a.x * b.z,
             a.x * b.y - a.y * b.x
        );
    } //Cross

    public static inline function RotationTo(a:Vector,b:Vector) {

        return a.rotationTo(b);

    } //RotationTo

    public static function Listen( _v:Vector, listener ) {

        _v.listen_x = listener;
        _v.listen_y = listener;
        _v.listen_z = listener;

    } //Listen

// Operations

    public inline function add(other:Vector) {

        assertnull(other);

        set_xyz( x + other.x, y + other.y, z + other.z );

        return this;

    } //add

    public inline function add_xyz( _x:Float = 0, _y:Float = 0, _z:Float = 0 ) {

        set_xyz( x + _x, y + _y, z + _z);

        return this;

    } //add_xyz


    public inline function subtract(other:Vector) {

        assertnull(other);

        set_xyz( x - other.x, y - other.y, z - other.z );

        return this;

    } //subtract

    public inline function subtract_xyz( _x:Float = 0, _y:Float = 0, _z:Float = 0 ) {

        set_xyz( x - _x, y - _y, z - _z);

        return this;

    } //subtract_xyz

    public inline function multiply(other:Vector) {

        assertnull(other);

        set_xyz( x * other.x, y * other.y, z * other.z );

        return this;

    } //multiply

    public inline function multiply_xyz( _x:Float = 1, _y:Float = 1, _z:Float = 1 ) {

        set_xyz( x * _x, y * _y, z * _z);

        return this;

    } //multiply_xyz

    public inline function divide(other:Vector) {

        assertnull(other);
        assert(other.x != 0, 'Vector: division by zero (other.x)');
        assert(other.y != 0, 'Vector: division by zero (other.y)');

        set_xyz( x / other.x, y / other.y, z / other.z );

        return this;

    } //divide

    public inline function divide_xyz( _x:Float = 1, _y:Float = 1, _z:Float = 1 ) {

        assert(_x != 0, 'Vector.divide_xyz: division by zero (x)');
        assert(_y != 0, 'Vector.divide_xyz: division by zero (y)');
        assert(_z != 0, 'Vector.divide_xyz: division by zero (z)');

        set_xyz( x / _x, y / _y, z / _z);

        return this;

    } //multiply_xyz


    public inline function addScalar( v:Float ) {

        set_xyz( x + v, y + v, z + v );

        return this;

    } //addScalar

    public inline function subtractScalar( v:Float ) {

        set_xyz( x - v, y - v, z - v );

        return this;

    } //subtractScalar

     public inline function multiplyScalar( v:Float ) {

        set_xyz( x * v, y * v, z * v );

        return this;

    } //multiplyScalar

    public inline function divideScalar( v:Float ) : Vector {

        if ( v != 0 ) {

            set_xyz( x / v, y / v, z / v );

        } else {

            set_xyz(0, 0, 0);

        }

        return this;

    } //divideScalar


//Properties

    inline function set_length( value:Float ) : Float {

        normalize().multiplyScalar( value );

        return value;

    } //set_length

    inline function get_length() : Float {

        return Math.sqrt( x * x + y * y + z * z );

    } //get_length


    inline function get_lengthsq() : Float {

        return x * x + y * y + z * z;

    } //get_lengthsq

    inline function get_normalized() {

        return Vector.Divide( this, length );

    } //get_normalized

    inline function set_x(_x:Float) : Float {

        x = _x;

        if(_construct) return x;

            if(listen_x != null && !ignore_listeners) listen_x(_x);

        return x;

    } //set_x

    inline function set_y(_y:Float) : Float {

        y = _y;

        if(_construct) return y;

            if(listen_y != null && !ignore_listeners) listen_y(_y);

        return y;

    } //set_y

    inline function set_z(_z:Float) : Float {

        z = _z;

        if(_construct) return z;

            if(listen_z != null && !ignore_listeners) listen_z(_z);

        return z;

    } //set_z

    inline function get_inverted() : Vector {

        return new Vector(-x,-y,-z);

    } //get_inverted


        //Changes the angle of the vector.
        //X and Y will change, length stays the same.
    inline function set_angle2D( value : Float ) : Float {

        var len:Float = length;

            set_xy(Math.cos(value) * len, Math.sin(value) * len);

        return value;
    }

        //Get the angle of this vector.
    inline function get_angle2D():Float {

        return Math.atan2(y, x);

    }

//Convenience functions

        //Sets the length under the given value.
        //Nothing is done if the vector is already shorter.
        //max The max length this vector can be.
    public inline function truncate( max:Float ) : Vector {

        length = Math.min(max, length);

        return this;

    } //truncate

    public inline function rotationTo( other:Vector ) : Float {
        var theta =  Math.atan2(  other.x - x , other.y - y );
        var r = -(180.0 + (theta*180.0/Math.PI));
        return r;
    }

//Transforms

    public inline function applyQuaternion( q:Quaternion ) : Vector {

        var qx = q.x;
        var qy = q.y;
        var qz = q.z;
        var qw = q.w;

        var ix = qw * x + qy * z - qz * y;
        var iy = qw * y + qz * x - qx * z;
        var iz = qw * z + qx * y - qy * x;
        var iw = -qx * x - qy * y - qz * z;

            set_xyz( ix * qw + iw * -qx + iy * -qz - iz * -qy,
                     iy * qw + iw * -qy + iz * -qx - ix * -qz,
                     iz * qw + iw * -qz + ix * -qy - iy * -qx );

        return this;

    } //applyQuaternion

    public inline function applyProjection( m:Matrix ) : Vector {

        var e = m.elements;
        var x = this.x, y = this.y, z = this.z;
        var d:Float = 1 / (e[3] * x + e[7] * y + e[11] * z + e[15]);

            set_xyz( (e[0] * x + e[4] * y + e[8] * z + e[12]) * d,
                     (e[1] * x + e[5] * y + e[9] * z + e[13]) * d,
                     (e[2] * x + e[6] * y + e[10] * z + e[14]) * d );

        return this;

    } //applyProjection

    public inline function transform( _m:Matrix ) : Vector {

        var _x = x;
        var _y = y;
        var _z = z;

        var e = _m.elements;

            set_xyz( e[0] * _x + e[4] * _y + e[8]  * _z + e[12],
                     e[1] * _x + e[5] * _y + e[9]  * _z + e[13],
                     e[2] * _x + e[6] * _y + e[10] * _z + e[14] );

        return this;

    } //transform

    public inline function transformDirection( m:Matrix ) : Vector {

        var e = m.elements;
        var x = this.x, y = this.y, z = this.z;

            set_xyz( e[0] * x + e[4] * y + e[8] * z,
                     e[1] * x + e[5] * y + e[9] * z,
                     e[2] * x + e[6] * y + e[10] * z );

        normalize();

        return this;

    } //transformDirection

    public inline function setEulerFromRotationMatrix (m:Matrix, order:ComponentOrder = XYZ) : Vector {

        var te = m.elements;
        var m11 = te[0], m12 = te[4], m13 = te[8];
        var m21 = te[1], m22 = te[5], m23 = te[9];
        var m31 = te[2], m32 = te[6], m33 = te[10];

        var _x = x;
        var _y = y;
        var _z = z;

        if (order == XYZ) {

            _y = Math.asin( Maths.clamp( m13, -1, 1 ) );

            if (Math.abs(m13) < 0.99999)
            {
                _x = Math.atan2( -m23, m33);
                _z = Math.atan2( -m12, m11);
            } else {
                _x = Math.atan2( m32, m22 );
                _z = 0;
            }

        }  else if ( order == YXZ ) {

            _x = Math.asin( -Maths.clamp( m23, -1, 1 ) );

            if ( Math.abs( m23 ) < 0.99999 ) {
                _y = Math.atan2( m13, m33 );
                _z = Math.atan2( m21, m22 );
            } else {
                _y = Math.atan2( -m31, m11 );
                _z = 0;
            }

        } else if ( order == ZXY ) {

            _x = Math.asin( Maths.clamp( m32, -1, 1 ) );

            if ( Math.abs( m32 ) < 0.99999 ) {
                _y = Math.atan2( -m31, m33 );
                _z = Math.atan2( -m12, m22 );
            } else {
                _y = 0;
                _z = Math.atan2( m21, m11 );
            }

        } else if ( order == ZYX ) {

            _y = Math.asin( -Maths.clamp( m31, -1, 1 ) );

            if ( Math.abs( m31 ) < 0.99999 ) {
                _x = Math.atan2( m32, m33 );
                _z = Math.atan2( m21, m11 );
            } else {
                _x = 0;
                _z = Math.atan2( -m12, m22 );
            }

        } else if ( order == YZX ) {

            _z = Math.asin( Maths.clamp( m21, -1, 1 ) );

            if ( Math.abs( m21 ) < 0.99999 ) {
                _x = Math.atan2( -m23, m22 );
                _y = Math.atan2( -m31, m11 );
            } else {
                _x = 0;
                _y = Math.atan2( m13, m33 );
            }

        } else if ( order == XZY ) {

            _z = Math.asin( -Maths.clamp( m12, -1, 1 ) );

            if ( Math.abs( m12 ) < 0.99999 ) {
                _x = Math.atan2( m32, m22 );
                _y = Math.atan2( m13, m11 );
            } else {
                _x = Math.atan2( -m23, m33 );
                _y = 0;
            }

        } //order

        set_xyz(_x, _y, _z);

        return this;

    } //setEulerFromRotationMatrix

    public inline function setEulerFromQuaternion (q:Quaternion, order:ComponentOrder = XYZ) : Vector {

        var sqx : Float = q.x * q.x;
        var sqy : Float = q.y * q.y;
        var sqz : Float = q.z * q.z;
        var sqw : Float = q.w * q.w;

        var _x = x;
        var _y = y;
        var _z = z;

        if (order == XYZ) {
            _x = Math.atan2( 2 * ( q.x * q.w - q.y * q.z ), ( sqw - sqx - sqy + sqz ) );
            _y = Math.asin(  Maths.clamp( 2 * ( q.x * q.z + q.y * q.w ), -1, 1 ) );
            _z = Math.atan2( 2 * ( q.z * q.w - q.x * q.y ), ( sqw + sqx - sqy - sqz ) );
        } else if ( order ==  YXZ ) {
            _x = Math.asin(  Maths.clamp( 2 * ( q.x * q.w - q.y * q.z ), -1, 1 ) );
            _y = Math.atan2( 2 * ( q.x * q.z + q.y * q.w ), ( sqw - sqx - sqy + sqz ) );
            _z = Math.atan2( 2 * ( q.x * q.y + q.z * q.w ), ( sqw - sqx + sqy - sqz ) );
        } else if ( order == ZXY ) {
            _x = Math.asin(  Maths.clamp( 2 * ( q.x * q.w + q.y * q.z ), -1, 1 ) );
            _y = Math.atan2( 2 * ( q.y * q.w - q.z * q.x ), ( sqw - sqx - sqy + sqz ) );
            _z = Math.atan2( 2 * ( q.z * q.w - q.x * q.y ), ( sqw - sqx + sqy - sqz ) );
        } else if ( order == ZYX ) {
            _x = Math.atan2( 2 * ( q.x * q.w + q.z * q.y ), ( sqw - sqx - sqy + sqz ) );
            _y = Math.asin(  Maths.clamp( 2 * ( q.y * q.w - q.x * q.z ), -1, 1 ) );
            _z = Math.atan2( 2 * ( q.x * q.y + q.z * q.w ), ( sqw + sqx - sqy - sqz ) );
        } else if ( order == YZX ) {
            _x = Math.atan2( 2 * ( q.x * q.w - q.z * q.y ), ( sqw - sqx + sqy - sqz ) );
            _y = Math.atan2( 2 * ( q.y * q.w - q.x * q.z ), ( sqw + sqx - sqy - sqz ) );
            _z = Math.asin(  Maths.clamp( 2 * ( q.x * q.y + q.z * q.w ), -1, 1 ) );
        } else if ( order == XZY ) {
            _x = Math.atan2( 2 * ( q.x * q.w + q.y * q.z ), ( sqw - sqx + sqy - sqz ) );
            _y = Math.atan2( 2 * ( q.x * q.z + q.y * q.w ), ( sqw + sqx - sqy - sqz ) );
            _z = Math.asin(  Maths.clamp( 2 * ( q.z * q.w - q.x * q.y ), -1, 1 ) );
        } //order

        set_xyz(_x,_y,_z);

        return this;

    } //setEulerFromQuaternion

    public inline function degrees() : Vector {

        set_xyz( Maths.degrees(x), Maths.degrees(y), Maths.degrees(z) );

        return this;

    } //degrees

    public inline function radians() : Vector {

        set_xyz( Maths.radians(x), Maths.radians(y), Maths.radians(z) );

        return this;

    } //radians

    public static function Degrees( _radian_vector:Vector ) : Vector {

        return _radian_vector.clone().degrees();

    } //Degrees

    public static function Radians( _degree_vector:Vector ) : Vector {

        return _degree_vector.clone().radians();

    } //Radians

} //Vector class



@:enum abstract ComponentOrder(Int) from Int to Int {

    var XYZ = 0;
    var YXZ = 1;
    var ZXY = 2;
    var ZYX = 3;
    var YZX = 4;
    var XZY = 5;

} //ComponentOrder


@:forward
abstract Vec(Vector) from Vector to Vector {

    public inline function new(?_x,?_y,?_z,?_w) {
        this = new Vector(_x,_y,_z,_w);
    }
//multiply
    @:communitative @:op(A * B) static inline function _multiply(lhs:Vec, rhs:Vec) : Vec {
        return Vector.MultiplyVector(lhs, rhs);
    }
    @:communitative @:op(A * B) static inline function _multiply_scalar(lhs:Vec, rhs:Float) : Vec {
        return Vector.Multiply(lhs, rhs);
    }
    @:communitative @:op(A * B) static inline function _multiply_scalar_int(lhs:Vec, rhs:Int) : Vec {
        return Vector.Multiply(lhs, rhs);
    }
// divide
    @:communitative @:op(A / B) static inline function _divide(lhs:Vec, rhs:Vec) : Vec {
        return Vector.DivideVector(lhs, rhs);
    }
    @:communitative @:op(A / B) static inline function _divide_scalar(lhs:Vec, rhs:Float) : Vec {
        return Vector.Divide(lhs, rhs);
    }
    @:communitative @:op(A / B) static inline function _divide_scalar_int(lhs:Vec, rhs:Int) : Vec {
        return Vector.Divide(lhs, rhs);
    }
// add
    @:communitative @:op(A + B) static inline function _add(lhs:Vec, rhs:Vec) : Vec {
        return Vector.Add(lhs, rhs);
    }
    @:communitative @:op(A + B) static inline function _add_scalar(lhs:Vec, rhs:Float) : Vec {
        return Vector.AddScalar(lhs, rhs);
    }
    @:communitative @:op(A + B) static inline function _add_scalar_int(lhs:Vec, rhs:Int) : Vec {
        return Vector.AddScalar(lhs, rhs);
    }
// subract
    @:communitative @:op(A - B) static inline function _subtract(lhs:Vec, rhs:Vec) : Vec {
        return Vector.Subtract(lhs,rhs);
    }
    @:communitative @:op(A - B) static inline function _subtract_scalar(lhs:Vec, rhs:Float) : Vec {
        return Vector.SubtractScalar(lhs,rhs);
    }
    @:communitative @:op(A - B) static inline function _subtract_scalar_int(lhs:Vec, rhs:Int) : Vec {
        return Vector.SubtractScalar(lhs,rhs);
    }
} //Vec

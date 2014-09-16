package phoenix;

import luxe.utils.Maths;

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

    public function new( _x:Float = 0, _y:Float = 0, _z:Float = 0, _w:Float = 0) {

        x = _x;
        y = _y;
        z = _z;
        w = _w;

    } //new

    public function copy_from( _other:Vector ) {
        x = _other.x;
        y = _other.y;
        z = _other.z;
        w = _other.w;
    }

    public function set_xyz( _x:Float, _y:Float, _z:Float ) {
        x = _x;
        y = _y;
        z = _z;
    }
    public function set_xyzw( _x:Float, _y:Float, _z:Float, _w:Float ) {
        x = _x;
        y = _y;
        z = _z;
        w = _w;
    }

    public function set_xy( _x:Float, _y:Float ) {
        x = _x;
        y = _y;
    }

    public function set( ?_x:Float, ?_y:Float, ?_z:Float, ?_w:Float ) : Vector {

        var _setx = x;
        var _sety = y;
        var _setz = z;
        var _setw = w;

            //assign new values
        if(_x != null) _setx = _x;
        if(_y != null) _sety = _y;
        if(_z != null) _setz = _z;
        if(_w != null) _setw = _w;

        x = _setx;
        y = _sety;
        z = _setz;
        w = _setw;

        return this;

    } //set

    public function int() {

        x = Math.round(x);
        y = Math.round(y);
        z = Math.round(z);

    } //int

    public function int_x() {
        x = Math.round(x);
    } //int_z

    public function int_y() {
        y = Math.round(y);
    } //int_y

    public function int_z() {
        z = Math.round(z);
    } //int_y

    function toString() {
        return "{ x:"+x + ", y:" + y + ", z:" + z  + " }" ;
    } //toString

    public function equals(other:Vector) {
        return (x == other.x && y == other.y && z == other.z && w == other.w);
    }

    public function clone() {
        return new Vector(x,y,z,w);
    } //clone

    public function normalize() {
        return divideScalar( length );
    } //normalize


    public function dot(other:Vector) {

        return x * other.x + y * other.y + z * other.z;

    } //dot


    public function cross( a:Vector, b:Vector ) {

        x = a.y * b.z - a.z * b.y;
        y = a.z * b.x - a.x * b.z;
        z = a.x * b.y - a.y * b.x;

        return this;

    } //cross

    public function invert() : Vector {

            x = -x;
            y = -y;
            z = -z;

        return this;

    } //invert

//Static Functions

    public static function Add(a:Vector, b:Vector) {
        return new Vector(
            a.x + b.x,
            a.y + b.y,
            a.z + b.z
        );
    } //Add

    public static function Subtract(a:Vector, b:Vector) {
        return new Vector(
            a.x - b.x,
            a.y - b.y,
            a.z - b.z
        );
    } //Subtract

    public static function MultiplyVector(a:Vector, b:Vector) : Vector {
        return new Vector(
            a.x * b.x,
            a.y * b.y,
            a.z * b.z
        );
    } //MultiplyVector

    public static function DivideVector(a:Vector, b:Vector) {
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

    public static function Divide(a:Vector, b:Float) {
        return new Vector(
            a.x / b,
            a.y / b,
            a.z / b
        );
    } //Divide

    public static function AddScalar(a:Vector, b:Float) {
        return new Vector(
            a.x + b,
            a.y + b,
            a.z + b
        );
    } //AddScalar

    public static function SubtractScalar(a:Vector, b:Float) {
        return new Vector(
            a.x - b,
            a.y - b,
            a.z - b
        );
    } //SubtractScalar

    public static function Cross(a:Vector, b:Vector) {
        return new Vector(
             a.y * b.z - a.z * b.y,
             a.z * b.x - a.x * b.z,
             a.x * b.y - a.y * b.x
        );
    } //Cross

    public static function RotationTo(a:Vector,b:Vector) {
        return a.rotationTo(b);
    } //RotationTo

    public static function listen( _v:Vector, listener ) {
        _v.listen_x = listener;
        _v.listen_y = listener;
        _v.listen_z = listener;
    } //Listen

// Operations

    public function add(other:Vector) {

        if(other == null) {
            throw "vector.add other was handed in as null";
        }

        x += other.x;
        y += other.y;
        z += other.z;

        return this;

    } //add

    public function subtract(other:Vector) {

        if(other == null) {
            throw "vector.subtract other was handed in as null";
        }

        x -= other.x;
        y -= other.y;
        z -= other.z;

        return this;

    } //subtract

    public function multiply(other:Vector) {

        if(other == null) {
            throw "vector.multiply other was handed in as null";
        }

        x *= other.x;
        y *= other.y;
        z *= other.z;

        return this;

    } //multiply

    public function divide(other:Vector) {

        if(other == null) {
            throw "vector.divide other was handed in as null";
        }

        x /= other.x;
        y /= other.y;
        z /= other.z;

        return this;

    } //divide

    public function addScalar( v:Float ) {

        x += v;
        y += v;
        z += v;

        return this;

    } //addScalar

    public function subtractScalar( v:Float ) {

        x -= v;
        y -= v;
        z -= v;

        return this;

    } //subtractScalar

     public function multiplyScalar( v:Float ) {

        x *= v;
        y *= v;
        z *= v;

        return this;

    } //multiplyScalar

    public function divideScalar( v:Float ) : Vector {

        if ( v != 0 ) {
            x /= v;
            y /= v;
            z /= v;
        } else {
            x = 0;
            y = 0;
            z = 0;
        }

        return this;

    } //divideScalar


//Properties

    function set_length( value:Float ) : Float {

        normalize().multiplyScalar(value);

        return value;

    } //set_length

    function get_length() : Float {

        return Math.sqrt( x * x + y * y + z * z );

    } //get_length


    function get_lengthsq() : Float {

        return x * x + y * y + z * z;

    } //get_lengthsq

    function get_normalized() {

        return Vector.Divide( this, length );

    } //get_normalized

    function set_x(_x:Float) : Float {

        x = _x;

            if(listen_x != null && !ignore_listeners) listen_x(_x);

        return x;

    } //set_x

    function set_y(_y:Float) : Float {

        y = _y;

            if(listen_y != null && !ignore_listeners) listen_y(_y);

        return y;

    } //set_y

    function set_z(_z:Float) : Float {

        z = _z;

            if(listen_z != null && !ignore_listeners) listen_z(_z);

        return z;

    } //set_z

    function get_inverted() : Vector {

        return new Vector(-x,-y,-z);

    } //get_inverted


        //Changes the angle of the vector.
        //X and Y will change, length stays the same.
    function set_angle2D( value : Float ) : Float {

        var len:Float = length;

            x = Math.cos(value) * len;
            y = Math.sin(value) * len;

        return value;
    }

        //Get the angle of this vector.
    function get_angle2D():Float {

        return Math.atan2(y, x);

    }

//Convenience functions

        //Sets the length under the given value.
        //Nothing is done if the vector is already shorter.
        //max The max length this vector can be.
    public function truncate( max:Float ) : Vector {

        length = Math.min(max, length);

        return this;

    } //truncate

    public function rotationTo( other:Vector ) : Float {
        var theta =  Math.atan2(  other.x - x , other.y - y );
        var r = -(180.0 + (theta*180.0/Math.PI));
        return r;
    }

//Transforms

    public function applyQuaternion( q:Quaternion ) : Vector {

        var qx = q.x;
        var qy = q.y;
        var qz = q.z;
        var qw = q.w;

        var ix = qw * x + qy * z - qz * y;
        var iy = qw * y + qz * x - qx * z;
        var iz = qw * z + qx * y - qy * x;
        var iw = -qx * x - qy * y - qz * z;

            x = ix * qw + iw * -qx + iy * -qz - iz * -qy;
            y = iy * qw + iw * -qy + iz * -qx - ix * -qz;
            z = iz * qw + iw * -qz + ix * -qy - iy * -qx;

        return this;

    } //applyQuaternion

    public function applyProjection( m:Matrix ) : Vector {

        var e = m.elements;
        var x = this.x, y = this.y, z = this.z;
        var d:Float = 1 / (e[3] * x + e[7] * y + e[11] * z + e[15]);

            this.x = (e[0] * x + e[4] * y + e[8] * z + e[12]) * d;
            this.y = (e[1] * x + e[5] * y + e[9] * z + e[13]) * d;
            this.z = (e[2] * x + e[6] * y + e[10] * z + e[14]) * d;

        return this;

    } //applyProjection

    public function transform( _m:Matrix ) : Vector {

        var _x = x;
        var _y = y;
        var _z = z;

        var e = _m.elements;

            x = e[0] * _x + e[4] * _y + e[8]  * _z + e[12];
            y = e[1] * _x + e[5] * _y + e[9]  * _z + e[13];
            z = e[2] * _x + e[6] * _y + e[10] * _z + e[14];

        return this;

    } //transform

    public function transformDirection( m:Matrix ) : Vector {

        var e = m.elements;
        var x = this.x, y = this.y, z = this.z;

            this.x = e[0] * x + e[4] * y + e[8] * z;
            this.y = e[1] * x + e[5] * y + e[9] * z;
            this.z = e[2] * x + e[6] * y + e[10] * z;

        normalize();

        return this;

    } //transformDirection

    public function setEulerFromRotationMatrix (m:Matrix, order:String = 'XYZ') : Vector {

        var te = m.elements;
        var m11 = te[0], m12 = te[4], m13 = te[8];
        var m21 = te[1], m22 = te[5], m23 = te[9];
        var m31 = te[2], m32 = te[6], m33 = te[10];

        if (order == 'XYZ') {

            y = Math.asin( Maths.clamp( m13, -1, 1 ) );

            if (Math.abs(m13) < 0.99999)
            {
                x = Math.atan2( -m23, m33);
                z = Math.atan2( -m12, m11);
            } else {
                x = Math.atan2( m32, m22 );
                z = 0;
            }

        }  else if ( order == 'YXZ' ) {

            x = Math.asin( -Maths.clamp( m23, -1, 1 ) );

            if ( Math.abs( m23 ) < 0.99999 ) {
                y = Math.atan2( m13, m33 );
                z = Math.atan2( m21, m22 );
            } else {
                y = Math.atan2( -m31, m11 );
                z = 0;
            }

        } else if ( order == 'ZXY' ) {

            x = Math.asin( Maths.clamp( m32, -1, 1 ) );

            if ( Math.abs( m32 ) < 0.99999 ) {
                y = Math.atan2( -m31, m33 );
                z = Math.atan2( -m12, m22 );
            } else {
                y = 0;
                z = Math.atan2( m21, m11 );
            }

        } else if ( order == 'ZYX' ) {

            y = Math.asin( -Maths.clamp( m31, -1, 1 ) );

            if ( Math.abs( m31 ) < 0.99999 ) {
                x = Math.atan2( m32, m33 );
                z = Math.atan2( m21, m11 );
            } else {
                x = 0;
                z = Math.atan2( -m12, m22 );
            }

        } else if ( order == 'YZX' ) {

            z = Math.asin( Maths.clamp( m21, -1, 1 ) );

            if ( Math.abs( m21 ) < 0.99999 ) {
                x = Math.atan2( -m23, m22 );
                y = Math.atan2( -m31, m11 );
            } else {
                x = 0;
                y = Math.atan2( m13, m33 );
            }

        } else if ( order == 'XZY' ) {

            z = Math.asin( -Maths.clamp( m12, -1, 1 ) );

            if ( Math.abs( m12 ) < 0.99999 ) {
                x = Math.atan2( m32, m22 );
                y = Math.atan2( m13, m11 );
            } else {
                x = Math.atan2( -m23, m33 );
                y = 0;
            }

        } //order

        return this;

    } //setEulerFromRotationMatrix

    public function setEulerFromQuaternion (q:Quaternion, order:String = 'XYZ') : Vector {

        var sqx : Float = q.x * q.x;
        var sqy : Float = q.y * q.y;
        var sqz : Float = q.z * q.z;
        var sqw : Float = q.w * q.w;

        var _x = x;
        var _y = y;
        var _z = z;

        if (order == 'XYZ') {
            _x = Math.atan2( 2 * ( q.x * q.w - q.y * q.z ), ( sqw - sqx - sqy + sqz ) );
            _y = Math.asin(  Maths.clamp( 2 * ( q.x * q.z + q.y * q.w ), -1, 1 ) );
            _z = Math.atan2( 2 * ( q.z * q.w - q.x * q.y ), ( sqw + sqx - sqy - sqz ) );
        } else if ( order ==  'YXZ' ) {
            _x = Math.asin(  Maths.clamp( 2 * ( q.x * q.w - q.y * q.z ), -1, 1 ) );
            _y = Math.atan2( 2 * ( q.x * q.z + q.y * q.w ), ( sqw - sqx - sqy + sqz ) );
            _z = Math.atan2( 2 * ( q.x * q.y + q.z * q.w ), ( sqw - sqx + sqy - sqz ) );
        } else if ( order == 'ZXY' ) {
            _x = Math.asin(  Maths.clamp( 2 * ( q.x * q.w + q.y * q.z ), -1, 1 ) );
            _y = Math.atan2( 2 * ( q.y * q.w - q.z * q.x ), ( sqw - sqx - sqy + sqz ) );
            _z = Math.atan2( 2 * ( q.z * q.w - q.x * q.y ), ( sqw - sqx + sqy - sqz ) );
        } else if ( order == 'ZYX' ) {
            _x = Math.atan2( 2 * ( q.x * q.w + q.z * q.y ), ( sqw - sqx - sqy + sqz ) );
            _y = Math.asin(  Maths.clamp( 2 * ( q.y * q.w - q.x * q.z ), -1, 1 ) );
            _z = Math.atan2( 2 * ( q.x * q.y + q.z * q.w ), ( sqw + sqx - sqy - sqz ) );
        } else if ( order == 'YZX' ) {
            _x = Math.atan2( 2 * ( q.x * q.w - q.z * q.y ), ( sqw - sqx + sqy - sqz ) );
            _y = Math.atan2( 2 * ( q.y * q.w - q.x * q.z ), ( sqw + sqx - sqy - sqz ) );
            _z = Math.asin(  Maths.clamp( 2 * ( q.x * q.y + q.z * q.w ), -1, 1 ) );
        } else if ( order == 'XZY' ) {
            _x = Math.atan2( 2 * ( q.x * q.w + q.y * q.z ), ( sqw - sqx + sqy - sqz ) );
            _y = Math.atan2( 2 * ( q.x * q.z + q.y * q.w ), ( sqw + sqx - sqy - sqz ) );
            _z = Math.asin(  Maths.clamp( 2 * ( q.z * q.w - q.x * q.y ), -1, 1 ) );
        } //order

        set_xyz(x,y,z);

        return this;

    } //setEulerFromQuaternion

    public function degrees() : Vector {

        x = Maths.degrees(x);
        y = Maths.degrees(y);
        z = Maths.degrees(z);

        return this;
    }

    public function radians() : Vector {

        x = Maths.radians(x);
        y = Maths.radians(y);
        z = Maths.radians(z);

        return this;
    }

    public static function Degrees( _radian_vector:Vector ) : Vector {
        return _radian_vector.clone().degrees();
    }

    public static function Radians( _degree_vector:Vector ) : Vector {
        return _degree_vector.clone().radians();
    }

} //Vector class



abstract Vec(Vector) from Vector to Vector {

    public inline function new(?_x,?_y,?_z,?_w) {
        this = new Vector(_x,_y,_z,_w);
    }
//multiply
    @:communitative @:op(A * B) static public function _multiply(lhs:Vec, rhs:Vec) : Vec {
        return Vector.MultiplyVector(lhs, rhs);
    }
    @:communitative @:op(A * B) static public function _multiply_scalar(lhs:Vec, rhs:Float) : Vec {
        return Vector.Multiply(lhs, rhs);
    }
    @:communitative @:op(A * B) static public function _multiply_scalar_int(lhs:Vec, rhs:Int) : Vec {
        return Vector.Multiply(lhs, rhs);
    }
// divide
    @:communitative @:op(A / B) static public function _divide(lhs:Vec, rhs:Vec) : Vec {
        return Vector.DivideVector(lhs, rhs);
    }
    @:communitative @:op(A / B) static public function _divide_scalar(lhs:Vec, rhs:Float) : Vec {
        return Vector.Divide(lhs, rhs);
    }
    @:communitative @:op(A / B) static public function _divide_scalar_int(lhs:Vec, rhs:Int) : Vec {
        return Vector.Divide(lhs, rhs);
    }
// add
    @:communitative @:op(A + B) static public function _add(lhs:Vec, rhs:Vec) : Vec {
        return Vector.Add(lhs, rhs);
    }
    @:communitative @:op(A + B) static public function _add_scalar(lhs:Vec, rhs:Float) : Vec {
        return Vector.AddScalar(lhs, rhs);
    }
    @:communitative @:op(A + B) static public function _add_scalar_int(lhs:Vec, rhs:Int) : Vec {
        return Vector.AddScalar(lhs, rhs);
    }
// subract
    @:communitative @:op(A - B) static public function _subtract(lhs:Vec, rhs:Vec) : Vec {
        return Vector.Subtract(lhs,rhs);
    }
    @:communitative @:op(A - B) static public function _subtract_scalar(lhs:Vec, rhs:Float) : Vec {
        return Vector.SubtractScalar(lhs,rhs);
    }
    @:communitative @:op(A - B) static public function _subtract_scalar_int(lhs:Vec, rhs:Int) : Vec {
        return Vector.SubtractScalar(lhs,rhs);
    }
} //Vec

package phoenix;

import phoenix.Vector;

    //Ported from Three.js https://github.com/mrdoob/three.js

class Quaternion {

    @:isVar public var x(default,set) : Float = 0.0;
    @:isVar public var y(default,set) : Float = 0.0;
    @:isVar public var z(default,set) : Float = 0.0;
    @:isVar public var w(default,set) : Float = 0.0;

    var euler : Vector;

    public var ignore_listeners : Bool = false;

    @:isVar public var listen_x(default,default) : Float -> Void;
    @:isVar public var listen_y(default,default) : Float -> Void;
    @:isVar public var listen_z(default,default) : Float -> Void;
    @:isVar public var listen_w(default,default) : Float -> Void;

    var _construct = false;

    public function new(_x:Float = 0, _y:Float = 0, _z:Float = 0, _w:Float = 1) {

        _construct = true;

            x = _x;
            y = _y;
            z = _z;
            w = _w;

        euler = new Vector();

        _construct = false;

    } //new

    function toString() {

        return "{ x:"+x + ", y:" + y + ", z:" + z  + ", w:" + w  +  " }" ;

    } //toString

    public function set( _x:Float, _y:Float, _z:Float, _w:Float ) : Quaternion {

        set_xyzw(_x, _y, _z, _w);

        return this;

    } //set


    public function copy( _quaternion :Quaternion ) : Quaternion {

            set_xyzw( _quaternion.x,
                      _quaternion.y,
                      _quaternion.z,
                      _quaternion.w );

        return this;

    } //copy

    public function dot( _other:Quaternion ) {
        return x * _other.x + y * _other.y + z * _other.z + w * _other.w;
    }


    public function setFromEuler( _euler:Vector, _order:ComponentOrder = XYZ ) : Quaternion {

            // http://www.mathworks.com/matlabcentral/fileexchange/
            //  20696-function-to-convert-between-dcm-euler-angles-quaternions-and-euler-vectors/
            //  content/SpinCalc.m

        var _x = x;
        var _y = y;
        var _z = z;
        var _w = w;

        var c1 = Math.cos( _euler.x / 2 );
        var c2 = Math.cos( _euler.y / 2 );
        var c3 = Math.cos( _euler.z / 2 );

        var s1 = Math.sin( _euler.x / 2 );
        var s2 = Math.sin( _euler.y / 2 );
        var s3 = Math.sin( _euler.z / 2 );

            if ( _order == XYZ ) {

                _x = s1 * c2 * c3 + c1 * s2 * s3;
                _y = c1 * s2 * c3 - s1 * c2 * s3;
                _z = c1 * c2 * s3 + s1 * s2 * c3;
                _w = c1 * c2 * c3 - s1 * s2 * s3;

            } else if ( _order == YXZ ) {

                _x = s1 * c2 * c3 + c1 * s2 * s3;
                _y = c1 * s2 * c3 - s1 * c2 * s3;
                _z = c1 * c2 * s3 - s1 * s2 * c3;
                _w = c1 * c2 * c3 + s1 * s2 * s3;

            } else if ( _order == ZXY ) {

                _x = s1 * c2 * c3 - c1 * s2 * s3;
                _y = c1 * s2 * c3 + s1 * c2 * s3;
                _z = c1 * c2 * s3 + s1 * s2 * c3;
                _w = c1 * c2 * c3 - s1 * s2 * s3;

            } else if ( _order == ZYX ) {

                _x = s1 * c2 * c3 - c1 * s2 * s3;
                _y = c1 * s2 * c3 + s1 * c2 * s3;
                _z = c1 * c2 * s3 - s1 * s2 * c3;
                _w = c1 * c2 * c3 + s1 * s2 * s3;

            } else if ( _order == YZX ) {

                _x = s1 * c2 * c3 + c1 * s2 * s3;
                _y = c1 * s2 * c3 + s1 * c2 * s3;
                _z = c1 * c2 * s3 - s1 * s2 * c3;
                _w = c1 * c2 * c3 - s1 * s2 * s3;

            } else if ( _order == XZY ) {

                _x = s1 * c2 * c3 - c1 * s2 * s3;
                _y = c1 * s2 * c3 - s1 * c2 * s3;
                _z = c1 * c2 * s3 + s1 * s2 * c3;
                _w = c1 * c2 * c3 + s1 * s2 * s3;

            }

        set_xyzw(_x, _y, _z, _w);

        return this;

    } //setFromEuler


    public function setFromAxisAngle( _axis:Vector, _angle:Float ) : Quaternion {

        // from http://www.euclideanspace.com/maths/geometry/rotations/conversions/angleToQuaternion/index.htm
        // axis have to be normalized

        var _halfAngle = _angle / 2;
        var _s = Math.sin( _halfAngle );

            set_xyzw( _axis.x * _s,
                      _axis.y * _s,
                      _axis.z * _s,
                      Math.cos( _halfAngle ) );

        return this;

    } //setFromAxisAngle


    public function setFromRotationMatrix( _m:Matrix ) : Quaternion {

        // http://www.euclideanspace.com/maths/geometry/rotations/conversions/matrixToQuaternion/index.htm
        // assumes the upper 3x3 of m is a pure rotation matrix (i.e, unscaled)

        var te = _m.elements;

        var m11 = te[0], m12 = te[4], m13 = te[8];
        var m21 = te[1], m22 = te[5], m23 = te[9];
        var m31 = te[2], m32 = te[6], m33 = te[10];

        var _x = x;
        var _y = y;
        var _z = z;
        var _w = w;

        var tr = m11 + m22 + m33;

        var s : Float;

            if (tr > 0) {

                s = 0.5 / Math.sqrt( tr + 1.0 );

                _w = 0.25 / s;
                _x = (m32 - m23) * s;
                _y = (m13 - m31) * s;
                _z = (m21 - m12) * s;

            } else if (m11 > m22 && m11 > m33) {

                s = 2.0 * Math.sqrt(1.0 + m11 - m22 - m33);

                _w = (m32 - m23) / s;
                _x = 0.25 * s;
                _y = (m12 + m21) / s;
                _z = (m13 + m31) / s;

            } else if (m22 > m33) {

                s = 2.0 * Math.sqrt(1.0 + m22 - m11 - m33);

                _w = (m13 - m31) / s;
                _x = (m12 + m21) / s;
                _y = 0.25 * s;
                _z = (m23 + m32) / s;

            } else {

                s = 2.0 * Math.sqrt(1.0 + m33 - m11 - m22);

                _w = (m21 - m12) / s;
                _x = (m13 + m31) / s;
                _y = (m23 + m32) / s;
                _z = 0.25 * s;

            }

        set_xyzw(_x, _y, _z, _w);

        return this;

    } //setFromRotationMatrix


    public function inverse() : Quaternion {

        return conjugate().normalize();

    } //inverse


    public function conjugate() : Quaternion {

        set_xyz( x * -1, y * -1, z * -1);

        return this;

    } //conjugate


    public function lengthSq() : Float {

        return x * x + y * y + z * z + w * w;

    } //lengthSq


    public function length() : Float {

        return Math.sqrt(x * x + y * y + z * z + w * w);

    } //length


    public function normalize() : Quaternion {

        var l = length();

            if (l == 0) {

                set_xyzw(0,0,0,1);

            } else {

                l = 1 / l;

                set_xyzw( x*l, y*l, z*l, w*l );

            }

        return this;

    } //normalize

    public static function Add( _a:Quaternion, _b:Quaternion ):Quaternion {
        return _a.clone().add(_b);
    }

    public static function Multiply( _a:Quaternion, _b:Quaternion ):Quaternion {
        return _a.clone().multiply(_b);
    }

    public static function MultiplyScalar(_quaternion:Quaternion, _scalar:Float):Quaternion {
        return _quaternion.clone().multiplyScalar(_scalar);
    }

    public function multiply( _quaternion:Quaternion ) : Quaternion {

        return multiplyQuaternions( this, _quaternion );

    } //multiply

    public function add( _quaternion:Quaternion ) : Quaternion {

        return addQuaternions( this, _quaternion );

    } //add

    public function addQuaternions( _a:Quaternion, _b:Quaternion ) {

            x = _a.x + _b.x;
            y = _a.y + _b.y;
            z = _a.z + _b.z;
            w = _a.w + _b.w;

        return this;

    } //addQuaternions

    public function multiplyScalar( _scalar:Float ) : Quaternion {

            x *= _scalar;
            y *= _scalar;
            z *= _scalar;
            w *= _scalar;

        return this;

    } //multiply

    public function multiplyQuaternions( _a:Quaternion, _b:Quaternion ) : Quaternion {

        var qax = _a.x, qay = _a.y, qaz = _a.z, qaw = _a.w;
        var qbx = _b.x, qby = _b.y, qbz = _b.z, qbw = _b.w;

            set_xyzw( qax * qbw + qaw * qbx + qay * qbz - qaz * qby,
                      qay * qbw + qaw * qby + qaz * qbx - qax * qbz,
                      qaz * qbw + qaw * qbz + qax * qby - qay * qbx,
                      qaw * qbw - qax * qbx - qay * qby - qaz * qbz );

        return this;

    } //multiplyQuaternions


    public function slerp( _qb:Quaternion, _t:Float ) : Quaternion {

        var _x = x;
        var _y = y;
        var _z = z;
        var _w = w;

        // http://www.euclideanspace.com/maths/algebra/realNormedAlgebra/quaternions/slerp/

        var cosHalfTheta = _w * _qb.w + _x * _qb.x + _y * _qb.y + _z * _qb.z;

        if ( cosHalfTheta < 0 ) {

                x = -_qb.x;
                y = -_qb.y;
                z = -_qb.z;
                w = -_qb.w;

                cosHalfTheta = -cosHalfTheta;

        } else {

            this.copy( _qb );

        }

        if ( cosHalfTheta >= 1.0 ) {

            set_xyzw(_x, _y, _z, _w);

            return this;

        }

        var halfTheta = Math.acos( cosHalfTheta );
        var sinHalfTheta = Math.sqrt( 1.0 - cosHalfTheta * cosHalfTheta );

        if ( Math.abs( sinHalfTheta ) < 0.001 ) {

            set_xyzw( 0.5 * ( _x + x ),
                      0.5 * ( _y + y ),
                      0.5 * ( _z + z ),
                      0.5 * ( _w + w ) );

            return this;

        }

        var ratioA = Math.sin( ( 1 - _t ) * halfTheta ) / sinHalfTheta,
        ratioB = Math.sin( _t * halfTheta ) / sinHalfTheta;

            set_xyzw( _x * ratioA + x * ratioB,
                      _y * ratioA + y * ratioB,
                      _z * ratioA + z * ratioB,
                      _w * ratioA + w * ratioB );

        return this;

    } //slerp


    public function equals( _q:Quaternion ) : Bool {

        return ( (_q.x == x) && (_q.y == y) && (_q.z == z) && (_q.w == w) );

    } //equals


    public function fromArray( _a:Array<Float> ) : Quaternion {

        set_xyzw(_a[0], _a[1], _a[2], _a[3]);

        return this;

    } //fromArray


    public function toArray() : Array<Float> {

        return [ x,y,z,w ];

    } //toArray

    public function clone() : Quaternion {

        return new Quaternion( x, y, z, w );

    } //clone

    public function toeuler() {
        return new Vector().setEulerFromQuaternion(this).degrees();
    }

    public static function Slerp( _qa:Quaternion , _qb:Quaternion, _qm:Quaternion , _t:Float ) : Quaternion {

        return _qm.copy( _qa ).slerp( _qb, _t );

    } //Slerp

    public static function Dot( _a:Quaternion,  _b:Quaternion ) {
        return new Quaternion(_a.x,_a.y,_a.z,_a.w).dot(_b);
    }

    inline function update_euler() {

        if( euler == null || ignore_euler || _construct) {
            return;
        }

        euler.setEulerFromQuaternion( this );

    } //update_euler

    var ignore_euler = false;

    public inline function set_xyzw(_x:Float, _y:Float, _z:Float, _w:Float) {

        ignore_euler = true;

            x = _x;
            y = _y;
            z = _z;
            w = _w;

        ignore_euler = false;

        update_euler();

        if(listen_x != null && !ignore_listeners) listen_x(x);
        if(listen_y != null && !ignore_listeners) listen_y(y);
        if(listen_z != null && !ignore_listeners) listen_z(z);
        if(listen_w != null && !ignore_listeners) listen_w(w);

    } //set_xyzw

    public inline function set_xyz(_x:Float, _y:Float, _z:Float) {

        ignore_euler = true;

            x = _x;
            y = _y;
            z = _z;

        ignore_euler = false;

        update_euler();

        if(listen_x != null && !ignore_listeners) listen_x(x);
        if(listen_y != null && !ignore_listeners) listen_y(y);
        if(listen_z != null && !ignore_listeners) listen_z(z);

    } //set_xyzw

    inline function set_x( _v:Float ) {

        x = _v;

        if(_construct) return x;

        update_euler();

        if(listen_x != null && !ignore_listeners) listen_x(x);

        return x;

    } //set_x

    inline function set_y( _v:Float ) {

        y = _v;

        if(_construct) return y;

        update_euler();

        if(listen_y != null && !ignore_listeners) listen_y(y);

        return y;

    } //set_y

    inline function set_z( _v:Float ) {

        z = _v;

        if(_construct) return z;

        update_euler();

        if(listen_z != null && !ignore_listeners) listen_z(z);

        return z;

    } //set_z

    inline function set_w( _v:Float ) {

        w = _v;

        if(_construct) return w;

        update_euler();

        if(listen_w != null && !ignore_listeners) listen_w(w);

        return w;

    } //set_w

    public static inline function Listen( _q : Quaternion, listener ) {

        _q.listen_x = listener;
        _q.listen_y = listener;
        _q.listen_z = listener;
        _q.listen_w = listener;

    } //listen

} //Quaternion


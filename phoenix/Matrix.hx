package phoenix;

import phoenix.Vector;
import phoenix.Quaternion;
import luxe.utils.Maths;

    //Ported from Three.js https://github.com/mrdoob/three.js

class MatrixTransform {

    public var pos : Vector;
    public var rotation : Quaternion;
    public var scale : Vector;

    public function new(p, r, s) {
        pos = p;
        rotation = r;
        scale = s;
    }

    function destroy() {
        pos = null; rotation = null; scale = null;
    }

} //MatrixTransform

class Matrix {

    public var elements:Array<Float>;

    @:isVar public var M11 (get,set) : Float = 1;
    @:isVar public var M21 (get,set) : Float = 0;
    @:isVar public var M31 (get,set) : Float = 0;
    @:isVar public var M41 (get,set) : Float = 0;

    @:isVar public var M12 (get,set) : Float = 0;
    @:isVar public var M22 (get,set) : Float = 1;
    @:isVar public var M32 (get,set) : Float = 0;
    @:isVar public var M42 (get,set) : Float = 0;

    @:isVar public var M13 (get,set) : Float = 0;
    @:isVar public var M23 (get,set) : Float = 0;
    @:isVar public var M33 (get,set) : Float = 1;
    @:isVar public var M43 (get,set) : Float = 0;

    @:isVar public var M14 (get,set) : Float = 0;
    @:isVar public var M24 (get,set) : Float = 0;
    @:isVar public var M34 (get,set) : Float = 0;
    @:isVar public var M44 (get,set) : Float = 1;

    public function new(
        n11:Float = 1, n12:Float = 0, n13:Float = 0, n14:Float = 0,
        n21:Float = 0, n22:Float = 1, n23:Float = 0, n24:Float = 0,
        n31:Float = 0, n32:Float = 0, n33:Float = 1, n34:Float = 0,
        n41:Float = 0, n42:Float = 0, n43:Float = 0, n44:Float = 1)
    {
        elements = new Array<Float>();

        var i = 0;
        while (i++ < 16) elements.push(0.0);

        set(
            n11, n12, n13, n14,
            n21, n22, n23, n24,
            n31, n32, n33, n34,
            n41, n42, n43, n44
        );
    }


    public function set(
        n11:Float, n12:Float, n13:Float, n14:Float,
        n21:Float, n22:Float, n23:Float, n24:Float,
        n31:Float, n32:Float, n33:Float, n34:Float,
        n41:Float, n42:Float, n43:Float, n44:Float) : Matrix
    {

        var e = elements;

            e[0] = n11; e[4] = n12; e[8]  = n13; e[12] = n14;
            e[1] = n21; e[5] = n22; e[9]  = n23; e[13] = n24;
            e[2] = n31; e[6] = n32; e[10] = n33; e[14] = n34;
            e[3] = n41; e[7] = n42; e[11] = n43; e[15] = n44;

        return this;
    }

    function toString() {
        var e = elements;
        var str = '{ 11:' + Maths.fixed(e[0], 3) + ', 12:' + Maths.fixed(e[4], 3)  + ', 13:' + Maths.fixed(e[ 8], 3)  + ', 14:' + Maths.fixed(e[12], 3) + ' }, ' +
                  '{ 21:' + Maths.fixed(e[1], 3) + ', 22:' + Maths.fixed(e[5], 3)  + ', 23:' + Maths.fixed(e[ 9], 3)  + ', 24:' + Maths.fixed(e[13], 3) + ' }, ' +
                  '{ 31:' + Maths.fixed(e[2], 3) + ', 32:' + Maths.fixed(e[6], 3)  + ', 33:' + Maths.fixed(e[10], 3)  + ', 34:' + Maths.fixed(e[14], 3) + ' }, ' +
                  '{ 41:' + Maths.fixed(e[3], 3) + ', 42:' + Maths.fixed(e[7], 3)  + ', 43:' + Maths.fixed(e[11], 3)  + ', 44:' + Maths.fixed(e[15], 3) + ' }';
        return str;
    }

    function get_M11() : Float { return elements[0]; }
    function get_M12() : Float { return elements[1]; }
    function get_M13() : Float { return elements[2]; }
    function get_M14() : Float { return elements[3]; }

    function get_M21() : Float { return elements[4]; }
    function get_M22() : Float { return elements[5]; }
    function get_M23() : Float { return elements[6]; }
    function get_M24() : Float { return elements[7]; }

    function get_M31() : Float { return elements[8]; }
    function get_M32() : Float { return elements[9]; }
    function get_M33() : Float { return elements[10]; }
    function get_M34() : Float { return elements[11]; }

    function get_M41() : Float { return elements[12]; }
    function get_M42() : Float { return elements[13]; }
    function get_M43() : Float { return elements[14]; }
    function get_M44() : Float { return elements[15]; }

    function set_M11( _value:Float ) : Float { elements[0] = _value; return _value; }
    function set_M12( _value:Float ) : Float { elements[1] = _value; return _value; }
    function set_M13( _value:Float ) : Float { elements[2] = _value; return _value; }
    function set_M14( _value:Float ) : Float { elements[3] = _value; return _value; }

    function set_M21( _value:Float ) : Float { elements[4] = _value; return _value; }
    function set_M22( _value:Float ) : Float { elements[5] = _value; return _value; }
    function set_M23( _value:Float ) : Float { elements[6] = _value; return _value; }
    function set_M24( _value:Float ) : Float { elements[7] = _value; return _value; }

    function set_M31( _value:Float ) : Float { elements[8] = _value; return _value; }
    function set_M32( _value:Float ) : Float { elements[9] = _value; return _value; }
    function set_M33( _value:Float ) : Float { elements[10] = _value; return _value; }
    function set_M34( _value:Float ) : Float { elements[11] = _value; return _value; }

    function set_M41( _value:Float ) : Float { elements[12] = _value; return _value; }
    function set_M42( _value:Float ) : Float { elements[13] = _value; return _value; }
    function set_M43( _value:Float ) : Float { elements[14] = _value; return _value; }
    function set_M44( _value:Float ) : Float { elements[15] = _value; return _value; }

    public function float32array() : snow.utils.Float32Array {
        return new snow.utils.Float32Array(elements);
    }

    public function identity () : Matrix {

            set(
                1, 0, 0, 0,
                0, 1, 0, 0,
                0, 0, 1, 0,
                0, 0, 0, 1
            );

        return this;
    }


    public function copy( m:Matrix ) : Matrix {

        var me = m.elements;

            set(
                me[0], me[4], me[8],  me[12],
                me[1], me[5], me[9],  me[13],
                me[2], me[6], me[10], me[14],
                me[3], me[7], me[11], me[15]
            );

        return this;
    }

    public function make2D( _x:Float, _y:Float, _scale:Float = 1, _rotation:Float = 0 ) {

        var theta = Maths.radians(_rotation);
        var c = Math.cos(theta);
        var s = Math.sin(theta);

        set(
             c * _scale,  s *_scale,  0,  _x,
            -s * _scale,  c *_scale,  0,  _y,
                      0,          0,  1,   0,
                      0,          0,  0,   1
        );

        return this;
   }


    public function copyPosition( m:Matrix ) : Matrix {

        elements[12] = m.elements[12];
        elements[13] = m.elements[13];
        elements[14] = m.elements[14];

        return this;
    }


    public function getPosition() : Vector {
        return new Vector(elements[12], elements[13], elements[14],1);
    }

    public function extractRotation( m:Matrix ) : Matrix {

        var _temp = new Vector();
        var me = m.elements;

        var _scale_x = 1 / _temp.set( me[0], me[1], me[2]  ).length;
        var _scale_y = 1 / _temp.set( me[4], me[5], me[6]  ).length;
        var _scale_z = 1 / _temp.set( me[8], me[9], me[10] ).length;

        elements[0] =  me[0]  * _scale_x;
        elements[1] =  me[1]  * _scale_x;
        elements[2] =  me[2]  * _scale_x;

        elements[4] =  me[4]  * _scale_y;
        elements[5] =  me[5]  * _scale_y;
        elements[6] =  me[6]  * _scale_y;

        elements[8] =  me[8]  * _scale_z;
        elements[9] =  me[9]  * _scale_z;
        elements[10] = me[10] * _scale_z;

        return this;
    }

    public function makeRotationFromEuler( _v:Vector, _order:String = 'XYZ') : Matrix {

        var te = elements;

        var x = _v.x;
        var y = _v.y;
        var z = _v.z;

        var a = Math.cos( x ), b = Math.sin( x );
        var c = Math.cos( y ), d = Math.sin( y );
        var e = Math.cos( z ), f = Math.sin( z );

        if ( _order == 'XYZ' ) {

            var ae = a * e, af = a * f, be = b * e, bf = b * f;

            te[0] = c * e;
            te[4] = - c * f;
            te[8] = d;

            te[1] = af + be * d;
            te[5] = ae - bf * d;
            te[9] = - b * c;

            te[2] = bf - ae * d;
            te[6] = be + af * d;
            te[10] = a * c;

        } else if ( _order == 'YXZ' ) {

            var ce = c * e, cf = c * f, de = d * e, df = d * f;

            te[0] = ce + df * b;
            te[4] = de * b - cf;
            te[8] = a * d;

            te[1] = a * f;
            te[5] = a * e;
            te[9] = - b;

            te[2] = cf * b - de;
            te[6] = df + ce * b;
            te[10] = a * c;

        } else if ( _order == 'ZXY' ) {

            var ce = c * e, cf = c * f, de = d * e, df = d * f;

            te[0] = ce - df * b;
            te[4] = - a * f;
            te[8] = de + cf * b;

            te[1] = cf + de * b;
            te[5] = a * e;
            te[9] = df - ce * b;

            te[2] = - a * d;
            te[6] = b;
            te[10] = a * c;

        } else if ( _order == 'ZYX' ) {

            var ae = a * e, af = a * f, be = b * e, bf = b * f;

            te[0] = c * e;
            te[4] = be * d - af;
            te[8] = ae * d + bf;

            te[1] = c * f;
            te[5] = bf * d + ae;
            te[9] = af * d - be;

            te[2] = - d;
            te[6] = b * c;
            te[10] = a * c;

        } else if ( _order == 'YZX' ) {

            var ac = a * c, ad = a * d, bc = b * c, bd = b * d;

            te[0] = c * e;
            te[4] = bd - ac * f;
            te[8] = bc * f + ad;

            te[1] = f;
            te[5] = a * e;
            te[9] = - b * e;

            te[2] = - d * e;
            te[6] = ad * f + bc;
            te[10] = ac - bd * f;

        } else if ( _order == 'XZY' ) {

            var ac = a * c, ad = a * d, bc = b * c, bd = b * d;

            te[0] = c * e;
            te[4] = - f;
            te[8] = d * e;

            te[1] = ac * f + bd;
            te[5] = a * e;
            te[9] = ad * f - bc;

            te[2] = bc * f - ad;
            te[6] = b * e;
            te[10] = bd * f + ac;

        }

        // last column
        te[3] = 0;
        te[7] = 0;
        te[11] = 0;

        // bottom row
        te[12] = 0;
        te[13] = 0;
        te[14] = 0;
        te[15] = 1;

        return this;

    } //makeRotationFromEuler

    public function makeRotationFromQuaternion( q:Quaternion ) : Matrix {

        var te = elements;

        var x2 = q.x + q.x, y2 = q.y + q.y, z2 = q.z + q.z;
        var xx = q.x * x2,  xy = q.x * y2,  xz = q.x * z2;
        var yy = q.y * y2,  yz = q.y * z2,  zz = q.z * z2;
        var wx = q.w * x2,  wy = q.w * y2,  wz = q.w * z2;

        te[0] = 1 - ( yy + zz );
        te[4] = xy - wz;
        te[8] = xz + wy;

        te[1] = xy + wz;
        te[5] = 1 - ( xx + zz );
        te[9] = yz - wx;

        te[2] = xz - wy;
        te[6] = yz + wx;
        te[10] = 1 - ( xx + yy );

            // last column
        te[3] = 0;
        te[7] = 0;
        te[11] = 0;

            // bottom row
        te[12] = 0;
        te[13] = 0;
        te[14] = 0;
        te[15] = 1;

        return this;

    } //makeRotationFromQuaternion


    public function lookAt( _eye:Vector, _target:Vector, _up:Vector ) : Matrix {

        var _x = new Vector();
        var _y = new Vector();
        var _z = new Vector();

        var te = elements;

        _z = Vector.Subtract( _target, _eye ).normalized;

            if ( _z.length == 0 ) {
                _z.z = 1;
            }

        _x = Vector.Cross( _up, _z ).normalized;

            if ( _x.length == 0 ) {
                _z.x += 0.0001;
                _x = Vector.Cross( _up, _z ).normalized;
            }

        _y = Vector.Cross( _z, _x );

        te[0] = _x.x; te[4] = _y.x; te[8]  = _z.x;
        te[1] = _x.y; te[5] = _y.y; te[9]  = _z.y;
        te[2] = _x.z; te[6] = _y.z; te[10] = _z.z;

        return this;

    } //lookAt


    public function multiply( _m:Matrix ) : Matrix {

        return multiplyMatrices(this, _m);

    } //multiply


    public function multiplyMatrices( _a:Matrix, _b:Matrix ) : Matrix {

        var ae = _a.elements;
        var be = _b.elements;
        var te = elements;

        var a11 = ae[0], a12 = ae[4], a13 = ae[8],  a14 = ae[12];
        var a21 = ae[1], a22 = ae[5], a23 = ae[9],  a24 = ae[13];
        var a31 = ae[2], a32 = ae[6], a33 = ae[10], a34 = ae[14];
        var a41 = ae[3], a42 = ae[7], a43 = ae[11], a44 = ae[15];

        var b11 = be[0], b12 = be[4], b13 = be[8],  b14 = be[12];
        var b21 = be[1], b22 = be[5], b23 = be[9],  b24 = be[13];
        var b31 = be[2], b32 = be[6], b33 = be[10], b34 = be[14];
        var b41 = be[3], b42 = be[7], b43 = be[11], b44 = be[15];

            te[0] =  a11 * b11 + a12 * b21 + a13 * b31 + a14 * b41;
            te[4] =  a11 * b12 + a12 * b22 + a13 * b32 + a14 * b42;
            te[8] =  a11 * b13 + a12 * b23 + a13 * b33 + a14 * b43;
            te[12] = a11 * b14 + a12 * b24 + a13 * b34 + a14 * b44;

            te[1] =  a21 * b11 + a22 * b21 + a23 * b31 + a24 * b41;
            te[5] =  a21 * b12 + a22 * b22 + a23 * b32 + a24 * b42;
            te[9] =  a21 * b13 + a22 * b23 + a23 * b33 + a24 * b43;
            te[13] = a21 * b14 + a22 * b24 + a23 * b34 + a24 * b44;

            te[2] =  a31 * b11 + a32 * b21 + a33 * b31 + a34 * b41;
            te[6] =  a31 * b12 + a32 * b22 + a33 * b32 + a34 * b42;
            te[10] = a31 * b13 + a32 * b23 + a33 * b33 + a34 * b43;
            te[14] = a31 * b14 + a32 * b24 + a33 * b34 + a34 * b44;

            te[3] =  a41 * b11 + a42 * b21 + a43 * b31 + a44 * b41;
            te[7] =  a41 * b12 + a42 * b22 + a43 * b32 + a44 * b42;
            te[11] = a41 * b13 + a42 * b23 + a43 * b33 + a44 * b43;
            te[15] = a41 * b14 + a42 * b24 + a43 * b34 + a44 * b44;

        return this;

    } //multiplyMatrices


    public function multiplyToArray( _a:Matrix, _b:Matrix, _r:Array<Float> ) : Matrix {

        var te = elements;

            multiplyMatrices(_a, _b);

            _r[0]  = te[0];   _r[1]  = te[1];   _r[2]  = te[2];  _r[3]  = te[3];
            _r[4]  = te[4];   _r[5]  = te[5];   _r[6]  = te[6];  _r[7]  = te[7];
            _r[8]  = te[8];   _r[9]  = te[9];   _r[10] = te[10]; _r[11] = te[11];
            _r[12] = te[12];  _r[13] = te[13];  _r[14] = te[14]; _r[15] = te[15];

        return this;

    } //multiplyToArray


    public function multiplyScalar( _s:Float ) : Matrix {

        var te = elements;

            te[0] *= _s; te[4] *= _s; te[8]  *= _s; te[12] *= _s;
            te[1] *= _s; te[5] *= _s; te[9]  *= _s; te[13] *= _s;
            te[2] *= _s; te[6] *= _s; te[10] *= _s; te[14] *= _s;
            te[3] *= _s; te[7] *= _s; te[11] *= _s; te[15] *= _s;

        return this;

    } //multiplyScalar


    public function multiplyVector3Array( _a:Array<Float> ) : Array<Float> {

        var v1 = new Vector();
        var i = 0;
        var il = _a.length;

        while (i < il) {

            v1.x = _a[i + 0];
            v1.y = _a[i + 1];
            v1.z = _a[i + 2];

            v1.applyProjection( this );

            _a[i + 0] = v1.x;
            _a[i + 1] = v1.y;
            _a[i + 2] = v1.z;

            i += 3;

        }

        return _a;

    } //multiplyVector3Array

    public function determinant() : Float {

        var te = elements;

        var n11 = te[0], n12 = te[4], n13 = te[8],  n14 = te[12];
        var n21 = te[1], n22 = te[5], n23 = te[9],  n24 = te[13];
        var n31 = te[2], n32 = te[6], n33 = te[10], n34 = te[14];
        var n41 = te[3], n42 = te[7], n43 = te[11], n44 = te[15];

        return (
            n41 * (
                 n14 * n23 * n32
                -n13 * n24 * n32
                -n14 * n22 * n33
                +n12 * n24 * n33
                +n13 * n22 * n34
                -n12 * n23 * n34
            ) +
            n42 * (
                 n11 * n23 * n34
                -n11 * n24 * n33
                +n14 * n21 * n33
                -n13 * n21 * n34
                +n13 * n24 * n31
                -n14 * n23 * n31
            ) +
            n43 * (
                 n11 * n24 * n32
                -n11 * n22 * n34
                -n14 * n21 * n32
                +n12 * n21 * n34
                +n14 * n22 * n31
                -n12 * n24 * n31
            ) +
            n44 * (
                -n13 * n22 * n31
                -n11 * n23 * n32
                +n11 * n22 * n33
                +n13 * n21 * n32
                -n12 * n21 * n33
                +n12 * n23 * n31
            )
        );
    } //determinant

    public function transpose() : Matrix {

        var te = elements;
        var tmp:Float;

        tmp = te[1]; te[1] = te[4]; te[4] = tmp;
        tmp = te[2]; te[2] = te[8]; te[8] = tmp;
        tmp = te[6]; te[6] = te[9]; te[9] = tmp;

        tmp = te[3];  te[3]  = te[12]; te[12] = tmp;
        tmp = te[7];  te[7]  = te[13]; te[13] = tmp;
        tmp = te[11]; te[11] = te[14]; te[14] = tmp;

        return this;

    } //transpose

    public function flattenToArray( _flat:Array<Float> = null ) : Array<Float> {

        if (_flat == null) {
            _flat = new Array<Float>();
            for(i in 0 ... 16) _flat.push( 0.0 );
        }

        var te = elements;

            _flat[ 0 ]  = te[0];  _flat[ 1 ]  = te[1];  _flat[ 2 ]  = te[2];  _flat[ 3 ]  = te[3];
            _flat[ 4 ]  = te[4];  _flat[ 5 ]  = te[5];  _flat[ 6 ]  = te[6];  _flat[ 7 ]  = te[7];
            _flat[ 8 ]  = te[8];  _flat[ 9 ]  = te[9];  _flat[ 10 ] = te[10]; _flat[ 11 ] = te[11];
            _flat[ 12 ] = te[12]; _flat[ 13 ] = te[13]; _flat[ 14 ] = te[14]; _flat[ 15 ] = te[15];

        return _flat;

    } //flattenToArray


    public function flattenToArrayOffset( _flat:Array<Float>, _offset:Int ) : Array<Float> {

        var te = elements;

            _flat[ _offset + 0 ]  = te[0];
            _flat[ _offset + 1 ]  = te[1];
            _flat[ _offset + 2 ]  = te[2];
            _flat[ _offset + 3 ]  = te[3];

            _flat[ _offset + 4 ]  = te[4];
            _flat[ _offset + 5 ]  = te[5];
            _flat[ _offset + 6 ]  = te[6];
            _flat[ _offset + 7 ]  = te[7];

            _flat[ _offset + 8 ]  = te[8];
            _flat[ _offset + 9 ]  = te[9];
            _flat[ _offset + 10 ] = te[10];
            _flat[ _offset + 11 ] = te[11];

            _flat[ _offset + 12 ] = te[12];
            _flat[ _offset + 13 ] = te[13];
            _flat[ _offset + 14 ] = te[14];
            _flat[ _offset + 15 ] = te[15];

        return _flat;

    } //flattenToArrayOffset


    public function setPosition( _v:Vector ) : Matrix {

        var te = elements;

            te[12] = _v.x;
            te[13] = _v.y;
            te[14] = _v.z;

        return this;

    } //setPosition

    public function inverse() : Matrix {
        return clone().getInverse(this);
    }

    public function getInverse( _m:Matrix ) : Matrix {

        // based on http://www.euclideanspace.com/maths/algebra/matrix/functions/inverse/fourD/index.htm

        var te = elements;
        var me = _m.elements;

        var n11 = me[0], n12 = me[4], n13 = me[8],  n14 = me[12];
        var n21 = me[1], n22 = me[5], n23 = me[9],  n24 = me[13];
        var n31 = me[2], n32 = me[6], n33 = me[10], n34 = me[14];
        var n41 = me[3], n42 = me[7], n43 = me[11], n44 = me[15];

            te[0]  = n23*n34*n42 - n24*n33*n42 + n24*n32*n43 - n22*n34*n43 - n23*n32*n44 + n22*n33*n44;
            te[4]  = n14*n33*n42 - n13*n34*n42 - n14*n32*n43 + n12*n34*n43 + n13*n32*n44 - n12*n33*n44;
            te[8]  = n13*n24*n42 - n14*n23*n42 + n14*n22*n43 - n12*n24*n43 - n13*n22*n44 + n12*n23*n44;
            te[12] = n14*n23*n32 - n13*n24*n32 - n14*n22*n33 + n12*n24*n33 + n13*n22*n34 - n12*n23*n34;
            te[1]  = n24*n33*n41 - n23*n34*n41 - n24*n31*n43 + n21*n34*n43 + n23*n31*n44 - n21*n33*n44;
            te[5]  = n13*n34*n41 - n14*n33*n41 + n14*n31*n43 - n11*n34*n43 - n13*n31*n44 + n11*n33*n44;
            te[9]  = n14*n23*n41 - n13*n24*n41 - n14*n21*n43 + n11*n24*n43 + n13*n21*n44 - n11*n23*n44;
            te[13] = n13*n24*n31 - n14*n23*n31 + n14*n21*n33 - n11*n24*n33 - n13*n21*n34 + n11*n23*n34;
            te[2]  = n22*n34*n41 - n24*n32*n41 + n24*n31*n42 - n21*n34*n42 - n22*n31*n44 + n21*n32*n44;
            te[6]  = n14*n32*n41 - n12*n34*n41 - n14*n31*n42 + n11*n34*n42 + n12*n31*n44 - n11*n32*n44;
            te[10] = n12*n24*n41 - n14*n22*n41 + n14*n21*n42 - n11*n24*n42 - n12*n21*n44 + n11*n22*n44;
            te[14] = n14*n22*n31 - n12*n24*n31 - n14*n21*n32 + n11*n24*n32 + n12*n21*n34 - n11*n22*n34;
            te[3]  = n23*n32*n41 - n22*n33*n41 - n23*n31*n42 + n21*n33*n42 + n22*n31*n43 - n21*n32*n43;
            te[7]  = n12*n33*n41 - n13*n32*n41 + n13*n31*n42 - n11*n33*n42 - n12*n31*n43 + n11*n32*n43;
            te[11] = n13*n22*n41 - n12*n23*n41 - n13*n21*n42 + n11*n23*n42 + n12*n21*n43 - n11*n22*n43;
            te[15] = n12*n23*n31 - n13*n22*n31 + n13*n21*n32 - n11*n23*n32 - n12*n21*n33 + n11*n22*n33;

        var det = me[ 0 ] * te[ 0 ] + me[ 1 ] * te[ 4 ] + me[ 2 ] * te[ 8 ] + me[ 3 ] * te[ 12 ];

        if (det == 0) {

            trace('Matrix.getInverse: cant invert matrix, determinant is 0');

            identity();

            return this;

        } //det == 0

        multiplyScalar( 1 / det );

        return this;

    } //getInverse


    public function scale( _v:Vector ) : Matrix {

        var te = elements;

            var _x = _v.x;
            var _y = _v.y;
            var _z = _v.z;

            te[0] *= _x; te[4] *= _y; te[8]  *= _z;
            te[1] *= _x; te[5] *= _y; te[9]  *= _z;
            te[2] *= _x; te[6] *= _y; te[10] *= _z;
            te[3] *= _x; te[7] *= _y; te[11] *= _z;

        return this;

    } //scale


    public function getMaxScaleOnAxis() : Float {

        var te = elements;

            var _scaleXSq = te[0] * te[0] + te[1] * te[1] + te[2]  * te[2];
            var _scaleYSq = te[4] * te[4] + te[5] * te[5] + te[6]  * te[6];
            var _scaleZSq = te[8] * te[8] + te[9] * te[9] + te[10] * te[10];

        return Math.sqrt( Math.max( _scaleXSq, Math.max( _scaleYSq, _scaleZSq ) ) );

    } //getMaxScaleOnAxis


    public function makeTranslation( _x:Float, _y:Float, _z:Float ) : Matrix {

        set(
            1, 0, 0, _x,
            0, 1, 0, _y,
            0, 0, 1, _z,
            0, 0, 0, 1
        );

        return this;

    } //makeTranslation


    public function makeRotationX( _theta:Float ) : Matrix {

        var _c = Math.cos(_theta);
        var _s = Math.sin(_theta);

            set(
                1,  0,   0,  0,
                0, _c, -_s,  0,
                0, _s,  _c,  0,
                0,  0,   0,  1
            );

        return this;

    } //makeRotationX


    public function makeRotationY(_theta:Float) : Matrix {

        var _c = Math.cos(_theta);
        var _s = Math.sin(_theta);

            set(
                 _c,  0, _s,  0,
                  0,  1,  0,  0,
                -_s,  0, _c,  0,
                  0,  0,  0,  1
            );

        return this;

    } //makeRotationY


    public function makeRotationZ(_theta:Float) : Matrix {

        var _c = Math.cos(_theta);
        var _s = Math.sin(_theta);

            set(
                _c, -_s,  0,  0,
                _s,  _c,  0,  0,
                 0,   0,  1,  0,
                 0,   0,  0,  1
            );

        return this;

    } //makeRotationZ


    public function makeRotationAxis( _axis:Vector, _angle:Float ) : Matrix {

        var _c = Math.cos( _angle );
        var _s = Math.sin( _angle );
        var _t = 1 - _c;

        var _ax = _axis.x;
        var _ay = _axis.y;
        var _az = _axis.z;

        var _tx = _t * _ax;
        var _ty = _t * _ay;

            set(
                _tx * _ax + _c,         _tx * _ay - _s * _az,   _tx * _az + _s  * _ay,  0,
                _tx * _ay + _s * _az,   _ty * _ay + _c,         _ty * _az - _s  * _ax,  0,
                _tx * _az - _s * _ay,   _ty * _az + _s * _ax,   _t  * _az * _az + _c,   0,
                0, 0, 0, 1
            );

        return this;

    } //makeRotationAxis


    public function makeScale( _x:Float, _y:Float, _z:Float) : Matrix {

            set(
                _x,  0,  0,  0,
                 0, _y,  0,  0,
                 0,  0, _z,  0,
                 0,  0,  0,  1
            );

        return this;

    } //makeScale


    public function compose_with_origin( _position:Vector, _origin:Vector, _quaternion:Quaternion, _scale:Vector ) : Matrix {

        //translate to origin -> scale -> rotate -> translate -origin -> apply position

            //origin ->
        makeTranslation(_origin.x, _origin.y, _origin.z);
            //scale ->
        scale(_scale);
            //rotation
        multiply( new Matrix().makeRotationFromQuaternion(_quaternion) );
            //translate -origin
        multiply( new Matrix().makeTranslation(-_origin.x, -_origin.y, -_origin.z) );
            //apply position
        multiply( new Matrix().makeTranslation(_position.x, _position.y, _position.z) );

        return this;

    }

    public function compose( _position:Vector, _quaternion:Quaternion, _scale:Vector ) : Matrix {

            makeRotationFromQuaternion( _quaternion );
            scale( _scale );
            setPosition( _position );

        return this;

    } //compose

    var _transform : MatrixTransform;

    public function decompose( _position:Vector = null, _quaternion:Quaternion = null, _scale:Vector = null ) : MatrixTransform {

        var te = elements;
        var matrix = new Matrix();

        var _ax_x = te[0]; var _ax_y = te[1]; var _ax_z = te[2];
        var _ay_x = te[4]; var _ay_y = te[5]; var _ay_z = te[6];
        var _az_x = te[8]; var _az_y = te[9]; var _az_z = te[10];

        var _ax_length = Math.sqrt( _ax_x * _ax_x + _ax_y * _ax_y + _ax_z * _ax_z );
        var _ay_length = Math.sqrt( _ay_x * _ay_x + _ay_y * _ay_y + _ay_z * _ay_z );
        var _az_length = Math.sqrt( _az_x * _az_x + _az_y * _az_y + _az_z * _az_z );


        if (_quaternion == null) {
            _quaternion = new Quaternion();
        }

        if (_position == null) {
            _position = new Vector(te[12], te[13], te[14]);
        } else {
            _position.x = te[12];
            _position.y = te[13];
            _position.z = te[14];
        }

        if (_scale == null) {
            _scale = new Vector(_ax_length,_ay_length,_az_length);
        } else {
            _scale.x = _ax_length;
            _scale.y = _ay_length;
            _scale.z = _az_length;
        }

                //copy them without .copy()
            matrix.elements = elements.concat([]);

            var me = matrix.elements;

                me[0]  /= _ax_length;
                me[1]  /= _ax_length;
                me[2]  /= _ax_length;

                me[4]  /= _ay_length;
                me[5]  /= _ay_length;
                me[6]  /= _ay_length;

                me[8]  /= _az_length;
                me[9]  /= _az_length;
                me[10] /= _az_length;

            _quaternion.setFromRotationMatrix( matrix );


        if(_transform == null) {
            _transform = new MatrixTransform(_position, _quaternion, _scale);
        } else {
            _transform.pos = _position;
            _transform.rotation = _quaternion;
            _transform.scale = _scale;
        }

        return _transform;

    } //decompose


    public function makeFrustum( _left:Float, _right:Float, _bottom:Float, _top:Float, _near:Float, _far:Float ) : Matrix {

        var te = elements;

        var tx = 2 * _near / (_right - _left);
        var ty = 2 * _near / (_top - _bottom);

        var a =  (_right + _left) / (_right - _left);
        var b =  (_top + _bottom) / (_top - _bottom);
        var c = -(_far + _near)   / (_far - _near);
        var d = -2 * _far * _near / (_far - _near);

            te[0] = tx;     te[4] = 0;      te[8]  = a;     te[12] = 0;
            te[1] = 0;      te[5] = ty;     te[9]  = b;     te[13] = 0;
            te[2] = 0;      te[6] = 0;      te[10] = c;     te[14] = d;
            te[3] = 0;      te[7] = 0;      te[11] = -1;    te[15] = 0;

        return this;

    } //makeFrustum


    public function makePerspective( _fov:Float, _aspect:Float, _near:Float, _far:Float ) : Matrix {

        var ymax = _near * Math.tan( Maths.radians(_fov * 0.5) );
        var ymin = -ymax;
        var xmin = ymin * _aspect;
        var xmax = ymax * _aspect;

        return makeFrustum( xmin, xmax, ymin, ymax, _near, _far );

    } //makePerspective


    public function makeOrthographic( _left:Float, _right:Float, _top:Float, _bottom:Float, _near:Float, _far:Float ) : Matrix {

        var te = elements;

        var w = _right - _left;
        var h = _top - _bottom;
        var p = _far - _near;

        var tx = ( _right + _left )   / w;
        var ty = ( _top   + _bottom ) / h;
        var tz = ( _far   + _near )   / p;

            te[0] = 2 / w;  te[4] = 0;      te[8] = 0;       te[12] = -tx;
            te[1] = 0;      te[5] = 2 / h;  te[9] = 0;       te[13] = -ty;
            te[2] = 0;      te[6] = 0;      te[10] = -2 / p; te[14] = -tz;
            te[3] = 0;      te[7] = 0;      te[11] = 0;      te[15] = 1;

        return this;

    } //makeOrthographic

    public function fromArray(_from:Array<Float>) {

        elements = _from.concat([]);

    } //fromArray

    public function toArray() : Array<Float> {

        var te = elements;

            return [
                te[ 0 ],  te[ 1 ],  te[ 2 ],  te[ 3 ],
                te[ 4 ],  te[ 5 ],  te[ 6 ],  te[ 7 ],
                te[ 8 ],  te[ 9 ],  te[ 10 ], te[ 11 ],
                te[ 12 ], te[ 13 ], te[ 14 ], te[ 15 ]
            ];

    } //toArray

    public function clone() : Matrix {

        var te = elements;

            return new Matrix(
                te[0], te[4], te[8],  te[12],
                te[1], te[5], te[9],  te[13],
                te[2], te[6], te[10], te[14],
                te[3], te[7], te[11], te[15]
            );

    } //clone

    public function up() {
        return new Vector( elements[4], elements[5], elements[10] );
    } //up

    public function down() : Vector {
        return up().inverted;
    } //down

    public function left() : Vector {
        return right().inverted;
    } //left

    public function right() : Vector {
        return new Vector( elements[0], elements[1], elements[2] );
    } //right

    public function backward() {
        return new Vector( elements[8], elements[9], elements[10] );
    } //backward

    public function forward() : Vector {
        return backward().inverted;
    } //forward


} //Matrix


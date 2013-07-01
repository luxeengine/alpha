package phoenix;


import phoenix.utils.Maths;
// import three.THREE;
import phoenix.Vector;
import phoenix.Quaternion;

/**
 * 
 * @author Three.js Project (http://threejs.org)
 * @author dcm
 */

class Matrix4
{

	public var elements:Array<Float>;
	
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
	
	
	public function set (
		n11:Float, n12:Float, n13:Float, n14:Float,
		n21:Float, n22:Float, n23:Float, n24:Float,
		n31:Float, n32:Float, n33:Float, n34:Float,
		n41:Float, n42:Float, n43:Float, n44:Float) : Matrix4
	{
		var e = elements;
		e[0] = n11; e[4] = n12; e[8] = n13; e[12] = n14;
		e[1] = n21; e[5] = n22; e[9] = n23; e[13] = n24;
		e[2] = n31; e[6] = n32; e[10] = n33; e[14] = n34;
		e[3] = n41; e[7] = n42; e[11] = n43; e[15] = n44;
		return this;
	}
	
	public function float32array() : lime.utils.Float32Array {
		return new lime.utils.Float32Array(elements);
	}	

	public function identity () : Matrix4
	{
		set(
			1, 0, 0, 0,
			0, 1, 0, 0,
			0, 0, 1, 0,
			0, 0, 0, 1
		);
		return this;
	}
	
	
	public function copy (m:Matrix4) : Matrix4
	{
		var me = m.elements;
		set(
			me[0], me[4], me[8], me[12],
			me[1], me[5], me[9], me[13],
			me[2], me[6], me[10], me[14],
			me[3], me[7], me[11], me[15]
		);
		return this;
	}
	
 	public function make2D(_x:Float, _y:Float, _scale:Float = 1, _rotation:Float = 0) {

      var theta = Maths.degToRad(_rotation);
      var c = Math.cos(theta);
      var s = Math.sin(theta);

      var me = elements;
       set(
         c * _scale,  -s *_scale,  me[8], 		me[12],
         s * _scale,   c *_scale,  me[9],		me[13],
         me[2],        me[6],      me[10],  	me[14],
        _x,           _y,          me[11], 		me[15]
      );

       return this;
   }	
	
	public function extractPosition (m:Matrix4) : Matrix4
	{
		return copyPosition(m);
	}
	
	
	public function copyPosition (m:Matrix4) : Matrix4
	{
		var te = elements;
		var me = m.elements;
		te[12] = me[12];
		te[13] = me[13];
		te[14] = me[14];
		return this;
	}
	
	
	public function extractRotation (m:Matrix4) : Matrix4
	{
		var v1 = new Vector();
		var te = elements;
		var me = m.elements;
		
		var scaleX = 1 / v1.set(me[0], me[1], me[2]).length;
		var scaleY = 1 / v1.set(me[4], me[5], me[6]).length;
		var scaleZ = 1 / v1.set(me[8], me[9], me[10]).length;
		
		te[0] = me[0] * scaleX;
		te[1] = me[1] * scaleX;
		te[2] = me[2] * scaleX;
		
		te[4] = me[4] * scaleY;
		te[5] = me[5] * scaleY;
		te[6] = me[6] * scaleY;
		
		te[8] = me[8] * scaleZ;
		te[9] = me[9] * scaleZ;
		te[10] = me[10] * scaleZ;
		
		return this;
	}
	
	
	public function setRotationFromEuler (v:Vector, order:String = 'XYZ') : Matrix4
	{
		return makeRotationFromEuler(v, order);
	}
	
	
	public function makeRotationFromEuler (v:Vector, order:String = 'XYZ') : Matrix4
	{
		var te = elements;
		var a = Math.cos(v.x), b = Math.sin(v.x);
		var c = Math.cos(v.y), d = Math.sin(v.y);
		var e = Math.cos(v.z), f = Math.sin(v.z);
		
		//todo - rest of the euler orders
		if (order == 'XYZ')
		{
			var ae = a * e, af = a * f, be = b * e, bf = b * f;
			te[0] = c * e;
			te[4] = -c * f;
			te[8] = d;
			
			te[1] = af + be * d;
			te[5] = ae - bf * d;
			te[9] = -b * c;
			
			te[2] = bf - ae * d;
			te[6] = be + af * d;
			te[10] = a * c;
			
		}
		
		te[3] = 0;
		te[7] = 0;
		te[11] = 0;
		
		te[12] = 0;
		te[13] = 0;
		te[14] = 0;
		te[15] = 1;
		
		return this;
	}
	
	
	public function setRotationFromQuaternion (q:Quaternion) : Matrix4
	{
		return makeRotationFromQuaternion(q);
	}
	
	
	public function makeRotationFromQuaternion (q:Quaternion) : Matrix4
	{
		var te = elements;
		var x2 = q.x + q.x, y2 = q.y + q.y, z2 = q.z + q.z;
		var xx = q.x * x2, xy = q.x * y2, xz = q.x * z2;
		var yy = q.y * y2, yz = q.y * z2, zz = q.z * z2;
		var wx = q.w * x2, wy = q.w * y2, wz = q.w * z2;
		
		te[0] = 1 - (yy + zz);
		te[4] = xy - wz;
		te[8] = xz + wy;
		
		te[1] = xy + wz;
		te[5] = 1 - (xx + zz);
		te[9] = yz - wx;
		
		te[2] = xz - wy;
		te[6] = yz + wx;
		te[10] = 1 - (xx + yy);
		
		te[3] = 0;
		te[7] = 0;
		te[11] = 0;
		
		te[12] = 0;
		te[13] = 0;
		te[14] = 0;
		te[15] = 1;
		
		return this;
	}
	
	
	public function lookAt (eye:Vector, target:Vector, up:Vector) : Matrix4
	{
		var x = new Vector(), y = new Vector(), z = new Vector();
		var te = elements;
		
		z.subVectors(eye, target).normalize();
		if (z.length == 0) z.z = 1;
		
		x.crossVectors(up, z).normalize();
		if (x.length == 0) 
		{
			z.x += 0.0001;
			x.crossVectors(up, z).normalize();
		}
		
		y.crossVectors(z, x);
		
		te[0] = x.x;	te[4] = y.x;	te[8] = z.x;
		te[1] = x.y;	te[5] = y.y;	te[9] = z.y;
		te[2] = x.z;	te[6] = y.z;	te[10] = z.z;
		
		return this;
	}
	
	
	public function multiply (m:Matrix4, n:Matrix4 = null) : Matrix4
	{
		if (n != null) return multiplyMatrices(m, n);
		return multiplyMatrices(this, m);
	}
	
	
	public function multiplyMatrices (a:Matrix4, b:Matrix4) : Matrix4
	{
		var ae = a.elements;
		var be = b.elements;
		var te = elements;
		
		var a11 = ae[0], a12 = ae[4], a13 = ae[8], a14 = ae[12];
		var a21 = ae[1], a22 = ae[5], a23 = ae[9], a24 = ae[13];
		var a31 = ae[2], a32 = ae[6], a33 = ae[10], a34 = ae[14];
		var a41 = ae[3], a42 = ae[7], a43 = ae[11], a44 = ae[15];
		
		var b11 = be[0], b12 = be[4], b13 = be[8], b14 = be[12];
		var b21 = be[1], b22 = be[5], b23 = be[9], b24 = be[13];
		var b31 = be[2], b32 = be[6], b33 = be[10], b34 = be[14];
		var b41 = be[3], b42 = be[7], b43 = be[11], b44 = be[15];
		
		te[0] = a11 * b11 + a12 * b21 + a13 * b31 + a14 * b41;
		te[4] = a11 * b12 + a12 * b22 + a13 * b32 + a14 * b42;
		te[8] = a11 * b13 + a12 * b23 + a13 * b33 + a14 * b43;
		te[12] = a11 * b14 + a12 * b24 + a13 * b34 + a14 * b44;
		
		te[1] = a21 * b11 + a22 * b21 + a23 * b31 + a24 * b41;
		te[5] = a21 * b12 + a22 * b22 + a23 * b32 + a24 * b42;
		te[9] = a21 * b13 + a22 * b23 + a23 * b33 + a24 * b43;
		te[13] = a21 * b14 + a22 * b24 + a23 * b34 + a24 * b44;
		
		te[2] = a31 * b11 + a32 * b21 + a33 * b31 + a34 * b41;
		te[6] = a31 * b12 + a32 * b22 + a33 * b32 + a34 * b42;
		te[10] = a31 * b13 + a32 * b23 + a33 * b33 + a34 * b43;
		te[14] = a31 * b14 + a32 * b24 + a33 * b34 + a34 * b44;
		
		te[3] = a41 * b11 + a42 * b21 + a43 * b31 + a44 * b41;
		te[7] = a41 * b12 + a42 * b22 + a43 * b32 + a44 * b42;
		te[11] = a41 * b13 + a42 * b23 + a43 * b33 + a44 * b43;
		te[15] = a41 * b14 + a42 * b24 + a43 * b34 + a44 * b44;
		
		return this;
	}
	
	
	public function multiplyToArray (a:Matrix4, b:Matrix4, r:Array<Float>) : Matrix4
	{
		var te = elements;
		multiplyMatrices(a, b);
		r[0] = te[0]; r[1] = te[1]; r[2] = te[2]; r[3] = te[3];
		r[4] = te[4]; r[5] = te[5]; r[6] = te[6]; r[7] = te[7];
		r[8] = te[8]; r[9] = te[9]; r[10] = te[10]; r[11] = te[11];
		r[12] = te[12]; r[13] = te[13]; r[14] = te[14]; r[15] = te[15];
		return this;
	}
	
	
	public function multiplyScalar (s:Float) : Matrix4
	{
		var te = elements;
		te[0] *= s; te[4] *= s; te[8] *= s; te[12] *= s;
		te[1] *= s; te[5] *= s; te[9] *= s; te[13] *= s;
		te[2] *= s; te[6] *= s; te[10] *= s; te[14] *= s;
		te[3] *= s; te[7] *= s; te[11] *= s; te[15] *= s;
		return this;
	}
	
	
	public function multiplyVector3 (v:Vector) : Vector
	{
		return v.applyProjection(this);
	}
	
	
	public function multiplyVector4 (v:Vector) : Vector
	{
		return v.applyMatrix4(this);
	}
	
	
	public function multiplyVector3Array (a:Array<Float>) : Array<Float>
	{
		var v1 = new Vector();
		var i = 0, il = a.length;
		while (i < il)
		{
			v1.x = a[i];
			v1.y = a[i + 1];
			v1.z = a[i + 2];
			v1.applyProjection(this);
			a[i] = v1.x;
			a[i + 1] = v1.y;
			a[i + 2] = v1.z;
			i += 3;
		}
		return a;
	}
	
	
	public function rotateAxis (v:Vector)
	{
		v.transformDirection(this);
	}
	
	
	public function crossVector (v:Vector) : Vector
	{
		return v.applyMatrix4(this);
	}
	
	
	public function determinant () : Float
	{
		var te = elements;
		var n11 = te[0], n12 = te[4], n13 = te[8], n14 = te[12];
		var n21 = te[1], n22 = te[5], n23 = te[9], n24 = te[13];
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
	}
	
	
	public function transpose () : Matrix4
	{
		var te = elements;
		var tmp:Float;
		
		tmp = te[1]; te[1] = te[4]; te[4] = tmp;
		tmp = te[2]; te[2] = te[8]; te[8] = tmp;
		tmp = te[6]; te[6] = te[9]; te[9] = tmp;
		
		tmp = te[3]; te[3] = te[12]; te[12] = tmp;
		tmp = te[7]; te[7] = te[13]; te[13] = tmp;
		tmp = te[11]; te[11] = te[14]; te[14] = tmp;
		
		return this;
		
	}
	
	
	public function flattenToArray (flat:Array<Float> = null) : Array<Float>
	{
		if (flat == null) 
		{
			flat = new Array<Float>();
			var i = 0;
			while (i++ < 16) flat.push(0.0);
		}
		var te = elements;
		flat[ 0 ] = te[0]; flat[ 1 ] = te[1]; flat[ 2 ] = te[2]; flat[ 3 ] = te[3];
		flat[ 4 ] = te[4]; flat[ 5 ] = te[5]; flat[ 6 ] = te[6]; flat[ 7 ] = te[7];
		flat[ 8 ] = te[8]; flat[ 9 ] = te[9]; flat[ 10 ] = te[10]; flat[ 11 ] = te[11];
		flat[ 12 ] = te[12]; flat[ 13 ] = te[13]; flat[ 14 ] = te[14]; flat[ 15 ] = te[15];
		return flat;
	}
	
	
	public function flattenToArrayOffset (flat:Array<Float>, offset:Int) : Array<Float>
	{
		var te = this.elements;
		flat[ offset ] = te[0];
		flat[ offset + 1 ] = te[1];
		flat[ offset + 2 ] = te[2];
		flat[ offset + 3 ] = te[3];
		
		flat[ offset + 4 ] = te[4];
		flat[ offset + 5 ] = te[5];
		flat[ offset + 6 ] = te[6];
		flat[ offset + 7 ] = te[7];
		
		flat[ offset + 8 ]  = te[8];
		flat[ offset + 9 ]  = te[9];
		flat[ offset + 10 ] = te[10];
		flat[ offset + 11 ] = te[11];
		
		flat[ offset + 12 ] = te[12];
		flat[ offset + 13 ] = te[13];
		flat[ offset + 14 ] = te[14];
		flat[ offset + 15 ] = te[15];
		
		return flat;
	}
	
	
	public function getPosition () : Vector
	{
		var te = elements;
		return new Vector(te[12], te[13], te[14]);
	}
	
	
	public function setPosition (v:Vector) : Matrix4
	{
		var te = elements;
		te[12] = v.x;
		te[13] = v.y;
		te[14] = v.z;
		return this;
	}
	
	
	public function getInverse (m:Matrix4) : Matrix4
	{
		var te = elements;
		var me = m.elements;
		
		var n11 = me[0], n12 = me[4], n13 = me[8], n14 = me[12];
		var n21 = me[1], n22 = me[5], n23 = me[9], n24 = me[13];
		var n31 = me[2], n32 = me[6], n33 = me[10], n34 = me[14];
		var n41 = me[3], n42 = me[7], n43 = me[11], n44 = me[15];
		
		te[0] = n23*n34*n42 - n24*n33*n42 + n24*n32*n43 - n22*n34*n43 - n23*n32*n44 + n22*n33*n44;
		te[4] = n14*n33*n42 - n13*n34*n42 - n14*n32*n43 + n12*n34*n43 + n13*n32*n44 - n12*n33*n44;
		te[8] = n13*n24*n42 - n14*n23*n42 + n14*n22*n43 - n12*n24*n43 - n13*n22*n44 + n12*n23*n44;
		te[12] = n14*n23*n32 - n13*n24*n32 - n14*n22*n33 + n12*n24*n33 + n13*n22*n34 - n12*n23*n34;
		te[1] = n24*n33*n41 - n23*n34*n41 - n24*n31*n43 + n21*n34*n43 + n23*n31*n44 - n21*n33*n44;
		te[5] = n13*n34*n41 - n14*n33*n41 + n14*n31*n43 - n11*n34*n43 - n13*n31*n44 + n11*n33*n44;
		te[9] = n14*n23*n41 - n13*n24*n41 - n14*n21*n43 + n11*n24*n43 + n13*n21*n44 - n11*n23*n44;
		te[13] = n13*n24*n31 - n14*n23*n31 + n14*n21*n33 - n11*n24*n33 - n13*n21*n34 + n11*n23*n34;
		te[2] = n22*n34*n41 - n24*n32*n41 + n24*n31*n42 - n21*n34*n42 - n22*n31*n44 + n21*n32*n44;
		te[6] = n14*n32*n41 - n12*n34*n41 - n14*n31*n42 + n11*n34*n42 + n12*n31*n44 - n11*n32*n44;
		te[10] = n12*n24*n41 - n14*n22*n41 + n14*n21*n42 - n11*n24*n42 - n12*n21*n44 + n11*n22*n44;
		te[14] = n14*n22*n31 - n12*n24*n31 - n14*n21*n32 + n11*n24*n32 + n12*n21*n34 - n11*n22*n34;
		te[3] = n23*n32*n41 - n22*n33*n41 - n23*n31*n42 + n21*n33*n42 + n22*n31*n43 - n21*n32*n43;
		te[7] = n12*n33*n41 - n13*n32*n41 + n13*n31*n42 - n11*n33*n42 - n12*n31*n43 + n11*n32*n43;
		te[11] = n13*n22*n41 - n12*n23*n41 - n13*n21*n42 + n11*n23*n42 + n12*n21*n43 - n11*n22*n43;
		te[15] = n12*n23*n31 - n13*n22*n31 + n13*n21*n32 - n11*n23*n32 - n12*n21*n33 + n11*n22*n33;
		
		var det = me[ 0 ] * te[ 0 ] + me[ 1 ] * te[ 4 ] + me[ 2 ] * te[ 8 ] + me[ 3 ] * te[ 12 ];
		
		if (det == 0)
		{
			trace('Matrix4.getInverse: cant invert matrix, determinant is 0');
			identity();
			return this;
		}
		
		multiplyScalar(1 / det);
		return this;
	}
	
	
	public function scale (v:Vector) : Matrix4
	{
		var te = elements;
		var x = v.x, y = v.y, z = v.z;
		te[0] *= x; te[4] *= y; te[8] *= z;
		te[1] *= x; te[5] *= y; te[9] *= z;
		te[2] *= x; te[6] *= y; te[10] *= z;
		te[3] *= x; te[7] *= y; te[11] *= z;
		
		return this;
	}
	
	
	public function getMaxScaleOnAxis () : Float
	{
		var te = elements;
		
		var scaleXSq = te[0] * te[0] + te[1] * te[1] + te[2] * te[2];
		var scaleYSq = te[4] * te[4] + te[5] * te[5] + te[6] * te[6];
		var scaleZSq = te[8] * te[8] + te[9] * te[9] + te[10] * te[10];
		
		return Math.sqrt( Math.max( scaleXSq, Math.max( scaleYSq, scaleZSq ) ) );		
	}
	
	
	public function makeTranslation (x:Float, y:Float, z:Float) : Matrix4
	{
		set(
			1, 0, 0, x,
			0, 1, 0, y,
			0, 0, 1, z,
			0, 0, 0, 1
		);
		return this;
	}
	
	
	public function makeRotationX (theta:Float) : Matrix4
	{
		var c =  Math.cos(theta), s = Math.sin(theta);
		set(
			1, 0, 0, 0,
			0, c, -s, 0,
			0, s, c, 0,
			0, 0, 0, 1
		);
		return this;
	}
	
	
	public function makeRotationY (theta:Float) : Matrix4
	{
		var c = Math.cos(theta), s = Math.sin(theta);
		set(
			c, 0, s, 0,
			0, 1, 0, 0,
			-s, 0, c, 0,
			0, 0, 0, 1
		);
		return this;
	}
	
	
	public function makeRotationZ (theta:Float) : Matrix4
	{
		var c = Math.cos(theta), s = Math.sin(theta);
		set(
			c, -s, 0, 0,
			s, c, 0, 0,
			0, 0, 1, 0,
			0, 0, 0, 1
		);
		return this;
	}
	
	
	public function makeRotationAxis (axis:Vector, angle:Float) : Matrix4
	{
		var c = Math.cos( angle );
		var s = Math.sin( angle );
		var t = 1 - c;
		var ax = axis.x, ay = axis.y, az = axis.z;
		var tx = t * ax, ty = t * ay;
		
		set(
			tx * ax + c,		tx * ay - s * az,	tx * az + s * ay,	0,
			tx * ay + s * az,	ty * ay + c,		ty * az - s * ax,	0,
			tx * az - s * ay,	ty * az + s * ax,	t * az * az + c,	0,
			0, 0, 0, 1
		);
		return this;
	}
	
	
	public function makeScale (x:Float, y:Float, z:Float) : Matrix4
	{
		set(
			x, 0, 0, 0,
			0, y, 0, 0,
			0, 0, z, 0,
			0, 0, 0, 1
		);
		return this;
	}
	
	
	public function compose (vpos:Vector, q:Quaternion, vscale:Vector) : Matrix4
	{
		return makeFromPositionQuaternionScale(vpos, q, vscale);
	}
	
	
	public function makeFromPositionQuaternionScale (vpos:Vector, q:Quaternion, vscale:Vector) : Matrix4
	{
		makeRotationFromQuaternion(q);
		scale(vscale);
		setPosition(vpos);
		return this;
	}
	
	
	//swapped scale/order arguments for default 'XYZ' order
	public function makeFromPositionEulerScale (vpos:Vector, vrot:Vector, vscale:Vector, order:String = 'XYZ') : Matrix4
	{
		makeRotationFromEuler(vrot, order);
		scale(vscale);
		setPosition(vpos);
		return this;
	}
	
	
	public function makeFrustum (left:Float, right:Float, bottom:Float, top:Float, near:Float, far:Float) : Matrix4
	{
		var te = elements;
		var tx = 2 * near / (right - left);
		var ty = 2 * near / (top - bottom);
		var a = (right + left) / (right - left);
		var b = (top + bottom) / (top - bottom);
		var c = -(far + near) / (far - near);
		var d = -2 * far * near / (far - near);
		
		te[0] = tx;		te[4] = 0;		te[8] = a;		te[12] = 0;
		te[1] = 0;		te[5] = ty;		te[9] = b;		te[13] = 0;
		te[2] = 0;		te[6] = 0;		te[10] = c;		te[14] = d;
		te[3] = 0;		te[7] = 0;		te[11] = -1;	te[15] = 0;
		
		return this;
	}
	
	
	public function makePerspective (fov:Float, aspect:Float, near:Float, far:Float) : Matrix4
	{
		var ymax = near * Math.tan( Maths.degToRad(fov * 0.5) );
		var ymin = -ymax;
		var xmin = ymin * aspect;
		var xmax = ymax * aspect;
		return makeFrustum(xmin, xmax, ymin, ymax, near, far);
	}
	
	
	public function makeOrthographic (left:Float, right:Float, top:Float, bottom:Float, near:Float, far:Float) : Matrix4
	{
		var te = elements;
		var w = right - left;
		var h = top - bottom;
		var p = far - near;
		
		var tx = ( right + left ) / w;
		var ty = ( top + bottom ) / h;
		var tz = ( far + near ) / p;
		
		te[0] = 2 / w;	te[4] = 0;		te[8] = 0;		te[12] = -tx;
		te[1] = 0;		te[5] = 2 / h;	te[9] = 0;		te[13] = -ty;
		te[2] = 0;		te[6] = 0;		te[10] = -2/p;	te[14] = -tz;
		te[3] = 0;		te[7] = 0;		te[11] = 0;		te[15] = 1;
		
		return this;
	}
	
	
	public function clone () : Matrix4
	{
		var te = elements;
		return new Matrix4(
			te[0], te[4], te[8], te[12],
			te[1], te[5], te[9], te[13],
			te[2], te[6], te[10], te[14],
			te[3], te[7], te[11], te[15]
		);
	}
	
	
	public function decompose (position:Vector = null, quaternion:Quaternion = null, scale:Vector = null) : Array<Dynamic>
	{
		var te = elements;
		
		var ax = new Vector(te[0], te[1], te[2]);
		var ay = new Vector(te[4], te[5], te[6]);
		var az = new Vector(te[8], te[9], te[10]);
		var matrix = new Matrix4();
		
		
		if (position == null) position = new Vector();
		if (quaternion == null) quaternion = new Quaternion();
		if (scale == null) scale = new Vector();
		
		scale.x = ax.length;
		scale.y = ay.length;
		scale.z = az.length;
		
		position.x = te[12];
		position.y = te[13];
		position.z = te[14];
		
		matrix.copy(this);
		
		var me = matrix.elements;
		me[0] /= scale.x;
		me[1] /= scale.x;
		me[2] /= scale.x;
		
		me[4] /= scale.y;
		me[5] /= scale.y;
		me[6] /= scale.y;
		
		me[8] /= scale.z;
		me[9] /= scale.z;
		me[10] /= scale.z;
		
		quaternion.setFromRotationMatrix(matrix);
		
		var arr = new Array<Dynamic>();
		arr.push(position);
		arr.push(quaternion);
		arr.push(scale);
		return arr;
	}
	
	
}


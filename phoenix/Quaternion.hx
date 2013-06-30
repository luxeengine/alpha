package phoenix;


/* 
 * 
 * @author Three.js Project (http://threejs.org)
 * @author dcm
 */

class Quaternion
{
	
	public var x:Float;
	public var y:Float;
	public var z:Float;
	public var w:Float;
	
	
	public function new (x:Float = 0, y:Float = 0, z:Float = 0, w:Float = 1) 
	{
		this.x = x;
		this.y = y;
		this.z = z;
		this.w = w;
	}
	
	
	public function set (x:Float, y:Float, z:Float, w:Float) : Quaternion
	{
		this.x = x;
		this.y = y;
		this.z = z;
		this.w = w;
		return this;
	}
	
	
	public function copy (q:Quaternion) : Quaternion
	{
		this.x = q.x;
		this.y = q.y;
		this.z = q.z;
		this.w = q.w;
		return this;
	}
	
	
	public function setFromEuler (v:Vector, order:String = 'XYZ') : Quaternion
	{
		var c1 = Math.cos(v.x / 2);
		var c2 = Math.cos(v.y / 2);
		var c3 = Math.cos(v.z / 2);
		var s1 = Math.sin(v.x / 2);
		var s2 = Math.sin(v.y / 2);
		var s3 = Math.sin(v.z / 2);
		
		if (order == 'XYZ')
		{
			this.x = s1 * c2 * c3 + c1 * s2 * s3;
			this.y = c1 * s2 * c3 - s1 * c2 * s3;
			this.z = c1 * c2 * s3 + s1 * s2 * c3;
			this.w = c1 * c2 * c3 - s1 * s2 * s3;
		}
		return this;
	}
	
	
	public function setFromAxisAngle (axis:Vector, angle:Float) : Quaternion
	{
		var halfAngle = angle / 2;
		var s = Math.sin(halfAngle);
		this.x = axis.x * s;
		this.y = axis.y * s;
		this.z = axis.z * s;
		this.w = Math.cos(halfAngle);
		return this;
	}
	
	
	public function setFromRotationMatrix (m:Matrix4) : Quaternion
	{
		var e = m.elements;
		var m11 = e[0], m12 = e[4], m13 = e[8];
		var m21 = e[1], m22 = e[5], m23 = e[9];
		var m31 = e[2], m32 = e[6], m33 = e[10];
		var tr = m11 + m22 + m33, s:Float;
		
		if (tr > 0)
		{
			s = 0.5 / Math.sqrt(tr + 1.0);
			this.w = 0.25 / s;
			this.x = (m32 - m23) * s;
			this.y = (m13 - m31) * s;
			this.z = (m21 - m12) * s;
			
		} else if (m11 > m22 && m11 > m33)
		{
			s = 2.0 * Math.sqrt(1.0 + m11 - m22 - m33);
			this.w = (m32 - m23) / s;
			this.x = 0.25 * s;
			this.y = (m12 + m21) / s;
			this.z = (m13 + m31) / s;
			
		} else if (m22 > m33)
		{
			s = 2.0 * Math.sqrt(1.0 + m22 - m11 - m33);
			this.w = (m13 - m31) / s;
			this.x = (m12 + m21) / s;
			this.y = 0.25 * s;
			this.z = (m23 + m32) / s;
			
		} else 
		{
			s = 2.0 * Math.sqrt(1.0 + m33 - m11 - m22);
			this.w = (m21 - m12) / s;
			this.x = (m13 + m31) / s;
			this.y = (m23 + m32) / s;
			this.z = 0.25 * s;
		}
		
		return this;
	}
	
	
	public function inverse () : Quaternion
	{
		return conjugate().normalize();
	}
	
	
	public function conjugate () : Quaternion
	{
		this.x *= -1;
		this.y *= -1;
		this.z *= -1;
		return this;
	}

	
	public function lengthSq () : Float
	{
		return x * x + y * y + z * z + w * w;
	}
	
	
	public function length () : Float
	{
		return Math.sqrt(x * x + y * y + z * z + w * w);
	}
	
	
	public function normalize () : Quaternion
	{
		var l = length();
		if (l == 0)
		{
			this.x = 0;
			this.y = 0;
			this.z = 0;
			this.w = 1;
		} else
		{
			l = 1 / l;
			this.x *= l;
			this.y *= l;
			this.z *= l;
			this.w *= l;
		}
		return this;
	}
	
	
	public function multiply (q:Quaternion, p:Quaternion = null) : Quaternion
	{
		if (p != null) return multiplyQuaternions(q, p);
		return multiplyQuaternions(this, q);
	}
	
	
	public function multiplyQuaternions (a:Quaternion, b:Quaternion) : Quaternion
	{
		var qax = a.x, qay = a.y, qaz = a.z, qaw = a.w;
		var qbx = b.x, qby = b.y, qbz = b.z, qbw = b.w;
		
		this.x = qax * qbw + qaw * qbx + qay * qbz - qaz * qby;
		this.y = qay * qbw + qaw * qby + qaz * qbx - qax * qbz;
		this.z = qaz * qbw + qaw * qbz + qax * qby - qay * qbx;
		this.w = qaw * qbw - qax * qbx - qay * qby - qaz * qbz;
		return this;
	}
	
	
	public function multiplyVector (v:Vector) : Vector
	{
		return v.applyQuaternion(this);
	}
	
	
	public function equals (q:Quaternion) : Bool
	{
		return ( (q.x == x) && (q.y == y) && (q.z == z) && (q.w == w) );
	}
	
	
	public function slerp (qb:Quaternion, t:Float) : Quaternion
	{
		trace('Quaternion.slerp: NOT DONE YET');
		return this;
	}
	
	
	public function fromArray (a:Array<Float>) : Quaternion
	{
		this.x = a[0];
		this.y = a[1];
		this.z = a[2];
		this.w = a[3];
		return this;
	}
	
	
	public function toArray () : Array<Float>
	{
		var a = new Array<Float>();
		a.push(this.x);
		a.push(this.y);
		a.push(this.z);
		a.push(this.w);
		return a;
	}
	
	
	public function clone () : Quaternion
	{
		return new Quaternion(this.x, this.y, this.z, this.w);
	}
	
	
}


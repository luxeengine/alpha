package phoenix;

import phoenix.utils.Maths;



class Vector implements Dynamic {
	
	@:isVar public var x(default, set) : Float = 0;
	@:isVar public var y(default, set) : Float = 0;
	@:isVar public var z(default, set) : Float = 0;
	@:isVar public var w(default, default) : Float = 0;

	@:isVar public var length(get, set) : Float;
	@:isVar public var normalized(get, null) : Vector;
	@:isVar public var inverted(get, null) : Vector;

	@:isVar public var listen_x(default,default) : Float -> Void;
	@:isVar public var listen_y(default,default) : Float -> Void;
	@:isVar public var listen_z(default,default) : Float -> Void;

	public function new( _x:Float = 0, _y:Float = 0, _z:Float = 0, _w:Float = 0) {
		x = _x;
		y = _y;
		z = _z;
		w = _w;
	}

	
	public function set (?_x:Float, ?_y:Float, ?_z:Float) : Vector {
		
		var _setx = x;
		var _sety = y;
		var _setz = z;
			
			//assign new values
		if(_x != null) _setx = _x;
		if(_y != null) _sety = _y;
		if(_z != null) _setz = _z;

		x = _setx;
		y = _sety;
		z = _setz;

		return this;
	}
	


	public function toString() {
		return "{ x:"+x + ", y:" + y + ", z:" + z  + " }" ;
	}

	public function clone() {
		return new Vector(x,y,z,w);
	}

	public function get_inverted() : Vector {
		return new Vector(-x,-y,-z);
	}

	public static function Cross(a:Vector, b:Vector) {
		return new Vector(
			 a.y * b.z - a.z * b.y,
			 a.z * b.x - a.x * b.z,
			 a.x * b.y - a.y * b.x
		);
	}

	public function dot(other:Vector) {
		return x * other.x + y * other.y + z * other.z;
	}


//Static external functions

	public static function Add(a:Vector, b:Vector) {
		return new Vector(
			a.x + b.x,
			a.y + b.y,
			a.z + b.z
		);
	}

	public static function Subtract(a:Vector, b:Vector) {
		return new Vector(
			a.x - b.x,
			a.y - b.y,
			a.z - b.z
		);
	}

	public static function MultiplyVector(a:Vector, b:Vector) : Vector {
		return new Vector(
			a.x * b.x,
			a.y * b.y,
			a.z * b.z
		);
	}

	public static function DivideVector(a:Vector, b:Vector) {
		return new Vector(
			a.x / b.x,
			a.y / b.y,
			a.z / b.z
		);
	}

	public static function Multiply(a:Vector, b:Float) {
		return new Vector(
			a.x * b,
			a.y * b,
			a.z * b
		);
	}

	public static function Divide(a:Vector, b:Float) {
		return new Vector(
			a.x / b,
			a.y / b,
			a.z / b
		);
	}

	public static function AddScalar(a:Vector, b:Float) {
		return new Vector(
			a.x + b,
			a.y + b,
			a.z + b
		);
	}

	public static function SubtractScalar(a:Vector, b:Float) {
		return new Vector(
			a.x - b,
			a.y - b,
			a.z - b
		);
	}

// local modifiers

	public function add(other:Vector) {

		if(other == null) {
			throw "vector.add other was handed in as null";
		}

		x += other.x;
        y += other.y;
        z += other.z;

        return this;
	}
	
	public function subtract(other:Vector) {

		if(other == null) {
			throw "vector.subtract other was handed in as null";
		}

		x -= other.x;
        y -= other.y;
        z -= other.z;

        return this;
	}
	
	public function multiply(other:Vector) {

		if(other == null) {
			throw "vector.multiply other was handed in as null";
		}

		x *= other.x;
        y *= other.y;
        z *= other.z;

        return this;
	}

	 public function multiplyScalar ( v:Float ) {

		x *= v;
		y *= v;
		z *= v;

		return this;
	}

	public function divideScalar (v:Float) : Vector {

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
	}

	public function subVectors (a:Vector, b:Vector) : Vector {

		x = a.x - b.x;
		y = a.y - b.y;
		z = a.z - b.z;

		return this;
	}

	public function crossVectors( a:Vector, b:Vector ) {

		x = a.y * b.z - a.z * b.y;
		y = a.z * b.x - a.x * b.z;
		z = a.x * b.y - a.y * b.x;

		return this;

	}

	public function set_length(v:Float) : Float {
		return 0;
	}

	public function get_length() : Float {
		return Math.sqrt( x * x + y * y + z * z );
	}

	public function get_normalized() {
		return Vector.Divide( this, length );
	}

	public function normalize() {
		return divideScalar( length );
	}


	public function set_x(_x:Float) : Float {
		x = _x;
		if(listen_x != null) listen_x(_x);
		return x;
	}

	public function set_y(_y:Float) : Float {
		y = _y;
		if(listen_y != null) listen_y(_y);
		return y;
	}

	public function set_z(_z:Float) : Float {
		z = _z;
		if(listen_z != null) listen_z(_z);
		return z;
	}

	public function applyQuaternion (q:Quaternion) : Vector {

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
	}	

	public function applyProjection (m:Matrix4) : Vector {

		var e = m.elements;
		var x = this.x, y = this.y, z = this.z;
		var d:Float = 1 / (e[3] * x + e[7] * y + e[11] * z + e[15]);
		this.x = (e[0] * x + e[4] * y + e[8] * z + e[12]) * d;
		this.y = (e[1] * x + e[5] * y + e[9] * z + e[13]) * d;
		this.z = (e[2] * x + e[6] * y + e[10] * z + e[14]) * d;
		return this;
	}	

	public function applyMatrix4 (m:Matrix4) : Vector {
		var e = m.elements;
		var x = this.x, y = this.y, z = this.z;
		this.x = e[0] * x + e[4] * y + e[8] * z + e[12];
		this.y = e[1] * x + e[5] * y + e[9] * z + e[13];
		this.z = e[2] * x + e[6] * y + e[10] * z + e[14];
		return this;
	}

	public function transformDirection (m:Matrix4) : Vector {

		var e = m.elements;
		var x = this.x, y = this.y, z = this.z;
		this.x = e[0] * x + e[4] * y + e[8] * z;
		this.y = e[1] * x + e[5] * y + e[9] * z;
		this.z = e[2] * x + e[6] * y + e[10] * z;
		normalize();
		return this;
	}	

	public function setEulerFromRotationMatrix (m:Matrix4, order:String = 'XYZ') : Vector {

		var te = m.elements;
		var m11 = te[0], m12 = te[4], m13 = te[8];
		var m21 = te[1], m22 = te[5], m23 = te[9];
		var m31 = te[2], m32 = te[6], m33 = te[10];
		
		//todo - support other euler orders
		if (order == 'XYZ') {

			y = Math.asin(Math.min(Math.max(m13, -1), 1));
			
			if (Math.abs(m13) < 0.99999)
			{
				x = Math.atan2( -m23, m33);
				z = Math.atan2( -m12, m11);
			} else {
				x = Math.atan2(m32, m22);
				z = 0;
			}
		}
		
		return this;
	}

	public function setEulerFromQuaternion (q:Quaternion, order:String = 'XYZ') : Vector {

		var sqx = q.x * q.x;
		var sqy = q.y * q.y;
		var sqz = q.z * q.z;
		var sqw = q.w * q.w;
		
		if (order == 'XYZ') {
			x = Math.atan2( 2 * ( q.x * q.w - q.y * q.z ), ( sqw - sqx - sqy + sqz ) );
			y = Math.asin(  Maths.clamp( 2 * ( q.x * q.z + q.y * q.w ), -1, 1 ) );
			z = Math.atan2( 2 * ( q.z * q.w - q.x * q.y ), ( sqw + sqx - sqy - sqz ) );			
		}
		
		return this;
	} //

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

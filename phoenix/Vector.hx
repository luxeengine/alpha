package phoenix;


class Vector {
	
	public var x : Float = 0;
	public var y : Float = 0;
	public var z : Float = 0;
	public var w : Float = 0;

	@:isVar public var length(get, set) : Float;
	@:isVar public var normalized(get, null) : Vector;

	public function new( _x:Float = 0, _y:Float = 0, _z:Float = 0, _w:Float = 0) {
		x = _x;
		y = _y;
		z = _z;
		w = _w;
	}

	public function clone() {
		return new Vector(x,y,z,w);
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
	
	public static function Subtract(a:Vector, b:Vector) {
		return new Vector(
			a.x - b.x,
			a.y - b.y,
			a.z - b.z
		);
	}
	public function subtract(other:Vector) {
		x = x - other.x;
        y = y - other.y;
        z = z - other.z;
        return this;
	}
	
	public function crossVectors( a:Vector, b:Vector ) {

		x = a.y * b.z - a.z * b.y;
		y = a.z * b.x - a.x * b.z;
		z = a.x * b.y - a.y * b.x;

		return this;

	}

	 public function multiply_ ( v:Float ) {

		x *= v;
		y *= v;
		z *= v;

		return this;
	}

	public function divide_(v:Float) : Vector{

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

	public function set_length(v:Float) : Float {
		return 0;
	}

	public function get_length() : Float {
		return Math.sqrt( x * x + y * y + z * z );
	}

	public function get_normalized() {
		return divide_( length );
	}
	
}
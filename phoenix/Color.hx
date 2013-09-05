package phoenix;

import luxe.tween.Actuate;

class Color {

	public var r : Float = 1.0;
	public var g : Float = 1.0;
	public var b : Float = 1.0;
	public var a : Float = 1.0;

	public function new(_r:Float = 1.0, _g:Float = 1.0, _b:Float = 1.0, _a:Float = 1.0) {
		
		r = _r;
		g = _g;
		b = _b;
		a = _a;

	}

	public function set( ?_r : Float, ?_g : Float, ?_b : Float, ?_a : Float ) : Color {
		var _setr = r;
		var _setg = g;
		var _setb = b;
		var _seta = a;
			
			//assign new values
		if(_r != null) _setr = _r;
		if(_g != null) _setg = _g;
		if(_b != null) _setb = _b;
		if(_a != null) _seta = _a;

		r = _setr;
		g = _setg;
		b = _setb;
		a = _seta;

		return this;		
	}

	public function tween( ?_time_in_seconds:Float = 0.5, ?_dest:Dynamic = null, _override:Bool = true ) {
			
		if(_dest != null) {

			var _dest_r = r;
			var _dest_g = g;
			var _dest_b = b;
			var _dest_a = a;

			var _change_r = false;		
			var _change_g = false;		
			var _change_b = false;		
			var _change_a = false;		

			if(Std.is(_dest, Color)) {
				
				_dest_r = _dest.r;
				_dest_g = _dest.g;
				_dest_b = _dest.b;
				_dest_a = _dest.a;

				_change_r = true;
				_change_g = true;
				_change_b = true;
				_change_a = true;

			} else {

				if(_dest.r != null) { _dest_r = _dest.r; _change_r = true; }
				if(_dest.g != null) { _dest_g = _dest.g; _change_g = true; }
				if(_dest.b != null) { _dest_b = _dest.b; _change_b = true; }
				if(_dest.a != null) { _dest_a = _dest.a; _change_a = true; }

			}

			var _properties : Dynamic = {};

			if(_change_r) _properties.r = _dest_r;
			if(_change_g) _properties.g = _dest_g;
			if(_change_b) _properties.b = _dest_b;
			if(_change_a) _properties.a = _dest_a;

			if(_change_r || _change_g || _change_b || _change_a) {
				Actuate.tween(this, _time_in_seconds, _properties, _override );
			}

		} else { //dest is null? 
			throw " Warning: Color.tween passed a null destination ";
		}

	} //tween

	public function clone() {
		return new Color(r,g,b,a);
	}

	public function rgb(_rgb:Int = 0xFFFFFF) : Color {
		from_int(_rgb);
		return this;
	} //rgb

		//make it traceable
	public function toString() : String {
		return "{ r:"+r+" , g:"+g+" , b:"+b+" , a:"+a+" }";
	}

	private function from_int(_i:Int) {

		var _r = _i >> 16;
		var _g = _i >> 8 & 0xFF;
		var _b = _i & 0xFF;
		
			//convert to 0-1
		r = _r / 255; 
		g = _g / 255;
		b = _b / 255;

			//alpha not specified in 0xFFFFFF
			//but we don't need to clobber it, 
			//it was set in the member list
		// a = 1.0;
	}

}
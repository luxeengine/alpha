/**
 * @author Joshua Granick
 * @author Philippe / http://philippe.elsass.me
 * @author Robert Penner / http://www.robertpenner.com/easing_terms_of_use.html
 */


package luxe.tween.easing;
	
	
class Cubic {
	
	
	static public var easeIn (get_easeIn, never):IEasing;
	static public var easeInOut (get_easeInOut, never):IEasing;
	static public var easeOut (get_easeOut, never):IEasing;
	
	
	private static function get_easeIn ():IEasing {
		
		return new CubicEaseIn ();
		
	}
	
	
	private static function get_easeInOut ():IEasing {
		
		return new CubicEaseInOut ();
		
	}
	
	
	private static function get_easeOut ():IEasing {
		
		return new CubicEaseOut ();
		
	}
	
	
}


class CubicEaseIn implements IEasing {
	
	
	public function new () {
		
		
		
	}
	
	
	public function calculate (k:Float):Float {
		
		return k * k * k;
		
	}
	
	
	public function ease (t:Float, b:Float, c:Float, d:Float):Float {
		
		return c * (t /= d) * t * t + b;
		
	}
	
	
}


class CubicEaseInOut implements IEasing {
	
	
	public function new () {
		
		
		
	}
	
	
	public function calculate (k:Float):Float {
		
		return ((k /= 1 / 2) < 1) ? 0.5 * k * k * k : 0.5 * ((k -= 2) * k * k + 2);
		
	}
	
	
	public function ease (t:Float, b:Float, c:Float, d:Float):Float {
		
		return ((t /= d / 2) < 1) ? c / 2 * t * t * t + b : c / 2 * ((t -= 2) * t * t + 2) + b;
		
	}
	
	
}


class CubicEaseOut implements IEasing {
	
	
	public function new () {
		
		
		
	}
	
	
	public function calculate (k:Float):Float {
		
		return --k * k * k + 1;
		
	}
	
	
	public function ease (t:Float, b:Float, c:Float, d:Float):Float {
		
		return c * ((t = t / d - 1) * t * t + 1) + b;
		
	}
	
	
}
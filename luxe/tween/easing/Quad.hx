/**
 * @author Joshua Granick
 * @author Robert Penner / http://www.robertpenner.com/easing_terms_of_use.html
 */


package luxe.tween.easing;



class Quad {
	
	
	static public var easeIn (get_easeIn, never):IEasing;
	static public var easeInOut (get_easeInOut, never):IEasing;
	static public var easeOut (get_easeOut, never):IEasing;
	
	
	private static function get_easeIn ():IEasing {
		
		return new QuadEaseIn ();
		
	}
	
	
	private static function get_easeInOut ():IEasing {
		
		return new QuadEaseInOut ();
		
	}
	
	
	private static function get_easeOut ():IEasing {
		
		return new QuadEaseOut ();
		
	}
	
	
}


class QuadEaseIn implements IEasing {
	
	
	public function new () {
		
		
		
	}
	
	
	public function calculate (k:Float):Float {
		
		return k * k;
		
	}
	
	
	public function ease (t:Float, b:Float, c:Float, d:Float):Float {
		
		return c * (t /= d) * t + b;
		
	}
	
	
}


class QuadEaseInOut implements IEasing {
	
	
	public function new () {
		
		
		
	}
	
	
	public function calculate (k:Float):Float {
		
		if ((k *= 2) < 1) {
			return 1 / 2 * k * k;
		}
		return -1 / 2 * ((--k) * (k - 2) - 1);
		
	}
	
	
	public function ease (t:Float, b:Float, c:Float, d:Float):Float {
		
		if ((t /= d / 2) < 1) {
			return c / 2 * t * t + b;
		}
		return -c / 2 * ((--t) * (t - 2) - 1) + b;
		
	}
	
	
}


class QuadEaseOut implements IEasing {
	
	
	public function new () {
		
		
		
	}
	
	
	public function calculate (k:Float):Float {
		
		return -k * (k - 2);
		
	}
	
	
	public function ease (t:Float, b:Float, c:Float, d:Float):Float {
		
		return -c * (t /= d) * (t - 2) + b;
		
	}
	
	
}
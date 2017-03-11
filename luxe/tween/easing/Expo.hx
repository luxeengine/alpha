/**
 * @author Joshua Granick
 * @author Robert Penner / http://www.robertpenner.com/easing_terms_of_use.html
 */


package luxe.tween.easing;



class Expo {


    static public var easeIn (get_easeIn, never):IEasing;
    static public var easeInOut (get_easeInOut, never):IEasing;
    static public var easeOut (get_easeOut, never):IEasing;


	private static function get_easeIn ():IEasing {

        return new ExpoEaseIn ();

    }


	private static function get_easeInOut ():IEasing {

        return new ExpoEaseInOut ();

    }


	private static function get_easeOut ():IEasing {

        return new ExpoEaseOut ();

    }


}


class ExpoEaseIn implements IEasing {


    public function new () {



    }


    public function calculate (k:Float):Float {

		return k == 0 ? 0 : Math.exp(6.931471805599453 * (k - 1));
    }


    public function ease (t:Float, b:Float, c:Float, d:Float):Float {

		return t == 0 ? b : c * Math.exp(6.931471805599453 * (t / d - 1)) + b;

    }


}


class ExpoEaseInOut implements IEasing {


    public function new () {



    }


    public function calculate (k:Float):Float {

        if (k == 0) { return 0; }
        if (k == 1) { return 1; }
        if ((k /= 1 / 2.0) < 1.0) {
			return 0.5 * Math.exp(6.931471805599453 * (k - 1));
        }
		return 0.5 * (2 - Math.exp(-6.931471805599453 * --k));

    }


    public function ease (t:Float, b:Float, c:Float, d:Float):Float {

        if (t == 0) {
            return b;
        }
        if (t == d) {
            return b + c;
        }
        if ((t /= d / 2.0) < 1.0) {
			return c / 2 * Math.exp(6.931471805599453 * (t - 1)) + b;
        }
		return c / 2 * (2 - Math.exp(-6.931471805599453 * --t)) + b;

    }


}


class ExpoEaseOut implements IEasing {


    public function new () {



    }


    public function calculate (k:Float):Float {

		return k == 1 ? 1 : (1 - Math.exp(-6.931471805599453 * k));

    }


    public function ease (t:Float, b:Float, c:Float, d:Float):Float {

		return t == d ? b + c : c * (1 - Math.exp(-6.931471805599453 * t / d)) + b;

    }


}

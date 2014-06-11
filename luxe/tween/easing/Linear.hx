/**
 * @author Joshua Granick
 * @author Philippe / http://philippe.elsass.me
 * @author Robert Penner / http://www.robertpenner.com/easing_terms_of_use.html
 */


package luxe.tween.easing;


class Linear {


    static public var easeNone (get_easeNone, never):IEasing;


    static function get_easeNone ():IEasing {

        return new LinearEaseNone ();

    }


}


class LinearEaseNone implements IEasing {


    public function new () {



    }


    public function calculate (k:Float):Float {

        return k;

    }


    public function ease (t:Float, b:Float, c:Float, d:Float):Float {

        return c * t / d + b;

    }


}
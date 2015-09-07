/**
 * @author Joshua Granick
 * @author Robert Penner / http://www.robertpenner.com/easing_terms_of_use.html
 */


package luxe.tween.easing;


class Circ {


    static public var easeIn (get_easeIn, never):IEasing;
    static public var easeInOut (get_easeInOut, never):IEasing;
    static public var easeOut (get_easeOut, never):IEasing;


    static function get_easeIn ():IEasing {

        return new CircEaseIn ();

    }


    static function get_easeInOut ():IEasing {

        return new CircEaseInOut ();

    }


    static function get_easeOut ():IEasing {

        return new CircEaseOut ();

    }


}


class CircEaseIn implements IEasing {


    public function new () {



    }


    public function calculate (k:Float):Float {

        return -(Math.sqrt(1 - k * k) - 1);

    }


    public function ease (t:Float, b:Float, c:Float, d:Float):Float {

        return -c * (Math.sqrt(1 - (t /= d) * t) - 1) + b;

    }


}


class CircEaseInOut implements IEasing {


    public function new () {



    }


    public function calculate (k:Float):Float {

        return k <= 0.5 ? (Math.sqrt(1 - k * k * 4) - 1) / -2 : (Math.sqrt(1 - (k * 2 - 2) * (k * 2 - 2)) + 1) / 2;

    }


    public function ease (t:Float, b:Float, c:Float, d:Float):Float {

        return ((t /= d / 2) < 1) ? -c / 2 * (Math.sqrt(1 - t * t) - 1) + b : c / 2 * (Math.sqrt(1 - (t -= 2) * t) + 1) + b;

    }


}


class CircEaseOut implements IEasing {


    public function new () {



    }


    public function calculate (k:Float):Float {

        return Math.sqrt(1 - (k - 1) * (k - 1));

    }


    public function ease (t:Float, b:Float, c:Float, d:Float):Float {

        return c * Math.sqrt(1 - (t = t / d - 1) * t) + b;

    }


}
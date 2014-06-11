
/**
 * @author Erik Escoffier
 * @author Robert Penner / http://www.robertpenner.com/easing_terms_of_use.html
 */


package luxe.tween.easing;


class Bounce {

    static public var easeIn (get_easeIn, never):IEasing;
    static public var easeInOut (get_easeInOut, never):IEasing;
    static public var easeOut (get_easeOut, never):IEasing;


    static function get_easeIn ():IEasing {

        return new BounceEaseIn ();

    }


    static function get_easeInOut ():IEasing {

        return new BounceEaseInOut ();

    }


    static function get_easeOut ():IEasing {

        return new BounceEaseOut ();

    }


}







class BounceEaseIn implements IEasing {


    public function new () {


    }


    public function calculate (k:Float):Float {
        return BounceEaseIn._ease(k,0,1,1);
    }


    public function ease (t:Float, b:Float, c:Float, d:Float):Float {
        return BounceEaseIn._ease(t,b,c,d);
    }

    public static inline function _ease  (t:Float, b:Float, c:Float, d:Float):Float {
        return c - BounceEaseOut._ease (d-t, 0, c, d) + b;
    }
}



class BounceEaseInOut implements IEasing {


    public function new () {


    }


    public function calculate (k:Float):Float {

        if (k < .5) {
            return BounceEaseIn._ease(k*2, 0, 1, 1) * .5;
        } else {
            return BounceEaseOut._ease(k*2-1, 0, 1, 1) * .5 + 1*.5;
        }
    }


    public function ease (t:Float, b:Float, c:Float, d:Float):Float {

        if (t < d/2) {
            return BounceEaseIn._ease(t*2, 0, c, d) * .5 + b;
        } else {
            return BounceEaseOut._ease(t*2-d, 0, c, d) * .5 + c*.5 + b;
        }

    }
}





class BounceEaseOut implements IEasing {


    public function new () {


    }


    public function calculate (k:Float):Float {

        return BounceEaseOut._ease(k,0,1,1);

    }


    public function ease (t:Float, b:Float, c:Float, d:Float):Float {

        return BounceEaseOut._ease(t,b,c,d);

    }

    public static inline function _ease(t:Float, b:Float, c:Float, d:Float):Float   {
        if ((t/=d) < (1/2.75)) {
            return c*(7.5625*t*t) + b;
        } else if (t < (2/2.75)) {
            return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
        } else if (t < (2.5/2.75)) {
            return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
        } else {
            return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
        }
    }

}


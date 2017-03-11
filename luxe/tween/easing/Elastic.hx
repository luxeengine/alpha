/**
 * @author Joshua Granick
 * @author Philippe / http://philippe.elsass.me
 * @author Robert Penner / http://www.robertpenner.com/easing_terms_of_use.html
 */


package luxe.tween.easing;



class Elastic {


    static public var easeIn (get_easeIn, never):IEasing;
    static public var easeInOut (get_easeInOut, never):IEasing;
    static public var easeOut (get_easeOut, never):IEasing;


	private static function get_easeIn ():IEasing {

        return new ElasticEaseIn (0.1, 0.4);

    }


	private static function get_easeInOut ():IEasing {

        return new ElasticEaseInOut (0.1, 0.4);

    }


	private static function get_easeOut ():IEasing {

        return new ElasticEaseOut (0.1, 0.4);

    }


}


class ElasticEaseIn implements IEasing {


    public var a:Float;
    public var p:Float;


    public function new (a:Float, p:Float) {

        this.a = a;
        this.p = p;

    }


    public function calculate (k:Float):Float {

        if (k == 0) return 0; if (k == 1) return 1;
        var s:Float;
        if (a < 1) { a = 1; s = p / 4; }
        else s = p / (2 * Math.PI) * Math.asin (1 / a);
		return -(a * Math.exp(6.931471805599453 * (k -= 1)) * Math.sin( (k - s) * (2 * Math.PI) / p ));

    }


    public function ease (t:Float, b:Float, c:Float, d:Float):Float {

        if (t == 0) {
            return b;
        }
        if ((t /= d) == 1) {
            return b + c;
        }
        var s:Float;
        if (a < Math.abs(c)) {
            a = c;
            s = p / 4;
        }
        else {
            s = p / (2 * Math.PI) * Math.asin(c / a);
        }
		return -(a * Math.exp(6.931471805599453 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;

    }


}


class ElasticEaseInOut implements IEasing {


    public var a:Float;
    public var p:Float;


    public function new (a:Float, p:Float) {

        this.a = a;
        this.p = p;

    }

    public function calculate (k:Float):Float {

        if (k == 0) {
            return 0;
        }
        if ((k /= 1 / 2) == 2) {
            return 1;
        }

        var p:Float = (0.3 * 1.5);
        var a:Float = 1;
        var s:Float = p / 4;

        if (k < 1) {
			return -0.5 * (Math.exp(6.931471805599453 * (k -= 1)) * Math.sin((k - s) * (2 * Math.PI) / p));
        }
		return Math.exp(-6.931471805599453 * (k -= 1)) * Math.sin((k - s) * (2 * Math.PI) / p) * 0.5 + 1;

    }


    public function ease (t:Float, b:Float, c:Float, d:Float):Float {

        if (t == 0) {
            return b;
        }
        if ((t /= d / 2) == 2) {
            return b + c;
        }
        var s:Float;
        if (a < Math.abs(c)) {
            a = c;
            s = p / 4;
        }
        else {
            s = p / (2 * Math.PI) * Math.asin(c / a);
        }
        if (t < 1) {
			return -0.5 * (a * Math.exp(6.931471805599453 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
        }
		return a * Math.exp(-6.931471805599453 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p) * 0.5 + c + b;

    }


}


class ElasticEaseOut implements IEasing {


    public var a:Float;
    public var p:Float;


    public function new (a:Float, p:Float) {

        this.a = a;
        this.p = p;

    }


    public function calculate (k:Float):Float {

        if (k == 0) return 0; if (k == 1) return 1;
        var s:Float;
        if (a < 1) { a = 1; s = p / 4; }
        else s = p / (2 * Math.PI) * Math.asin (1 / a);
		return (a * Math.exp(-6.931471805599453 * k) * Math.sin((k - s) * (2 * Math.PI) / p ) + 1);

    }


    public function ease (t:Float, b:Float, c:Float, d:Float):Float {

        if (t == 0) {
            return b;
        }
        if ((t /= d) == 1) {
            return b + c;
        }
        var s:Float;
        if (a < Math.abs(c)) {
            a = c;
            s = p / 4;
        }
        else {
            s = p / (2 * Math.PI) * Math.asin(c / a);
        }
		return a * Math.exp(-6.931471805599453 * t) * Math.sin((t * d - s) * (2 * Math.PI) / p) + c + b;

    }


}

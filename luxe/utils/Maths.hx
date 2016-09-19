package luxe.utils;

//Portions ported from Three.js http://github.com/mrdoob/three.js

class Maths {

    function new() {}

    static inline public function fixed( value:Float, precision:Int ) {

        var n = Math.pow( 10, precision );
        return ( Std.int(value * n) / n );

    } //fixed'

    static inline public function lerp( value:Float, target:Float, t:Float ) {

        t = clamp(t, 0, 1);

        return (value + t * (target - value));

    } //lerp

    static inline public function weighted_avg( value:Float, target:Float, slowness:Float ) {

            //:todo: use an epsilon
        if( slowness == 0 ) { slowness = 0.00000001; }

        return ((value * (slowness - 1)) + target) / slowness;

    } //weighted_avg

    static inline public function clamp( value:Float, a:Float, b:Float ) : Float {
        return ( value < a ) ? a : ( ( value > b ) ? b : value );
    } //clamp

    static inline public function clampi( value:Int, a:Int, b:Int ) : Int {
        return ( value < a ) ? a : ( ( value > b ) ? b : value );
    } //clamp

    static inline public function clamp_bottom(value:Float, a:Float) : Float {
        return value < a ? a : value;
    } //clamp_bottom

    static inline public function within_range(value:Float, start_range:Float, end_range:Float ) {
        return value >= start_range && value <= end_range;
    } //within_range

    public static inline function wrap_angle( degrees:Float, lower:Float, upper:Float ) {

        var _radians:Float = radians(degrees);
        var _distance:Float = upper - lower;
        var _times:Float = Math.floor((degrees - lower) / _distance);

        return degrees - (_times * _distance);

    } //wrap_angle

    public static inline function nearest_power_of_two(_value:Int) {

        _value--;
        _value |= _value >> 1;
        _value |= _value >> 2;
        _value |= _value >> 4;
        _value |= _value >> 8;
        _value |= _value >> 16;
        _value++;

        return _value;

    } //nearest_power_of_two

    static inline public function map_linear( value:Float, a1:Float, a2:Float, b1:Float, b2:Float ) : Float {
        return b1 + ( value - a1 ) * ( b2 - b1 ) / ( a2 - a1 );
    } //map_linear

    static inline public function smoothstep( x:Float, min:Float, max:Float ) : Float {

        if (x <= min) {
            return 0;
        }

        if (x >= max) {
            return 1;
        }

        x = ( x - min ) / ( max - min );

        return x * x * ( 3 - 2 * x );

    } //smoothstep

    static inline public function smootherstep( x:Float, min:Float, max:Float ) : Float {

        if (x <= min) {
            return 0;
        }

        if (x >= max) {
            return 1;
        }

        x = ( x - min ) / ( max - min );

        return x * x * x * ( x * ( x * 6 - 15 ) + 10 );

    } //smootherstep

        /** Return the sign of a number, `1` if >= 0 and `-1` if < 0 */
    static inline public function sign( x:Float ) : Int {
        return (x >= 0) ? 1 : -1;
    } //sign

        /** Return the sign of a number, `0` is returned as `0`, `1` if > `0` and `-1` if < `0` */
    static inline public function sign0( x:Float ) : Int {
        return (x < 0) ? -1 : ((x > 0) ? 1 : 0);
    } //sign

        /** Convert a number from degrees to radians */
    static inline public function radians( degrees:Float ) : Float {
        return degrees * _PI_OVER_180;
    } //radians

        /** Convert a number from radians to degrees */
    static inline public function degrees( radians:Float ) : Float {
        return radians * _180_OVER_PI;
    } //degrees

        /** Get the length squared of a vector by components */
    static inline public function vec_lengthsq(x:Float, y:Float) : Float {
        return x * x + y * y;
    }

        /** Get the length of a vector by components */
    static inline public function vec_length(x:Float, y:Float) : Float {
        return Math.sqrt(vec_lengthsq(x,y));
    }

        /** Normalize the component of a vector based on it's length */
    static inline public function vec_normalize(length:Float, component:Float) : Float {
        if(length == 0) return 0;
        return component /= length;
    }

        /** Returns the dot product between two vectors by components */
    static inline public function vec_dot(x:Float, y:Float, otherx:Float, othery:Float) : Float {
        return x * otherx + y * othery;
    }

//Internal constants

        /** Used by `degrees()` and `radians()`, use those to convert, unless needed */
    static inline public var _PI_OVER_180:Float = 3.14159265358979 / 180;
        /** Used by `degrees()` and `radians()`, use those to convert, unless needed */
    static inline public var _180_OVER_PI:Float = 180 / 3.14159265358979;

} //Maths

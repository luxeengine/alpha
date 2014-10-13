package luxe.utils;

//Portions ported from Three.js http://github.com/mrdoob/three.js

class Maths {

    @:noCompletion public var luxe:Core;

    @:noCompletion public function new( _luxe:Core ) {

        luxe = _luxe;

    }

    static inline public var DEG2RAD:Float = 3.14159265358979 / 180;
    static inline public var RAD2DEG:Float = 180 / 3.14159265358979;

    static inline public function fixed( value:Float, precision:Int ) {

        var n = Math.pow( 10, precision );
        return ( Std.int(value * n) / n );

    } //fixed'

    static inline public function lerp( value:Float, target:Float, t:Float ) {

        t = clamp(t, 0, 1);

        return (value + t * (target - value));

    } //lerp

    static inline public function weighted_average( value:Float, target:Float, slowness:Float ) {

        if( slowness == 0 ) { slowness = 0.00000001; }

        return ((value * (slowness - 1)) + target) / slowness;

    } //weighted_average

    static inline public function clamp( value:Float, a:Float, b:Float ) : Float {
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

    static inline public function random16() : Float {
        return ( 65280 * Math.random() + 255 * Math.random() ) / 65535;
    } //random16

    static inline public function random_int( low:Int, high:Int ) : Int {
        return low + Math.floor(Math.random() * (high - low + 1));
    } //random_int

    static inline public function random_float( low:Float, high:Float ) : Float {
        return low + Math.random() * (high - low);
    } //random_float

    static inline public function random_float_spread( range:Float ) : Float {
        return range * (0.5 - Math.random());
    } //random_float_spread

    static inline public function sign( x:Float ) : Int {
        return (x < 0) ? -1 : ((x > 0) ? 1 : 0);
    } //sign

    static inline public function radians( degrees:Float ) : Float {
        return degrees * DEG2RAD;
    } //radians

    static inline public function degrees( radians:Float ) : Float {
        return radians * RAD2DEG;
    } //degrees


} //Maths

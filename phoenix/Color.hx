package phoenix;

import luxe.tween.Actuate;
import luxe.tween.actuators.SimpleActuator;

//Pieces of the color conversion code come from
// http://haxe.org/doc/snip/colorconverter
import luxe.options.ColorOptions;

class Color {

    @:isVar public var r (default, set) : Float = 1.0;
    @:isVar public var g (default, set) : Float = 1.0;
    @:isVar public var b (default, set) : Float = 1.0;

    public var a : Float = 1.0;

    var is_hsl : Bool = false;
    var is_hsv : Bool = false;
    var refreshing : Bool = false;

    @:isVar public var serialized(get, null) : Dynamic;
    function get_serialized() : Dynamic { return {r:r,g:g,b:b,a:a} };

    public function new( _r:Float = 1.0, _g:Float = 1.0, _b:Float = 1.0, _a:Float = 1.0 ) {

        r = _r;
        g = _g;
        b = _b;
        a = _a;

    }

    function set_r(_r:Float) {
        r = _r;

        if(!refreshing) {
            if(is_hsl) {
                var colorhsl : ColorHSL = cast this;
                colorhsl.fromColor(this);
            } else if(is_hsv) {
                var colorhsv : ColorHSV = cast this;
                colorhsv.fromColor(this);
            }
        } //refreshing

        return r;
    }
    function set_g(_g:Float) {
        g = _g;

        if(!refreshing) {
            if(is_hsl) {
                var colorhsl : ColorHSL = cast this;
                colorhsl.fromColor(this);
            } else if(is_hsv) {
                var colorhsv : ColorHSV = cast this;
                colorhsv.fromColor(this);
            }
        } //!refreshing

        return g;
    }
    function set_b(_b:Float) {
        b = _b;

        if(!refreshing) {
            if(is_hsl) {
                var colorhsl : ColorHSL = cast this;
                colorhsl.fromColor(this);
            } else if(is_hsv) {
                var colorhsv : ColorHSV = cast this;
                colorhsv.fromColor(this);
            }
        } //refreshing

        return b;
    }


    public static function random(?_include_alpha:Bool=false) : Color {
        return new Color(Math.random(), Math.random(), Math.random(), _include_alpha ? Math.random() : 1.0 );
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

    public function maxRGB() : Float {
        return Math.max(r, Math.max(g, b));
    }

    public function minRGB() : Float {
        return Math.min(r, Math.min(g, b));
    }

    public function tween( ?_time_in_seconds:Float = 0.5, ?_properties_to_tween:ColorOptions = null, _override:Bool = true ) {

        if(_properties_to_tween != null) {

            var _dest_r = r;
            var _dest_g = g;
            var _dest_b = b;
            var _dest_a = a;

            var _change_r = false;
            var _change_g = false;
            var _change_b = false;
            var _change_a = false;

            if(Std.is(_properties_to_tween, Color)) {

                _dest_r = _properties_to_tween.r;
                _dest_g = _properties_to_tween.g;
                _dest_b = _properties_to_tween.b;
                _dest_a = _properties_to_tween.a;

                _change_r = true;
                _change_g = true;
                _change_b = true;
                _change_a = true;

            } else {

                if(_properties_to_tween.r != null) { _dest_r = _properties_to_tween.r; _change_r = true; }
                if(_properties_to_tween.g != null) { _dest_g = _properties_to_tween.g; _change_g = true; }
                if(_properties_to_tween.b != null) { _dest_b = _properties_to_tween.b; _change_b = true; }
                if(_properties_to_tween.a != null) { _dest_a = _properties_to_tween.a; _change_a = true; }

            }

            var _properties : Dynamic = {};

            if(_change_r) _properties.r = _dest_r;
            if(_change_g) _properties.g = _dest_g;
            if(_change_b) _properties.b = _dest_b;
            if(_change_a) _properties.a = _dest_a;

            return Actuate.tween( this, _time_in_seconds, _properties, _override );

        } else { //dest is null?
            throw " Warning: Color.tween passed a null destination ";
        }

    } //tween

    public function clone() : Color {
        return new Color(r,g,b,a);
    } //clone

    public function rgb(_rgb:Int = 0xFFFFFF) : Color {
        from_int(_rgb);
        return this;
    } //rgb

    public function toColorHSL() : ColorHSL {
        return new ColorHSL().fromColor(this);
    } //toColorHSL

    public function toColorHSV() : ColorHSV {
        return new ColorHSV().fromColor(this);
    } //toColorHSV

    public function fromColorHSV( _color_hsv:ColorHSV ) {

        var d:Float = (_color_hsv.h%360) / 60;

        if (d < 0) {
            d += 6;
        }

        var hf:Int = Math.floor(d);
        var hi:Int = hf % 6;
        var f:Float = d - hf;

        var v:Float = _color_hsv.v;
        var p:Float = _color_hsv.v * (1 - _color_hsv.s);
        var q:Float = _color_hsv.v * (1 - f * _color_hsv.s);
        var t:Float = _color_hsv.v * (1 - (1 - f) * _color_hsv.s);

        switch(hi) {
            case 0: { r = v; g = t; b = p; };
            case 1: { r = q; g = v; b = p; };
            case 2: { r = p; g = v; b = t; };
            case 3: { r = p; g = q; b = v; };
            case 4: { r = t; g = p; b = v; };
            case 5: { r = v; g = p; b = q; };
        }

        a = _color_hsv.a;

    } //fromColorHSV

    public function fromColorHSL( _color_hsl:ColorHSL ) : Color {

        var q:Float = 1;

        if (_color_hsl.l < 1 / 2) {
            q = _color_hsl.l * (1 + _color_hsl.s);
        } else {
            q = _color_hsl.l + _color_hsl.s - (_color_hsl.l * _color_hsl.s);
        }

        var p:Float = 2 * _color_hsl.l - q;
        var hk:Float = (_color_hsl.h % 360) / 360;

        var tr:Float = hk + 1 / 3;
        var tg:Float = hk;
        var tb:Float = hk - 1 / 3;

        var tc:Array<Float> = [ tr, tg, tb ];

            for (n in 0...tc.length) {

                var t:Float = tc[n];

                if (t < 0) t += 1;
                if (t > 1) t -= 1;

                tc[n] = if (t < 1 / 6) {
                    p + ((q - p) * 6 * t);
                } else if (t < 1 / 2) {
                    q;
                } else if (t < 2 / 3) {
                    p + ((q - p) * 6 * (2 / 3 - t));
                } else {
                    p;
                }

            } //for each in tc

            //store in rgb
        r = tc[0];
        g = tc[1];
        b = tc[2];
            //alpha is passed straight through
        a = _color_hsl.a;

        return this;

    } // fromColorHSL

        //make it traceable
    public function toString() : String {
        return "{ r:"+r+" , g:"+g+" , b:"+b+" , a:"+a+" }";
    }

    function from_int(_i:Int) {

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

} //Color

class ColorHSL extends Color {

    @:isVar public var h (default,set) : Float = 0.0;
    @:isVar public var s (default,set) : Float = 1.0;
    @:isVar public var l (default,set) : Float = 1.0;

    function set_h(_h:Float) {
        h = _h;
        _refresh();
        return _h;
    }
    function set_s(_s:Float) {
        s = _s;
        _refresh();
        return _s;
    }
    function set_l(_l:Float) {
        l = _l;
        _refresh();
        return _l;
    }

    public function new( _h:Float = 0.0, _s:Float = 1.0, _l:Float = 1.0, _a:Float = 1.0 ) {

        super();

        is_hsl = true;

        h = _h;
        s = _s;
        l = _l;
        a = _a;

        _refresh();

    } //new

    public override function set( ?_h : Float, ?_s : Float, ?_l : Float, ?_a : Float ) : ColorHSL {

        var _seth = h;
        var _sets = s;
        var _setl = l;
        var _seta = a;

            //assign new values
        if(_h != null) _seth = _h;
        if(_s != null) _sets = _s;
        if(_l != null) _setl = _l;
        if(_a != null) _seta = _a;

            h = _seth;
            s = _sets;
            l = _setl;
            a = _seta;

        _refresh();

        return this;

    } //set

    public override function tween( ?_time_in_seconds:Float = 0.5, ?_dest:ColorOptions = null, _override:Bool = true ) {

        super.tween(_time_in_seconds, _dest, _override);

        if(_dest != null) {

            var _dest_h = h;
            var _dest_s = s;
            var _dest_l = l;
            var _dest_a = a;

            var _change_h = false;
            var _change_s = false;
            var _change_l = false;
            var _change_a = false;

            if(Std.is(_dest, ColorHSL)) {

                _dest_h = _dest.h;
                _dest_s = _dest.s;
                _dest_l = _dest.l;
                _dest_a = _dest.a;

                _change_h = true;
                _change_s = true;
                _change_l = true;
                _change_a = true;

            } else {

                if(_dest.h != null) { _dest_h = _dest.h; _change_h = true; }
                if(_dest.s != null) { _dest_s = _dest.s; _change_s = true; }
                if(_dest.l != null) { _dest_l = _dest.l; _change_l = true; }
                if(_dest.a != null) { _dest_a = _dest.a; _change_a = true; }

            }

            var _properties : Dynamic = {};

            if(_change_h) _properties.h = _dest_h;
            if(_change_s) _properties.s = _dest_s;
            if(_change_l) _properties.l = _dest_l;
            if(_change_a) _properties.a = _dest_a;

            return Actuate.tween( this, _time_in_seconds, _properties, _override );

        } else { //dest is null?
            throw " Warning: Color.tween passed a null destination ";
        }

    } //tween

    public function _refresh() : ColorHSL {

        refreshing = true;
            super.fromColorHSL(this);
        refreshing = false;

        return this;
    } //_refresh

    public override function clone() : ColorHSL {
        return new ColorHSL(h,s,l,a);
    } //clone

    public function toColor() : Color {
        return cast _refresh();
    } //toColor

    public function fromColor( _color:Color ) : ColorHSL {

        var max:Float = _color.maxRGB();
        var min:Float = _color.minRGB();
        var add:Float = max + min;
        var sub:Float = max - min;

        var _h:Float = 0;
        if (max == min) {
            _h = 0;
        } else if (max == _color.r) {
            _h = ((60 * (_color.g - _color.b) / sub + 360) % 360);
        } else if (max == _color.g) {
            _h = (60 * (_color.b - _color.r) / sub + 120);
        } else if (max == _color.b) {
            _h = (60 * (_color.r - _color.g) / sub + 240);
        }

        var _l:Float = add / 2;

        var _s:Float = if (max == min) {
            0;
        } else if (l <= 1 / 2) {
            sub / add;
        } else {
            sub / (2 - add);
        }

            h = _h;
            s = _h;
            l = _h;
            a = _color.a;

        return this;

    } //fromColor

    public override function toString() : String {
        return "{ h:"+h+" , s:"+s+" , l:"+l+" , a:"+a+" }";
    }


} //ColorHSL


class ColorHSV extends Color {

    @:isVar public var h (default,set) : Float = 0.0;
    @:isVar public var s (default,set) : Float = 0.0;
    @:isVar public var v (default,set) : Float = 1.0;

    function set_h(_h:Float) {
        h = _h;
        _refresh();
        return _h;
    }
    function set_s(_s:Float) {
        s = _s;
        _refresh();
        return s;
    }
    function set_v(_v:Float) {
        v = _v;
        _refresh();
        return v;
    }

    public function new( _h:Float = 0.0, _s:Float = 0.0, _v:Float = 1.0, _a:Float = 1.0 ) {

        super();

        is_hsv = true;

        h = _h;
        s = _s;
        v = _v;
        a = _a;

        _refresh();

    } //new

    public override function set( ?_h : Float, ?_s : Float, ?_v : Float, ?_a : Float ) : Color {

        var _seth = h;
        var _sets = s;
        var _setv = v;
        var _seta = a;

            //assign new values
        if(_h != null) _seth = _h;
        if(_s != null) _sets = _s;
        if(_v != null) _setv = _v;
        if(_a != null) _seta = _a;

            h = _seth;
            s = _sets;
            v = _setv;
            a = _seta;

            //update parent rgba values
        _refresh();

        return this;

    } //set

    public override function tween( ?_time_in_seconds:Float = 0.5, ?_dest:ColorOptions = null, _override:Bool = true ) {

        super.tween(_time_in_seconds, _dest, _override);

        if(_dest != null) {

            var _dest_h = h;
            var _dest_s = s;
            var _dest_v = v;
            var _dest_a = a;

            var _change_h = false;
            var _change_s = false;
            var _change_v = false;
            var _change_a = false;

            if(Std.is(_dest, ColorHSV)) {

                _dest_h = _dest.h;
                _dest_s = _dest.s;
                _dest_v = _dest.v;
                _dest_a = _dest.a;

                _change_h = true;
                _change_s = true;
                _change_v = true;
                _change_a = true;

            } else {

                if(_dest.h != null) { _dest_h = _dest.h; _change_h = true; }
                if(_dest.s != null) { _dest_s = _dest.s; _change_s = true; }
                if(_dest.v != null) { _dest_v = _dest.v; _change_v = true; }
                if(_dest.a != null) { _dest_a = _dest.a; _change_a = true; }

            }

            var _properties : Dynamic = {};

            if(_change_h) _properties.h = _dest_h;
            if(_change_s) _properties.s = _dest_s;
            if(_change_v) _properties.v = _dest_v;
            if(_change_a) _properties.a = _dest_a;

            return Actuate.tween( this, _time_in_seconds, _properties, _override );

        } else { //dest is null?
            throw " Warning: Color.tween passed a null destination ";
        }

    } //tween

    public function _refresh() {

        refreshing = true;
            super.fromColorHSV(this);
        refreshing = false;

        return this;
    }

    public override function clone() : ColorHSV {
        return new ColorHSV(h,s,v,a);
    } //clone

    public function toColor() : Color {
        //make sure the values are passed up to parent color
        return cast _refresh();
    } //toColor

    public override function toColorHSL() : ColorHSL {
        _refresh();
        return super.toColorHSL();
    } //to hsl

    public override function fromColorHSL( _color_hsl:ColorHSL ) : ColorHSV {
            //make sure that it it's updated in the parent
        _color_hsl._refresh();
        return fromColor( cast _color_hsl );
    } //from hsl

    public function fromColor( _color:Color ) : ColorHSV {

        var max:Float = _color.maxRGB();
        var min:Float = _color.minRGB();
        var add:Float = max + min;
        var sub:Float = max - min;

        var _h:Float = 0;

        if (max == min) {
            _h = 0;
        } else if (max == _color.r) {
            _h = (60 * (_color.g - _color.b) / sub + 360) % 360;
        } else if (max == _color.g) {
            _h = 60 * (_color.b - _color.r) / sub + 120;
        } else if (max == _color.b) {
            _h = 60 * (_color.r - _color.g) / sub + 240;
        }

        var _s:Float = if (max == 0) {
            0;
        } else {
            1 - min / max;
        }

        h = _h;
        s = _s;
        v = max;
        a = _color.a;

        return this;

    } //fromColor

    public override function toString() : String {
        return "{ h:"+h+" , s:"+s+" , v:"+v+" , a:"+a+" }";
    }

} //ColorHSV

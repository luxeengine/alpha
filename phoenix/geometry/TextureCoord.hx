package phoenix.geometry;


class TextureCoordSet {


    public var uv0 : TextureCoord;
    public var uv1 : TextureCoord;
    public var uv2 : TextureCoord;
    public var uv3 : TextureCoord;
    public var uv4 : TextureCoord;
    public var uv5 : TextureCoord;
    public var uv6 : TextureCoord;
    public var uv7 : TextureCoord;


    public function new() {

        uv0 = new TextureCoord();
        uv1 = new TextureCoord();
        uv2 = new TextureCoord();
        uv3 = new TextureCoord();
        uv4 = new TextureCoord();
        uv5 = new TextureCoord();
        uv6 = new TextureCoord();
        uv7 = new TextureCoord();

    } //new

    public function clone() {

        var _set = new TextureCoordSet();

            _set.uv0 = uv0.clone();
            _set.uv1 = uv1.clone();
            _set.uv2 = uv2.clone();
            _set.uv3 = uv3.clone();
            _set.uv4 = uv4.clone();
            _set.uv5 = uv5.clone();
            _set.uv6 = uv6.clone();
            _set.uv7 = uv7.clone();

        return _set;

    } //clone


} //TextureCoordSet


class TextureCoord {


    public var u : Float = 0.0;
    public var v : Float = 0.0;
    public var w : Float = 0.0;
    public var t : Float = 0.0;


    public function new(_u:Float = 0.0, _v:Float = 0.0, _w:Float = 0.0, _t:Float = 0.0) {

        u = _u;
        v = _v;
        w = _w;
        t = _t;

    } //new

    public function clone() {

        return new TextureCoord(u,v,w,t);

    } //clone

    public function set( ?_u : Float, ?_v : Float, ?_w : Float, ?_t:Float ) : TextureCoord {

        var _setu = u;
        var _setv = v;
        var _setw = w;
        var _sett = t;

            //assign new values
        if(_u != null) _setu = _u;
        if(_v != null) _setv = _v;
        if(_w != null) _setw = _w;
        if(_t != null) _sett = _t;

        u = _setu;
        v = _setv;
        w = _setw;
        t = _sett;

        return this;

    } //set

    public function toString() {

        return  "{ u:"+u + ", v:" + v +" }";

    } //toString


} //TextureCoord

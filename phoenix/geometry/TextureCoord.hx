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


    public inline function new() {

        uv0 = new TextureCoord();
        uv1 = new TextureCoord();
        uv2 = new TextureCoord();
        uv3 = new TextureCoord();
        uv4 = new TextureCoord();
        uv5 = new TextureCoord();
        uv6 = new TextureCoord();
        uv7 = new TextureCoord();

    } //new

    public inline function clone() {

        var _set = new TextureCoordSet();

            _set.uv0.set(uv0.u, uv0.v, uv0.w, uv0.t);
            _set.uv1.set(uv1.u, uv1.v, uv1.w, uv1.t);
            _set.uv2.set(uv2.u, uv2.v, uv2.w, uv2.t);
            _set.uv3.set(uv3.u, uv3.v, uv3.w, uv3.t);
            _set.uv4.set(uv4.u, uv4.v, uv4.w, uv4.t);
            _set.uv5.set(uv5.u, uv5.v, uv5.w, uv5.t);
            _set.uv6.set(uv6.u, uv6.v, uv6.w, uv6.t);
            _set.uv7.set(uv7.u, uv7.v, uv7.w, uv7.t);

        return _set;

    } //clone

    public inline function destroy() {
        uv0 = null;
        uv1 = null;
        uv2 = null;
        uv3 = null;
        uv4 = null;
        uv5 = null;
        uv6 = null;
        uv7 = null;
    }


} //TextureCoordSet


class TextureCoord {


    public var u : Float = 0.0;
    public var v : Float = 0.0;
    public var w : Float = 0.0;
    public var t : Float = 0.0;


    public inline function new(_u:Float = 0.0, _v:Float = 0.0, _w:Float = 0.0, _t:Float = 0.0) {

        u = _u;
        v = _v;
        w = _w;
        t = _t;

    } //new

    public inline function clone() {

        return new TextureCoord( u, v, w, t );

    } //clone

    public inline function set( _u : Float, _v : Float, _w : Float, _t:Float ) : TextureCoord {

        u = _u;
        v = _v;
        w = _w;
        t = _t;

        return this;

    } //set

    public inline function set_uv( _u : Float, _v : Float ) : TextureCoord {

        u = _u;
        v = _v;

        return this;

    } //set_uv

    inline function toString() {

        return  '{ u:$v, v:$v }';

    } //toString


} //TextureCoord

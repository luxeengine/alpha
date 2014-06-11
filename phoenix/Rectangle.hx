package phoenix;


class Rectangle {

    @:isVar public var x (default, set) : Float = 0;
    @:isVar public var y (default, set) : Float = 0;
    @:isVar public var w (default, set) : Float = 0;
    @:isVar public var h (default, set) : Float = 0;

     @:isVar public var serialized(get, null) : Dynamic;

    public var ignore_listeners : Bool = false;

    @:isVar public var listen_x (default,default) : Float -> Void;
    @:isVar public var listen_y (default,default) : Float -> Void;
    @:isVar public var listen_w (default,default) : Float -> Void;
    @:isVar public var listen_h (default,default) : Float -> Void;

    public function new(?_x:Float = 0,?_y:Float = 0,?_w:Float = 0,?_h : Float = 0) {

        x = _x;
        y = _y;
        w = _w;
        h = _h;

    } //new

    public function toString() {

        return "{ x:"+x + ", y:" + y + ", w:" + w  + ", h:" + h  + " }" ;

    } //toString

    public static function listen( _r:Rectangle, listener ) {
        _r.listen_x = listener;
        _r.listen_y = listener;
        _r.listen_w = listener;
        _r.listen_h = listener;
    } //listen

    public function point_inside( _p:Vector ) {

        if(_p.x < x) return false;
        if(_p.y < y) return false;
        if(_p.x > x+w) return false;
        if(_p.y > y+h) return false;

        return true;

    } //point_inside

    public function overlaps( _other:Rectangle ) {

        if(_other == null) {
            return false;
        }

            //only need to test extremes
        if( x < (_other.x + _other.w) &&
            y < (_other.y + _other.h) &&
            (x + w) > _other.x        &&
            (y + h) > _other.y ) {

            return true;
        }

        return false;
    }

    public function clone() {

        return new Rectangle(x,y,w,h);

    } //clone

        //:todo:, epsilon fp check version
    public function equal( _other:Rectangle ) {

        if(_other == null) {
            return false;
        }

        return x == _other.x && y == _other.y && w == _other.w && h == _other.h;

    } //equal

    public function copy_from( _rect:Rectangle ) {

        x = _rect.x;
        y = _rect.y;
        w = _rect.w;
        h = _rect.h;

    } //copy_from

    public function set(?_x:Float, ?_y:Float, ?_w:Float, ?_h:Float) {

        var _setx = x;
        var _sety = y;
        var _setw = w;
        var _seth = h;

                    //assign new values
                if(_x != null) _setx = _x;
                if(_y != null) _sety = _y;
                if(_w != null) _setw = _w;
                if(_h != null) _seth = _h;

            x = _setx;
            y = _sety;
            w = _setw;
            h = _seth;

        return this;

    } //set

    function set_x(_x:Float) : Float {

        x = _x;

            if(listen_x != null && !ignore_listeners) {
                listen_x(_x);
            }

        return x;

    } //set_x

    function set_y(_y:Float) : Float {

        y = _y;

            if(listen_y != null && !ignore_listeners) {
                listen_y(_y);
            }

        return y;

    } //set_y

    function set_w(_w:Float) : Float {

        w = _w;

            if(listen_w != null && !ignore_listeners) {
                listen_w(_w);
            }

        return w;

    } //set_w

    function set_h(_h:Float) : Float {

        h = _h;

            if(listen_h != null && !ignore_listeners) {
                listen_h(_h);
            }

        return h;

    } //set_h

    function get_serialized() : Dynamic {

        return { x:x, y:y, w:w, h:h }

    } //get_serialized

}
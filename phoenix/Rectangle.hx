package phoenix;

class Rectangle {

    public var x:Float;
    public var y:Float;
    public var w:Float;
    public var h:Float;

    public function new(?_x:Float = 0,?_y:Float = 0,?_w:Float = 0,?_h : Float = 0) {
        x = _x; 
        y = _y; 
        w = _w; 
        h = _h; 
    }

    public function toString() {
        return "{ x:"+x + ", y:" + y + ", w:" + w  + ", h:" + h  + " }" ;
    }

    public function point_inside(_p:Vector) {
        if(_p.x < x) return false;
        if(_p.y < y) return false;
        if(_p.x > x+w) return false;
        if(_p.y > y+h) return false;
        return true;
    }

    public function clone() {
        return new Rectangle(x,y,w,h);
    }

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
    }

}
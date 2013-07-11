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

    public function point_inside(_p:Vector) {
        if(_p.x < x) return false;
        if(_p.y < y) return false;
        if(_p.x > x+w) return false;
        if(_p.y > y+h) return false;
        return true;
    }

}
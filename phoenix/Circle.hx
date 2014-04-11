package phoenix;


class Circle {

    public var x:Float;
    public var y:Float;
    public var r:Float;

    public function new(?_x:Float = 0,?_y:Float = 0,?_r:Float = 0) {
        x = _x; 
        y = _y; 
        r = _r; 
    } //new

    public function toString() {
        return "{ x:"+x + ", y:" + y + ", r:" + r + " }" ;
    } //toString

    public function point_inside(_p:Vector) {
        
        return true;
    } //point_inside

    public function clone() {
        return new Circle(x,y,r);
    } //clone

    public function set(?_x:Float, ?_y:Float, ?_r:Float) {
        var _setx = x;
        var _sety = y;
        var _setr = r;
            
            //assign new values
        if(_x != null) _setx = _x;
        if(_y != null) _sety = _y;
        if(_r != null) _setr = _r;

        x = _setx;
        y = _sety;
        r = _setr;

        return this;
    } //set

} //Circle
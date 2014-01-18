package luxe;

import luxe.Vector;

class Screen {
	public var x : Float;
	public var y : Float;
	public var w : Float;
	public var h : Float;

	@:isVar public var mid (get,null) : Vector;

	public function new( _x:Int, _y:Int, _w:Int, _h:Int ) {
		x = _x;
		y = _y;
		w = _w;
		h = _h;

		mid = new Vector( Math.round(w/2), Math.round(h/2) );
	}

	function get_mid() : Vector {
		return mid.clone();
	} 

    public function point_inside(_p:Vector) {
        if(_p.x < x) return false;
        if(_p.y < y) return false;
        if(_p.x > x+w) return false;
        if(_p.y > y+h) return false;
        return true;
    }
}
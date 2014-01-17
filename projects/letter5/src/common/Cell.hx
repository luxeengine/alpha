package common;

import common.Board;
import luxe.Color;
import phoenix.geometry.Geometry;

class Cell {

	var name : String;
	
	var _debug_geometry : Array<Geometry>;

	public var board : Board;
	public var x : Int = 0;
	public var y : Int = 0;
	public var c : Int = 0;
	public var r : Int = 0;

	public function new( _board:Board, _x:Int, _y:Int, _c:Int, _r:Int ) {
		board = _board;
		x = _x; y = _y;
		c = _c; r = _r;
		name = 'cell_'+c+'-'+r;
	}

	public function init() {
		
		return;

		_debug_geometry = [];

		_debug_geometry.push(Luxe.draw.rectangle({
        	x: x, y : y,
        	w : board.blockw, h : board.blockh,
        	color : new Color(Math.random(),Math.random(),Math.random(),1)
        }));
        _debug_geometry[0].id = name;

	}
 
	public function destroy() {

		return;

		for(_g in _debug_geometry) {
			_g.drop();
			_g = null;
		}
	}
	
}
package common;

import common.Board;
import lab.Color;
import phoenix.geometry.Geometry;

class Cell {
	
	var _debug_geometry : Array<Geometry>;

	public var board : Board;
	public var x : Int = 0;
	public var y : Int = 0;

	public function new( _board:Board, _x:Int, _y:Int ) {
		board = _board;
		_debug_geometry = [];
		x = _x; y = _y;
	}

	public function init() {
		_debug_geometry.push(Lab.draw.rectangle({
        	x: x, y : y,
        	w : board.blockw, h : board.blockh,
        	color : new Color(1,1,1,0.4)
        }));
	}

	public function destroy() {
		for(_g in _debug_geometry) {
			_g.drop();
			_g = null;
		}
		_debug_geometry.splice(0,_debug_geometry.length);
	}
	
}
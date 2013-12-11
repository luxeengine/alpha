
import haxeAStar.AStar;
import haxeAStar.IAStarClient;

import luxe.components.Components.Component;
import luxe.Input.MouseEvent;
import luxe.Vector;
import luxe.Entity;
import luxe.Text;
import luxe.Color;
import phoenix.geometry.Geometry;


class Grid implements IAStarClient extends Component {
		
	var level : Level;
		
	public var width : Int;
	public var height : Int;

	var astar_cells : Array< Array<Int> >;
	var pathgeom : Array<Geometry>;
	var cellgeom : Array< Array<Geometry> >;
	
	var astar : AStar;
	
	//astar client functions
	
	public function isWalkable(x:Float, y:Float) {
		return astar_cells[Std.int(y)][Std.int(x)] == 0;
	}

	public var rowTotal(get, never):Int;
	public var colTotal(get, never):Int;

	function get_rowTotal() { return height; };
	function get_colTotal() { return width; };

	public function init() {

		width = 10;
		height = 10;
		pathgeom = [];
		cellgeom = [];

		astar_cells = [];
		for(_y in 0...height) {
			
			var _row = [];
			var _grow = [];
			
				for(_x in 0...width) {
					_row.push(0);
					_grow.push(null);
				} //x

			astar_cells.push(_row);
			cellgeom.push(_grow);
		}//y

		astar_cells[4][4] = 1;
		astar_cells[4][5] = 1;
		astar_cells[5][5] = 1;
		astar_cells[5][4] = 1;
		
		draw_astar_cells();

		
		astar = AStar.getAStarInstance(this);

	} //init

	public function set_blocked(_x:Float, _y:Float){
		var __x:Int = Std.int(_x);
		var __y:Int = Std.int(_y);

		astar_cells[__y][__x] = 1;
		astar._nodeArray[__x][__y].walkable = false;

		cellgeom[__y][__x].color = new Color(0.8,0,0,0.1);
	}

	public function set_unblocked(_x:Float, _y:Float){
		var __x:Int = Std.int(_x);
		var __y:Int = Std.int(_y);

		astar_cells[__y][__x] = 0;
		astar._nodeArray[__x][__y].walkable = true;

		cellgeom[__y][__x].color = new Color(1,1,1,0.1);
	}

	public function path(a:Vector, b:Vector) {
		var p = astar.findPath(a, b);
		if(p!=null) {
			draw_astar_path( p );
		} 
		return p;
	}

	

	public function draw_astar_path( path:Array<Vector> ) {

		if(pathgeom == null) {
			pathgeom = [];
		} else {
			for(geom in pathgeom) {
				geom.drop();
			}
			pathgeom = [];
		}

		var _block_width = 0.95;
		var _block_height = 0.95;
		var _green = new Color(0,0.8,0.2,0.2);

		for(p in path) {
			var _x = p.x;
			var _y = p.y;

			var wx = -5 + (_x * (_block_width+(0.05))) ;
			var wz = -5 + (_y * (_block_height+(0.05)));
			var wy = 20.5;

			pathgeom.push(Luxe.draw.plane({
				x : wx, y:wy, z:wz,
				w : _block_width, h : _block_height,
				color : _green
			}));
		}

	}

	public function draw_astar_cells() {
		
		var _block_width = 0.95;
		var _block_height = 0.95;
		var _white = new Color(1,1,1,0.1);
		var _red = new Color(0.8,0,0,0.1);

		for(_y in 0...height) {
			for(_x in 0...width) {

				var wx = -5 + (_x * (_block_width+(0.05))) ;
				var wz = -5 + (_y * (_block_height+(0.05)));
				var wy = 20;

				var g  = Luxe.draw.plane({
					x : wx, y:wy, z:wz,
					w : _block_width, h : _block_height,
					color : astar_cells[_y][_x] == 1 ? _red : _white
				});

				cellgeom[_y][_x] = g;
			}
		}

	} //draw_astar_cells

}
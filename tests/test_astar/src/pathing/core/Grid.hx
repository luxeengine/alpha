
package pathing.core;


typedef GridArray = Array<Array<Dynamic>>;
typedef NodeArray = Array<Array<Node>>;

		/**
		 * The Grid class, which serves as the encapsulation of the layout of the nodes.
		 * @constructor
		 * @param {Int} width Int of columns of the grid.
		 * @param {Int} height Int of rows of the grid.
		 * @param {Array<Array<(Int|Bool)>>} [grid] - A 0-1 grid
		 *     representing the walkable status of the nodes(0 or false for walkable).
		 *     If the grid is not supplied, all the nodes will be walkable.  */

class Grid {

	public var width : Int = 0;
	public var height : Int = 0;
	public var nodes : NodeArray;

	public function new( _width:Int, _height:Int, ?_grid:GridArray ) {
		width = _width;
		height = _height;
		nodes = build_nodes(width,height,_grid);
	} //new

	function build_nodes( _width:Int, _height:Int, ?_grid:GridArray ) : NodeArray {

		var nodes : NodeArray = [];

	    for (y in 0 ... _height) {
	        var _row = [];

	        for (x in 0 ... _width) {
	            _row.push(new Node(x, y));
	        }

	        nodes.push(_row);
	    }

	    if (_grid == null) {
	        return nodes;
	    }

	    if (_grid.length != _height || _grid[0].length != _width) {
	        throw '_grid size does not fit';
	    }

	    for( y in 0 ... _height ) {
	        for( x in 0 ... _width ) {

	            if(_grid[y][x] != null && _grid[y][x] != false && _grid[y][x] != 0 ) {
	                // 0, false, null will be walkable
	                // while others will be un-walkable
	                nodes[y][x].walkable = false;
	            }

	        }
	    }

	    return nodes;

	} //new

	public function getNodeAt(x:Int, y:Int) : Node {
		return nodes[y][x];
	}

		/**
		 * Determine whether the node at the given position is walkable.
		 * (Also returns false if the position is outside the grid.)
		 * @param {Int} x - The x coordinate of the node.
		 * @param {Int} y - The y coordinate of the node.
		 * @return {Bool} - The walkability of the node.
		 */	
	public function isWalkableAt(x:Int, y:Int) : Bool {
	    return isInside(x, y) && nodes[y][x].walkable;
	}

		/**
		 * Determine whether the position is inside the grid.
		 * XXX: `grid.isInside(x, y)` is wierd to read.
		 * It should be `(x, y) is inside grid`, but I failed to find a better
		 * name for this method.
		 * @param {Int} x
		 * @param {Int} y
		 * @return {Bool}
		 */
	public function isInside(x:Int, y:Int) : Bool {
	    return (x >= 0 && x < width) && (y >= 0 && y < height);
	}


		/**
		 * Set whether the node on the given position is walkable.
		 * NOTE: throws exception if the coordinate is not inside the grid.
		 * @param {Int} x - The x coordinate of the node.
		 * @param {Int} y - The y coordinate of the node.
		 * @param {Bool} walkable - Whether the position is walkable.
		 */
	public function setWalkableAt(x:Int, y:Int, walkable:Bool) : Void {
	    nodes[y][x].walkable = walkable;
	}

		/**
		 * Get the neighbors of the given node.
		 *
		 *     offsets      diagonalOffsets:
		 *  +---+---+---+    +---+---+---+
		 *  |   | 0 |   |    | 0 |   | 1 |
		 *  +---+---+---+    +---+---+---+
		 *  | 3 |   | 1 |    |   |   |   |
		 *  +---+---+---+    +---+---+---+
		 *  |   | 2 |   |    | 3 |   | 2 |
		 *  +---+---+---+    +---+---+---+
		 *
		 *  When allowDiagonal is true, if offsets[i] is valid, then
		 *  diagonalOffsets[i] and
		 *  diagonalOffsets[(i + 1) % 4] is valid.
		 * @param {Node} node
		 * @param {Bool} allowDiagonal
		 * @param {Bool} dontCrossCorners
		 */
	public function getNeighbors( node:Node, allowDiagonal:Bool, dontCrossCorners:Bool ) {

	    var x = node.x;
	    var y = node.y;
		var neighbors : Array<Node> = [];

	        var s0 : Bool = false; var d0 : Bool = false;
	        var s1 : Bool = false; var d1 : Bool = false;
	        var s2 : Bool = false; var d2 : Bool = false;
	        var s3 : Bool = false; var d3 : Bool = false;

	    // ↑
	    if (isWalkableAt(x, y - 1)) {
	        neighbors.push(nodes[y - 1][x]);
	        s0 = true;
	    }
	    // →
	    if (isWalkableAt(x + 1, y)) {
	        neighbors.push(nodes[y][x + 1]);
	        s1 = true;
	    }
	    // ↓
	    if (isWalkableAt(x, y + 1)) {
	        neighbors.push(nodes[y + 1][x]);
	        s2 = true;
	    }
	    // ←
	    if (isWalkableAt(x - 1, y)) {
	        neighbors.push(nodes[y][x - 1]);
	        s3 = true;
	    }

	    if (!allowDiagonal) {
	        return neighbors;
	    }

	    if (dontCrossCorners) {
	        d0 = s3 && s0;
	        d1 = s0 && s1;
	        d2 = s1 && s2;
	        d3 = s2 && s3;
	    } else {
	        d0 = s3 || s0;
	        d1 = s0 || s1;
	        d2 = s1 || s2;
	        d3 = s2 || s3;
	    }

	    // ↖
	    if (d0 && isWalkableAt(x - 1, y - 1)) {
	        neighbors.push(nodes[y - 1][x - 1]);
	    }
	    // ↗
	    if (d1 && isWalkableAt(x + 1, y - 1)) {
	        neighbors.push(nodes[y - 1][x + 1]);
	    }
	    // ↘
	    if (d2 && isWalkableAt(x + 1, y + 1)) {
	        neighbors.push(nodes[y + 1][x + 1]);
	    }
	    // ↙
	    if (d3 && isWalkableAt(x - 1, y + 1)) {
	        neighbors.push(nodes[y + 1][x - 1]);
	    }

	    return neighbors;
	}


		/**
		 * Get a clone of this grid.
		 * @return {Grid} Cloned grid.
		 */
	public function clone() : Grid {

	        var new_grid = new Grid(width, height);
	        var new_nodes : NodeArray = [];

	    for( y in 0 ... height ) {
	        var _row : Array<Node> = [];
	        for( x in 0 ... width ) {
	            _row.push( new Node(x, y, nodes[y][x].walkable) );
	        }
	        new_nodes.push(_row);
	    }

	    new_grid.nodes = new_nodes;

	    return new_grid;
	}

}
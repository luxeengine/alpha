
package pathing.core;

		/**
	 * A node in grid. 
	 * This class holds some basic information about a node and custom 
	 * attributes may be added, depending on the algorithms' needs.
	 * @constructor
	 * @param {number} x - The x coordinate of the node on the grid.
	 * @param {number} y - The y coordinate of the node on the grid.
	 * @param {boolean} [walkable] - Whether this node is walkable.
	 */

enum NodeType {
	start;
	end;
}

class Node {

	public var x : Int = -1;
	public var y : Int = -1;
	public var walkable : Bool = true;
	public var opened : Bool = false;
	public var closed : Bool = false;

	public var h : Null<Float> = null;
	public var f : Float = 0;
	public var g : Float = 0;
	public var parent : Node;
	public var by : NodeType;

	public function new(_x:Int, _y:Int, ?_walkable:Bool = true) {
	    x = _x; y = _y;
	    walkable = _walkable;
	}

} //Node
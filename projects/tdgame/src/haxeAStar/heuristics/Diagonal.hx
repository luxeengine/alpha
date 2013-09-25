package haxeAStar.heuristics;
import haxeAStar.AStar;
import haxeAStar.Node;

/**
 * 对角线估值算法。
 * 
 * @author statm
 */

class Diagonal implements IHeuristic
{
	public function new() 
	{
	}
	
	public function getCost(node1:Node, node2:Node):Float
	{
		var dx = Math.abs(node1.x - node2.x);
		var dy = Math.abs(node1.y - node2.y);
		
		var diag = Math.min(dx, dy);
		var straight = dx + dy;
		
		return AStar.ADJ_COST * (straight - 2 * diag) + AStar.DIAG_COST * diag;
	}
}
package haxeAStar;

import luxe.Vector;

/**
 * A* 节点。
 * 
 * @author statm
 */

class Node extends Vector
{
	public var parent:Node;
	
	public var walkable:Bool;
	
	public var f:Float;
	public var g:Float;
	
	override public function toString():String
	{
		var result:String;
		result = "[Node(" + this.x + "," + this.y + ")";
		if (parent != null)
		{
			result += ", parent=(" + parent.x + "," + parent.y + ")";
		}
		result += (walkable ? ", W" : ", X");
		result += ", f=" + f;
		result += "]";
		
		return result;
	}
	
	public function toVector():Vector
	{
		return this.clone();
	}
}

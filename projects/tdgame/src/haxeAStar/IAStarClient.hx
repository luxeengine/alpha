package haxeAStar;

/**
 * A* 数据源。
 * 
 * @author statm
 */

interface IAStarClient 
{
	public var rowTotal(get, never):Int;
	public var colTotal(get, never):Int;
	
	function isWalkable(x:Float, y:Float):Bool;
}
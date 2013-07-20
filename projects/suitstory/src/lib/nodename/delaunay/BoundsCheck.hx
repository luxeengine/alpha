package lib.nodename.delaunay;

import lib.as3.Rectangle;
import lib.as3.TypeDefs;

using as3.RectangleCore;

class BoundsCheck {

	public static inline var TOP:Int = 1;
	public static inline var BOTTOM:Int = 2;
	public static inline var LEFT:Int = 4;
	public static inline var RIGHT:Int = 8;
	
	/**
	 * 
	 * @param point
	 * @param bounds
	 * @return an int with the appropriate bits set if the Point lies on the corresponding bounds lines
	 * 
	 */
	public static function check(point:Point, bounds:Rectangle):Int
	{
		var value:Int = 0;
		if (point.x == bounds.left())
		{
			value |= LEFT;
		}
		if (point.x == bounds.right())
		{
			value |= RIGHT;
		}
		if (point.y == bounds.top())
		{
			value |= TOP;
		}
		if (point.y == bounds.bottom())
		{
			value |= BOTTOM;
		}
		return value;
	}
}
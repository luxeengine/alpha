package lib.nodename.geom;

import lib.as3.TypeDefs;

class Circle {

	public var center:Point;
	public var radius:Number;
	
	public function new(centerX:Number, centerY:Number, radius:Number)
	{
		this.center = {x:centerX, y:centerY};
		this.radius = radius;
	}

	public function contains(pt:Point) {
		
	}
	
	public function toString():String
	{
		return "Circle (center: " + center + "; radius: " + radius + ")";
	}
	
}
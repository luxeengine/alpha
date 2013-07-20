package lib.nodename.geom;

import lib.as3.TypeDefs;

class Polygon {

	private var _vertices:Vector<Point>;

	public function new(vertices:Vector<Point>) {
		_vertices = vertices;
	}
	
	public function area():Number
	{
		return Math.abs(signedDoubleArea() * 0.5);
	}

	public function winding():Winding
	{
		var signedDoubleArea:Number = signedDoubleArea();
		if (signedDoubleArea < 0)
		{
			return Winding.CLOCKWISE;
		}
		if (signedDoubleArea > 0)
		{
			return Winding.COUNTERCLOCKWISE;
		}
		return Winding.NONE;
	}

	private function signedDoubleArea():Number
	{
		var index:UInt, nextIndex:UInt;
		var n:UInt = _vertices.length;
		var point:Point, next:Point;
		var signedDoubleArea:Number = 0;
		for (index in 0...n)
		{
			nextIndex = (index + 1) % n;
			point = _vertices[index];
			next = _vertices[nextIndex];
			signedDoubleArea += point.x * next.y - next.x * point.y;
		}
		return signedDoubleArea;
	}
	
}
package lib.nodename.delaunay;

import lib.as3.TypeDefs;

using Math;

class Vertex implements ICoord {

	public static var VERTEX_AT_INFINITY:Vertex = new Vertex(Math.NaN, Math.NaN);
	private static var _pool:Vector<Vertex> = new Vector<Vertex>();
	private static function create(x:Number, y:Number):Vertex
	{
		if (x.isNaN() || y.isNaN())
		{
			return VERTEX_AT_INFINITY;
		}
		if (_pool.length > 0)
		{
			return _pool.pop().init(x, y);
		}
		else
		{
			return new Vertex(x, y);
		}
	}

	private static var _nvertices:Int = 0;
	
	private var _coord:Point;
	public var coord(get_coord, never):Point;
	inline public function get_coord():Point {
		return _coord;
	}
	public var vertexIndex(default, null):Int;

	private function new(x:Number, y:Number)
	{
		init(x, y);
	}

	private function init(x:Number, y:Number):Vertex
	{
		_coord = {x:x, y:y};
		return this;
	}
	
	public function dispose():Void
	{
		_coord = null;
		_pool.push(this);
	}
	
	public function setIndex():Void
	{
		vertexIndex = _nvertices++;
	}
	
	public function toString():String
	{
		return "Vertex (" + vertexIndex + ")";
	}

	/**
	 * This is the only way to make a Vertex
	 * 
	 * @param halfedge0
	 * @param halfedge1
	 * @return 
	 * 
	 */
	public static function intersect(halfedge0:Halfedge, halfedge1:Halfedge):Vertex
	{
		var edge0:Edge, edge1:Edge, edge:Edge;
		var halfedge:Halfedge;
		var determinant:Number, intersectionX:Number, intersectionY:Number;
		var rightOfSite:Boolean;
	
		edge0 = halfedge0.edge;
		edge1 = halfedge1.edge;
		if (edge0 == null || edge1 == null)
		{
			return null;
		}
		if (edge0.rightSite == edge1.rightSite)
		{
			return null;
		}
	
		determinant = edge0.a * edge1.b - edge0.b * edge1.a;
		if (-1.0e-10 < determinant && determinant < 1.0e-10)
		{
			// the edges are parallel
			return null;
		}
	
		intersectionX = (edge0.c * edge1.b - edge1.c * edge0.b)/determinant;
		intersectionY = (edge1.c * edge0.a - edge0.c * edge1.a)/determinant;

		//if (Voronoi.isInfSite(edge0.rightSite, edge1.rightSite))	//HxDelaunay
		if (Voronoi.compareSiteByYThenX(edge0.rightSite, edge1.rightSite) < 0)
		{
			halfedge = halfedge0; edge = edge0;
		}
		else
		{
			halfedge = halfedge1; edge = edge1;
		}
		rightOfSite = intersectionX >= edge.rightSite.x;
		if ((rightOfSite && halfedge.leftRight == LR.LEFT)
		||  (!rightOfSite && halfedge.leftRight == LR.RIGHT))
		{
			return null;
		}
		return Vertex.create(intersectionX, intersectionY);
	}

	public var x(getX, null):Number;
	private inline function getX():Number
	{
		return _coord.x;
	}
	public var y(getY, null):Number;
	private inline function getY():Number
	{
		return _coord.y;
	}

}
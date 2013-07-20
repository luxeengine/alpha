package lib.nodename.delaunay;

import lib.as3.TypeDefs;
import lib.nodename.geom.LineSegment;

using Lambda;
using as3.BitmapDataCore;

class Delaunay {

	public static function delaunayLinesForEdges(edges:Vector<Edge>):Vector<LineSegment>
	{
		var segments:Vector<LineSegment> = new Vector<LineSegment>();
		for (edge in edges)
		{
			segments.push(edge.delaunayLine());
		}
		return segments;
	}

	public static function selectEdgesForSitePoint(coord:Point, edgesToTest:Vector<Edge>):Vector<Edge>
	{
		return edgesToTest.filter(function (edge:Edge):Boolean {
			return ((edge.leftSite != null && edge.leftSite.coord == coord)
			||  (edge.rightSite != null && edge.rightSite.coord == coord));
		}).array();
	}	

	public static function selectNonIntersectingEdges(keepOutMask:BitmapData, edgesToTest:Vector<Edge>):Vector<Edge>
	{
		if (keepOutMask == null)
		{
			return edgesToTest;
		}
		
		var zeroPoint:Point = {x:0.0, y:0.0};
		return edgesToTest.filter(function (edge:Edge):Boolean {
			var delaunayLineBmp:BitmapData = edge.makeDelaunayLineBmp();
			var notIntersecting:Boolean = !(keepOutMask.hitTest(zeroPoint, 1, delaunayLineBmp, zeroPoint, 1));
			delaunayLineBmp.dispose();
			return notIntersecting;
		}).array();
	}
	
	public static function visibleLineSegments(edges:Vector<Edge>):Vector<LineSegment>
	{
		var segments:Vector<LineSegment> = new Vector<LineSegment>();
	
		for (edge in edges)
		{
			if (edge.visible)
			{
				var p1:Point = edge.clippedEnds.get(LR.LEFT.toString());
				var p2:Point = edge.clippedEnds.get(LR.RIGHT.toString());
				segments.push(new LineSegment(p1, p2));
			}
		}
		
		return segments;
	}	
	
}
package lib.nodename.delaunay;
import lib.as3.TypeDefs;

enum Criterion { vertex; site; }

class EdgeReorderer {

	public var edges(default, null):Vector<Edge>;
	public var edgeOrientations(default, null):Vector<LR>;
	
	public function new(origEdges:Vector<Edge>, criterion:Criterion)
	{
		if (criterion != vertex && criterion != site)
		{
			throw "Edges: criterion must be Vertex or Site";
		}
		edges = new Vector<Edge>();
		edgeOrientations = new Vector<LR>();
		if (origEdges.length > 0)
		{
			edges = reorderEdges(origEdges, criterion);
		}
	}
	
	public function dispose():Void
	{
		edges = null;
		edgeOrientations = null;
	}

	private function reorderEdges(origEdges:Vector<Edge>, criterion:Criterion):Vector<Edge>
	{
		var i:Int;
		var j:Int;
		var n:Int = origEdges.length;
		var edge:Edge;
		// we're going to reorder the edges in order of traversal
		var done:Vector<Boolean> = new Vector<Boolean>();
		var nDone:Int = 0;
		for (b in done)
		{
			b = false;
		}
		var newEdges:Vector<Edge> = new Vector<Edge>();
		
		i = 0;
		edge = origEdges[i];
		newEdges.push(edge);
		edgeOrientations.push(LR.LEFT);
		var firstPoint:ICoord;
		var lastPoint:ICoord;
		if (criterion == vertex) {
			firstPoint = edge.leftVertex;
			lastPoint = edge.rightVertex;
		}
		else {
			firstPoint = edge.leftSite;
			lastPoint = edge.rightSite;
		}
		
		if (firstPoint == Vertex.VERTEX_AT_INFINITY || lastPoint == Vertex.VERTEX_AT_INFINITY)
		{
			return new Vector<Edge>();
		}
		
		done[i] = true;
		++nDone;
		
		while (nDone < n)
		{
			for (i in 1...n)
			{
				if (done[i])
				{
					continue;
				}
				edge = origEdges[i];
				var leftPoint:ICoord; 
				var rightPoint:ICoord;
				if (criterion == vertex) {
					leftPoint = edge.leftVertex;
					rightPoint = edge.rightVertex;
				}
				else {
					leftPoint = edge.leftSite;
					rightPoint = edge.rightSite;
				}
				
				if (leftPoint == Vertex.VERTEX_AT_INFINITY || rightPoint == Vertex.VERTEX_AT_INFINITY)
				{
					return new Vector<Edge>();
				}
				if (leftPoint == lastPoint)
				{
					lastPoint = rightPoint;
					edgeOrientations.push(LR.LEFT);
					newEdges.push(edge);
					done[i] = true;
				}
				else if (rightPoint == firstPoint)
				{
					firstPoint = leftPoint;
					edgeOrientations.unshift(LR.LEFT);
					newEdges.unshift(edge);
					done[i] = true;
				}
				else if (leftPoint == firstPoint)
				{
					firstPoint = rightPoint;
					edgeOrientations.unshift(LR.RIGHT);
					newEdges.unshift(edge);
					done[i] = true;
				}
				else if (rightPoint == lastPoint)
				{
					lastPoint = leftPoint;
					edgeOrientations.push(LR.RIGHT);
					newEdges.push(edge);
					done[i] = true;
				}
				if (done[i])
				{
					++nDone;
				}
			}
		}
		
		return newEdges;
	}	
	
}
package lib.nodename.delaunay;

import lib.as3.Rectangle;
import lib.as3.TypeDefs;
import lib.nodename.delaunay.EdgeReorderer;
import lib.nodename.geom.Circle;
import lib.nodename.geom.LineSegment;
import de.polygonal.math.PM_PRNG;

using Lambda;
using Std;
using as3.PointCore;

class Voronoi {

	private var _prng:PM_PRNG;
	private var _sites:SiteList;
	private var _sitesIndexedByLocation:Dictionary<Site>;
	private var _triangles:Vector<Triangle>;
	private var _edges:Vector<Edge>;

	// TODO generalize this so it doesn't have to be a rectangle;
	// then we can make the fractal voronois-within-voronois
	public var plotBounds(default, null):Rectangle;

	public function dispose():Void
	{
		var i:Int, n:Int;
		if (_sites != null)
		{
			_sites.dispose();
			_sites = null;
		}
		if (_triangles != null)
		{
			n = _triangles.length;
			for (i in 0...n)
			{
				_triangles[i].dispose();
			}
			//_triangles.length = 0;
			_triangles = null;
		}
		if (_edges != null)
		{
			n = _edges.length;
			for (i in 0...n)
			{
				_edges[i].dispose();
			}
			//_edges.length = 0;
			_edges = null;
		}
		plotBounds = null;
		_sitesIndexedByLocation = null;
	}

	public function new(points:Vector<Point>, colors:Vector<UInt>, plotBounds:Rectangle)
	{	
		makeSureNoDuplicatePoints(points);
		(_prng = new PM_PRNG()).seed = 1;
		_sites = new SiteList();
		_sitesIndexedByLocation = new Dictionary();
		addSites(points, colors);
		this.plotBounds = plotBounds;
		_triangles = new Vector<Triangle>();
		_edges = new Vector<Edge>();
		fortunesAlgorithm();
	}
	
	/**
	 * AS3 Dictionary stores object keys by object identity.
	 * Haxe Hash only supports string keys.
	 * This means duplicate coordinates can't be stored in hash.
	 * Prevent this case until it's possible to store duplicate points coords.
	 */
	private function makeSureNoDuplicatePoints(points:Vector<Point>) {
		var h = new Hash<Point>();
		var c : Int = 0;
		for (p in points) {
			c++;
			// trace('checking point : ' + c + ' : ' + p); 
			if (h.exists(p.hash())) {
				throw "Duplicate points not supported yet!";
			}
			h.set(p.hash(), p);
		}
	}

	private function addSites(points:Vector<Point>, colors:Vector<UInt>):Void
	{
		var length:UInt = points.length;
		for (i in 0...length) {
			addSite(points[i], (colors != null) ? colors[i] : 0, i);
		}
	}
	
	private function addSite(p:Point, color:UInt, index:Int):Void {

		var weight:Number = _prng.nextDouble() * 100;
		var site:Site = Site.create(p, index, weight, color, this);
		_sites.push(site);
		_sitesIndexedByLocation.set(p.hash(), site);

	}

	public function edges():Vector<Edge>
	{
		return _edges;
	}
	
	public function order() {
		_sites.order();
	}

	public function site(p:Point):Site {
		var site:Site = _sitesIndexedByLocation.get(p.hash());
		return site;
	}
	public function region(p:Point):Vector<Point>
	{
		var site:Site = _sitesIndexedByLocation.get(p.hash());

		if (site == null) {
			return new Vector<Point>();
		}

		return site.region(plotBounds);
	}

	  // TODO: bug: if you call this before you call region(), something goes wrong :(
	public function neighborSitesForSite(coord:Point):Vector<Point>
	{
		var points:Vector<Point> = new Vector<Point>();
		var site:Site = _sitesIndexedByLocation.get(coord.hash());
		if (site == null)
		{
			return points;
		}
		var sites:Vector<Site> = site.neighborSites();
		var neighbor:Site;
		for (neighbor in sites)
		{
			points.push(neighbor.coord);
		}
		return points;
	}
	
	public function circles():Vector<Circle>
	{
		return _sites.circles();
	}
	
	public function voronoiBoundaryForSite(coord:Point):Vector<LineSegment>
	{
		return Delaunay.visibleLineSegments(Delaunay.selectEdgesForSitePoint(coord, _edges));
	}

	public function delaunayLinesForSite(coord:Point):Vector<LineSegment>
	{
		return Delaunay.delaunayLinesForEdges(Delaunay.selectEdgesForSitePoint(coord, _edges));
	}
	
	public function voronoiDiagram():Vector<LineSegment>
	{
		return Delaunay.visibleLineSegments(_edges);
	}
	
	public function delaunayTriangulation(keepOutMask:BitmapData = null):Vector<LineSegment>
	{
		return Delaunay.delaunayLinesForEdges(Delaunay.selectNonIntersectingEdges(keepOutMask, _edges));
	}
	
	public function hull():Vector<LineSegment>
	{
		return Delaunay.delaunayLinesForEdges(hullEdges());
	}
	
	private function hullEdges():Vector<Edge>
	{
		return _edges.filter(function (edge:Edge):Boolean {
			return (edge.isPartOfConvexHull());
		}).array();
	}

	public function hullPointsInOrder():Vector<Point>
	{
		var hullEdges:Vector<Edge> = hullEdges();
		
		var points:Vector<Point> = new Vector<Point>();
		if (hullEdges.length == 0)
		{
			return points;
		}
		
		var reorderer:EdgeReorderer = new EdgeReorderer(hullEdges, Criterion.site);
		hullEdges = reorderer.edges;
		var orientations:Vector<LR> = reorderer.edgeOrientations;
		reorderer.dispose();
		
		var orientation:LR;

		var n:Int = hullEdges.length;
		for (i in 0...n)
		{
			var edge:Edge = hullEdges[i];
			orientation = orientations[i];
			points.push(edge.site(orientation).coord);
		}
		return points;
	}
	
	public function spanningTree(type:String = "minimum", keepOutMask:BitmapData = null):Vector<LineSegment>
	{
		var edges:Vector<Edge> = Delaunay.selectNonIntersectingEdges(keepOutMask, _edges);
		var segments:Vector<LineSegment> = Delaunay.delaunayLinesForEdges(edges);
		return Kruskal.kruskal(segments, type);
	}

	public function regions():Vector<Vector<Point>>
	{
		return _sites.regions(plotBounds);
	}
	
	public function siteColors(referenceImage:BitmapData = null):Vector<UInt>
	{
		return _sites.siteColors(referenceImage);
	}
	
	/**
	 * 
	 * @param proximityMap a BitmapData whose regions are filled with the site index values; see PlanePointsCanvas::fillRegions()
	 * @param x
	 * @param y
	 * @return coordinates of nearest Site to (x, y)
	 * 
	 */
	public function nearestSitePoint(proximityMap:BitmapData, x:Int, y:Int):Point
	{
		return _sites.nearestSitePoint(proximityMap, x, y);
	}
	
	public function siteCoords():Vector<Point>
	{
		return _sites.siteCoords();
	}
	
	private function fortunesAlgorithm():Void
	{
		var newSite:Site, bottomSite:Site, topSite:Site, tempSite:Site;
		var v:Vertex, vertex:Vertex;
		var newintstar:Point;
		var leftRight:LR;
		var lbnd:Halfedge, rbnd:Halfedge, llbnd:Halfedge, rrbnd:Halfedge, bisector:Halfedge;
		var edge:Edge;
		
		var dataBounds:Rectangle = _sites.getSitesBounds();
		
		var sqrt_nsites:Int = Std.int(Math.sqrt(_sites.length + 4));
		var heap:HalfedgePriorityQueue = new HalfedgePriorityQueue(dataBounds.y, dataBounds.height, sqrt_nsites);
		var edgeList:EdgeList = new EdgeList(dataBounds.x, dataBounds.width, sqrt_nsites);
		var halfEdges:Vector<Halfedge> = new Vector<Halfedge>();
		var vertices:Vector<Vertex> = new Vector<Vertex>();
		
		var bottomMostSite:Site = _sites.next();
		newSite = _sites.next();

		function leftRegion (he:Halfedge):Site
		{
			var edge:Edge = he.edge;
			if (edge == null)
			{
				return bottomMostSite;
			}
			return edge.site(he.leftRight);
		}
		
		function rightRegion (he:Halfedge):Site
		{
			var edge:Edge = he.edge;
			if (edge == null)
			{
				return bottomMostSite;
			}
			return edge.site(LR.other(he.leftRight));
		}
		
		while (true)
		{
			if (heap.empty() == false)
			{
				newintstar = heap.min();
			}
		
			if (newSite != null 
			&&  (heap.empty() || comparePointByYThenX(newSite, newintstar) < 0))
			{
				/* new site is smallest */
				//trace("smallest: new site " + newSite);
				
				// Step 8:
				lbnd = edgeList.edgeListLeftNeighbor(newSite.coord);	// the Halfedge just to the left of newSite
				//trace("lbnd: " + lbnd);
				rbnd = lbnd.edgeListRightNeighbor;		// the Halfedge just to the right
				//trace("rbnd: " + rbnd);
				bottomSite = rightRegion(lbnd);		// this is the same as leftRegion(rbnd)
				// this Site determines the region containing the new site
				//trace("new Site is in region of existing site: " + bottomSite);
				
				// Step 9:
				edge = Edge.createBisectingEdge(bottomSite, newSite);
				//trace("new edge: " + edge);
				_edges.push(edge);
				
				bisector = Halfedge.create(edge, LR.LEFT);
				halfEdges.push(bisector);
				// inserting two Halfedges into edgeList constitutes Step 10:
				// insert bisector to the right of lbnd:
				edgeList.insert(lbnd, bisector);
				
				// first half of Step 11:
				if ((vertex = Vertex.intersect(lbnd, bisector)) != null) 
				{
					vertices.push(vertex);
					heap.remove(lbnd);
					lbnd.vertex = vertex;
					lbnd.ystar = vertex.y + newSite.dist(vertex);
					heap.insert(lbnd);
				}
				
				lbnd = bisector;
				bisector = Halfedge.create(edge, LR.RIGHT);
				halfEdges.push(bisector);
				// second Halfedge for Step 10:
				// insert bisector to the right of lbnd:
				edgeList.insert(lbnd, bisector);
				
				// second half of Step 11:
				if ((vertex = Vertex.intersect(bisector, rbnd)) != null)
				{
					vertices.push(vertex);
					bisector.vertex = vertex;
					bisector.ystar = vertex.y + newSite.dist(vertex);
					heap.insert(bisector);	
				}
				
				newSite = _sites.next();	
			}
			else if (heap.empty() == false) 
			{
				/* intersection is smallest */
				lbnd = heap.extractMin();
				llbnd = lbnd.edgeListLeftNeighbor;
				rbnd = lbnd.edgeListRightNeighbor;
				rrbnd = rbnd.edgeListRightNeighbor;
				bottomSite = leftRegion(lbnd);
				topSite = rightRegion(rbnd);
				// these three sites define a Delaunay triangle
				// (not actually using these for anything...)
				//_triangles.push(new Triangle(bottomSite, topSite, rightRegion(lbnd)));
				
				v = lbnd.vertex;
				v.setIndex();
				lbnd.edge.setVertex(lbnd.leftRight, v);
				rbnd.edge.setVertex(rbnd.leftRight, v);
				edgeList.remove(lbnd); 
				heap.remove(rbnd);
				edgeList.remove(rbnd); 
				leftRight = LR.LEFT;
				if (bottomSite.y > topSite.y)
				{
					tempSite = bottomSite; bottomSite = topSite; topSite = tempSite; leftRight = LR.RIGHT;
				}
				edge = Edge.createBisectingEdge(bottomSite, topSite);
				_edges.push(edge);
				bisector = Halfedge.create(edge, leftRight);
				halfEdges.push(bisector);
				edgeList.insert(llbnd, bisector);
				edge.setVertex(LR.other(leftRight), v);
				if ((vertex = Vertex.intersect(llbnd, bisector)) != null)
				{
					vertices.push(vertex);
					heap.remove(llbnd);
					llbnd.vertex = vertex;
					llbnd.ystar = vertex.y + bottomSite.dist(vertex);
					heap.insert(llbnd);
				}
				if ((vertex = Vertex.intersect(bisector, rrbnd)) != null)
				{
					vertices.push(vertex);
					bisector.vertex = vertex;
					bisector.ystar = vertex.y + bottomSite.dist(vertex);
					heap.insert(bisector);
				}
			}
			else
			{
				break;
			}
		}
		
		// heap should be empty now
		heap.dispose();
		edgeList.dispose();
		
		for (halfEdge in halfEdges)
		{
			halfEdge.reallyDispose();
		}
		//halfEdges.length = 0;
		
		// we need the vertices to clip the edges
		for (edge in _edges)
		{
			edge.clipVertices(plotBounds);
		}
		// but we don't actually ever use them again!
		for (vertex in vertices)
		{
			vertex.dispose();
		}
		//vertices.length = 0;
		
	}

	/**
	 * HxDelaunay
	 */
	public inline static function isInfSite(s1:Site, s2:Site) : Bool {
		return (s1.y < s2.y) || (s1.y == s2.y && s1.x < s2.x);
	}
	
	public static function comparePointByYThenX(s1:Site, s2:Point):Int
	{
		return compareByYThenX(s1.x, s1.y, s2.x, s2.y);
	}
	
	public static function compareSiteByYThenX(s1:Site, s2:Site):Int
	{
		return compareByYThenX(s1.x, s1.y, s2.x, s2.y);
	}

	public static function compareByYThenX(s1x:Number, s1y:Number, s2x:Number, s2y:Number):Int
	{
		if (s1y < s2y) return -1;
		if (s1y > s2y) return 1;
		if (s1x < s2x) return -1;
		if (s1x > s2x) return 1;
		return 0;
	}
	
	
}
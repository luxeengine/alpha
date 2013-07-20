package lib.nodename.delaunay;

import lib.as3.NumberCore;
import lib.as3.Rectangle;
import lib.as3.TypeDefs;
import lib.nodename.geom.Circle;
import lib.nodename.utils.IDisposable;

using Std;
using as3.BitmapDataCore;

class SiteList implements IDisposable {

	private var _sites:Vector<Site>;
	private var _currentIndex:Int;
	
	private var _sorted:Boolean;
	
	public function new()
	{
		_sites = new Vector<Site>();
		_sorted = false;
	}

	public function dispose():Void
	{
		if (_sites != null)
		{
			for (site in _sites)
			{
				site.dispose();
			}
			_sites = null;
		}
	}

	public function order() {
		for(_s in _sites) {
			_s.order();
		}
	}

	public function push(site:Site):Int
	{
		_sorted = false;
		return _sites.push(site);
	}
	
	public var length(getLength, null):Int;
	private inline function getLength():Int
	{
		return _sites.length;
	}

	public function next():Site
	{
		if (_sorted == false)
		{
			throw "SiteList::next():  sites have not been sorted";
		}
		if (_currentIndex < _sites.length)
		{
			return _sites[_currentIndex++];
		}
		else
		{
			return null;
		}
	}
	
	public function getSitesBounds():Rectangle
	{
		if (_sorted == false)
		{
			Site.sortSites(_sites);
			_currentIndex = 0;
			_sorted = true;
		}
		var xmin:Number, xmax:Number, ymin:Number, ymax:Number;
		if (_sites.length == 0)
		{
			return new Rectangle(0, 0, 0, 0);
		}
		
		xmin = Math.POSITIVE_INFINITY;
		xmax = Math.NEGATIVE_INFINITY;
		for (site in _sites)
		{
			if (site.x < xmin)
			{
				xmin = site.x;
			}
			if (site.x > xmax)
			{
				xmax = site.x;
			}
		}
		// here's where we assume that the sites have been sorted on y:
		ymin = _sites[0].y;
		ymax = _sites[_sites.length - 1].y;
		
		return new Rectangle(xmin, ymin, xmax - xmin, ymax - ymin);
	}

	public function siteColors(referenceImage:BitmapData = null):Vector<Int>
	{
		var colors:Vector<Int> = new Vector<Int>();
		for (site in _sites)
		{
			colors.push(referenceImage != null ? referenceImage.getPixel(site.x.int(), site.y.int()) : site.color);
		}
		return colors;
	}

	public function siteCoords():Vector<Point>
	{
		var coords:Vector<Point> = new Vector<Point>();
		for (site in _sites)
		{
			coords.push(site.coord);
		}
		return coords;
	}

	/**
	 * 
	 * @return the largest circle centered at each site that fits in its region;
	 * if the region is infinite, return a circle of radius 0.
	 * 
	 */
	public function circles():Vector<Circle>
	{
		var circles:Vector<Circle> = new Vector<Circle>();
		for (site in _sites)
		{
			//var radius:Number = 0;
			var nearestEdge:Edge = site.nearestEdge();
			
			var radius = (!nearestEdge.isPartOfConvexHull())? (nearestEdge.sitesDistance() * 0.5): 0;
			//!nearestEdge.isPartOfConvexHull() && (radius = nearestEdge.sitesDistance() * 0.5);
			circles.push(new Circle(site.x, site.y, radius));
		}
		return circles;
	}

	public function regions(plotBounds:Rectangle):Vector<Vector<Point>>
	{
		var regions:Vector<Vector<Point>> = new Vector<Vector<Point>>();
		for (site in _sites)
		{
			regions.push(site.region(plotBounds));
		}
		return regions;
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
		var index:Int = proximityMap.getPixel(x, y);
		if (index > _sites.length - 1)
		{
			return null;
		}
		return _sites[index].coord;
	}
	
}
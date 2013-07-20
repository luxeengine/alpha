package lib.nodename.delaunay;

import lib.as3.TypeDefs;

class Triangle {
	private var _sites:Vector<Site>;
	public var sites(get_sites, null) : Vector<Site>;
	inline public function get_sites():Vector<Site> {
		return _sites;
	}
	
	public function new(a:Site, b:Site, c:Site)
	{
		_sites = [ a, b, c ];
	}
	
	public function dispose():Void
	{
		_sites = null;
	}
	
}
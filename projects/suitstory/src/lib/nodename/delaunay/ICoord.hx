package lib.nodename.delaunay;

import lib.as3.TypeDefs;

interface ICoord {
	public var coord(get_coord, null):Point;
	public function get_coord():Point;
}
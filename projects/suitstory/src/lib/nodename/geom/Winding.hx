package lib.nodename.geom;

class Winding {

	public static var CLOCKWISE:Winding = new Winding("clockwise");
	public static var COUNTERCLOCKWISE:Winding = new Winding("counterclockwise");
	public static var NONE:Winding = new Winding("none");
	
	private var _name:String;
	
	private function new(name:String)
	{
		_name = name;
	}
	
	public function toString():String
	{
		return _name;
	}

}
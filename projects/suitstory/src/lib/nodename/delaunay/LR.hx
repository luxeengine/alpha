package lib.nodename.delaunay;

class LR {

	public static var LEFT:LR = new LR("left");
	public static var RIGHT:LR = new LR("right");
	
	private var _name:String;
	
	private function new(name:String)
	{
		_name = name;
	}
	
	public static function other(leftRight:LR):LR
	{
		return leftRight == LEFT ? RIGHT : LEFT;
	}
	
	public function toString():String
	{
		return _name;
	}
	
}
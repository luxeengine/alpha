package luxe.tilemaps.tiled;

import luxe.tilemaps.tiled.TiledMap;

class TiledObject {

}

class TiledObjectGroup {
	
	public var map : TiledMap;
	public var name : String;

	public var width : Int;
	public var height : Int;
	public var color:String;
	public var properties:Map<String, String>;
	public var objects : Array<TiledObject>;	

	public function new( _map:TiledMap ) {
		map = _map;

		name = '';
		width = 0;
		height = 0;
		color = '';
		properties = new Map();
		objects = [];

	} //new

	public function from_xml( xml:Xml ) {

	}

} //TiledObjectGroup
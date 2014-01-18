package luxe.tilemaps.tiled;

import luxe.tilemaps.tiled.TiledMap;
import phoenix.Texture;

class TiledTileset {

	public var name : String;	
	public var tile_width : Int;
	public var tile_height : Int;
	public var texture_name : String;
	public var first_id : Int;

	public var properties : Map<String,String>;
    public var property_tiles:Map<Int, TiledPropertyTile>;

	public function new(  ) {
		
		name = '';
		tile_width = 0;
		tile_height = 0;
		texture_name = '';

		properties = new Map();
		property_tiles = new Map();

	} //new	

    function is_valid_xml_element( element:Xml ) {
        return Std.string( element.nodeType ) == "element";
    }

	public function from_xml( xml:Xml ) {

		var root = xml;
		
		name = root.get("name");
		tile_width = Std.parseInt(root.get("tilewidth"));
		tile_height = Std.parseInt(root.get("tileheight"));

		for(child in root.elements()) {
			if(is_valid_xml_element(child)) {

				switch(child.nodeName) {								

					case "properties" : {
						for( property in child ) {
							if( is_valid_xml_element(property) ) {
								properties.set( property.get("name"), property.get("value") );
							}
						} //for each property node
					} //properties

					case "image" : {
						// var width = Std.parseInt(child.get("width"));
						// var height = Std.parseInt(child.get("height"));
						texture_name = child.get("source");
					} //image

					case "tile" : {
						var _tile_id:Int = Std.parseInt(child.get("id"));
						var _tile_props:Map<String, String> = new Map<String, String>();

							for (element in child) {
								if(is_valid_xml_element(element)) {
									if (element.nodeName == "properties") {

										for (property in element) {

											if (!is_valid_xml_element(property)) {
												continue;
											} //?not valid
											
											properties.set(property.get("name"), property.get("value"));

										} //for each property element

									} //if it's a properties node
								} //if valid
							} //for each tile node

						property_tiles.set(_tile_id, new TiledPropertyTile(_tile_id, _tile_props));
					} //tile

				} //switch child nodename
					
			} //is valid node
		} //for each child
		
	} //from_xml

} //TiledTileset

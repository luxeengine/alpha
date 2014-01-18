package luxe.tilemaps.tiled;

import luxe.tilemaps.tiled.TiledTile;

class TiledLayer {
	
	public var name : String;
	public var width : Int;
	public var height : Int;
	public var map : TiledMap;
	public var properties : Map<String,String>;
	public var tiles : Array<TiledTile>;

	public function new( _map:TiledMap ) {
		map = _map;
		properties = new Map();
		tiles = [];
	}

    function is_valid_xml_element( element:Xml ) {
        return Std.string( element.nodeType ) == "element";
    } //is_valid_xml_element

	public function from_xml( xml:Xml ) {

		var tileGIDs:Array<Int> = new Array<Int>();

		var root = xml;

			name = root.get("name");
			width = Std.parseInt(root.get("width"));
			height = Std.parseInt(root.get("height"));
			
		for (child in root) {

			if(is_valid_xml_element(child)) {

				switch(child.nodeName) {

					case "properties" : {
	                    for (property in child) {

	                        if (!is_valid_xml_element(property)) { 
	                            continue; 
	                        } //!valid

	                        properties.set(property.get("name"), property.get("value"));

	                    } //for each property
	                } //properties

					case "data": {
						
						var encoding:String = (child.exists("encoding")) ? child.get("encoding") : "";
						var chunk:String = "";
						
						switch(encoding){

							case "base64": //todo
								// chunk = child.firstChild().nodeValue;
								// var compressed:Bool = false;
								// if (child.exists("compression")){
								// 	switch(child.get("compression")){
								// 		case "zlib":
								// 			compressed = true;
								// 		default:
								// 			throw "TmxLayer - data compression type not supported!";
								// 	}
								// }
								// tileGIDs = base64ToArray(chunk, width, compressed);

							case "csv": //todo
								// chunk = child.firstChild().nodeValue;
								// tileGIDs = csvToArray(chunk);
							
							default: //default is xml

								for( tile in child ) {
									if( is_valid_xml_element(tile) ) {
										
										var gid = Std.parseInt( tile.get("gid") );									
											tileGIDs.push(gid);

									} //if is valid
								} //tile in child

						} //switch encoding

					} //data

				} //switch child nodename
			} //is valid node
		} //child in root

		for(gid in tileGIDs) {
			tiles.push( new TiledTile(this, gid) );
		} //gid in tileGIDs
			
	} //from_xml

}
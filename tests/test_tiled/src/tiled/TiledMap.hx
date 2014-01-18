package tiled;

import tiled.TiledObjectGroup;
import tiled.TiledTileset;
import Tilemap;


class TiledMap {

        //The map width in tiles
    public var width:Int;
        //The map height in tiles
    public var height:Int;
        //TILED orientation: Orthogonal or Isometric
    public var orientation:TilemapOrientation;
        //The tile width
    public var tile_width:Int;
        //The tile height
    public var tile_height:Int;
        //All tilesets the map is using
    public var tilesets:Array<TiledTileset>;
        //Contains all layers from this map
    public var layers:Array<TiledLayer>;
        //All objectgroups
    public var object_groups:Array<TiledObjectGroup>;
        //All map properties
    public var properties:Map<String, String>;
    
    public function new() {

        width = 0;
        height = 0;
        tile_width = 0;
        tile_height = 0;

        orientation = TilemapOrientation.none;
        tilesets = [];
        layers = [];
        properties = new Map();
        object_groups = [];

    }

    public function toString() {
        return "TiledMap : layers(" + layers.length + ") tilesets(" + tilesets.length + ")" + " tilew,tileh(" + tile_width + "," + tile_height + ")" ;
    }

    function is_valid_xml_element( element:Xml ) {
        return Std.string( element.nodeType ) == "element";
    }

    function orientation_from_string( _orientation_string:String ) : TilemapOrientation {

        switch(_orientation_string) {
            case "orthogonal":
                return TilemapOrientation.ortho;
            case "isometric":
                return TilemapOrientation.isometric;
            default:
                return TilemapOrientation.none;
        }

        return TilemapOrientation.none;

    } //orientation_from_string

    public function parseFromXML( xml:Xml ) {

        var root = xml.firstElement();
        
        width = Std.parseInt(root.get("width"));
        height = Std.parseInt(root.get("height"));
        orientation = orientation_from_string( root.get("orientation") );
        tile_width = Std.parseInt(root.get("tilewidth"));
        tile_height = Std.parseInt(root.get("tileheight"));
        
        for (child in root) {
            if(is_valid_xml_element(child)) {
                switch( child.nodeName ) {

                    case "tileset" : {
                        var tileset:TiledTileset = new TiledTileset();

                            if (child.get("source") != null) {
                                // tileset.from_xml( Helper.getText(child.get("source")) );
                                trace("tilesets from other sources are not available right now? " + child.get('source'));
                            } else {
                                tileset.from_xml( child );
                            }

                            tileset.first_id = Std.parseInt(child.get("firstgid"));

                        tilesets.push(tileset);

                    } //tileset

                    case "properties" : {
                        for (property in child) {

                            if (!is_valid_xml_element(property)) { 
                                continue; 
                            } //!valid

                            properties.set(property.get("name"), property.get("value"));

                        } //for each property
                    } //properties

                    case "layer" : {

                        var layer : TiledLayer = new TiledLayer( this );
                            layer.from_xml( child );

                        layers.push(layer);

                    } //layer

                    case "objectgroup" : {

                        // var object_group : TiledObjectGroup = new TiledObjectGroup( this );
                        //     object_group.from_xml( child );

                        // object_groups.push( object_group );

                    } //objectgroup

                } //switch child nodename
            } //if valid element
        } //for each child in root
    }

    public function parseFromJSON( xml:Xml ) {

    }

} // TiledMap



class TiledPropertyTile {

    public var id:Int;
    public var properties:Map<String, String>;
    
    public function new(_id:Int, _properties:Map<String, String>) {
        id = _id;
        properties = _properties;
    }
    
}
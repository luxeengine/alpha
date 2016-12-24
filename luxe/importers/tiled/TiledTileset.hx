package luxe.importers.tiled;

import luxe.importers.tiled.TiledMapData;
import luxe.importers.tiled.TiledUtil.valid_element;

import phoenix.Texture;

class TiledTileset {

    public var name : String = '';
    public var texture_name : String = '';

    public var first_id : Int = 1;
    public var tile_width : Int = 0;
    public var tile_height : Int = 0;
    public var margin : Int = 0;
    public var spacing : Int = 0;

    public var properties : Map<String,String>;
    public var property_tiles:Map<Int, TiledPropertyTile>;

    public function new(  ) {

        properties = new Map();
        property_tiles = new Map();

    } //new


    public function from_xml( xml:Xml ) {

        var root = xml;

        name = root.get("name");
        tile_width = Std.parseInt(root.get("tilewidth"));
        tile_height = Std.parseInt(root.get("tileheight"));
        spacing = Std.parseInt(root.get("spacing"));
        margin = Std.parseInt(root.get("margin"));

        for(child in root.elements()) {
            if(valid_element(child)) {

                switch(child.nodeName) {

                    case "properties" : {
                        for( property in child ) {
                            if( valid_element(property) ) {
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
                        var _tile_anim:Array<TiledTileAnimationFrame> = null;

                            for (element in child) {
                                if(valid_element(element)) {
                                    if (element.nodeName == "properties") {

                                        for (property in element) {

                                            if (!valid_element(property)) {
                                                continue;
                                            } //?not valid

                                            _tile_props.set(property.get("name"), property.get("value"));

                                        } //for each property element

                                    } //if it's a properties node
                                    else if (element.nodeName == "animation") {

                                        _tile_anim = [];

                                        for (frame in element) {

                                            if (!valid_element(frame)) {
                                                continue;
                                            } //?not valid

                                            _tile_anim.push({
                                                tileid: Std.parseInt(frame.get("tileid")),
                                                duration: Std.parseInt(frame.get("duration"))
                                            });

                                        } //for each frame element

                                    } // if it's an animation node
                                } //if valid
                            } //for each tile node

                        property_tiles.set(_tile_id, new TiledPropertyTile(_tile_id, _tile_props, _tile_anim));
                    } //tile

                } //switch child nodename

            } //is valid node
        } //for each child

    } //from_xml


    public function from_json( json:Dynamic ) {

        name = Reflect.field(json, "name");
        tile_width = cast Reflect.field(json, "tilewidth");
        tile_height = cast Reflect.field(json, "tileheight");
        spacing = cast Reflect.field(json, "spacing");
        margin = cast Reflect.field(json, "margin");

        var fields = Reflect.fields(json);
        for(nodename in fields) {

            var child:Dynamic = cast Reflect.field(json, nodename);
                switch(nodename) {

                    case "properties" : {
                        var child_fields = Reflect.fields(child);
                        for (property_name in child_fields) {
                            properties.set(property_name, Reflect.field(child, property_name));
                        } //for each property
                    } //properties

                    case "image" : {
                        // var width = cast Reflect.field(child, "width");
                        // var height = cast Reflect.field(child, "height");
                        texture_name = child;
                    } //image

                    case "tiles" : {
                        var tiles_fields = Reflect.fields(child);
                        for(tile_id in tiles_fields) {
                            trace(tile_id);
                            var _tile_id:Int = Std.parseInt(tile_id);
                            var _tile_props:Map<String, String> = new Map<String, String>();
                            var _tile_anim:Array<TiledTileAnimationFrame> = null;

                            var tile_data:Dynamic = cast Reflect.field(child, tile_id);
                            var tile_fields = Reflect.fields(tile_data);
                            for (tile_node in tile_fields) {

                                if(tile_node == "properties") {
                                    var tile_item:Dynamic = cast Reflect.field(tile_data, tile_node);
                                    var child_fields = Reflect.fields(tile_item);
                                    for (property_name in child_fields) {
                                        properties.set(property_name, Reflect.field(tile_item, property_name));
                                    } //for each property
                                } //if it's a properties node

                                else if (tile_node == "animation") {
                                    _tile_anim = [];
                                    var animation_data:Array<Dynamic> = cast Reflect.field(tile_data, tile_node);
                                    for (animation_node in animation_data) {
                                        _tile_anim.push({
                                            tileid: Std.parseInt(Reflect.field(animation_node, "tileid")),
                                            duration: Std.parseInt(Reflect.field(animation_node, "duration"))
                                        });
                                    } //for each property

                                } // if it's an animation node
                            } // for each tile node

                            property_tiles.set(_tile_id, new TiledPropertyTile(_tile_id, _tile_props, _tile_anim));
                        } //for each tile node

                    } //tiles

                } //switch child nodename

        } //for each child

    } //from_xml
} //TiledTileset

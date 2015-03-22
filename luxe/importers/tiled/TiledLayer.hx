package luxe.importers.tiled;

import luxe.importers.tiled.TiledTile;
import luxe.importers.tiled.TiledMapData;
import luxe.importers.tiled.TiledUtil.valid_element;

// Parts adapted from https://github.com/kasoki/openfl-tiled by Christopher "Kasoki" Kaster

class TiledLayer {

    public var opacity : Float = 1.0;
    public var visible : Bool = true;

    public var name : String;
    public var width : Int;
    public var height : Int;
    public var map : TiledMapData;
    public var properties : Map<String,String>;
    public var tiles : Array<TiledTile>;

    public function new( _map:TiledMapData ) {
        map = _map;
        properties = new Map();
        tiles = [];
    }

    public function from_xml( xml:Xml ) {

        var tileGIDs:Array<Int> = new Array<Int>();

        var root = xml;

            name = root.get("name");
            width = Std.parseInt(root.get("width"));
            height = Std.parseInt(root.get("height"));

            var _opacity = root.get("opacity");
            var _visible = root.get("visible");
            opacity = (_opacity == null) ? 1.0 : Std.parseFloat(_opacity);
            visible = (_visible == "0") ? false : true;

        for (child in root) {

            if(valid_element(child)) {

                switch(child.nodeName) {

                    case "properties" : {
                        for (property in child) {

                            if (!valid_element(property)) {
                                continue;
                            } //!valid

                            properties.set(property.get("name"), property.get("value"));

                        } //for each property
                    } //properties

                    case "data": {

                        var encoding:String = (child.exists("encoding")) ? child.get("encoding") : "";
                        var node_value:String = child.firstChild().nodeValue;

                        switch(encoding){

                            case "base64":

                                tileGIDs = base64_to_array(node_value, child.get("compression"));

                            case "csv": tileGIDs = csv_to_array( node_value );

                            default: //default is xml

                                for( tile in child ) {
                                    if( valid_element(tile) ) {

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

    public function from_json( json:Dynamic ) {

        var tileGIDs:Array<Int> = new Array<Int>();

            name = Reflect.field(json, "name");
            width = Std.parseInt(Reflect.field(json, "width"));
            height = Std.parseInt(Reflect.field(json, "height"));
            opacity = Std.parseFloat(Reflect.field(json, "opacity"));
            visible = Reflect.field(json, "visible") == "false" ? false : true;

        var fields = Reflect.fields(json);
        for( nodename in fields ) {
            var child = Reflect.field(json, nodename);
            switch(nodename) {

                case "properties" : {
                    var child_fields = Reflect.fields(child);
                    for (property_name in child_fields) {
                        properties.set(property_name, Reflect.field(child, property_name));
                    } //for each property
                } //properties

                case "data": {
                    tileGIDs = cast child;
                } //data

            } //switch child nodename

        } //child in root

        for(gid in tileGIDs) {
            tiles.push( new TiledTile(this, gid) );
        } //gid in tileGIDs

    } //from_json

    function csv_to_array( input:String ) : Array<Int> {

        var result:Array<Int> = new Array<Int>();
        var rows:Array<String> = StringTools.trim(input).split("\n");
        var row:String;

        for (row in rows) {
            if (row != "") {
                var resultRow:Array<Int> = new Array<Int>();
                var entries:Array<String> = StringTools.trim(row).split(",");
                var entry:String;
                for (entry in entries) {
                    if(entry != "") {
                        result.push(Std.parseInt(entry));
                    } //entry != ""
                } //for each entry
            } //row != ""
        } //row in rows

        return result;

    } //csv_to_array


    /** Convert the base64 encoded data to a regular array of int's,
        Note that Tiled base64 doesn't encode base64 in the same way as
        what haxe.crypto.base64 would expect so it must manually be decomposed */

    static var base_chars:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    static var base_lookup:Array<Int> = [];
    static function base64_to_array( input:String, ?compression:Null<String> ):Array<Int> {

            //:todo:  well, this isn't ideal but it's better than before
        if(base_lookup.length == 0) {
            for(c in 0...base_chars.length)
                base_lookup[base_chars.charCodeAt(c)] = c;
        }

        var result:Array<Int> = [];
            //the n/4*3 is the max length the input decoded data can be
        var bytes = haxe.io.Bytes.alloc(Std.int(input.length / 4 * 3));
            //the position in the bytes at which we're writing
        var byte_pos:Int = 0;

        var i:Int = 0;

        while(i < input.length - 3) {

            var input_ch = input.charAt(i);

            if(input_ch == " " || input_ch == "\n"){
                i++;
                continue;
            }

                //read 4 bytes and look them up in the table
            var a0:Int = base_lookup[input.charCodeAt(i)];
            var a1:Int = base_lookup[input.charCodeAt(i + 1)];
            var a2:Int = base_lookup[input.charCodeAt(i + 2)];
            var a3:Int = base_lookup[input.charCodeAt(i + 3)];

            inline function write_byte(b:Int) {
                bytes.set(byte_pos++, b);
            }

            if(a1 < 64) write_byte(((a0 << 2))        + ((a1 & 0x30) >> 4));
            if(a2 < 64) write_byte(((a1 & 0x0f) << 4) + ((a2 & 0x3c) >> 2));
            if(a3 < 64) write_byte(((a2 & 0x03) << 6) + ((a3)));

            i += 4;

        } //

        //now our bytes should be filled with the decoded base64,
        //so we check if it's compressed and decompressed it if need be

        trace(compression);
        if(compression != null) {
            switch(compression) {
                case 'gzip': throw "TiledMap: gzip compression is not currently supported. Try zlib/zip compression instead.";
                case 'zlib': bytes = haxe.zip.Uncompress.run(bytes);
            }
        }

        var byte_len = bytes.length;
            //reuse/reset the byte_pos for reading
        byte_pos = 0;

        while(byte_pos < byte_len) {
            result.push( bytes.getInt32(byte_pos) );
            byte_pos += 4; //int32 is 4 bytes
        }

        bytes = null;

        return result;

    } //base64_to_array

} //TiledLayer

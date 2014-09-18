package luxe.importers.tiled;

import luxe.importers.tiled.TiledTile;
import luxe.importers.tiled.TiledMapData;

import snow.utils.ByteArray;

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

    function is_valid_xml_element( element:Xml ) {
        return Std.string( element.nodeType ) == "element";
    } //is_valid_xml_element

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

                        switch(encoding){

                            case "base64":

                                var base64_data : String = child.firstChild().nodeValue;
                                var compression : String = 'none';

                                if (child.exists("compression")){
                                    compression = child.get("compression");
                                }

                                tileGIDs = tiled_base64_to_IntArray(base64_data, width, compression);

                            case "csv":

                                var csv_data : String = child.firstChild().nodeValue;

                                tileGIDs = csv_to_IntArray( csv_data );

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

    function csv_to_IntArray( input:String ) : Array<Int> {

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

    static function tiled_base64_to_IntArray( base64_data:String, lineWidth:Int, compression:String ):Array<Int> {

        var result:Array<Int> = new Array<Int>();
        var data:ByteArray = ByteArray.fromBytes( haxe.crypto.Base64.decode(base64_data) );

            //handle zip compression
        if(compression != 'none') {
            #if js
                throw "No support for compressed maps in html5 target";
            #else
                switch(compression) {

                    case "zlib" : {
                        data.uncompress();
                    } //zlib

                    case "gzip" : {
                        throw "gzip compression is not currently supported from a base64 Tiled Map. try zlib/zip compression instead.";

                      //       //First we have to convert to haxe.io.bytes for use with format.gz
                      //   var data_bytes = haxe.io.Bytes.ofData( data.getData() );
                      //       //Then we need it to be a BytesInput haxe.io.Input
                      //   var byte_input = new haxe.io.BytesInput( data_bytes, 0, data_bytes.length );
                      //    //The we feed it to the format gz Reader
                      //   var gz_reader = new format.gz.Reader( byte_input );
                      //    //The output reader
                      //   var out_bytes : haxe.io.BytesOutput = new haxe.io.BytesOutput();
                      //    //the bytes can be fed into the output but
                      //   var read_bytes = gz_reader.readData( out_bytes );
                    } //gzip

                } //switch compression type
            #end
        }

            //tiled is always little endian
        data.endian = ByteArray.LITTLE_ENDIAN;
            //read back into the array
        while(data.position < data.length){
            result.push(data.readInt());
        }

        return result;

    } //tiled_base64_to_IntArray

}
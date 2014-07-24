package luxe.utils;

import luxe.Core;
import luxe.utils.UUID;

class Utils {

    public var geometry : luxe.utils.GeometryUtils;

    @:noCompletion public var luxe:Core;

    var _byte_levels : Array<String>;


    @:noCompletion public function new( _luxe:Core ) {

            //store the reference
        luxe = _luxe;
            //initialise the helpers
        geometry = new luxe.utils.GeometryUtils(luxe);
            //initialize the byte text helpers
        _byte_levels = ['bytes', 'Kb', 'MB', 'GB', 'TB'];

    }  //new

    public function uniqueid() : String {
        return haxe.crypto.Md5.encode(Std.string(Luxe.time*Math.random()));
    } //uniqueid

    public function uuid() : String {
    	return UUID.get();
    } //uuid

    public function base64_encode(_string:String) {
        return Base64.encode(_string);
    } //base64_encode

    public function base64_decode(_string:String) {
        return Base64.decode(_string);
    } //base64_decode

    public function stacktrace( ?_depth:Int = 100 ) : String {

        var result = '\n';

            var stack = haxe.CallStack.callStack();

            stack.shift();
            stack.reverse();

            var total : Int = Std.int(Math.min(stack.length, _depth));

            for(i in 0 ... total) {
                var stackitem : haxe.CallStack.StackItem = stack[i];
                var params = stackitem.getParameters();

                    result += ' >  ' + params[1] + ':' + params[2];

                    if(i != total - 1) {
                        result += '\n';
                    }
            } //total

        return result;

    } //stacktrace

    public function path_is_relative(_path:String) {

        return _path.charAt(0) != "#"
          && _path.charAt(0) != "/"
          && _path.indexOf(":\\") == -1
          && _path.indexOf(":/") == -1
          && ( _path.indexOf("//") == -1
            || _path.indexOf("//") > _path.indexOf("#")
            || _path.indexOf("//") > _path.indexOf("?")
        );

    } //path_is_relative

    public function find_assets_image_sequence( _name:String, _ext:String='.png', _start:String='1' ) : Array<String> {

        var _final : Array<String> = [];

            //:todo:
        //     var _sequence_type = '';
        //     var _pattern_regex : EReg = null;

        //     var _type0 = _name + _start + _ext;
        //     var _type0_re : EReg = new EReg('('+_name+')(\\d\\b)', 'gi');
        //     var _type1 = _name + '_' + _start + _ext;
        //     var _type1_re : EReg  = new EReg('('+_name+')(_\\d\\b)', 'gi');
        //     var _type2 = _name + '-' + _start + _ext;
        //     var _type2_re : EReg  = new EReg('('+_name+')(-\\d\\b)', 'gi');

        //         //check name0 ->
        //     if(Lambda.indexOf(luxe.app.assets.list, _type0) != -1) {
        //         _sequence_type = _type0;
        //         _pattern_regex = _type0_re;
        //     } else if(Lambda.indexOf(luxe.app.assets.list, _type1) != -1) {
        //         _sequence_type = _type1;
        //         _pattern_regex = _type1_re;
        //     } else if(Lambda.indexOf(luxe.app.assets.list, _type2) != -1) {
        //         _sequence_type = _type2;
        //         _pattern_regex = _type2_re;
        //     } else {
        //         trace("Sequence requested from " + _name + " but no assets found like `" + _type0 + "` or `" + _type1 + "` or `" + _type2 + "`" );
        //     }

        // if(_sequence_type != '') {
        //     for(_asset in luxe.app.assets.list) {
        //         //check for continuations of the sequence, matching by pattern rather than just brute force, so we can catch missing frames etc
        //         if(_pattern_regex.match(_asset)) {
        //             _final.push( _asset );
        //         }
        //     }

        //     _final.sort(function(a:String,b:String):Int { if(a == b) return 0; if(a < b) return -1; return 1; });
        // }

        return _final;

    } //find_assets_image_sequence

    public function bytes_to_string( bytes:Int ) : String {

        var index : Int = Math.floor( Math.log(bytes) / Math.log(1024) );
        var _byte_value = ( bytes / Math.pow(1024, index));

        return _byte_value + _byte_levels[index];

    } //bytes_to_string

    public function array_to_bytes(array:Array<Int>):haxe.io.Bytes {

        if (array == null) return null;
        var bytes:haxe.io.Bytes = haxe.io.Bytes.alloc(array.length);
        for (n in 0 ... bytes.length) bytes.set(n, array[n]);

        return bytes;

    } //array_to_bytes

} //Utils

package luxe.utils;

import luxe.Core;
import luxe.utils.UUID;
import luxe.utils.Murmur3;

class Utils {

    public var geometry : luxe.utils.GeometryUtils;

    @:noCompletion public var core:Core;

    var _byte_levels : Array<String>;

    @:noCompletion public function new( _luxe:Core ) {

            //store the reference
        core = _luxe;
            //initialise the helpers
        geometry = new luxe.utils.GeometryUtils(core);
            //initialize the byte text helpers
        _byte_levels = ['bytes', 'Kb', 'MB', 'GB', 'TB'];

    }  //new

        /** Generate a short, unique string ID for use ("base62"). */
    public inline function uniqueid(?val:Int) : String {

        // http://www.anotherchris.net/csharp/friendly-unique-id-generation-part-2/#base62

        if(val == null) val = Std.random(0x7fffffff);

        function to_char(value:Int) : String {
            if (value > 9) {
                var ascii = (65 + (value - 10));
                if (ascii > 90) { ascii += 6; }
                return String.fromCharCode(ascii);
            } else return Std.string(value).charAt(0);
        } //to_char

        var r = Std.int(val % 62);
        var q = Std.int(val / 62);
        if (q > 0) return uniqueid(q) + to_char(r);
        else return Std.string(to_char(r));

    } //uniqueid

        /** Generates and returns a uniqueid converted to a hashed integer for convenience.
            Uses the default `uniqueid` and `hash` implementation detail. */
    public inline function uniquehash() : Int {
        return hash( uniqueid() );
    } //uniquehash

        /** Generates a integer hash from a string using the default algorithm (murmur3) */
    public inline function hash( string:String ) : Int {
        return hashdjb2( string );
        // return hashmurmur( haxe.io.Bytes.ofString(string) );
    } //hash

        /** Generates an integer hash of a string using the murmur 3 algorithm */
    public inline function hashmurmur( _bytes:haxe.io.Bytes, ?_seed:Int=0 ) : Int {
        return Murmur3.hash( _bytes, _seed );
    } //hashmurmur

        /** Generates an integer hash of a string using the djb2 algorithm */
    public inline function hashdjb2(string:String) : Int {

            //http://www.cse.yorku.ca/~oz/hash.html
        var _hash : Int = 5381;
        for(i in 0...string.length) {
            _hash = ((_hash << 5) + _hash) + string.charCodeAt(i);
        }

        return _hash;

    } //hashdjb2

    public function uniqueid2() : String {

        return haxe.crypto.Md5.encode(Std.string(Luxe.time*Math.random()));

    } //uniqueid2

    public function uuid() : String {

    	return UUID.get();

    } //uuid

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
            || _path.indexOf("//") > _path.indexOf("?"));

    } //path_is_relative

    public function find_assets_image_sequence( _name:String, _ext:String='.png', _start:String='1' ) : Array<String> {

        var _final : Array<String> = [];

            var _sequence_type = '';
            var _pattern_regex : EReg = null;

            var _type0 = _name + _start + _ext;
            var _type0_re : EReg = new EReg('('+_name+')(\\d\\b)', 'gi');
            var _type1 = _name + '_' + _start + _ext;
            var _type1_re : EReg  = new EReg('('+_name+')(_\\d\\b)', 'gi');
            var _type2 = _name + '-' + _start + _ext;
            var _type2_re : EReg  = new EReg('('+_name+')(-\\d\\b)', 'gi');

                //check name0 ->
            if(core.app.assets.listed(_type0)) {
                _sequence_type = _type0;
                _pattern_regex = _type0_re;
            } else if(core.app.assets.listed(_type1)) {
                _sequence_type = _type1;
                _pattern_regex = _type1_re;
            } else if(core.app.assets.listed(_type2)) {
                _sequence_type = _type2;
                _pattern_regex = _type2_re;
            } else {
                trace("Sequence requested from " + _name + " but no assets found like `" + _type0 + "` or `" + _type1 + "` or `" + _type2 + "`" );
            }

        if(_sequence_type != '') {
            for(_asset in core.app.assets.list) {
                //check for continuations of the sequence, matching by pattern rather than just brute force, so we can catch missing frames etc
                if(_pattern_regex.match(_asset.id)) {
                    _final.push( _asset.id );
                }
            }

            _final.sort(function(a:String,b:String):Int { if(a == b) return 0; if(a < b) return -1; return 1; });
        }

        return _final;

    } //find_assets_image_sequence

        /** Soft wrap a string by maximum character count. brk default:'\n', col default:80 */
    public inline function text_wrap_column( _text:String, _brk:String='\n', _column:Int=80) {

            //based on http://blog.macromates.com/2006/wrapping-text-with-regular-expressions/
            //take note that the ${_column} is string interpolation, not part of the regex.
            //i.e (.{1,80})( +|$)\n?|(.{80})

        return new EReg('(.{1,${_column}})(?: +|$)\n?|(.{${_column}})','gimu').replace(_text, '$1$2${_brk}');

    } //text_wrap_column

    public inline function bytes_to_string( bytes:Int ) : String {

        var index : Int = Math.floor( Math.log(bytes) / Math.log(1024) );
        var _byte_value = ( bytes / Math.pow(1024, index));

        return _byte_value + _byte_levels[index];

    } //bytes_to_string

    public inline function array_to_bytes(array:Array<Int>):haxe.io.Bytes {

        if (array == null) return null;
        var bytes:haxe.io.Bytes = haxe.io.Bytes.alloc(array.length);
        for (n in 0 ... bytes.length) bytes.set(n, array[n]);

        return bytes;

    } //array_to_bytes

} //Utils

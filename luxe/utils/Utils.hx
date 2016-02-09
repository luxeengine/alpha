package luxe.utils;

import luxe.Core;

import haxe.CallStack;
import snow.api.buffers.Uint8Array;

class Utils {

    public var geometry : luxe.utils.GeometryUtils;
    public var random : luxe.utils.Random;

    @:noCompletion public var core:Core;

    var _byte_levels : Array<String>;

    @:allow(luxe.Core)
    function new( _luxe:Core ) {

            //store the reference
        core = _luxe;
            //initialise the helpers
        geometry = new luxe.utils.GeometryUtils();
        random = new luxe.utils.Random(Math.random()*0xFFFFFF);
            //initialize the byte text helpers
        _byte_levels = ['bytes', 'Kb', 'MB', 'GB', 'TB'];

    }  //new

        /** Return a formatted string from a PosInfos */
    public function pos_info( pos:haxe.PosInfos ) {
        return '${pos.fileName}:${pos.lineNumber}:(${pos.className}:${pos.methodName})';
    }

        /** Generate a short, unique string ID for use ("base62"). */
    #if release inline #end
    public function uniqueid(?val:Null<Int>) : String {

        // http://www.anotherchris.net/csharp/friendly-unique-id-generation-part-2/#base62

        if(val == null) {
            #if neko val = Std.random(0x3FFFFFFF);
            #else val = Std.random(0x7fffffff);
            #end
        }

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
    #if release inline #end
    public function uniquehash() : UInt {
        return hash( uniqueid() );
    } //uniquehash

        /** Generates a integer hash from a string using the default algorithm (murmur3) */
    #if release inline #end
    public function hash( string:String ) : UInt {
        return hashdjb2( string );
    } //hash

        /** Generates an integer hash of a string using the djb2 algorithm */
    #if release inline #end
    public function hashdjb2(string:String) : UInt {

            //http://www.cse.yorku.ca/~oz/hash.html
        var _hash : Int = 5381;
        for(i in 0...string.length) {
            _hash = ((_hash << 5) + _hash) + string.charCodeAt(i);
        }

        return _hash;

    } //hashdjb2

    #if release inline #end
    public function uniqueid2() : String {

        return haxe.crypto.Md5.encode(Std.string(Luxe.time*Math.random()));

    } //uniqueid2

    #if release inline #end
    public function stacktrace( ?_depth:Int = 100 ) : String {

        var result = '\n';

            var stack = haxe.CallStack.callStack();

            stack.shift();
            stack.reverse();

            var total : Int = Std.int(Math.min(stack.length, _depth));

            for(i in 0 ... total) {
                var stackitem : haxe.CallStack.StackItem = stack[i];

                switch(stack[i]) {
                    case FilePos(s, file, line):
                        switch(s) {
                            case Method(classname, method):
                                result += '   at $file:$line: $classname.$method';
                            case _:
                        }
                    case _:{}
                }

                if(i != total - 1) {
                    result += '\n';
                }
            } //total

        return result;

    } //stacktrace

    #if release inline #end
    public function path_is_relative(_path:String) {

        return _path.charAt(0) != "#"
            && _path.charAt(0) != "/"
            && _path.indexOf(":\\") == -1
            && _path.indexOf(":/") == -1

          && ( _path.indexOf("//") == -1
            || _path.indexOf("//") > _path.indexOf("#")
            || _path.indexOf("//") > _path.indexOf("?"));

    } //path_is_relative

    public function find_assets_sequence( _name:String, _ext:String='.png', _start:String='1' ) : Array<String> {

        var _final : Array<String> = [];

            var _sequence_type = '';
            var _pattern_regex : EReg = null;

                //these are not using string interpolation to prevent confusing the regex
            var _type0 = _name + _start + _ext;
            var _type0_re : EReg = new EReg('('+_name+')(\\d\\b)', 'gi');
            var _type1 = _name + '_' + _start + _ext;
            var _type1_re : EReg  = new EReg('('+_name+')(_\\d\\b)', 'gi');
            var _type2 = _name + '-' + _start + _ext;
            var _type2_re : EReg  = new EReg('('+_name+')(-\\d\\b)', 'gi');

                //check name0 ->
            if(Luxe.resources.has(_type0)) {
                _sequence_type = _type0;
                _pattern_regex = _type0_re;
            } else if(Luxe.resources.has(_type1)) {
                _sequence_type = _type1;
                _pattern_regex = _type1_re;
            } else if(Luxe.resources.has(_type2)) {
                _sequence_type = _type2;
                _pattern_regex = _type2_re;
            } else {
                trace("Sequence requested from " + _name + " but no assets found like `" + _type0 + "` or `" + _type1 + "` or `" + _type2 + "`" );
            }

        if(_sequence_type != '') {
            for(_asset in core.resources.cache) {
                //check for continuations of the sequence, matching by pattern rather than just brute force, so we can catch missing frames etc
                if(_pattern_regex.match(_asset.id)) {
                    _final.push( _asset.id );
                }
            }

            _final.sort(function(a:String,b:String):Int { if(a == b) return 0; if(a < b) return -1; return 1; });
        }

        return _final;

    } //find_assets_sequence

        /** :WIP: Wrap text using a knuth plass algorithm for column breaking. */
    #if release inline #end
    public function text_wrap_column_knuth_plass( _string:String, _column:Int=80) {

        var result = [];

        inline function splitwords(_str:String, _into:Array<String>) {
            var s = _str;
            var rgx = new EReg('(\\b[^\\s]+\\b)', 'gm');
            while (rgx.match(s)) {
                _into.push(rgx.matched(1));
                s = rgx.matchedRight();
            }
                //no matches?
            if(_into.length == 0) _into.push(_str);
            return _into;
        } //splitwords

        inline function findlen(_lens:Array<Int>, _start:Int, _end:Int) {
            var total = 0;
            for(i in (_start-1) ... _end) total += _lens[i];
            return total + (_end - _start + 1);
        } //findlen

        inline function getmin(_from:Map<Int,Int>):Int {
            var min = 0x3FFFFFFF;
            for(item in _from.keys()) if(item < min) min = item;
            return min;
        } //getmin

        var words = [];
        var lengths = [];
        var badness = [ 0 => 0 ];
        var extra = new Map<Int,Int>();

        splitwords(_string, words);
        words.map(function(w){ lengths.push(w.length); });

        var n = words.length;

        for( i in 1 ... n+1 ) {

            var sums = new Map<Int,Int>();
            var k = i;

            while( findlen(lengths, k, i) <= _column && k > 0) {
                var a = (_column - findlen(lengths, k, i));
                sums[ Std.int(Math.pow(a,3) + badness[k - 1]) ] = k;
                k -= 1;
            }

            var mn = getmin(sums);
            badness[i] = mn;
            extra[i] = sums[mn];

        } //each word

        var line = 1;
        while(n > 1) {
            result.unshift( words.slice(extra[n]-1, n).join(' ') );
            n = extra[n] - 1;
            line += 1;
        }

        if(result.length == 0) result.push(_string);
        return result;

    } //text_wrap_column_knuth

        /** Soft wrap a string by maximum character count. brk default:'\n', col default:80 */
    #if release inline #end
    public function text_wrap_column( _text:String, _brk:String='\n', _column:Int=80) {

            //based on http://blog.macromates.com/2006/wrapping-text-with-regular-expressions/
            //take note that the ${_column} is string interpolation, not part of the regex.
            //i.e (.{1,80})( +|$)\n?|(.{80})

        var result = new EReg('(.{1,${_column}})(?: +|$)\n?|(.{${_column}})','gimu').replace(_text, '$1$2${_brk}');

        return StringTools.rtrim(result);

    } //text_wrap_column

    #if release inline #end
    public function bytes_to_string( bytes:Int, ?precision:Int=3 ) : String {

        var index = bytes == 0 ? 0 : Math.floor(Math.log(bytes) / Math.log(1024));
        var _byte_value = bytes / Math.pow(1024, index);
            _byte_value = luxe.utils.Maths.fixed(_byte_value, precision);

        return _byte_value + ' ' + _byte_levels[index];

    } //bytes_to_string

    #if release inline #end
    public function array_to_bytes(array:Array<Int>):haxe.io.Bytes {

        if (array == null) return null;
        var bytes:haxe.io.Bytes = haxe.io.Bytes.alloc(array.length);
        for (n in 0 ... bytes.length) bytes.set(n, array[n]);

        return bytes;

    } //array_to_bytes

        /** Multiply the pixels in the array by their alpha value.
            This means the format of the pixels is RGBA, with values  [0...255].
            Modifies the given array and returns it.  */
    public function premultiply_alpha( _pixels:Uint8Array ) : Uint8Array {

        var count = _pixels.length;
        var read = _pixels[0];
        var index = 0;

        while(index < count) {

            var r = _pixels[index+0];
            var g = _pixels[index+1];
            var b = _pixels[index+2];
            var a = _pixels[index+3] / 255.0;

            _pixels[index+0] = Std.int(r*a);
            _pixels[index+1] = Std.int(g*a);
            _pixels[index+2] = Std.int(b*a);

            index += 4;

        } // while

        return _pixels;

    } //premultiply_alpha

        /** Multiply the pixels in the array by their alpha value.
            This means the format of the pixels is RGBA with values  [0...1].
            Modifies the given array and returns it.  */
    public function premultiply_alpha_normalized( _pixels:Uint8Array ) : Uint8Array {

        var count = _pixels.length;
        var read = _pixels[0];
        var index = 0;

        while(index < count) {

            var r = _pixels[index+0];
            var g = _pixels[index+1];
            var b = _pixels[index+2];
            var a = _pixels[index+3];

            _pixels[index+0] = r * a;
            _pixels[index+1] = g * a;
            _pixels[index+2] = b * a;

            index += 4;

        } // while

        return _pixels;

    } //premultiply_alpha_normalized


} //Utils

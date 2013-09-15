
package luxe.utils;

import luxe.utils.UUID;

class Utils {
    public var geometry : luxe.utils.GeometryUtils;

    private var _byte_levels : Array<String>;
    
    public var luxe:luxe.Core;
    public function new(_luxe:luxe.Core) {
        luxe = _luxe;

            //initialise our helpers
        geometry = new luxe.utils.GeometryUtils(luxe);
        _byte_levels = ['bytes', 'Kb', 'MB', 'GB', 'TB'];
    }  

    public function uuid() : String {
    	return UUID.get();
    }

    public function clamp(value:Float, min:Float, max:Float) {
        return Math.min( Math.max(min, value), max);
    }

    public function nearest_power_of_two(_value:Int) {
        _value--;
        _value |= _value >> 1;
        _value |= _value >> 2;
        _value |= _value >> 4;
        _value |= _value >> 8;
        _value |= _value >> 16;
        _value++;
        return _value;
    }
    
    public function bytes_to_string( bytes:Int ) : String {
        var index : Int = Math.floor( Math.log(bytes) / Math.log(1024) );
        var _byte_value = ( bytes / Math.pow(1024, index));
        return _byte_value + _byte_levels[index];
    }

    public function arrayToBytes(array:Array<Int>):haxe.io.Bytes {
        if (array == null) return null;
        var bytes:haxe.io.Bytes = haxe.io.Bytes.alloc(array.length);
        for (n in 0 ... bytes.length) bytes.set(n, array[n]);
        return bytes;
    }

    public function file_bytes_to_class(_file:String, _outfile:String, ?_string_length:Int = 2048) {

        #if luxe_native

            var file_bytes : haxe.io.Bytes = cast lime.utils.Assets.getBytes(_file);
            var _class = new haxe.io.Path(_file).file;
            _class = StringTools.replace(_class, '.','_');
            _class = StringTools.replace(_class, ' ','_');
            //
            var bytes_string = file_bytes.toHex();
            var final_string = 'class ' + _class + ' { \n\n\tpublic static function data() { \n\t\treturn "';

            for(i in 0...Std.int(bytes_string.length/2) ) {
                var p = i * 2;
                var b = bytes_string.substr(p, 2);
                final_string += '0x'+b + ' ';
                if(final_string.length % _string_length == 0) {
                     final_string+='"+\n\t\t"';
                } 
            }
            
            final_string = final_string.substr(0,final_string.length-1);
            final_string +='";\n\t} //data()\n\n}//' + _class;
            sys.io.File.saveContent(_outfile, final_string);
            file_bytes = null;
            bytes_string = null;
            final_string = null;

        #end //luxe_native

    } // file_bytes_to_class

}

// Luxe.utils.file_bytes_to_class('assets/ui/tiny.box.png', '/Users/Sven/dev/luxe/luxe/luxe/defaults/UIBox.hx');
// Luxe.utils.file_bytes_to_class('assets/ui/tiny.button.png', '/Users/Sven/dev/luxe/luxe/luxe/defaults/UIButton.hx');

        //     //create a more bitesized file
        // var s = FontString.data();
        // var current = "'";
        // var final_string = "";        
        // var _string_length = s.length;

        // for(i in 0..._string_length) {
        //     final_string += s.charAt(i);
        //     if(final_string.length % 4096 == 0) {
        //         final_string+="'+\n'";
        //     }            
        // }

        // sys.io.File.saveContent('/Users/Sven/dev/luxe/test.txt', final_string);

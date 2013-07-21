
package lab.utils;

import lab.utils.UUID;

class Utils {
    public var geometry : lab.utils.GeometryUtils;

    public var lab:lab.Core;
    public function new(_lab:lab.Core) {
        lab = _lab;

            //initialise our helpers
        geometry = new lab.utils.GeometryUtils(lab);
    }  

    public function uuid() : String {
    	return UUID.get();
    }

    public function arrayToBytes(array:Array<Int>):haxe.io.Bytes {
        if (array == null) return null;
        var bytes:haxe.io.Bytes = haxe.io.Bytes.alloc(array.length);
        for (n in 0 ... bytes.length) bytes.set(n, array[n]);
        return bytes;
    }

}

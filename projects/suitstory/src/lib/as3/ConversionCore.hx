package lib.as3;

import lib.as3.TypeDefs;

class ConversionCore {

	public static inline function intFromBoolean(b:Boolean):Int {
		return b ? 1 : 0;
	}
	
	public static inline function booleanFromInt(i:Int):Boolean {
		return (i == 0) ? false : i > 0;
	}
	
}
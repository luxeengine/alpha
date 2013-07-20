package lib.as3;

import lib.as3.TypeDefs;

class BitmapDataCore {


	public static function dispose(bd:BitmapData):Void {
		
	}
	
	public static function drawLine(bd:BitmapData, a:Point, b:Point):BitmapData {
		throw "not implemented";
		return null;
	}

	public static function getPixel(bd:BitmapData, x:Int, y:Int):Int {
		throw "not implemented";
		return 0;
	}

	public static function hitTest(bd:BitmapData, firstPoint:Point, firstAlphaThreshold:UInt, secondObject:BitmapData, secondBitmapDataPoint:Point = null, secondAlphaThreshold:UInt = 1):Boolean {
		throw "not implemented";
		return false;
	}
	
	public static function perlinNoise(bd:BitmapData, baseX:Number, baseY:Number, numOctaves:Int, randomSeed:Int, stitch:Boolean, fractalNoise:Boolean):BitmapData {
		throw "not implemented";
		return null;
	}
	
}
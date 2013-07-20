package lib.as3;

import lib.as3.TypeDefs;

class Rectangle {

	public var x:Number;
	public var y:Number;
	public var width:Number;
	public var height:Number;
	
	public function new(x:Number = 0, y:Number = 0, width:Number = 0, height:Number = 0) {
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}

	public function toString() {
		return 'Rectangle( ' +x+ ', ' +y+ ', ' +width+ ', ' +height+ ' )';
	}
}
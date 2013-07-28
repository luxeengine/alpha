package common;

import lab.Rectangle;
import phoenix.Texture;
import lab.Vector;

typedef Bar = {
	var x:Int;
	var y:Int;
	var w:Int;
	var h:Int;
	
	var sx:Int;
	var sy:Int;	
	var sw:Int;
	var sh:Int;

	var t:Int;
	var r:Int;
	var b:Int;
	var l:Int;
};

class Skin {
		
	public var board : Board;
	public var template : Dynamic;
	public var texture : Texture;
	public var block : Rectangle;
	public var text : Rectangle;
	public var top : Bar;
	public var bottom : Bar;

	public function new(_template:Dynamic, _board:Board ){
		
		template = _template;
		board = _board;

		block = new Rectangle();
		text = new Rectangle();
		top = { x:0, y:0, w:0, h:0, sx:0, sy:0, sw:0, sh:0, t:0, r:0, b:0, l:0 };
		bottom = { x:0, y:0, w:0, h:0, sx:0, sy:0, sw:0, sh:0, t:0, r:0, b:0, l:0 };

	} //new

		//parse value from the skin
	public function parse_value(_s) : Int {
		if(_s == "screenw") return Std.int(Lab.screen.w);
		if(_s == "screenh") return Std.int(Lab.screen.h);
		if(_s == "below_bottom") return Std.int(Lab.screen.h - (board.basetop+board.height));
		if(_s == "half_below_bottom") return Std.int( (Lab.screen.h - (board.basetop+board.height)) /  2);
		if(_s == "top") return Std.int(board.basetop);
		if(_s == "bottom") return Std.int(board.basetop+board.height);
		return Std.parseInt(_s);
	} //

	public function init() {

		var _texture = 'assets/skins/default/default.png';

		if(template.image != null) { _texture = template.image; }

			//load the image file
		texture = Lab.loadTexture(_texture);

		if(template.block != null) {
			block.x = Std.parseInt(template.block.x);
			block.y = Std.parseInt(template.block.y);
			block.w = Std.parseInt(template.block.w);
			block.h = Std.parseInt(template.block.h);
		} //block

		if(template.text != null) {
			text.x = Std.parseInt(template.text.x);
			text.y = Std.parseInt(template.text.y);
			text.h = Std.parseInt(template.text.h);
		} //text

		if(template.top_bar != null) {

			top.x = parse_value(template.top_bar.x);
			top.y = parse_value(template.top_bar.y);
			top.w = parse_value(template.top_bar.w);
			top.h = parse_value(template.top_bar.h);

			top.sx = parse_value(template.top_bar.sx);
			top.sy = parse_value(template.top_bar.sy);
			top.sw = parse_value(template.top_bar.sw);
			top.sh = parse_value(template.top_bar.sh);

			top.t = parse_value(template.top_bar.t);
			top.r = parse_value(template.top_bar.r);
			top.b = parse_value(template.top_bar.b);
			top.l = parse_value(template.top_bar.l);

		} //top_bar

		if(template.bottom_bar != null) {

			bottom.x = parse_value(template.bottom_bar.x);
			bottom.y = parse_value(template.bottom_bar.y);
			bottom.w = parse_value(template.bottom_bar.w);
			bottom.h = parse_value(template.bottom_bar.h);

			bottom.sx = parse_value(template.bottom_bar.sx);
			bottom.sy = parse_value(template.bottom_bar.sy);
			bottom.sw = parse_value(template.bottom_bar.sw);
			bottom.sh = parse_value(template.bottom_bar.sh);

			bottom.t = parse_value(template.bottom_bar.t);
			bottom.r = parse_value(template.bottom_bar.r);
			bottom.b = parse_value(template.bottom_bar.b);
			bottom.l = parse_value(template.bottom_bar.l);

		} //bottom_bar


	}
}
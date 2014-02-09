package common;

import luxe.Rectangle;
import phoenix.Texture;
import luxe.Vector;
import luxe.Color;

typedef Bar = {
	var x:Int;
	var y:Int;
	var w:Int;
	var h:Int;

	var depth:Float;
	
	var sx:Int;
	var sy:Int;	
	var sw:Int;
	var sh:Int;

	var t:Int;
	var r:Int;
	var b:Int;
	var l:Int;
};

typedef SkinBlock = {
	var x : Float;
	var y : Float;
	var w : Float;
	var h : Float;
	var depth : Float;
};

typedef Rectbox = {
	var rect : Rectangle;
	var color : Color;
	var depth : Float;
};

typedef SkinText = {
	var x : Float;
	var y : Float;
	var w : Float;
	var h : Float;
	var normal_color : Color;
	var highlight_color : Color;
};

class Skin {

	public var board : Board;
	public var template : Dynamic;
	public var texture : Texture;
	public var block : SkinBlock;
	public var block_selected : SkinBlock;
	public var block_highlighted : SkinBlock;
	public var block_locked : SkinBlock;
	public var text : SkinText;

	public var top : Bar;
	public var bottom : Bar;
	public var rects : Array<Rectbox>;
	public var offset : Vector;

	public function new(_template:Dynamic, _board:Board ){
		
		template = _template;
		board = _board;

		text = { x:0, y:0, w:0, h:48, normal_color:new Color(1,1,1,0.5), highlight_color:new Color() };
		offset = new Vector();

		block = { x:0, y:0, w:0, h:0, depth:0 };
		block_selected = { x:0, y:0, w:0, h:0, depth:0 };
		block_highlighted = { x:0, y:0, w:0, h:0, depth:0 };
		block_locked = { x:0, y:0, w:0, h:0, depth:0 };
		top = { x:0, y:0, w:0, h:0, depth:1, sx:0, sy:0, sw:0, sh:0, t:0, r:0, b:0, l:0 };
		bottom = { x:0, y:0, w:0, h:0, depth:1, sx:0, sy:0, sw:0, sh:0, t:0, r:0, b:0, l:0 };
		rects = [];

	} //new

		//parse value from the skin
	public function parse_value(_s) : Int {
		if(_s == "screenw") return Std.int(Luxe.screen.w);
		if(_s == "screenh") return Std.int(Luxe.screen.h);
		if(_s == "bottom_area") return Std.int(Luxe.screen.h - (board.basetop+board.height));
		if(_s == "bottom_area-16") return Std.int(Luxe.screen.h - (board.basetop+board.height)) - 16;
		if(_s == "bottom_area-32") return Std.int(Luxe.screen.h - (board.basetop+board.height)) - 32;
		if(_s == "bottom_area-48") return Std.int(Luxe.screen.h - (board.basetop+board.height)) - 48;
		if(_s == "half_bottom_area") return Std.int( (Luxe.screen.h - (board.basetop+board.height)) /  2);
		if(_s == "top") return Std.int(board.basetop);
		if(_s == "bottom") return Std.int(board.basetop+board.height);
		if(_s == "bottom2") return Std.int(board.basetop+board.height+32);
		return Std.parseInt(_s);
	} //

	public function init() {

		var _texture = 'assets/skins/default/default.png';

		if(template.image != null) { _texture = template.image; }

			//load the image file
		texture = Luxe.loadTexture(_texture);

		if(template.board != null) {

			offset.x = parse_value(template.board.offsetx);
			offset.y = parse_value(template.board.offsety);

 			board.baseleft += Std.int(offset.x);
        	board.basetop += Std.int(offset.y);
        	       
		}


		if(template.block != null) {
			block.x = Std.parseInt(template.block.x);
			block.y = Std.parseInt(template.block.y);
			block.w = Std.parseInt(template.block.w);
			block.h = Std.parseInt(template.block.h);
			block.depth = Std.parseFloat(template.block.depth);
		} //block

		if(template.block_selected != null) {
			block_selected.x = Std.parseInt(template.block_selected.x);
			block_selected.y = Std.parseInt(template.block_selected.y);
			block_selected.w = Std.parseInt(template.block_selected.w);
			block_selected.h = Std.parseInt(template.block_selected.h);
			block_selected.depth = Std.parseFloat(template.block_selected.depth);
		} //block_selected

		if(template.block_highlighted != null) {
			block_highlighted.x = Std.parseInt(template.block_highlighted.x);
			block_highlighted.y = Std.parseInt(template.block_highlighted.y);
			block_highlighted.w = Std.parseInt(template.block_highlighted.w);
			block_highlighted.h = Std.parseInt(template.block_highlighted.h);
			block_highlighted.depth = Std.parseFloat(template.block_highlighted.depth);
		} //block_selected

		if(template.block_locked != null) {
			block_locked.x = Std.parseInt(template.block_locked.x);
			block_locked.y = Std.parseInt(template.block_locked.y);
			block_locked.w = Std.parseInt(template.block_locked.w);
			block_locked.h = Std.parseInt(template.block_locked.h);
			block_locked.depth = Std.parseFloat(template.block_locked.depth);
		} //block_selected

		if(template.text != null) {
			text.x = Std.parseInt(template.text.x);
			text.y = Std.parseInt(template.text.y);
			text.h = Std.parseInt(template.text.h);
			if(template.text.normal_color != null) {
				text.normal_color.set(
					Std.parseFloat(template.text.normal_color.r),
					Std.parseFloat(template.text.normal_color.g),
					Std.parseFloat(template.text.normal_color.b),
					Std.parseFloat(template.text.normal_color.a)
				);
			}
			if(template.text.highlight_color != null) {
				text.highlight_color.set(
					Std.parseFloat(template.text.highlight_color.r),
					Std.parseFloat(template.text.highlight_color.g),
					Std.parseFloat(template.text.highlight_color.b),
					Std.parseFloat(template.text.highlight_color.a)
				);
			}
		} //text

		if(template.top_bar != null) {

			top.x = parse_value(template.top_bar.x);
			top.y = parse_value(template.top_bar.y);
			top.w = parse_value(template.top_bar.w);
			top.h = parse_value(template.top_bar.h);

			top.depth = parse_value(template.top_bar.depth);

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

			bottom.depth = parse_value(template.bottom_bar.depth);

			bottom.sx = parse_value(template.bottom_bar.sx);
			bottom.sy = parse_value(template.bottom_bar.sy);
			bottom.sw = parse_value(template.bottom_bar.sw);
			bottom.sh = parse_value(template.bottom_bar.sh);

			bottom.t = parse_value(template.bottom_bar.t);
			bottom.r = parse_value(template.bottom_bar.r);
			bottom.b = parse_value(template.bottom_bar.b);
			bottom.l = parse_value(template.bottom_bar.l);

		} //bottom_bar

		if(template.rects != null) {
			
			var list : Array<Dynamic> = cast template.rects;
			for(_rect in list) {
				rects.push({ 
					rect : new Rectangle( parse_value(_rect.x), parse_value(_rect.y), parse_value(_rect.w), parse_value(_rect.h) ),
					color : new Color( _rect.color.r, _rect.color.g, _rect.color.b, _rect.color.a ),
					depth : (_rect.depth == null) ? 1 : _rect.depth
				});
			} //each rects

		} //

	} //init

} //Skin
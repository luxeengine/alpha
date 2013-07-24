package common;

import lab.Rectangle;
import phoenix.Texture;
import lab.Vector;

class Skin {
		
	public var template : Dynamic;
	public var texture : Texture;
	public var block : Rectangle;
	public var text : Rectangle;

	public function new(_template:Dynamic){
		template = _template;

		block = new Rectangle();
		text = new Rectangle();

	} //new

	public function init() {

		var _texture = 'assets/skins/default/block_gray.png';

		if(template.texture != null) { _texture = template.image; }

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
		} //block


	}
}
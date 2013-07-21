package lab.debug;

import lab.Text;
import phoenix.Texture;
import lab.utils.NineSlice;
import phoenix.Batcher;
import phoenix.BitmapFont;

import lab.defaults.TinyUI;

class Inspector {

	public var title:String;
	public var font : BitmapFont;
	public var pos:Vector;
	public var size:Vector;

		//pieces
	public var _title_text : Text;
	public var default_box_texture : Texture;
	public var default_button_texture : Texture;

	public var _window : NineSlice;
	private var _batcher : Batcher;

	public function new(_options:Dynamic) {

		title = 'Inspector';
		font = Lab.renderer.default_font;
		size = new Vector( Std.int(Lab.screen.w*0.2), Std.int(Lab.screen.h*0.6) );
		pos = new Vector((Lab.screen.w/2) - (size.x/2), (Lab.screen.h/2) - (size.y/2));

			//load the images from the classes, todo:make a single atlas
		default_box_texture = Lab.renderer.load_texture_from_string_byte_array('default_ui_box', TinyBox.data(), 128,128 );
		default_button_texture = Lab.renderer.load_texture_from_string_byte_array('default_ui_button', TinyButton.data(), 64,32 );
		
			//default to the internal batcher
		_batcher = Lab.renderer.default_batcher;

		if(_options != null) {

			if(_options.title != null) title = _options.title;
			if(_options.font != null) font = _options.font;
			if(_options.pos != null) pos = _options.pos;
			if(_options.size != null) size = _options.size;
			if(_options.batcher != null) _batcher = _options.batcher;
			
		} //_options != null		

	} //new

	public function refresh() {
		if(_window == null) {
			_create_window();
		}
	}

	public function show() { 
		refresh();
		_window.visible = true;
		_title_text.visible = true;
	}
	public function hide() { 
		_window.visible = false;
		_title_text.visible = false;
	}

	private function _create_window() {
			//if already exists, clean up
		if(_window != null) {
			_window.destroy();
		}

		_window = new NineSlice({
			depth : 999.1,
			texture : default_box_texture,
			batcher : _batcher
		});	

		_window.create( pos, size.x, size.y );

		_title_text = new Text({
			batcher : _batcher,
			depth : 999.2,
			color : new Color().rgb(0xf6007b),
			pos : new Vector( pos.x+(size.x/2), pos.y+18 ),
			align : TextAlign.center,
			font : font,
			text : title,
			size : 19,
			enabled : false
		});

	}
}
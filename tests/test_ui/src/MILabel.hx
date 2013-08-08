import luxe.Text;
import luxe.Color;
import luxe.Vector;

import MIControl;

class MILabel extends MIControl {
	
	public var _text : Text;

	public function new(_options:Dynamic) {		

		super(_options);

		_options.bounds = real_bounds;

		if(_options.align == null) { _options.align = TextAlign.center; }
		if(_options.align_vertical == null) { _options.align_vertical = TextAlign.center; }
		if(_options.text_size != null) { _options.size = _options.text_size; }		

		_options.pos = new Vector(real_bounds.x, real_bounds.y);
		_text = new Text( options_plus(_options, {depth : 2}) );

		debug_color = new Color(0,1,0.6,0.5);

		_text.geometry.clip = true;
        _text.geometry.clip_rect = parent.real_bounds;

	} //new

	public override function translate( ?_x : Float = 0, ?_y : Float = 0 ) {
		super.translate(_x,_y);		
		_text.pos = new Vector(_text.pos.x + _x, _text.pos.y + _y);
	}


}
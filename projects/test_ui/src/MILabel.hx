import lab.Text;
import lab.Color;

import MIControl;

class MILabel extends MIControl {
	
	private var _text : Text;

	public function new(_options:Dynamic) {		

		super(_options);

		trace(real_bounds);

		_options.bounds = real_bounds;

		if(_options.align == null) { _options.align = TextAlign.center; }
		if(_options.align_vertical == null) { _options.align_vertical = TextAlign.center; }
		if(_options.text_size != null) { _options.size = _options.text_size; }		

		_text = new Text( _options );

		debug_color = new Color(0,1,0.6,0.5);

	}		
}
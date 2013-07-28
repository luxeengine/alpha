

import lab.Rectangle;
import lab.Vector;
import lab.Color;

import MIControl;

class MICanvas extends MIControl {

	public var focused : MIControl;

	public function new( _options:Dynamic ) {

		if(_options.name == null) _options.name = 'canvas';

		if(_options.bounds == null) _options.bounds = new Rectangle(0, 0, Lab.screen.w, Lab.screen.h );

		super(_options);

		debug_color = new Color(0.5,0,0,0.5);

		focused = null;

	}

	public function update(dt:Float) {
		_debug();
	}

	public function destroy(){

	}

}
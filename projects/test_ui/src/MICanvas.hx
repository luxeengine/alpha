

import lab.Rectangle;
import lab.Vector;
import lab.Color;
import phoenix.geometry.QuadGeometry;
import MIControl;

class MICanvas extends MIControl {

	public var focused : MIControl;
	public var back : QuadGeometry;

	public function new( _options:Dynamic ) {

		if(_options.name == null) _options.name = 'canvas';

		if(_options.bounds == null) _options.bounds = new Rectangle(0, 0, Lab.screen.w, Lab.screen.h );

		super(_options);
		mouse_enabled = true;

		debug_color = new Color(0.5,0,0,0.5);

		focused = null;

		back = new QuadGeometry({
			x: real_bounds.x,
            y: real_bounds.y,
            width: real_bounds.w,
            height: real_bounds.h,
            color : new Color().rgb(0x212121)
		});

		Lab.addGeometry( back );
	}

	public function update(dt:Float) {
		_debug();
	}

	public function destroy(){

	}

}
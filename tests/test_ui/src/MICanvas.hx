

import luxe.Rectangle;
import luxe.Vector;
import luxe.Color;
import phoenix.geometry.QuadGeometry;
import MIControl;

class MICanvas extends MIControl {

	public var focused : MIControl;

	public function new( _options:Dynamic ) {

		if(_options == null) throw "No options given to canvas, at least a MIRenderer is required.";
		if(_options.renderer == null) throw "No renderer given to MICanvas, cannot create this way.";
		if(_options.name == null) _options.name = 'canvas';
		if(_options.bounds == null) _options.bounds = new Rectangle(0, 0, Luxe.screen.w, Luxe.screen.h );

		renderer = _options.renderer;

		super(_options);
		if(_options.parent == null) {
			canvas = this;
		} else {
			canvas = _options.parent;
		} //parent null

		mouse_enabled = true;
		focused = null;

		debug_color = new Color(0.5,0,0,0.5);		

		renderer.canvas.init( this, _options );

	} //new

	public function update(dt:Float) {
		_debug();
	} //update

	public function destroy(){

	} //destroy

} //MICanvas
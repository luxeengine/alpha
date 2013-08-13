package ;

import MIRenderer;
import MIRenderer.MILabelRenderer;
import MIRenderer.MICanvasRenderer;

import luxe.Text;
import luxe.Color;
import luxe.Vector;

import phoenix.geometry.QuadGeometry;


class MILuxeRenderer extends MIRenderer {

	public function new() {
		
		super();

		canvas = new MICanvasLuxeRenderer();
		label = new MILabelLuxeRenderer();

	} //new

} //MIRenderer

class MICanvasLuxeRenderer extends MICanvasRenderer {
	
	var back : QuadGeometry;

	public override function init( _canvas:MICanvas, _options:Dynamic ) {

		back = new QuadGeometry({			
			x: _canvas.real_bounds.x,
            y: _canvas.real_bounds.y,
            width: _canvas.real_bounds.w,
            height: _canvas.real_bounds.h,
            color : new Color().rgb(0x212121),
            depth : _canvas.depth
		});

		Luxe.addGeometry( back );

	} //init

} //MICanvasLuxeRenderer

class MILabelLuxeRenderer extends MILabelRenderer {

	var text : Text;

	public override function init( _label:MILabel, _options:Dynamic ) {
		
		text = new Text( _options );

		text.geometry.clip = true;
        text.geometry.clip_rect = _label.real_bounds;		

	} //init

	public override function translate( _label:MILabel, _x:Float, _y:Float ) {

		text.pos = new Vector( text.pos.x + _x, text.pos.y + _y );
		
	} //translate

} //MILabelLuxeRenderer

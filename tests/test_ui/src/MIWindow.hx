	import luxe.Input.MouseEvent;
import luxe.Rectangle;
import luxe.Text;
import luxe.Color;
import luxe.utils.NineSlice;
import luxe.Vector;

import MIControl;

class MIWindow extends MIControl {
	
	public var geom : NineSlice;
	public var _title : Text;
	public var title_bounds : Rectangle;
	public var view_bounds : Rectangle;

	public var dragging : Bool = false;
	public var drag_start : Vector;
	public var down_start : Vector;

	public function new(_options:Dynamic) {		

		super(_options);

		_options.bounds = real_bounds;

		drag_start = new Vector();
		down_start = new Vector();

		if(_options.align == null) { _options.align = TextAlign.center; }
		if(_options.align_vertical == null) { _options.align_vertical = TextAlign.center; }
		if(_options.title_size != null) { _options.size = _options.title_size; }		
		if(_options.title != null) { _options.text = _options.title; }		

		title_bounds = new Rectangle(real_bounds.x, real_bounds.y, bounds.w, 30 );
		view_bounds = new Rectangle(32, 32, bounds.w - 64, bounds.h - 64 );


		_options.pos = new Vector(real_bounds.x, real_bounds.y);
		_title = new Text( options_plus(_options, {depth : 2, bounds:title_bounds, color:new Color().rgb(0x999999) }) );

		geom = new NineSlice({
			texture : Luxe.loadTexture('assets/box.ui.png'),
			depth : 2,
			top : 32, left : 32, right : 32, bottom : 32,
		});

		geom.pos = new Vector( real_bounds.x, real_bounds.y );
		geom.create( new Vector(real_bounds.x, real_bounds.y), real_bounds.w, real_bounds.h );

	} //new
 
	public override function onmousemove(e:MouseEvent)  {
		var _m : Vector = new Vector(e.x,e.y);
		if(dragging) {
			var diff = Vector.Subtract( _m , drag_start );			
			drag_start = _m.clone();
			translate(diff.x, diff.y);
		} //dragging
	} //onmousemove

	public override function onmousedown(e:MouseEvent)  {
		var _m : Vector = new Vector(e.x,e.y);

			if(!dragging) {
				if( title_bounds.point_inside(_m) ) {			
					dragging = true;			
					drag_start = _m.clone();
					down_start = new Vector(real_bounds.x, real_bounds.y);
				} //if inside title bounds
			} //!dragging

	} //onmousedown

	public override function onmouseup(e:MouseEvent)  {
		var _m : Vector = new Vector(e.x,e.y);
		if(dragging) {
			dragging = false;
		} //dragging
	} //onmouseup

	public override function translate( ?_x : Float = 0, ?_y : Float = 0 ) {
		super.translate(_x,_y);
		
		title_bounds = new Rectangle(real_bounds.x, real_bounds.y, bounds.w, 30 );		
		_title.pos = new Vector(_title.pos.x + _x, _title.pos.y + _y);
		geom.pos = new Vector( geom.pos.x + _x, geom.pos.y + _y );
	}


}
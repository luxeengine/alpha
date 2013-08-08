
import luxe.utils.NineSlice;
import luxe.Vector;
import luxe.Color;
import MIControl;


class MIButton extends MIControl {
	
	public var label : MILabel;
	private var geom : NineSlice;

	public function new(_options:Dynamic) {
			
			//create the base control
		super(_options);
			//buttons can be clicked
		mouse_enabled = true;
			//create the label
		label = new MILabel({
			parent : this,
			bounds : _options.bounds.clone().set(0,0),
			text:_options.text,
			text_size:_options.text_size,
			name : name + '.label',
			depth : 4.1,
			color : new Color().rgb(0x999999)
		});

		if(_options.onclick != null) {
			mousedown = _options.onclick;
		}

		geom = new NineSlice({
			texture : Luxe.loadTexture('assets/button.ui.png'),
			depth : 2,
			top : 8, left : 8, right : 8, bottom : 8,
		});

		
		label._text.geometry.clip = true;
		label._text.geometry.clip_rect = parent.real_bounds;

		geom.pos = new Vector( real_bounds.x, real_bounds.y );
		geom.create( new Vector(real_bounds.x, real_bounds.y), real_bounds.w, real_bounds.h );
		geom.clip = true;
		geom.clip_rect = parent.real_bounds;
	}

	public override function translate(?_x:Float = 0, ?_y:Float = 0) {
		super.translate(_x,_y);
		geom.pos = new Vector( geom.pos.x + _x, geom.pos.y + _y );
	}

	public override function onmousedown(e) {
		super.onmousedown(e);
	}
	public override function onmouseup(e) {
		super.onmouseup(e);
	}
}
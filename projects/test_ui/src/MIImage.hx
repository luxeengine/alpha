
import lab.Sprite;
import lab.Vector;
import MIControl;

class MIImage extends MIControl {
	
	public var image : lab.Sprite;

	public function new(_options:Dynamic) {
			
			//create the base control
		super(_options);
			//image size to the parent,
		_options.centered = false;
		_options.pos = new Vector(real_bounds.x, real_bounds.y);
		_options.depth = 2;
			//create the image
		image = new Sprite(_options);
			//clip the geometry
		image.geometry.clip = true;
        image.geometry.clip_rect = parent.real_bounds;

	}

	public override function translate( ?_x : Float = 0, ?_y : Float = 0 ) {
		super.translate(_x,_y);
		image.pos = image.pos.add(new Vector(_x,_y));
	}

}
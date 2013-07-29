
import lab.Sprite;
import lab.Vector;
import MIControl;

class MIScrollArea extends MIControl {
	

	public var can_scroll_h : Bool = false;
	public var can_scroll_v : Bool = false;

	public var scroll_amount : Vector;
	public var scroll_percent : Vector;

	public function new(_options:Dynamic) {

		super(_options);

		scroll_amount = new Vector();
		scroll_percent = new Vector();

		refresh_scroll();
		
	} //new

	public override function add(child:MIControl) {
		super.add(child);
		refresh_scroll();
	}

	public function scrolly(diff:Float) {

		if(diff > 0 && scroll_percent.y <= 0) return;
		if(diff < 0 && scroll_percent.y >= 1) return;

		for(child in children) {
			child.translate(0, diff);
		}

		refresh_scroll();
	}

	public function scrollx(diff:Float) {

		if(diff > 0 && scroll_percent.x <= 0) return;
		if(diff < 0 && scroll_percent.x >= 1) return;

		for(child in children) {
			child.translate(diff, 0);
		}

		refresh_scroll();
	}

	public function refresh_scroll() {

			//get child bounds
		var _children_bounds = children_bounds();
		
			//get them into absolute space, based on our position
		var _children_y = (real_bounds.y + _children_bounds.y);
		var _children_x = (real_bounds.x + _children_bounds.x);
			//when the difference between our y and the children y is 0, the scroll amount is 0
		var _scroll_percent_x = (real_bounds.x - _children_x) / (_children_bounds.w - real_bounds.w);
		var _scroll_percent_y = (real_bounds.y - _children_y) / (_children_bounds.h - real_bounds.h);

			//keep for later
		scroll_percent.x = _scroll_percent_x;
		scroll_percent.y = _scroll_percent_y;
	}

	public override function _debug() {

		var _children_size = children_bounds();
		super._debug();

			//horizontal scroll
		Lab.draw.rectangle({
			depth : 8,
			immediate : true,
			color : debug_color,			
			x : real_bounds.x + ((real_bounds.w-10) * scroll_percent.x), 
			y : (real_bounds.y+real_bounds.h - 4), 
			w:10, h:3
		});		
			//vertical scroll
		Lab.draw.rectangle({
			depth : 8,
			immediate : true,
			color : debug_color,
			x : (real_bounds.x+real_bounds.w - 4), 
			y: real_bounds.y + ((real_bounds.h-10) * scroll_percent.y), 
			w:3, h:10
		});

		Lab.draw.text({
			text : ' [ ' + scroll_percent.x + ',' +  scroll_percent.y + ' ]',
			depth : 5,
			size : 14,
			immediate : true,
			pos : new Vector(real_bounds.x, real_bounds.y),
			color : debug_color			
		});

	}

}
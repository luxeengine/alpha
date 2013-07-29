
import lab.Sprite;
import lab.Vector;
import MIControl;

class MIScrollArea extends MIControl {
	

	public var can_scroll_h : Bool = true;
	public var can_scroll_v : Bool = true;

	public var scroll_amount : Vector;
	public var scroll_percent : Vector;
	public var child_bounds : Dynamic;

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

	public override function onmousedown(e) {
			//forward to 
		super.onmousedown(e);
		
		if(!ishovered) return;

		if(e.button == lime.InputHandler.MouseButton.wheel_up) {
			if(e.ctrl_down) {
            	scrollx(-10);
            } else {
            	scrolly(-10);
            }
        } else if(e.button == lime.InputHandler.MouseButton.wheel_down) {
			if(e.ctrl_down) {
            	scrollx(10);
            } else {
            	scrolly(10);
            }
        }

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

		if(!can_scroll_h) return;

		if(diff > 0 && scroll_percent.x <= 0) return;
		if(diff < 0 && scroll_percent.x >= 1) return;

		for(child in children) {
			child.translate(diff, 0);
		}

		refresh_scroll();
	}

	public function refresh_scroll() {

			//get child bounds
		child_bounds = children_bounds();		

			//if the children bounds are < our size, it can't scroll
		if(child_bounds.w < real_bounds.w) {
			can_scroll_h = false;
		} else {
			can_scroll_h = true;
		}

		if(child_bounds.h < real_bounds.h) {
			can_scroll_v = false;
		} else {
			can_scroll_v = true;
		}
		
		if(can_scroll_h) {

			var _diff_x = (real_bounds.x - child_bounds.realx);
			scroll_percent.x = (_diff_x / (child_bounds.w - bounds.w));
			scroll_percent.x = Math.min( Math.max(0.0, scroll_percent.x), 1.0);

		} //can_scroll_h

		if(can_scroll_v) {

			var _diff_y = (real_bounds.y - child_bounds.realy);
			scroll_percent.y = (_diff_y / (child_bounds.h - bounds.h));
			scroll_percent.y = Math.min( Math.max(0.0, scroll_percent.y), 1.0);

		} //can_scroll_v
			

	} // refresh_scroll

	public override function _debug() {

		
		super._debug();

			//horizontal scroll
		if(can_scroll_h) {
			Lab.draw.rectangle({
				depth : 8,
				immediate : true,
				color : debug_color,			
				x : real_bounds.x + ((real_bounds.w-10) * scroll_percent.x), 
				y : (real_bounds.y+real_bounds.h - 4), 
				w:10, h:3
			});		
		}

			//vertical scroll
		if(can_scroll_v) {
			Lab.draw.rectangle({
				depth : 8,
				immediate : true,
				color : debug_color,
				x : (real_bounds.x+real_bounds.w - 4), 
				y: real_bounds.y + ((real_bounds.h-10) * scroll_percent.y), 
				w:3, h:10
			});
		}

		var cy:Float = child_bounds.realy;
		var diffy:Float = (real_bounds.y - child_bounds.realy);

		Lab.draw.text({
			text :  'y =' + real_bounds.y + ' cy = ' + cy + ' diffy = ' + diffy + ' [ ' +scroll_percent.y+ ']',
			depth : 5,
			size : 14,
			immediate : true,
			pos : new Vector(real_bounds.x, real_bounds.y),
			color : debug_color			
		});

	}

}

import lab.Rectangle;
import lab.Color;
import lab.Vector;

	//base class for all controls
	//handles propogation of events,
	//mouse handling, alignment, so on

class MIControl {
	
	public var name : String = 'control';

	public var bounds : Rectangle;
	public var real_bounds : Rectangle;
	@:isVar public var parent(get,set) : MIControl;
	public var children : Array<MIControl>;

	public var isfocused : Bool = false;
	public var ishovered : Bool = false;

	private var debug_color : Color;

	public function new(_options:Dynamic) {
				
		debug_color = new Color(0.5,0.3,0.2,0.5);

		bounds = _options.bounds == null ? new Rectangle(0,0,32,32) : _options.bounds;
		real_bounds = bounds.clone();

		if(_options.name != null) { name = _options.name; }

		children = [];

		if(_options.parent != null) {
			_options.parent.add(this);
		}

	}

	public function add( child:MIControl ) {
		if(child.parent != this) {
			child.parent = this;
			children.push(child);
		}
	}

	private function set_parent(p:MIControl) {
		if(p != null) {
			real_bounds.set(p.real_bounds.x+bounds.x, p.real_bounds.y+bounds.y, bounds.w, bounds.h);
		} else {
			real_bounds.set(bounds.x, bounds.y, bounds.w, bounds.h);
		}

		trace(name + ' at ' + real_bounds);

		return parent = p;
	} //set_parent

	private function get_parent() {
		return parent;
	}
		
	public function onmousemove(e) {		
		if(real_bounds.point_inside(new Vector(e.x,e.y))) {
			if(!ishovered) {				
				onmouseenter(e);
			} else {
				for(child in children) {
					child.onmousemove(e);
				}
			}
		} else {
			if(ishovered) {
				onmouseleave(e);
			}
		}	

	} //mousemove

	public function onmouseup(e) {}
	public function onmousedown(e) {}
	public function onmouseenter(e) {
		if(!ishovered) {
			ishovered = true;
			trace('mouse enter ' + name);
		}
	}

	public function onmouseleave(e) {
		if(ishovered) {
			ishovered = false;
			trace('mouse leave ' + name);
		}
	}

	public function _debug() {
		Lab.draw.rectangle({
			immediate : true,
			color : debug_color,
			x : real_bounds.x, y:real_bounds.y, w:real_bounds.w, h:real_bounds.h
		});
		for(control in children) {
			control._debug();
		}		
	}	

}
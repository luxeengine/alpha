package mode;

import mode.Mode;

class Modes {

	public var modes: Map<String,Mode>; 
	public var activemodes: Array<Dynamic>; 
	public var currentmode: Dynamic;

	public function new () {
		modes = new Map();
		activemodes = new Array<Mode>();
	}

	public function add (mode:Mode) {
		modes.set( mode.name, mode );
	}

	public function set (name:String) {

		if (currentmode != null) {
			activemodes.remove (currentmode);
			if(currentmode.leave != null) currentmode.leave();
			currentmode = null;
		} 

		if (modes.exists(name)) {
			currentmode = modes.get (name); 
			if(currentmode.enter != null) currentmode.enter ();
			activemodes.push (currentmode);
		}
	}

	public function keydown(e) {
		for (mode in activemodes) {
			if(mode.keydown != null) mode.keydown(e);
		}
	}	
	public function keyup(e) {
		for (mode in activemodes) {
			if(mode.keyup != null) mode.keyup(e);
		}
	}	
	public function mousedown(e) {
		for (mode in activemodes) {
			if(mode.mousedown != null) mode.mousedown(e);
		}
	}
	public function mouseup(e) {
		for (mode in activemodes) {
			if(mode.mouseup != null) mode.mouseup(e);
		}
	}
	public function mousemove(e) {
		for (mode in activemodes) {			
			if(mode.mousemove != null) mode.mousemove(e);
		}
	}

	public function update (dt:Float) {
		for (mode in activemodes) {
			if(mode.update != null) mode.update (dt);
		}
	}

}
package luxe;

import luxe.Input.KeyEvent;
import luxe.Input.MouseEvent;

class Mode {

	public var active : Bool = false;
	public var name : String = 'none';
	@:isVar public var next_tick(never,set) :Void->Void;
	private var ticks : Array< Void->Void >;

	public function new() {
		ticks = new Array<Void->Void>();
	}
	public function set_next_tick(_f:Void->Void) {
		ticks.push(_f);
		return _f;
	}

	public function _update(dt:Float) {
		if(ticks.length > 0) {
			for(_f in ticks) {
				_f();
			}
			ticks.splice(0,ticks.length);
		}
	}

}

class Modes {

	public var _modes: Map<String,Mode>; 
	public var activemodes: Array<Mode>; 
	public var currentmode: Mode;

	public function new() {
		_modes = new Map();
		activemodes = new Array<Mode>();
	}

	public function add_mode<T>(type:Class<T>, ?_name:String='') : T {

		var _temp_name = _name;
		if(_temp_name.length == 0) {
			_temp_name = Luxe.utils.uuid();
			trace("warning ; Mode being added with no name " + type);
		} else {
			_temp_name = _name;
		}

			//create a class instance
		var _mode = Type.createInstance( type, [] );
			//create a mode typed instance 
		var _mode_instance : Mode = cast _mode;
			//set the name of the instance
		_mode_instance.name = _temp_name;
			//store it in the mode list
		_modes.set(_temp_name, _mode_instance );
			//debug stuff
		//trace('adding a mode to ' + name + ' called ' + _temp_name + ', now at ' + Lambda.count(_modes) + ' modes');

			//return the mode instance
		return _mode;

	} //add_mode

	public function set (name:String) {

		if (currentmode != null) {
			activemodes.remove(currentmode);
			_call(currentmode, 'leave',[] );
			currentmode = null;
		} 

		if (_modes.exists(name)) {
			currentmode = _modes.get(name); 
			_call(currentmode, 'enter',[] );
			activemodes.push (currentmode);
		}

	} //set

	//entity router functions
	public function init() {
		for (mode in _modes) {
			_call(mode, 'init', []);
		}		
	}	
	public function start() {
		for (mode in activemodes) {
			_call(mode, 'start', []);
		}		
	}
	public function update(dt:Float) {
		for (mode in activemodes) {
			_call(mode, 'update', [dt]);
			_call(mode, '_update', [dt]);
		}
	}
	public function destroy() {
		for (mode in _modes) {
			_call(mode, 'destroy', []);
		}
	}

//Private helper functions

	private function _call(_object:Mode, _name:String, ?args) {
		var _func = Reflect.field(_object, _name);
		if(_func != null) {
			Reflect.callMethod(_object, _func, args );
		} //does function exist?
	}

	public function onkeydown( e:KeyEvent ) {
		for (mode in activemodes) {
			_call(mode, 'onkeydown', [e]);
		}
	}	
	public function onkeyup( e:KeyEvent ) {
		for (mode in activemodes) {
			_call(mode, 'onkeyup', [e]);
		}
	}
	public function oninputup( name:String, e:Dynamic ) {
		for (mode in activemodes) {
			_call(mode, 'oninputup', [name,e]);
		}
	}
	public function oninputdown( name:String, e:Dynamic ) {
		for (mode in activemodes) {
			_call(mode, 'oninputdown', [name,e]);
		}
	}	
	public function onmousedown( e:MouseEvent ) {
		for (mode in activemodes) {
			_call(mode, 'onmousedown', [e]);
		}
	}
	public function onmouseup( e:MouseEvent ) {
		for (mode in activemodes) {
			_call(mode, 'onmouseup', [e]);
		}
	}
	public function onmousemove( e:MouseEvent ) {
		for (mode in activemodes) {			
			_call(mode, 'onmousemove', [e]);
		}
	}

}
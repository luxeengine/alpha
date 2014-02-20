package luxe;

import luxe.Input.KeyEvent;
import luxe.Input.MouseEvent;
import luxe.Input.TouchEvent;

import luxe.Objects;

import luxe.options.StateOptions;

class State extends Objects {

	public var machine : States;
	public var active : Bool = false;
	@:isVar public var next_tick(never,set) :Void->Void;
	private var ticks : Array< Void->Void >;
	
	private var options : Dynamic;

	public override function new<T>( ?_options:StateOptions<T> ) {

		super();

		ticks = new Array<Void->Void>();
		options = _options;

	}
	
	private function set_next_tick(_f:Void->Void) {
		ticks.push(_f);
		return _f;
	}

	public function enable<T>( ?_enable_with:T ) {
		machine.enable( name, _enable_with );
	}

	public function disable<T>( ?_disable_with:T ) {
		machine.disable( name, _disable_with );
	}

	@:noCompletion public function _init() {
		_call(this, 'init', [ (options == null) ? null : cast options.init_with ]);
	}

	@:noCompletion public function _update(dt:Float) {

		if(ticks.length > 0) {
			for(_f in ticks) {
				_f();
			}
			ticks.splice(0,ticks.length);
		}

		_call(this, 'update', [dt]);

	} //update	

} //State

class States {

	@:noCompletion public var _states: Map<String,State>; 
	public var active_states: Array<State>; 
	public var current_state: State;

	public function new() {
		_states = new Map();
		active_states = new Array<State>();
	}

	public function add_state<T1,T2>(type:Class<T1>, ?_name:String='', ?_construct_with:T2 ) : T1 {

		var _temp_name = _name;

		if(_temp_name.length == 0) {
			_temp_name = Luxe.utils.uniqueid();
			trace("warning ; State being added with no name " + type);
		} else {
			_temp_name = _name;
		}

			//create a class instance
		var _state = Type.createInstance( type, [_construct_with] );
			//create a state typed instance 
		var _state_instance : State = cast _state;
			//set the name of the instance
		_state_instance.name = _temp_name;
			//store it in the state list
		_states.set(_temp_name, _state_instance );
			//store reference of the owner
		_state_instance.machine = this;
			//debug stuff
		//trace('adding a state to ' + name + ' called ' + _temp_name + ', now at ' + Lambda.count(_states) + ' states');

			//return the state instance
		return _state;

	} //add_state

	public function enable<T>( _name:String, ?_enable_with:T ) {
		var state = _states.get( _name );
		if(state != null) {
			_call(state, 'enabled',[_enable_with] );
			active_states.push(state);
		}
	}

	public function disable<T>( _name:String, ?_disable_with:T  ) {
		var state = _states.get( _name );
		if(state != null) {
			_call(state, 'disabled',[_disable_with] );
			active_states.remove( state );
		}
	}

	public function set<T1,T2>(name:String, ?_enter_with:T1, ?_leave_with:T2 ) {

		if (current_state != null) {
			active_states.remove( current_state );
			_call(current_state, 'leave',[_leave_with] );
			current_state = null;
		} 

		if (_states.exists(name)) {
			current_state = _states.get(name); 
			_call(current_state, 'enter',[_enter_with] );
			active_states.push (current_state);
		}

	} //set

	//entity router functions
	public function init() {
		for (state in _states) {
			state._init();
		}
	}	
	public function reset() {
		for (state in active_states) {
			_call(state, 'reset');
		}
	}
	public function update(dt:Float) {
		for (state in active_states) {
			state._update(dt);
		}
	}
	public function destroy() {
		for (state in _states) {
			_call(state, 'destroyed', []);
		}
	}
	public function prerender() {
		for (state in active_states) {
			_call(state, 'prerender', []);
		}
	}
	public function postrender() {
		for (state in active_states) {
			_call(state, 'postrender', []);
		}
	}

//Private helper functions

	private function _call(_object:State, _name:String, ?_args:Array<Dynamic> ) {
		var _func = Reflect.field(_object, _name);
		if(_func != null) {
			Reflect.callMethod(_object, _func, _args );
		} //does function exist?
	}

	public function onkeydown( e:KeyEvent ) {
		for (state in active_states) {
			_call(state, 'onkeydown', [e]);
		}
	}	
	public function onkeyup( e:KeyEvent ) {
		for (state in active_states) {
			_call(state, 'onkeyup', [e]);
		}
	}
	public function oninputup( name:String, e:Dynamic ) {
		for (state in active_states) {
			_call(state, 'oninputup', [name,e]);
		}
	}
	public function oninputdown( name:String, e:Dynamic ) {
		for (state in active_states) {
			_call(state, 'oninputdown', [name,e]);
		}
	}	
	public function onmousedown( e:MouseEvent ) {
		for (state in active_states) {
			_call(state, 'onmousedown', [e]);
		}
	}
	public function onmousewheel( e:MouseEvent ) {
		for (state in active_states) {
			_call(state, 'onmousewheel', [e]);
		}
	}
	public function onmouseup( e:MouseEvent ) {
		for (state in active_states) {
			_call(state, 'onmouseup', [e]);
		}
	}
	public function onmousemove( e:MouseEvent ) {
		for (state in active_states) {
			_call(state, 'onmousemove', [e]);
		}
	}
	public function ontouchmove( e:TouchEvent ) {
		for (state in active_states) {			
			_call(state, 'ontouchmove', [e]);
		}
	}
	public function ontouchend( e:TouchEvent ) {
		for (state in active_states) {			
			_call(state, 'ontouchend', [e]);
		}
	}
	public function ontouchbegin( e:TouchEvent ) {
		for (state in active_states) {			
			_call(state, 'ontouchbegin', [e]);
		}
	}

}
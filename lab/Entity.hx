package lab;
	
class Entity {

	public var _components : Map<String, Entity>;
    public var id : String;
    public var name : String;
    public var parent : Entity;
    public var debug : Bool = false;

    private function _debug(v){
    	if(debug) trace(v);
    }

	public function new(){
		id = lab.utils.UUID.get();
		_components = new Map();		
	}

	public function add<T>(type:Class<T>, ?_name:String='') : T {

		var _temp_name = _name;
		if(_temp_name == '') {
			_temp_name = Lab.utils.uuid();
		} else {
			_temp_name = _name;
		}			

			//create an instance
		var _component = Type.createInstance( type, [] );
			//cast to entity so we can set its name
		var _e_component : Entity = cast _component;
			//apply it!
		_e_component.name = _temp_name;
			//store the parent
		_e_component.parent = this;		
			//store it in the component list
		_components.set(_temp_name, _e_component );
			//debug stuff
		_debug('adding an entity to ' + name + ' called ' + _temp_name);

			//return the component
		return _component;
	}

	public function get(_name:String, ?in_children:Bool = false, ?first_only:Bool = true ) : Dynamic {
		
		if(!in_children) {

			return _components.get(_name);

		} else {

			var results = [];

			var is_this_component = _components.get(_name);
			if(is_this_component != null) {
				if(first_only) {
					return is_this_component;
				} else {
					results.push(is_this_component);	
				} //first only
			} //is_this_component

				//check each of our child components for this named item
			for(_component in _components) {				
				var found : Dynamic = _component.get( _name, true, first_only );
				if(found != null) {
						//early out
					if(first_only) return found;
						//store otherwise
					if(Std.is(found, Array)) {
						results.concat(found);
					} else {
						results.push(found);
					}
				} //found != null
			} //each component

			return (results.length > 0) ? results : null;
		}

		return null;
	}

	public function has(name:String) : Bool {
		return _components.exists(name);
	}

	private function _call(_object:Entity, _name:String, ?args) {
		var _func = Reflect.field(_object, _name);
		if(_func != null) {
			Reflect.callMethod(_object, _func, args );
		} //init function exists?
	}

	public function _init() {
			//update the parent first
		_call(this, 'init');

		if(name == null) throw "name on entity is null?";
		_debug('calling init on ' + name);

		for(_component in _components) {
			_call(_component, 'init');
			_debug('calling init on ' + _component.name);		
		} //for each component
	} //_init

	public function _destroy() {

		for(_component in _components) {
			_call(_component, 'destroy');
			_debug('calling destroy on ' + _component.name);		
		} //for each component

		_debug('calling destroy on ' + name);	

			//kill the parent last
		_call(this, 'destroy');		

	} //_destroy

	public function _start() {
			//update the parent first
		_call(this, 'start');

		_debug('calling start on ' + name);	

		for(_component in _components) {
			_call(_component, 'start');
			_debug('calling start on ' + _component.name);	
		} //for each component
	} //_start

	public function _update(dt:Float) {
			//update the parent first
		_call(this, 'update', [dt]);

		for(_component in _components) {
			_call(_component, 'update', [dt]);
		} //for each component
	} //_update


}
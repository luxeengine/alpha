package lab;
	
class Entity {

	public var _components : Map<String, Entity>;
    public var id : String;

	public function new(){
		id = lab.utils.UUID.get();
		_components = new Map();
	}

	public function add<T>(type:T, ?name:String='') {
		
		if(name == '') {
			name = Lab.utils.uuid();
		}

			//create an instance
		var _component = Type.createInstance( cast type,[]);
			//store it in the component list
		_components.set(name, _component);

	}

	public function get(name:String) : Dynamic {
		return _components.get(name);
	}

	public function _init() {
		for(_component in _components) {
			var _init_func = Reflect.field(_component,'init');
			if(_init_func != null) {
				Reflect.callMethod(_component, _init_func, []);
			} //init function exists?
		} //for each component
	} //_init

	public function _destroy() {
		for(_component in _components) {
			var _destroy_func = Reflect.field(_component,'destroy');
			if(_destroy_func != null) {
				Reflect.callMethod(_component, _destroy_func, []);
			} //destroy function exists?
		} //for each component
	} //_destroy

	public function _start() {
		for(_component in _components) {
			var _start_func = Reflect.field(_component,'start');
			if(_start_func != null) {
				Reflect.callMethod(_component, _start_func, []);
			} //start function exists?
		} //for each component
	} //_start

	public function _update(dt:Float) {
		for(_component in _components) {
			var _update_func = Reflect.field(_component,'update');
			if(_update_func != null) {
				Reflect.callMethod(_component, _update_func, [dt]);
			}//update function exists?
		} //for each component
	} //_update


}
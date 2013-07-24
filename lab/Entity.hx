package lab;

import lab.Vector;
	
class Entity {

    public var id : String;
    public var name : String;
	public var _components : Map<String, Entity>;

    @:isVar public var parent 	(default,default) : Entity;
	@:isVar public var pos 		(get,set) : Vector;
	@:isVar public var rotation (get,set) : Float = 0;
	@:isVar public var scale 	(get,set) : Vector;

	private var _last_scale : Vector;

	public function new(){	
		
		_components = new Map();
			//defaults
		id = lab.utils.UUID.get();
			//transform
		pos = new Vector();
		scale = new Vector(1,1);
		_last_scale = new Vector(1,1);
		rotation = 0;
			//hierarchy
		parent = null;

	} //new

	public function add<T>(type:Class<T>, ?_name:String='') : T {

		var _temp_name = _name;
		if(_temp_name.length == 0) {
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
		_e_component.pos = this.pos;
		_e_component.scale = this.scale;
		_e_component.rotation = this.rotation;
			//store it in the component list
		_components.set(_temp_name, _e_component );
			//debug stuff
		_debug('adding an entity to ' + name + ' called ' + _temp_name + ', now at ' + Lambda.count(_components) + ' components');

			//return the component
		return _component;

	} //add component

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
	} //get

	public function has(name:String) : Bool {
		return _components.exists(name);
	} //has

	public function _init() {
		_debug('calling init on ' + name);
			//init the parent first
		_call(this, 'init');

		if(name == null) throw "name on entity is null?";

		for(_component in _components) {
			_call(_component, '_init');			
		} //for each component
	} //_init

	public function _destroy() {

		for(_component in _components) {
			_call(_component, '_destroy');
		} //for each component

		_debug('calling destroy on ' + name);	

			//kill the parent last
		_call(this, 'destroy');		

	} //_destroy

	public function _start() {
			//start the parent first
		_call(this, 'start');

		_debug('calling start on ' + name);	

		for(_component in _components) {
			_call(_component, '_start');
		} //for each component
	} //_start

	public function _update(dt:Float) {

			//update the parent first
		_call(this, 'update', [dt]);

		for(_component in _components) {
			_call(_component, '_update', [dt]);
		} //for each component
	} //_update

//Private helper functions

	private function _call(_object:Entity, _name:String, ?args) {
		var _func = Reflect.field(_object, _name);
		if(_func != null) {
			Reflect.callMethod(_object, _func, args );
		} //does function exist?
	}

//Debugging

    public static var debug : Bool = false;
    private function _debug(v){
    	if(debug) trace(v);
    }

//Spatial transforms

	    //An internal callback for when x y or z on a transform changes
    private function pos_change(_v:Float) {
        set_pos(pos);
    }
	    //An internal callback for when x y or z on a transform changes
    private function scale_change(_v:Float) {
        set_scale(scale);
    }

        //An internal function to attach position 
        //changes to a vector, so we can listen for `pos.x` as well
    private function _attach_listener(_v : Vector, listener) {
        _v.listen_x = listener; _v.listen_y = listener; _v.listen_z = listener;
    }

    public function get_rotation() : Float { return (parent == null) ? rotation : parent.rotation; }
    public function set_rotation(_r:Float) : Float { return (parent == null) ? rotation = _r : parent.rotation = _r; }

    public function get_scale() : Vector { return (parent == null) ? scale : parent.scale; }
    public function set_scale(_s:Vector) : Vector {

    	if(parent == null) {

	    		//store the new value
	    	scale = _s;
	    		//listen for changes on the new value
	        _attach_listener( scale, scale_change );
	        	//store a copy for getting a difference in scale
	        _last_scale = scale.clone();
	        	//set requires return
	        return scale;
	    } else {
			return parent.scale = _s;
	    }

	    return _s;
    } //set_scale

    public function get_pos() : Vector { return (parent == null) ? pos : parent.pos; }
	public function set_pos(_p:Vector) { 

		if(parent == null) {
			pos = _p;
        	_attach_listener( pos, pos_change );
        	return pos;
        } else {
        	// Reflect.setField(parent, 'pos', _p);
        	pos = _p;
        	return pos;
        }

        return _p;
	} //set_pos

}
package luxe.components;

class Component extends Objects {
		//the root entity
	public var entity : Entity;	
	public function new() {
		super();
	}
}

class Components {
		
		//the list of attached components
	public var components : Map<String, Component>;
		//the root entity
	public var entity : Entity;

	public function new( _entity:Entity ) {
		
		components = new Map();
		entity = _entity;

	} //new

	public function add<T>( type:Class<T>, ?_name:String='' ) : T {

		var _temp_name = _name;

		if(_temp_name.length == 0) {
			_temp_name = Luxe.utils.uuid();
		} else {
			_temp_name = _name;
		}

			//create an instance
		var _component = Type.createInstance( type, [] );
			//cast to Component so we can set its name
		var _e_component : Component = cast _component;
			//apply it!
		_e_component.name = _temp_name;
			//store the entity
		_e_component.entity = this.entity;
			//store it in the component list
		components.set( _temp_name, _e_component );
			//debug stuff
		_debug('adding a component to ' + entity.name + ' called ' + _temp_name + ', now at ' + Lambda.count(components) + ' components');

			//return the component
		return _component;

	} //add component

	public function get(_name:String, ?in_children:Bool = false, ?first_only:Bool = true ) : Dynamic {
			
		_debug('looking for ' + _name + ' in children : ' + in_children + ' first only ; ' + first_only);

		if(!in_children) {

			return components.get(_name);

		} else {

			var results = [];

			var in_this_entity = components.get( _name );
			if( in_this_entity != null ) {
				if(first_only) {
					return in_this_entity;
				} else {
					results.push( in_this_entity );
				}
			} //if found in the root entity

			_debug('check each of our children for the component');

				//check each child of our entity
			for(_child in entity.children) {
				
				_debug('looking at ' + _child.name + ' for ' + _name );
				
				var found : Dynamic = _child.get( _name, true, first_only );
				
				if(found != null) {
					if(Std.is(found, Array)) {
							//only want the first result, i.e not a list
						if(first_only && found.length > 0) {
							return found[0];
						} else {
							results.concat(found);
						} //append to the list 
					} else {
						if(first_only) {
							return found;
						} else {
							results.push( found );
						} //first only
					} //not array
				} //found

			} //for each child

			return (results.length > 0) ? results : null;

		} //if in children

		return null;

	} //get

	public function has(_name:String) : Bool {
		return components.exists(_name);
	} //has	

    public static var _show_debug : Bool = false;
    private function _debug(v){ if(_show_debug) { trace(v); } }		

} //AcceptsComponents
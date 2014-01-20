package luxe.components;

class Component extends Objects {

	public var entity : Entity;	
		//the transfrom the parent entity
	@:isVar public var pos 				(get,set) : Vector;
	@:isVar public var posRelative 		(get,set) : Vector;
	@:isVar public var rotation 		(get,set) : Vector;
	@:isVar public var rotationRelative (get,set) : Vector;
	@:isVar public var scale 			(get,set) : Vector;
	@:isVar public var scaleRelative 	(get,set) : Vector;

	@:noCompletion var init_data : Dynamic;

	public function new<T>( ?_init_data:T ) {
		super();
		init_data = _init_data;
	} //new

	@:noCompletion public function _init() {
		_call(this, 'init', [ cast init_data ]);
	}
	@:noCompletion public function _reset() {
		_call(this, 'reset');
	}

	private function set_pos(_p:Vector) {
		return entity.pos = _p;
	} //set_pos
	private function set_posRelative(_p:Vector) {
		return entity.posRelative = _p;
	} //set_posRelative
	private function get_pos() {
		return entity.pos;
	} //get_pos
	private function get_posRelative() {
		return entity.posRelative;
	} //get_posRelative

	private function set_rotation(_r:Vector) {
		return entity.rotation = _r;
	} //set_rotation
	private function set_rotationRelative(_r:Vector) {
		return entity.rotationRelative = _r;
	} //set_rotationRelative
	private function get_rotation() {
		return entity.rotation;
	} //get_rotation
	private function get_rotationRelative() {
		return entity.rotationRelative;
	} //get_rotationRelative

	private function set_scale(_s:Vector) {
		return entity.scale = _s;
	} //set_scale
	private function set_scaleRelative(_s:Vector) {
		return entity.scaleRelative = _s;
	} //set_scaleRelative
	private function get_scale() {
		return entity.scale;
	} //get_scale
	private function get_scaleRelative() {
		return entity.scaleRelative;
	} //get_scaleRelative

	public function add<T1,T2>( type:Class<T1>, ?_name:String='', ?_data:T2 ) : T1 {
		return entity.add( type,_name,_data );
	} //add

    public function remove<T>(?_name:String='', ?_data:T ) : Bool {
    	return entity.remove( _name, _data );
    } //add

	public function get(_name:String, ?in_children:Bool = false, ?first_only:Bool = true ) : Dynamic {
		return entity.get(_name,in_children,first_only);
	} //get

	@:noCompletion public function entity_pos_change(_p:Vector) {}
	@:noCompletion public function entity_scale_change(_p:Vector) {}
	@:noCompletion public function entity_rotation_change(_p:Vector) {
		// _attach_listener(_p, _rotation_change);
	}

 //Spatial transforms

        //An internal callback for when x y or z on a transform changes
    @:noCompletion private function _pos_change(_v:Float) { this.set_pos(pos); }
        //An internal callback for when x y or z on a transform changes
    @:noCompletion private function _scale_change(_v:Float) { this.set_scale(scale); }
        //An internal callback for when x y or z on a transform changes
    @:noCompletion private function _rotation_change(_v:Float) { this.set_rotation(rotation); }

        //An internal function to attach position 
        //changes to a vector, so we can listen for `pos.x` as well
    @:noCompletion private function _attach_listener( _v : Vector, listener ) {
        _v.listen_x = listener; 
        _v.listen_y = listener; 
        _v.listen_z = listener;
    } //_attach_listener

	public function get_serialize_data() : Dynamic {
		return {
			id : id,
			entity : entity.id
		};
	} //get_serialize_data

 #if luxe_native

	@:noCompletion public function serialize_to_disk( _destination_path:String ) {

        var _data : Dynamic = get_serialize_data();        

        var _type = Type.getClassName(Type.getClass(this));

        var _destfile = _destination_path + name  + '.' + _type + '.json';

        var _file : sys.io.FileOutput = sys.io.File.write( _destfile, false);
            _file.writeString( luxe.utils.JSON.encode(_data) );
            _file.close();

	} //serialize_to_disk

 #end //luxe_native

} //Component



@:noCompletion class Components {
		
		//the list of attached components
	public var components : Map<String, Component>;
		//the root entity
	public var entity : Entity;

	public function new( _entity:Entity ) {
		
		components = new Map();
		entity = _entity;

	} //new

	public function add<T1,T2>( type:Class<T1>, ?_name:String='', ?_data:T2 ) : T1 {

		var _temp_name = _name;

		if(_temp_name.length == 0) {
			_temp_name = Luxe.utils.uniqueid();
		} else {
			_temp_name = _name;
		}

			//create an instance
		var _component = Type.createInstance( type, [ _data ] );		
			//cast to Component so we can set its name
		var _e_component : Component = cast _component;
			//apply it!
		_e_component.name = _temp_name;
			//store the entity
		_e_component.entity = entity;
			//store it in the component list
		components.set( _temp_name, _e_component );
			//debug stuff
		_debug('adding a component to ' + entity.name + ' called ' + _temp_name + ', now at ' + Lambda.count(components) + ' components');

			//now check against the entity already being init'ed and start'ed 
			//and if so, call them manually
		if(entity.inited) {
			_debug("\t entity " + entity.name + " adding component after init, so doing init on " + _e_component.name );
			_call(_component, '_init');
		}

		if(entity.started) {
			_debug("\t entity " + entity.name + " adding component after start, so doing reset on " + _e_component.name );
			_call(_component, '_reset');
		}

			//return the component
		return _component;

	} //add component

	public function remove<T>( ?_name:String='', ?_data:T ) : Bool {
		
			//doesn't exist? 
    	if(!components.exists(_name)) {
    		trace("attempt to remove " + _name + " from " + entity.name + " failed because that component was not attached to this entity");
    		return false;
    	}

    		//now, when removing a component we call "removed" on it, in case they care
    	var _component = components.get( _name );

		_debug("\t entity " + entity.name + " remove component " + _component.name );
			
			_call(_component, 'removed', [ cast _data ]);

		return components.remove(_name);

    } //remove

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

	@:noCompletion private function _call(_object:Dynamic, _name : String, ?args:Array<Dynamic> ) {
		
		var _func = Reflect.field( _object, _name );
		if(_func != null) {
			Reflect.callMethod( _object, _func, args );
		} //does function exist?

	} //_call	

    @:noCompletion public static var _show_debug : Bool = false;
    @:noCompletion private function _debug(v){ if(_show_debug) { trace(v); } }		

} //AcceptsComponents
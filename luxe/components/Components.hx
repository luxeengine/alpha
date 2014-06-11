package luxe.components;

import luxe.options.ComponentOptions;
import luxe.Quaternion;

import luxe.Log._debug;
import luxe.Log._verbose;


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
        var _component = Type.createInstance( type, [] );
            //cast to Component so we can set its name
        var _e_component : Component = cast _component;
            //store the options for init
        _e_component.options = _data;
            //apply it!
        _e_component.name = _temp_name;
            //store the entity
        _e_component.entity = entity;
            //store it in the component list
        components.set( _temp_name, _e_component );
            //debug stuff
        _debug('    adding to ' + entity.name + ' called ' + _temp_name + ', now at ' + Lambda.count(components) + ' components');


        _debug("\t entity " + entity.name + " created, calling create on " + _e_component.name );
        _call(_component, '_create');

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

    public function get<T>(_name:String, ?in_children:Bool = false ) : T {

        _debug('looking for all of ' + _name + ' in children : ' + in_children );

        if(!in_children) {

            return cast components.get(_name);

        } else {

                //if found in the root entity
            var in_this_entity = components.get( _name );               
            if( in_this_entity != null ) {
                return cast in_this_entity;
            } 

            _debug('check each of our children for the component');

                //check each child of our entity
            for(_child in entity.children) {
                
                _debug('looking at ' + _child.name + ' for ' + _name );
                
                var found : T = _child.get( _name, true );
                
                if(found != null) {
                    return cast found;
                } //found

            } //for each child

            return null;

        } //if in children

        return null;

    } //get

    public function get_any<T>(_name:String, ?in_children:Bool = false, ?first_only:Bool = true ) : Array<T> {
            
        _debug('looking for all of ' + _name + ' in children : ' + in_children + ' first only ; ' + first_only);

        var results : Array<T> = [];

        if(!in_children) {

            return [cast components.get(_name)];

        } else {

            var in_this_entity = components.get( _name );
            if( in_this_entity != null ) {
                if(first_only) {
                    return [cast in_this_entity];
                } else {
                    results.push( cast in_this_entity );
                }
            } //if found in the root entity

            _debug('check each of our children for the component');

                //check each child of our entity
            for(_child in entity.children) {
                
                _debug('looking at ' + _child.name + ' for ' + _name );
                
                var found : Array<T> = _child.get_any( _name, true, first_only );
                
                if(found != null) {
                    
                        //only want the first result, i.e not a list
                    if(first_only && found.length > 0) {
                        return [cast found[0]];
                    } else {
                        results.concat(found);
                    } //append to the list 

                } //found

            } //for each child          

        } //if in children

        return results;

    } //get_any

    public function has(_name:String) : Bool {
        return components.exists(_name);
    } //has 

    @:noCompletion function _call(_object:Dynamic, _name : String, ?args:Array<Dynamic> ) {
        
        var _func = Reflect.field( _object, _name );
        if(_func != null) {
            Reflect.callMethod( _object, _func, args );
        } //does function exist?

    } //_call

} //Components

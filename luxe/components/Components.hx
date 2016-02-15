package luxe.components;

import luxe.Quaternion;
import luxe.structural.OrderedMap;

import luxe.Log._debug;
import luxe.Log._verbose;


@:noCompletion class Components {

        //the list of attached components
    public var components : OrderedMap<String, Component>;
        //the root entity
    public var entity : Entity;

    public function new( _entity:Entity ) {

        var _map = new Map<String,Component>();
        components = new OrderedMap(_map);
        entity = _entity;

    } //new

    public function destroy() {
        
        components.map = null;
        components = null;
        entity = null;

    }

    public function add<T:Component>( _component:T ) : T {

        if(_component == null) {
            trace('attempt to add null component to ${entity.name}' );
            return _component;
        }

        _component.entity = entity;

        components.set( _component.name, _component );

            _debug('    entity ${entity.name} added component ${_component.name}, now at ${Lambda.count(components)} components');
            _debug('    entity ${entity.name} added component, calling added() on ${_component.name}');

        _component.onadded();

            //now check against the entity already being init'ed and reset'ed
            //and if so, call them manually
        if(entity.inited) {
            _debug('\t entity ${entity.name} adding component after init, so doing init on ${_component.name}' );
            _component.init();
        }

        if(entity.started) {
            _debug('\t entity ${entity.name} adding component after reset, so doing reset on ${_component.name}' );
            _component.onreset();
        }

        return _component;

    } //add component

    public function remove( _name:String ) : Bool {

            //doesn't exist?
        if(!components.exists(_name)) {
            trace('attempt to remove $_name from ${entity.name} failed because that component was not attached to this entity');
            return false;
        }

        _debug('\t entity ${entity.name} removing component $_name');

        var _component = components.get( _name );
            _component.onremoved();

            //we also set the entity to null
            _component.entity = null;

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

} //Components

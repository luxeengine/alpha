package luxe.components;

import luxe.options.ComponentOptions;
import luxe.Quaternion;

class Component extends Objects {

        //the entity this component is attached to
    public var entity : Entity;

        //the transfrom that affect the parent entity
    public var pos              (get,set) : Vector;
    public var rotation         (get,set) : Quaternion;
    public var scale            (get,set) : Vector;
    public var origin           (get,set) : Vector;

        //the options for passing into init
    @:noCompletion var options : Dynamic;

    public function new<T>( ?_options:ComponentOptions<T> ) {
        
        super();
            
        options = _options;

    } //new

//Public API

//components

    public function add<T1,T2>( type:Class<T1>, ?_name:String='', ?_data:T2 ) : T1 {
        return entity.add( type,_name,_data );
    } //add

    public function remove<T>(?_name:String='', ?_data:T ) : Bool {
        return entity.remove( _name, _data );
    } //add

    public function get<T>(_name:String, ?in_children:Bool = false ) : T {
        return entity.get( _name, in_children );
    } //get

    public function get_any<T>(_name:String, ?in_children:Bool = false, ?first_only:Bool = true ) : Array<T> {
        return entity.get_any( _name, in_children, first_only );
    } //get_any

//transforms

    function set_pos( _p:Vector ) {
        return entity.pos = _p;
    } //set_pos

    function get_pos() {
        return entity.pos;
    } //get_pos

    function set_rotation( _r:Quaternion ) {
        return entity.rotation = _r;
    } //set_rotation

    function get_rotation() {
        return entity.rotation;
    } //get_rotation

    function set_scale(_s:Vector) {
        return entity.scale = _s;
    } //set_scale
    
    function get_scale() {
        return entity.scale;
    } //get_scale

    function set_origin(_o:Vector) {
        return entity.origin = _o;
    } //set_origin

    function get_origin() {
        return entity.origin;
    } //get_origin

    @:noCompletion public function entity_pos_change( _pos:Vector ) {}
    @:noCompletion public function entity_scale_change( _scale:Vector ) {}
    @:noCompletion public function entity_rotation_change( _rotation:Quaternion ) {}
    @:noCompletion public function entity_origin_change( _origin:Vector ) {}
    @:noCompletion public function entity_parent_change( _parent:Transform ) {}

//internal api

    @:noCompletion public function _init() {
        _call(this, 'init', [ (options == null) ? null : cast options.init_with ]);
    }
    @:noCompletion public function _reset() {
        _call(this, 'reset');
    }


 //Serialization


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

    @:noCompletion public static var _show_debug : Bool = false;
    @:noCompletion function _debug(v){ if(_show_debug) { trace(v); } }      

} //Components

package luxe;

import luxe.Quaternion;
import luxe.Vector;
import luxe.Transform;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;

@:autoBuild(luxe.components.ComponentRules.apply())
class Component extends Objects {

        //the entity this component is attached to
    public var entity : Entity;

        //the transfrom that affect the parent entity
    public var pos              (get,set) : Vector;
    public var rotation         (get,set) : Quaternion;
    public var scale            (get,set) : Vector;
    public var origin           (get,set) : Vector;
    public var transform        (get,set) : Transform;

        //the options for passing into init
    @:noCompletion public var options : Dynamic;

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
        return entity.transform.pos = _p;
    } //set_pos

    function get_pos() {
        return entity.transform.pos;
    } //get_pos

    function set_rotation( _r:Quaternion ) {
        return entity.transform.rotation = _r;
    } //set_rotation

    function get_rotation() {
        return entity.transform.rotation;
    } //get_rotation

    function set_scale(_s:Vector) {
        return entity.transform.scale = _s;
    } //set_scale

    function get_scale() {
        return entity.transform.scale;
    } //get_scale

    function set_origin(_o:Vector) {
        return entity.transform.origin = _o;
    } //set_origin

    function get_origin() {
        return entity.transform.origin;
    } //get_origin

    function set_transform(_o:Transform) {
        return entity.transform = _o;
    } //set_transform

    function get_transform() {
        return entity.transform;
    } //get_transform

    @:noCompletion public function entity_pos_change( _pos:Vector ) {}
    @:noCompletion public function entity_scale_change( _scale:Vector ) {}
    @:noCompletion public function entity_rotation_change( _rotation:Quaternion ) {}
    @:noCompletion public function entity_origin_change( _origin:Vector ) {}
    @:noCompletion public function entity_parent_change( _parent:Transform ) {}

//internal api

    @:noCompletion public function _create() {
        _verbose('        component $name create');
        _call(this, 'create');
    }

    @:noCompletion public function _init() {
        _verbose('        component $name init with options $options ');
        _call(this, 'init', [ (options == null) ? null : cast options.init_with ]);
    }

    @:noCompletion public function _reset() {
        _verbose('        component $name reset');
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

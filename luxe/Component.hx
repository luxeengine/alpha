package luxe;

import luxe.Quaternion;
import luxe.Vector;
import luxe.Transform;
import luxe.Input;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;

@:autoBuild(luxe.components.ComponentRules.apply())
class Component extends Objects {

        //the entity this component is attached to
    @:isVar public var entity (get,set) : Entity;

        //the transfrom that affect the parent entity
    public var pos              (get,set) : Vector;
    public var rotation         (get,set) : Quaternion;
    public var scale            (get,set) : Vector;
    public var origin           (get,set) : Vector;
    public var transform        (get,set) : Transform;

    public function new( ?_name:String='' ) {

        super(_name == '' ? Luxe.utils.uniqueid() : _name);

    } //new

//components

    public function add( component:Component ) : Void {
        entity.add( component );
    } //add

    public function remove( _name:String ) : Bool {
        return entity.remove( _name );
    } //add

    public function get<T>( _name:String, ?in_children:Bool = false ) : T {
        return entity.get( _name, in_children );
    } //get

    public function get_any<T>( _name:String, ?in_children:Bool = false, ?first_only:Bool = true ) : Array<T> {
        return entity.get_any( _name, in_children, first_only );
    } //get_any

//entity

    function _reset(_) {

        emit('reset');

    } //_reset

    function _destroy(_) {

        emit('removed');
        emit('destroy');

    } //_reset

    function detach_entity() {

        if(entity != null) {
            entity.off('reset', _reset);
            entity.off('destroy', _destroy);
        }

    } //detach_entity

    function attach_entity() {

        if(entity != null) {
            entity.on('reset', _reset);
            entity.on('destroy', _destroy);
        }

    } //attach_entity

    function set_entity(_entity:Entity) {

        detach_entity();

            entity = _entity;

        attach_entity();

        return entity;

    } //set_entity

    function get_entity() {

        return entity;

    } //get_entity

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

    public function init() {}
    public function update(dt:Float) {}

} //Component

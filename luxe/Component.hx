package luxe;

import luxe.Quaternion;
import luxe.Vector;
import luxe.Transform;
import luxe.Input;
import luxe.Objects.ID;
import luxe.options.ComponentOptions;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;

@:autoBuild(luxe.macros.ComponentRules.apply())
class Component extends ID {

        //the entity this component is attached to
    @:isVar public var entity (get,set) : Entity;

        //the transfrom that affect the parent entity
    public var pos              (get,set) : Vector;
    public var rotation         (get,set) : Quaternion;
    public var scale            (get,set) : Vector;
    public var origin           (get,set) : Vector;
    public var transform        (get,set) : Transform;

        //critical events, called directly
    public function init() {}
    public function update(dt:Float) {}

        //component events, called directly
    public function onadded() {}
    public function onremoved() {}

        //entity events, called directly
    public function onreset() {}
    public function ondestroy() {}
    public function onfixedupdate() {}

        //input events, connected only when overriden in component class
    public function onkeyup( event:KeyEvent ) {}
    public function onkeydown( event:KeyEvent ) {}

    public function onmousedown( event:MouseEvent ) {}
    public function onmouseup( event:MouseEvent ) {}
    public function onmousemove( event:MouseEvent ) {}
    public function onmousewheel( event:MouseEvent ) {}

    public function ontouchdown( event:TouchEvent ) {}
    public function ontouchup( event:TouchEvent ) {}
    public function ontouchmove( event:TouchEvent ) {}

    public function ongamepadup( event:GamepadEvent ) {}
    public function ongamepaddown( event:GamepadEvent ) {}
    public function ongamepadaxis( event:GamepadEvent ) {}
    public function ongamepaddevice( event:GamepadEvent ) {}


    public function new( ?_options:ComponentOptions ) {

        var _name = '';

        if(_options != null) {
            if(_options.name != null) {
                _name = _options.name;
            }
        }

        super(_name == '' ? Luxe.utils.uniqueid() : _name);

    } //new

//components

    public function add( component:Component ) {
        return entity.add( component );
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

//Internal

//entity

    function _detach_entity() {

        if(entity != null) {
            //entity.off('reset', _reset);
        }

    } //detach_entity

    function _attach_entity() {

        if(entity != null) {
            //entity.on('reset', _reset);
        }

    } //attach_entity

    function set_entity(_entity:Entity) {

        _detach_entity();

            entity = _entity;

        _attach_entity();

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

} //Component

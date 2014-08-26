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
    public var entity : Entity;

        //the transfrom that affect the parent entity
    public var pos              (get,set) : Vector;
    public var rotation         (get,set) : Quaternion;
    public var scale            (get,set) : Vector;
    public var origin           (get,set) : Vector;
    public var transform        (get,set) : Transform;

//components

    public function add( _name:String, component:Component ) : Void {
        entity.add( _name, component );
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
    public function reset() {}
    public function destroyed() {}

    public function added() {}
    public function removed() {}

    public function fixed_update() {}
    public function update(dt:Float) {}

    public function onkeyup(e:KeyEvent) {}
    public function onkeydown(e:KeyEvent) {}

    public function onmouseup(e:MouseEvent) {}
    public function onmousedown(e:MouseEvent) {}
    public function onmousemove(e:MouseEvent) {}
    public function onmousewheel(e:MouseEvent) {}

    public function ontouchup(e:TouchEvent) {}
    public function ontouchdown(e:TouchEvent) {}
    public function ontouchmove(e:TouchEvent) {}

    public function ongamepadaxis(e:GamepadEvent) {}
    public function ongamepaddown(e:GamepadEvent) {}
    public function ongamepadup(e:GamepadEvent) {}

    public function oninputdown(_name:String, e:InputEvent) {}
    public function oninputup(_name:String, e:InputEvent) {}

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

package luxe;

import luxe.Quaternion;
import luxe.Vector;
import luxe.Transform;
import luxe.Input;
import luxe.Screen;
import luxe.Objects.ID;
import luxe.options.ComponentOptions;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;

@:autoBuild(luxe.macros.ComponentRules.apply())
class Component extends ID {

        /** the entity this component is attached to */
    @:isVar public var entity (get,set) : Entity;

        /** The spatial transform of the attached entity. direct proxy to the entity transform */
    public var transform : Transform;
        /** The local position of the spatial transform. direct proxy to the entity transform */
    public var pos              (get,set) : Vector;
        /** The local rotation of the spatial transform. direct proxy to the entity transform */
    public var rotation         (get,set) : Quaternion;
        /** The local scale of the spatial transform. direct proxy to the entity transform */
    public var scale            (get,set) : Vector;
        /** The local origin of the spatial transform. direct proxy to the entity transform */
    public var origin           (get,set) : Vector;

        /** called when the scene is initiated. **use this instead of new** for state setup. it respects the order of creations, children, and component ordering. */
    public function init() {}
        /** called once per frame, passing the delta time */
    public function update(dt:Float) {}

        /** called when the component is attached to an entity */
    public function onadded() {}
        /** called when the component is removed from an entity */
    public function onremoved() {}

        /** called when the fixed update is triggered, if the entity has a fixed_rate set. hands the fixed_rate for interchangeable update/fixedupdate convenience */
    @:noCompletion public function onfixedupdate(rate:Float) {}
       /** called when the scene starts or is reset. use this to reset state. */
    @:noCompletion public function onreset() {}
        /** called when the scene, parent or entity is destroyed. use this to clean up state. */
    @:noCompletion public function ondestroy() {}

        /** override this to get notified when a key is released. only called if overridden. */
    @:noCompletion public function onkeyup( event:KeyEvent ) {}
        /** override this to get notified when a key is pressed. only called if overridden. */
    @:noCompletion public function onkeydown( event:KeyEvent ) {}
        /** override this to get notified when a text input event happens. only called if overridden. */
    @:noCompletion public function ontextinput( event:TextEvent ) {}

        /** override this to get notified when a named input event happens. only called if overridden. */
    @:noCompletion public function oninputdown( event:{ name:String, event:InputEvent } ) {}
        /** override this to get notified when a named input event happens. only called if overridden. */
    @:noCompletion public function oninputup( event:{ name:String, event:InputEvent } ) {}

        /** override this to get notified when a mouse button is pressed. only called if overridden. */
    @:noCompletion public function onmousedown( event:MouseEvent ) {}
        /** override this to get notified when a mouse button is pressed. only called if overridden. */
    @:noCompletion public function onmouseup( event:MouseEvent ) {}
        /** override this to get notified when a mouse is moved. only called if overridden. */
    @:noCompletion public function onmousemove( event:MouseEvent ) {}
        /** override this to get notified when the mouse wheel/trackpad is scrolled. only called if overridden. */
    @:noCompletion public function onmousewheel( event:MouseEvent ) {}

        /** override this to get notified when a touch begins. only called if overridden. */
    @:noCompletion public function ontouchdown( event:TouchEvent ) {}
        /** override this to get notified when a touch ends. only called if overridden. */
    @:noCompletion public function ontouchup( event:TouchEvent ) {}
        /** override this to get notified when a touch moves. only called if overridden. */
    @:noCompletion public function ontouchmove( event:TouchEvent ) {}

        /** override this to get notified when a gamepad button is released. only called if overridden. */
    @:noCompletion public function ongamepadup( event:GamepadEvent ) {}
        /** override this to get notified when a gamepad button is pressed. only called if overridden. */
    @:noCompletion public function ongamepaddown( event:GamepadEvent ) {}
        /** override this to get notified when a gamepad axis changes. only called if overridden. */
    @:noCompletion public function ongamepadaxis( event:GamepadEvent ) {}
        /** override this to get notified when a gamepad device event happens. only called if overridden. */
    @:noCompletion public function ongamepaddevice( event:GamepadEvent ) {}

       /** override this to get notified when a window is moved, with the data containing the new x/y position */
   @:noCompletion public function onwindowmoved( event:WindowEvent ) {}
       /** override this to get notified when a window is resized by the user, with the data containing the new x/y size */
   @:noCompletion public function onwindowresized( event:WindowEvent ) {}
       /** override this to get notified when a window is resized by the system or code or the user, with the data containing the new x/y size */
   @:noCompletion public function onwindowsized( event:WindowEvent ) {}
       /** override this to get notified when a window is minimized. */
   @:noCompletion public function onwindowminimized( event:WindowEvent ) {}
       /** override this to get notified when a window is restored. */
   @:noCompletion public function onwindowrestored( event:WindowEvent ) {}

        /** Use this to pass instance specific data and values to the component. */
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

        /** attach a component to the entity */
    public function add<T:Component>( component:T ) : T {
        return entity.add( component );
    } //add

        /** remove a component from the entity */
    public function remove( _name:String ) : Bool {
        return entity.remove( _name );
    } //add

        /** get a component from the entity, by name */
    public function get<T>( _name:String, ?in_children:Bool = false ) : T {
        return entity.get( _name, in_children );
    } //get

        /** get all component from the entity, by name */
    public function get_any<T>( _name:String, ?in_children:Bool = false, ?first_only:Bool = true ) : Array<T> {
        return entity.get_any( _name, in_children, first_only );
    } //get_any

        /** returns true if the entity has a component by the given name */
    public function has( _name:String ) : Bool {
        return entity.has( _name );
    } //has

//Internal

//entity

    function _detach_entity() {

        if(entity != null) {
            //entity.off(Ev.reset, _reset);
        }

    } //detach_entity

    function _attach_entity() {

        if(entity != null) {
            //entity.on(Ev.reset, _reset);
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

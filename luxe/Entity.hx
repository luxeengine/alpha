package luxe;

import luxe.Quaternion;
import luxe.Transform;
import luxe.Matrix;

import luxe.Input;
import luxe.Vector;
import luxe.Scene;
import luxe.components.Components;
import luxe.Component;
import luxe.Emitter;

import luxe.options.EntityOptions;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;
import luxe.Log._verboser;

@:autoBuild(luxe.macros.EntityRules.apply())
class Entity extends Objects {

        /** The map of attached components, by name. use .get to find components in children and from other components instead of accessing this unless you need to */
    public var components (get,never) : Map<String, Component>;
        /** A local event system for sending and receiving named events through the entity. Helps communicate between components, and more. */
    public var events : luxe.Events;
        /** The list of children this entity is parenting. Use `child.parent = null;` to remove, or `child.parent = entity;` to assign. */
    public var children : Array<Entity>;

        /** whether or not this entity has been destroyed */
    public var destroyed : Bool = false;
        /** whether or not this entity has been inited yet */
    public var inited : Bool = false;
        /** whether or not this entity has been started/reset by the scene */
    public var started : Bool = false;

        /** per entity fixed rate timer, if any. if 0 (default) no fixed update is called on this entity. */
    @:isVar public var fixed_rate       (get,set) : Float = 0;
        /** The parent entity if any, set to null for no parent */
    @:isVar public var parent           (get,set) : Entity;
        /** if the entity is in a scene, this is not null */
    @:isVar public var scene            (get,set) : Scene;
        /** if the entity is active in the scene or not. set to inactive to stop scene events propogating into this entity and it's components and children */
    @:isVar public var active           (get,set) : Bool = true;

        /** The spatial transform of the entity. */
    public var transform : Transform;
        /** The local position of the spatial transform */
    public var pos              (get,set) : Vector;
        /** The local rotation of the spatial transform */
    public var rotation         (get,set) : Quaternion;
        /** The local scale of the spatial transform */
    public var scale            (get,set) : Vector;
        /** The local origin of the spatial transform */
    public var origin           (get,set) : Vector;

        /** the system for the entity */
    var _components : Components;
        /** the timer for the fixed update */
    var fixed_rate_timer : snow.utils.Timer;
        /** the options passed in for giving to the init function */
    var options : Dynamic;


        /** called when the scene is initiated. **use this instead of new** for state setup. it respects the order of creations, children, and component ordering. */
    public function init() {}
        /** called once per frame, passing the delta time */
    public function update(dt:Float) {}
        /** called once per fixed rate, only if fixed_rate != 0 */
    public function onfixedupdate(rate:Float) {}

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
    @:noCompletion public function oninputdown( name:String, event:InputEvent ) {}
        /** override this to get notified when a named input event happens. only called if overridden. */
    @:noCompletion public function oninputup( name:String, event:InputEvent ) {}

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


        /** Create a new entity with the given options */
    public function new( ?_options:EntityOptions ) {

        super('entity');

            //default to name.id
        name += '.$id';

        _verbose('create new entity with options ' + options);

        options = _options;

        _components = new Components( this );
        children = new Array<Entity>();
        events = new luxe.Events();
        transform = new Transform();

            //listen for transform changes
        transform.listen_pos(set_pos_from_transform);
        transform.listen_scale(set_scale_from_transform);
        transform.listen_origin(set_origin_from_transform);
        transform.listen_parent(set_parent_from_transform);
        transform.listen_rotation(set_rotation_from_transform);

        if(options != null) {

    //name
                //default to non-unique name
            if(options.name_unique == null) {
                options.name_unique = false;
            }

            if(options.name != null) {
                name = options.name;
                if(options.name_unique) {
                    name += '';
                }
            }

    //position
            if(options.pos != null) {
                var _op : Vector = options.pos;
                pos = _op.clone();
            }
    //scale
            if(options.scale != null) {
                var _os : Vector = options.scale;
                scale = _os.clone();
            }

    //scene
            _verbose('\tnon null options, checking for scene placement no_scene:' + options.no_scene + ' scene:' + options.scene);
                //if they haven't explicitly said "no scene management"
                //we add to the scene they requested, or the default scene otherwise
            var _should_add:Bool = true;

            if(options.no_scene != null) {
                if(options.no_scene == true) {
                    _should_add = false;
                    _verbose(" \tno_scene flag requested");
                }
            }

            if(options.parent != null) {

                _should_add = false;
                parent = options.parent;
                _verbose(" \tparent specified, not adding to scene only to parent :" + options.parent.name);

            }

            if(_should_add) {

                if(options.scene != null) {
                    scene = options.scene;
                    _verbose(" \tscene specified, storing in scene named : " + options.scene.name );
                } else {
                    scene = Luxe.scene;
                    _verbose(" \tno scene specified, adding to default scene");
                }

            } //_should_add

        } else {

            scene = Luxe.scene;

            _verbose(" \tadding to default scene because no options were specified.");

        } //options ! null


            //finally, add to the requested scene
        if(scene != null) {

            _verbose(" \tadding to scene " + scene.name);

            scene.add( this );

                //we also want to listen for scene events

        } else {
            _verbose(" \tnot adding to any scene.");
        }

        _verbose(" created " + name);

    } //new


//components


        /** attach a component to the entity */
    public function add<T:Component>( _component:T ) : T {
        return _components.add( _component );
    } //add

        /** remove a component from the entity */
    public function remove( _name:String ) : Bool {
        return _components.remove( _name );
    } //remove

        /** get a component from the entity, by name */
    public function get<T>(_name:String, ?_in_children:Bool = false ) : T {
        return _components.get( _name, _in_children );
    } //get

        /** get all component from the entity, by name */
    public function get_any<T>(_name:String, ?_in_children:Bool = false, ?_first_only:Bool = true ) : Array<T> {
        return _components.get_any( _name, _in_children, _first_only );
    } //get

        /** returns true if the entity has a component by the given name */
    public function has( _name:String ) : Bool {
        return _components.has( _name );
    } //has



//internal


    @:noCompletion public function _init() {

            //verbose debugging
        _verbose('${this} inside _init with options as $options' );


        init();
            //for any potential listeners, after the init() direct call
            //as there is likely connections made during init
        emit('init');

            //init all the components attached
        for(_component in components) {
            _verbose("          " + name + " calling init on component " + _component.name );
            _component.init();
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _verbose("         parent " + name + " calling init on child " + _child.name );
            _child._init();
        } //for each child

            //flag internally
        inited = true;

    } //_init

    @:noCompletion public function _reset(_) {

        _debug('calling reset on ' + name);

            //parent
        onreset();
            //potential listeners
        emit('reset');

        for(_component in components) {
            _verbose("          " + name + " calling reset on component " + _component.name );
            _component.onreset();
        } //for each component

            //now reset our children, so they do the same
        for(_child in children) {
            _child._reset(_);
            _debug("         parent " + name + " calling reset on child " + _child.name );
        } //for each child

            //start the fixed rate timer
        _start_fixed_rate_timer( fixed_rate );

            //flag internally
        started = true;

    } //_reset

        /** destroy this entity. removes it from the scene if any, from the parent etc. */
    public function destroy( ?_from_parent:Bool=false ) {

        _debug('destroy ' + name + ' with ' + children.length + ' children and ' + Lambda.count(components) + " components / " + id);

            //first destroy children
        for(_child in children) {
            _verbose('     calling destroy on child ' + _child.name);
            _child.destroy(true);
        } //for each child

            //clear the list
        children = null;
        children = [];

        for(_component in components) {
            _verbose("          " + name + " calling destroy on component " + _component.name );
            _component.onremoved();
            _component.ondestroy();
        } //for each component

            //tell listeners
        emit('destroy');
            //then parent
        ondestroy();

            //remove it from it's parent if any
        if(parent != null && !_from_parent) {
            _verbose("     removing " + name + "/" + id + " from parent " + parent.name + " / " + parent.id );
            parent._remove_child(this);
        }

            //kill any fixed rate timers
        _stop_fixed_rate_timer();

            //mark the flags
        destroyed = true;
        inited = false;
        started = false;

            //remove from the scene it's in if any
        _verbose( "     removing " + name + " / " + id + " from scene " + scene );

        if(scene != null) {
            scene.remove(this);
        }

            //kill the events
        if(events != null) {
            events.destroy();
            events = null;
        }

    } //destroy


    @:noCompletion public function _update(dt:Float) {

        if(destroyed) {
            _debug(" calling update AFTER DESTROYED on " + name + " / " + id );
            return;
        }

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling update on ' + name);

            //make sure transforms are resolved
        transform.clean_check();

            //update the parent first
        update(dt);

        if(events != null) {
                //update the events
            events.process();
        }

            //update all the components attached directly to us
        for(_component in components) {
            _component.update(dt);
        } //for each component

            //now update our children, so they do the same
        if(children.length > 0) {
            for(_child in children) {
                _child._update(dt);
            } //for each child
        }

    } //_update

//timing

    @:noCompletion public function _fixed_update() {

        if(destroyed) {
            return;
        }

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling fixedupdate on ' + name);

        emit('fixedupdate');

        onfixedupdate(fixed_rate);

        for(_component in components) {
            _component.onfixedupdate(fixed_rate);
        }

        for(_child in children) {
            _child._fixed_update();
        }

    } //_fixed_update

//events

    @:noCompletion public function _listen( _event:String, _handler:EmitHandler, ? _self:Bool=false ) {

        //this function is called when a component, or a subclass tries to override the onmousedown handler,
        //at which point it makes sure this entity is connected to the scene handlers, and then makes sure
        //that the calling component or this instance is connected to its own events to the requested handler

        //the duplication of events&handler combo is handled internally by Emitter, so we don't have to worry
        //todo: potential consolidation to avoid the switch here

        if( !_self){
            on(_event, _handler);
        }

        if(scene != null) {
            switch(_event) {

                case 'keyup'         : scene.on(_event, _keyup);
                case 'keydown'       : scene.on(_event, _keydown);
                case 'textinput'     : scene.on(_event, _textinput);

                case 'mousedown'     : scene.on(_event, _mousedown);
                case 'mouseup'       : scene.on(_event, _mouseup);
                case 'mousemove'     : scene.on(_event, _mousemove);
                case 'mousewheel'    : scene.on(_event, _mousewheel);

                case 'touchdown'     : scene.on(_event, _touchdown);
                case 'touchup'       : scene.on(_event, _touchup);
                case 'touchmove'     : scene.on(_event, _touchmove);

                case 'inputup'       : scene.on(_event, _inputup);
                case 'inputdown'     : scene.on(_event, _inputdown);

                case 'gamepaddown'   : scene.on(_event, _gamepaddown);
                case 'gamepadup'     : scene.on(_event, _gamepadup);
                case 'gamepadaxis'   : scene.on(_event, _gamepadaxis);
                case 'gamepaddevice' : scene.on(_event, _gamepaddevice);

            } //switch event
        }

    } //_listen

    @:noCompletion public function _unlisten( _event:String, _handler:EmitHandler, ?_self:Bool=false ) {

        if(!_self) {
            off(_event, _handler);
        }

    } //_unlisten


//scene

    function _detach_scene() {

        if(scene != null) {

            scene.off('reset', _reset);
            scene.off('destroy', destroy);

                //precaution
            scene.off('keyup', _keyup);
            scene.off('keydown', _keydown);
            scene.off('textinput', _textinput);
            scene.off('mousedown', _mousedown);
            scene.off('mouseup', _mouseup);
            scene.off('mousemove', _mousemove);
            scene.off('mousewheel', _mousewheel);
            scene.off('touchdown', _touchdown);
            scene.off('touchup', _touchup);
            scene.off('touchmove', _touchmove);
            scene.off('inputup', _inputup);
            scene.off('inputdown', _inputdown);
            scene.off('gamepaddown', _gamepaddown);
            scene.off('gamepadup', _gamepadup);
            scene.off('gamepadaxis', _gamepadaxis);
            scene.off('gamepaddevice', _gamepaddevice);

        } //scene != null

    } //detach_scene

    function _attach_scene() {

        if(scene != null) {
            scene.on('reset', _reset);
            scene.on('destroy', destroy);
        }

    } //attach_scene

//Keys

    @:noCompletion public function _keyup( _event:KeyEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _keyup on ' + name);

        onkeyup(_event);
        emit('keyup', _event);

    } //_keyup

    @:noCompletion public function _keydown( _event:KeyEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _keydown on ' + name);

        onkeydown(_event);
        emit('keydown', _event);

    } //_keydown

    @:noCompletion public function _textinput( _event:TextEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _textinput on ' + name);

        ontextinput(_event);
        emit('textinput', _event);

    } //_textinput


//Mouse

    @:noCompletion public function _mousedown( _event:MouseEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _mousedown on ' + name );

        onmousedown(_event);
        emit('mousedown', _event);

    } //_mousedown


    @:noCompletion public function _mouseup( _event:MouseEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _mouseup on ' + name);

        onmouseup(_event);
        emit('mouseup', _event);

    } //_mouseup

    @:noCompletion public function _mousewheel( _event:MouseEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _mousewheel on ' + name);

        onmousewheel(_event);
        emit('mousewheel', _event);

    } //_mousewheel

    @:noCompletion public function _mousemove( _event:MouseEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _mousemove on ' + name);

        onmousemove(_event);
        emit('mousemove', _event);

    } //_mousemove

//Touch
    @:noCompletion public function _touchdown( _event:TouchEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _touchdown on ' + name);

        ontouchdown(_event);
        emit('touchdown', _event);

    } //_touchdown

    @:noCompletion public function _touchup( _event:TouchEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _touchup on ' + name);

        ontouchup(_event);
        emit('touchup', _event);

    } //_touchup

    @:noCompletion public function _touchmove( _event:TouchEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _touchmove on ' + name);

        ontouchmove(_event);
        emit('touchmove', _event);

    } //_touchmove

//Gamepad
    @:noCompletion public function _gamepadaxis( _event:GamepadEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _gamepadaxis on ' + name);

        ongamepadaxis(_event);
        emit('gamepadaxis', _event);

    } //_gamepadaxis

    @:noCompletion public function _gamepaddown( _event:GamepadEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _gamepaddown on ' + name);

        ongamepaddown(_event);
        emit('gamepaddown', _event);

    } //_gamepaddown

    @:noCompletion public function _gamepadup( _event:GamepadEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _gamepadup on ' + name);

        ongamepadup(_event);
        emit('gamepadup', _event);

    } //_gamepadup

    @:noCompletion public function _gamepaddevice( _event:GamepadEvent ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _gamepaddevice on ' + name);

        ongamepaddevice(_event);
        emit('gamepaddevice', _event);

    } //_gamepaddevice

//Input

    @:noCompletion public function _inputdown( _event : { name:String, event:InputEvent } ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _inputdown on ' + name);

        oninputdown(_event.name, _event.event);
        emit('inputdown', _event);

    } //_inputdown

    @:noCompletion public function _inputup( _event : { name:String, event:InputEvent } ) {

        if(!active || !inited || !started) {
            return;
        }

        _debug('calling _inputup on ' + name);

        oninputup(_event.name, _event.event);
        emit('inputup', _event );

    } //_inputup


//timing

    function get_fixed_rate() : Float {

        return fixed_rate;

    } //get_fixed_rate

    function set_fixed_rate( _rate:Float ) : Float {

        fixed_rate = _rate;

        _stop_fixed_rate_timer();
        _start_fixed_rate_timer( _rate );

        return fixed_rate;

    } //set_fixed_rate

    function _stop_fixed_rate_timer() {
        if(fixed_rate_timer != null) {
            fixed_rate_timer.stop();
            fixed_rate_timer = null;
        }
    } //_stop_fixed_rate_timer

    function _start_fixed_rate_timer( _rate:Float ) {
            //only top tier entities call this, all their children are fixed under the parent rate
            //for now, that is.
        if(_rate != 0 && parent == null && !destroyed) {
            fixed_rate_timer = new snow.utils.Timer( _rate );
            fixed_rate_timer.run = _fixed_update;
        } //_rate

    } //_start_fixed_rate_timer

//components

    function get_components() {
        return _components.components;
    } //get_components

//children

    @:noCompletion public function _add_child( child:Entity ) {

        children.push(child);

        _debug( '' + name + " : add child : " + child.name );

            //children inherit the updates and such from the parent, so they shouldn't be in the root of the scene
        if(child.scene != null) {
            _debug( '' + name + " add child " + child.name + " being parented, removing from scene root of " + child.scene.name);
            var removed = child.scene.remove( child );
        } else {
            _debug('' + name + " add child " + child.name + " being parented, but not from a scene");
        }

    } //_add_child

        //internal function do not use directly
    @:noCompletion public function _remove_child(child:Entity) {

        children.remove(child);

    } //removeChild

//listeners

    function set_pos_from_transform( _pos:Vector ) {

            //and we have to propogate the values to the components
        for(_component in components) {
            _component.entity_pos_change( _pos );
        } //for each _component

    } //set_pos_from_transform

    function set_rotation_from_transform( _rotation:Quaternion ) {

            //and we have to propogate the values to the components
        for(_component in components) {
            _component.entity_rotation_change( _rotation );
        } //for each _component

    } //set_rotation_from_transform

    function set_scale_from_transform( _scale:Vector ) {

            //and we have to propogate the values to the components
        for(_component in components) {
            _component.entity_scale_change( _scale );
        } //for each _component

    } //set_scale_from_transform

    function set_origin_from_transform( _origin:Vector ) {

            //and we have to propogate the values to the components
        for(_component in components) {
            _component.entity_origin_change( _origin );
        } //for each _component

    } //set_origin_from_transform

    function set_parent_from_transform( _parent:Transform ) {

            //and we have to propogate the values to the components
        for(_component in components) {
            _component.entity_parent_change( _parent );
        } //for each _component

    } //set_parent_from_transform

//pos

    function set_pos(_p:Vector) {

        return transform.pos = _p;

    } //set_pos

    function get_pos() {

        return transform.pos;

    } //get_pos

//rotation

    function set_rotation( _r:Quaternion ) {

        return transform.rotation = _r;

    } //set_rotation

    function get_rotation() {

        return transform.rotation;

    } //get_rotation

//scale

    function set_scale( _s:Vector ) {

        return transform.scale = _s;

    } //set_scale

    function get_scale() {

        return transform.scale;

    } //get_scale

//origin

    function set_origin( _origin:Vector ) {

        return transform.origin = _origin;

    } //set_origin


    function get_origin() {

        return transform.origin;

    } //get_origin

//parent

    function set_parent( other:Entity ) {

        _debug('>>  ' + name + ' calling set parent to ' + (other == null ? 'null' : other.name) );

            //if we are parented already,
            //remove ourselves from that parent
        if(parent != null) {
            parent._remove_child( this );
        } //remove

            //store the new parent, even if it's null, that is ok
        parent = other;

            //and if we are not detaching parent using null
            //we add it to the parent directly and update its transform
        if(parent != null) {
            parent._add_child(this);
            transform.parent = parent.transform;
        } else {
            transform.parent = null;
        }

        return parent;

    } //set_parent

    function get_parent() {

        return parent;

    } //get_parent

//scene

    function set_scene(_scene:Scene) {

        _detach_scene();

            scene = _scene;

        _attach_scene();

        return scene;

    } //set_scene

    function get_scene() {

        return scene;

    } //get_scene

//active

    function set_active(_active:Bool) : Bool {

        return active = _active;

    } //set_active

    function get_active() {

        return active;

    } //get_active

} //Entity

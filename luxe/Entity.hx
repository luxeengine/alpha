package luxe;

import luxe.Quaternion;
import luxe.Transform;
import luxe.Matrix;

import luxe.Input;
import luxe.Vector;
import luxe.Scene;
import luxe.components.Components;
import luxe.Component;

import luxe.options.EntityOptions;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;
import luxe.Log._verboser;

class Entity extends Objects {


    public var components (get,never) : Map<String, Component>;
    public var events : luxe.Events;
    public var children : Array<Entity>;

        ////whether or not this entity has been destroyed
    public var _destroyed : Bool = false;
        //whether or not this entity has been inited yet
    public var inited : Bool = false;
        //whether or not this entity has been started
    public var started : Bool = false;
        //whether or not this should be serialized
    public var serialize : Bool = true;

        //The fixed rate timer if any
    @:isVar public var fixed_rate       (get,set) : Float = 0;
        //The parent entity if any, set to null for no parent
    @:isVar public var parent           (get,set) : Entity;
        //if the entity is in a scene, this is not null
    @:isVar public var scene            (get,set) : Scene;
        //if the entity is active in the scene or not
    @:isVar public var active           (get,set) : Bool = true;

        //The spatial transform of the entity
    public var transform : Transform;
        //The local position of the transform
    public var pos              (get,set) : Vector;
        //The local rotation of the transform
    public var rotation         (get,set) : Quaternion;
        //The local scale of the transform
    public var scale            (get,set) : Vector;
        //The local origin of the transform
    public var origin           (get,set) : Vector;

        //the system for the entity
    var _components : Components;
        //the timer for the fixed update
    var fixed_rate_timer : haxe.Timer;
        //the options passed in for giving to the init function
    var options : Dynamic;

    public function new<T>( ?_options:EntityOptions<T> ) {

        super();

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

        name = 'entity.' + id; //default to the entity id

        if(options != null) {

    //name
            if(options.name != null) {
                name = options.name;
            }

    //position
            if(options.pos != null) {
                pos = options.pos.clone();
            }
    //scale
            if(options.scale != null) {
                scale = options.scale.clone();
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
        } else {
            _verbose(" \tnot adding to any scene.");
        }

        _verbose(" created " + name);

    } //new

    @:noCompletion public function _init() {

            //verbose debugging
        _verbose('${this} inside _init with options as $options' );

            //init the parent first
        _call(this, 'init', [ (options == null) ? null : cast options.init_with ]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _verbose("          " + name + " calling init on component " + _component.name );
            _call(_component, '_init');
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _verbose("         parent " + name + " calling init on child " + _child.name );
            _child._init();
        } //for each child

            //flag internally
        inited = true;

    } //_init

    @:noCompletion public function _reset() {

        _verbose('calling reset on ' + name);

            //reset the parent first
        _call(this, 'reset');

            //reset all the components attached directly to us
        for(_component in components) {
            _verbose("         " + name + " calling reset on component " + _component.name );
            _call(_component, 'reset');
        } //for each component

            //now reset our children, so they do the same
        for(_child in children) {
            _child._reset();
            _verbose("         parent " + name + " calling reset on child " + _child.name );
        } //for each child

            //start the fixed rate timer
        _start_fixed_rate_timer( fixed_rate );

            //flag internally
        started = true;

    } //_reset

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

            //destroy all the components attached directly to us
        for(_component in components) {
            _call(_component, 'destroyed');
        } //for each component

            //destroy the actual one last
        _call(this, 'destroyed');

            //remove it from it's parent if any
        if(parent != null && !_from_parent) {
            _verbose("     removing " + name + "/" + id + " from parent " + parent.name + " / " + parent.id );
            parent._remove_child(this);
        }

            //kill any fixed rate timers
        _stop_fixed_rate_timer();

            //mark the flags
        _destroyed = true;
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

//Keys

    @:noCompletion public function _onkeyup(e:KeyEvent) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _onkeyup on ' + name);

            //init the parent first
        _call(this, 'onkeyup', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'onkeyup', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._onkeyup(e);
        } //for each child

    } //_onkeyup

    @:noCompletion public function _onkeydown(e:KeyEvent) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _onkeydown on ' + name);

            //init the parent first
        _call(this, 'onkeydown', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'onkeydown', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._onkeydown(e);
        } //for each child

    } //_onkeydown

//Mouse

    @:noCompletion public function _onmousedown(e:MouseEvent) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _onmousedown on ' + name );

            //init the parent first
        _call(this, 'onmousedown', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'onmousedown', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._onmousedown(e);
        } //for each child

    } //_onmousedown


    @:noCompletion public function _onmouseup(e:MouseEvent) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _onmouseup on ' + name);

            //init the parent first
        _call(this, 'onmouseup', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'onmouseup', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._onmouseup(e);
        } //for each child

    } //_onmouseup

    @:noCompletion public function _onmousewheel(e:MouseEvent) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _onmousewheel on ' + name);

            //init the parent first
        _call(this, 'onmousewheel', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'onmousewheel', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._onmousewheel(e);
        } //for each child

    } //_onmousewheel

    @:noCompletion public function _onmousemove(e:MouseEvent) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _onmousemove on ' + name);

            //init the parent first
        _call(this, 'onmousemove', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'onmousemove', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._onmousemove(e);
        } //for each child

    } //_onmousemove

//Touch
    @:noCompletion public function _ontouchbegin(e:TouchEvent) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _ontouchbegin on ' + name);

            //init the parent first
        _call(this, 'ontouchbegin', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'ontouchbegin', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._ontouchbegin(e);
        } //for each child

    } //_ontouchbegin

    @:noCompletion public function _ontouchend(e:TouchEvent) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _ontouchend on ' + name);

            //init the parent first
        _call(this, 'ontouchend', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'ontouchend', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._ontouchend(e);
        } //for each child

    } //_ontouchend

    @:noCompletion public function _ontouchmove(e:TouchEvent) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _ontouchmove on ' + name);

            //init the parent first
        _call(this, 'ontouchmove', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'ontouchmove', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._ontouchmove(e);
        } //for each child

    } //_ontouchmove

//Gamepad
    @:noCompletion public function _ongamepadaxis(e) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _ongamepadaxis on ' + name);

            //init the parent first
        _call(this, 'ongamepadaxis', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'ongamepadaxis', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._ongamepadaxis(e);
        } //for each child

    } //_ongamepadaxis

    @:noCompletion public function _ongamepadball(e) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _ongamepadball on ' + name);

            //init the parent first
        _call(this, 'ongamepadball', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'ongamepadball', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._ongamepadball(e);
        } //for each child

    } //_ongamepadball

    @:noCompletion public function _ongamepadhat(e) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _ongamepadhat on ' + name);

            //init the parent first
        _call(this, 'ongamepadhat', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'ongamepadhat', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._ongamepadhat(e);
        } //for each child

    } //_ongamepadhat

    @:noCompletion public function _ongamepadbuttondown(e) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _ongamepadbuttondown on ' + name);

            //init the parent first
        _call(this, 'ongamepadbuttondown', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'ongamepadbuttondown', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._ongamepadbuttondown(e);
        } //for each child

    } //_ongamepadbuttondown

    @:noCompletion public function _ongamepadbuttonup(e) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _ongamepadbuttonup on ' + name);

            //init the parent first
        _call(this, 'ongamepadbuttonup', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'ongamepadbuttonup', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._ongamepadbuttonup(e);
        } //for each child

    } //_ongamepadbuttonup

//Input

    @:noCompletion public function _oninputdown(_name:String, e:InputEvent) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _oninputdown on ' + name);

            //init the parent first
        _call(this, 'oninputdown', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'oninputdown', [_name, e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._oninputdown(_name, e);
        } //for each child

    } //_oninputdown

    @:noCompletion public function _oninputup(_name:String, e:InputEvent) {

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling _oninputup on ' + name);

            //init the parent first
        _call(this, 'oninputup', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'oninputup', [_name, e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _child._oninputup(_name, e);
        } //for each child

    } //_oninputup


    @:noCompletion public function _update(dt:Float) {

        if(_destroyed) {
            _debug(" calling update AFTER DESTROYED on " + name + " / " + id );
            return;
        }

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling update on ' + name);

            //update the parent first
        _call(this, 'update', [dt]);

        if(events != null) {
                //update the events
            events.process();
        }

            //update all the components attached directly to us
        for(_component in components) {
            _call(_component, 'update', [dt]);
        } //for each component

            //now update our children, so they do the same
        for(_child in children) {
            _child._update(dt);
        } //for each child

    } //_update

//timing

    @:noCompletion public function _fixed_update() {

            //Not allowed post destroy
        if(_destroyed) {
            return;
        }

        if(!active || !inited || !started) {
            return;
        }

        _verboser('calling fixed_update on ' + name);

            //fixed_update the parent first
        _call(this, 'fixed_update');

            //fixed_update all the components attached directly to us
        for(_component in components) {
            _call(_component, 'fixed_update');
        } //for each component

            //now fixed_update our children, so they do the same
        for(_child in children) {
            _child._fixed_update();
        } //for each child

    } //_fixed_update

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
        if(_rate != 0 && parent == null && !_destroyed) {
            fixed_rate_timer = new haxe.Timer( Std.int(_rate*1000) );
            fixed_rate_timer.run = _fixed_update;
        } //_rate

    } //_start_fixed_rate_timer

//components

    public function add<T1,T2>(type:Class<T1>, ?_name:String='', ?_data:T2 ) : T1 {
        return _components.add( type, _name, _data );
    } //add

    public function remove<T>(?_name:String='', ?_data:T ) : Bool {
        return _components.remove( _name, _data );
    } //remove

    public function get<T>(_name:String, ?_in_children:Bool = false ) : T {
        return _components.get( _name, _in_children );
    } //get

    public function get_any<T>(_name:String, ?_in_children:Bool = false, ?_first_only:Bool = true ) : Array<T> {
        return _components.get_any( _name, _in_children, _first_only );
    } //get

    public function has( _name:String ) : Bool {
        return _components.has( _name );
    } //has

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

        return scene = _scene;

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


//serialization


    public function get_serialize_data() : Dynamic {

        var _type = Type.getClassName(Type.getClass(this));

        return {
            entity : id,
            name : name,
            type : _type,
            count_children : children.length,
            count_components : Lambda.count(components),
            pos : pos.serialized,
            rotation : rotation.serialized,
            scale : scale.serialized
        };
    } //get_serialize_data

#if luxe_native
        //save me and all my children and components to disk
    public function serialize_to_disk(_destination_path:String, _parent_write:Bool=false) : Void {

        if(!serialize) return;
        if(parent != null && !_parent_write) return;

        var _type = Type.getClassName(Type.getClass(this));
        var _name_string = name ;//+ '.' +  id.substring(0,8);
        var _destpath = _destination_path + _name_string;

            //create the path folder
        sys.FileSystem.createDirectory(_destpath);

            //work out the meta file
         var _destfile = _destpath + '/' + _name_string + '.' + _type + '.json';

        var _data : Dynamic = get_serialize_data();

        var _file : sys.io.FileOutput = sys.io.File.write( _destfile, false);
            _file.writeString( luxe.utils.JSON.encode(_data) );
            _file.close();

            //write the children and their components
        var _children_path = _destpath + '/children/';

        sys.FileSystem.createDirectory(_children_path);

        for(child in children) {
            child.serialize_to_disk(_children_path, true);
        }

        var _component_path = _destpath + '/components/';

            //now write the components
        sys.FileSystem.createDirectory( _component_path );

            //tell the components to write
        for(component in components) {
            component.serialize_to_disk(_component_path);
        }

    }
#end //luxe_native

} //Entity

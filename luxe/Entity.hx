package luxe;

import luxe.Input.MouseEvent;
import phoenix.Matrix4;

import luxe.Vector;
import luxe.Scene;
import luxe.components.Components;

//Objects -> Entity
class Entity extends Objects {

	public var components(get,never) : Map<String, Component>;
	private var _components : Components;

    public var events : luxe.Events;
    public var children : Array<Entity>;
    
    @:isVar public var fixed_rate (get,set) : Float = 0;

    var fixed_rate_timer : haxe.Timer;

    var _destroyed : Bool = false;
    public var inited : Bool = false;
    public var started : Bool = false;

    	//The parent entity if any, set to null for no parent
    @:isVar public var parent   		(get,set) : Entity;
    	//absolute position in world space
    @:isVar public var pos      		(get,set) : Vector;
    	//relative position to parent 
    @:isVar public var posRelative  	(get,set) : Vector;
        //absolute rotation in world space
    @:isVar public var rotation         (get,set) : Vector;
        //relative rotation to parent 
    @:isVar public var rotationRelative (get,set) : Vector;
    	//absolute scale in world space
    @:isVar public var scale 		    (get,set) : Vector;
    	//relative scale to parent 
    @:isVar public var scaleRelative    (get,set) : Vector;
        //if the entity is in a scene
    @:isVar public var scene            (get,set) : Scene;


    public var serialize : Bool = true;

    private var _last_scale:Vector;

    public function new() {

    	super();

    	name = 'Entity';
    	
    	_components = new Components( this );
    	children = new Array<Entity>();
		events = new luxe.Events();

			//transform
		pos = new Vector();
		posRelative = new Vector();
        rotation = new Vector();
        rotationRelative = new Vector();
        _last_scale = new Vector(1,1,1);
        scale = new Vector(1,1,1);
		scaleRelative = new Vector(1,1,1);

			//init events
		events.startup();

    } //new

	public function _init() {

		_debug('calling init on ' + name);

			//init the parent first
		_call(this, 'init');

		if(name == null) throw "name on entity is null? " + this;

			//init all the components attached directly to us
		for(_component in components) {
			_call(_component, 'init');
		} //for each component

			//now init our children, so they do the same
		for(_child in children) {
			_call(_child, '_init');
		} //for each child

            //flag internally
        inited = true;

	} //_init

    public function _onmousedown(e:MouseEvent) {

        _debug('calling _onmousedown on ' + name);

            //init the parent first
        _call(this, 'onmousedown', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'onmousedown', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _call(_child, '_onmousedown', [e]);
        } //for each child

    } //_onmousedown

    public function _onmouseup(e:MouseEvent) {

        _debug('calling _onmouseup on ' + name);

            //init the parent first
        _call(this, 'onmouseup', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'onmouseup', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _call(_child, '_onmouseup', [e]);
        } //for each child

    } //_onmouseup    

    public function _onmousemove(e:MouseEvent) {

        _debug('calling _onmousemove on ' + name);

            //init the parent first
        _call(this, 'onmousemove', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'onmousemove', [e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _call(_child, '_onmousemove', [e]);
        } //for each child

    } //_onmousemove

    public function _oninputdown(_name:String,e:Dynamic) {

        _debug('calling _oninputdown on ' + name);

            //init the parent first
        _call(this, 'oninputdown', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'oninputdown', [_name, e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _call(_child, '_oninputdown', [_name, e]);
        } //for each child

    } //_oninputdown

    public function _oninputup(_name:String,e:Dynamic) {

        _debug('calling _oninputup on ' + name);

            //init the parent first
        _call(this, 'oninputup', [e]);

        if(name == null) throw "name on entity is null? " + this;

            //init all the components attached directly to us
        for(_component in components) {
            _call(_component, 'oninputup', [_name, e]);
        } //for each component

            //now init our children, so they do the same
        for(_child in children) {
            _call(_child, '_oninputup', [_name, e]);
        } //for each child

    } //_oninputup

	public function _start() {

		_debug('calling start on ' + name);

			//start the parent first
		_call(this, 'start');

			//start all the components attached directly to us
		for(_component in components) {
			_call(_component, 'start');
		} //for each component

			//now start our children, so they do the same
		for(_child in children) {
			_call(_child, '_start');
		} //for each child

            //start the fixed rate timer
		_start_fixed_rate_timer( fixed_rate );

            //flag internally
        started = true;

	} //_start

	public function _destroy() {

			//first destroy children
		for(_child in children) {
			_call(_child, '_destroy');
		} //for each child

			//destroy all the components attached directly to us
		for(_component in components) {
			_call(_component, 'destroy');
		} //for each component

		_debug('calling destroy on ' + name);

			//destroy the parent last
		_call(this, 'destroy');

            //kill any fixed rate timers
        _stop_fixed_rate_timer();

			//mark the flag
		_destroyed = true;

			//kill the events
		events.shutdown();

	} //_start

	public function _update(dt:Float) {

		_debug('calling update on ' + name);

			//update the parent first
		_call(this, 'update', [dt]);

			//update the events
		events.process();

			//update all the components attached directly to us
		for(_component in components) {
			_call(_component, 'update', [dt]);
		} //for each component

			//now update our children, so they do the same
		for(_child in children) {
			_call(_child, '_update', [dt]);
		} //for each child

	} //_update

	public function _fixed_update() {

			//Not allowed post destroy
		if(_destroyed) return;

		_debug('calling fixed_update on ' + name);

			//fixed_update the parent first
		_call(this, 'fixed_update');

			//fixed_update all the components attached directly to us
		for(_component in components) {
			_call(_component, 'fixed_update');
		} //for each component

			//now fixed_update our children, so they do the same
		for(_child in children) {
			_call(_child, '_fixed_update');
		} //for each child

	} //_fixed_update

    private function get_fixed_rate() : Float {
        return fixed_rate;
    } //get_fixed_rate

    private function set_fixed_rate( _rate:Float ) : Float {

        fixed_rate = _rate;

        _stop_fixed_rate_timer();
        _start_fixed_rate_timer( _rate );

        return fixed_rate;
    } //set_fixed_rate

    private function _stop_fixed_rate_timer() {
        if(fixed_rate_timer != null) {
            fixed_rate_timer.stop();
            fixed_rate_timer = null;
        }
    } //_stop_fixed_rate_timer

    private function _start_fixed_rate_timer( _rate:Float ) {
            //only top tier entities call this, all their children are fixed under the parent rate
            //for now, that is.
        if(_rate != 0 && parent == null && !_destroyed) {
            fixed_rate_timer = new haxe.Timer( Std.int(_rate*1000) );
            fixed_rate_timer.run = _fixed_update;
        } //_rate

    } //_start_fixed_rate_timer

    public function add<T>(type:Class<T>, ?_name:String='') : T {
    	return _components.add( type, _name );
    } //add

    public function get(_name:String, ?_in_children:Bool = false, ?_first_only:Bool = true ) : Dynamic {
    	return _components.get( _name, _in_children, _first_only );
    } //get

    public function has( _name:String ) : Bool {
    	return _components.has( _name );
    } //has

    private function get_components() {
    	return _components.components;
    } //get_components

    public function add_child(child:Entity) {

    	children.push(child);

    } //addChild

    public function remove_child(child:Entity) {

    	children.remove(child);

    } //removeChild

    private function set_posRelative(_p:Vector) { 

    	if(parent == null) {
    			//when setting the relative position and we have no parent,
    			//it will instead just change our absolute position
    		pos = _p.clone();

    			//apply
    		return posRelative = _p;

    	} else {
    			//if we do have a parent, it needs to affect our position
    			//based on where the parent is sitting
    		pos = Vector.Add( parent.pos, _p );
    			//apply
    		return posRelative = _p; 
    	}

    } //set_posRelative

    private function set_rotationRelative( _r:Vector ) { 

        if(parent == null) {
                //when setting the relative rotation and we have no parent,
                //it will instead just change our absolute rotation
            rotation = _r.clone();

                //apply
            return rotationRelative = _r;

        } else {
                //if we do have a parent, it needs to affect our rotation
                //based on where the parent is sitting
            rotation = Vector.Add( parent.rotation, _r );
                //apply
            return rotationRelative = _r; 
        }

    } //set_posRelative    

    private function set_scaleRelative( _s:Vector ) { 

    	if(parent == null) {
    			//when setting the relative scale and we have no parent,
    			//it will instead just change our absolute scale
    		scale = _s.clone();

    			//apply
    		return scaleRelative = _s;

    	} else {
    			//if we do have a parent, it needs to affect our scale
    			//based on where the parent is sitting
    		scale = Vector.Add( parent.scale, _s );
    			//apply
    		return scaleRelative = _s; 
    	}

    } //set_posRelative    

    private function set_pos(_p:Vector) { 
        
    		//if we have a parent, we adjust our relative position to match
    	if(parent != null) {
    		posRelative.set( _p.x - parent.pos.x, _p.y - parent.pos.y, _p.z - parent.pos.z );
    	}

    		//update the value before we propogate
    	pos = _p; 

    		//if we have children we must propogate the change to them
    	for(child in children) {
    		child.internal_parent_pos_changed( pos );
    	}

            //and we have to propogate the values to the components
        for(_component in components) {
            _component.entity_pos_change( pos );
        } //for each _component

        _attach_listener( pos, _pos_change );

    	return pos; 
    } //set_pos

    private function set_rotation( _r:Vector ) { 

    		//if we have a parent, we adjust our relative rotation to match
    	if(parent != null) {
    		rotationRelative.set( _r.x - parent.rotation.x, _r.y - parent.rotation.y, _r.z - parent.rotation.z );
    	}

    		//update the value before we propogate
    	rotation = _r; 

    		//if we have children we must propogate the change to them
    	for(child in children) {
    		child.internal_parent_rotation_changed( rotation );
    	} //child

            //and we have to propogate the values to the components
        for(_component in components) {
            _component.entity_rotation_change( rotation );
        } //for each _component

            //attach each component
        _attach_listener( rotation, _rotation_change );

    	return rotation; 

    } //set_rotation

    private function set_scale( _s:Vector ) { 

            //if we have a parent, we adjust our relative scale to match
        if(parent != null) {
            scaleRelative.set( _s.x - parent.scale.x, _s.y - parent.scale.y, _s.z - parent.scale.z );
        }

            //update the value before we propogate
        scale = _s;
        _last_scale = scale.clone();        

            //if we have children we must propogate the change to them
        for(child in children) {
            child.internal_parent_scale_changed( scale );
        } //child

            //and we have to propogate the values to the components
        for(_component in components) {
            _component.entity_scale_change( scale );
        } //for each _component

            //attach each component
        _attach_listener( scale, _scale_change );

        return scale; 

    } //set_scale

    public function internal_parent_pos_changed(_parent_pos:Vector) {
    		//our position is updated as parent_pos+relativePos
    	pos = _parent_pos.clone().add( posRelative );

    }//internal_parent_pos_changed

    public function internal_parent_rotation_changed(_parent_rotation:Vector) {
            //our rotation is updated as parent_rotation+relative
        rotation = _parent_rotation.clone().add( rotationRelative );

    }//internal_parent_pos_changed

    public function internal_parent_scale_changed(_parent_scale:Vector) {
    		//our scale is updated as parent_scale+relative
    	scale = _parent_scale.clone().add( scaleRelative );

    }//internal_parent_pos_changed

    private function set_parent(other:Entity) {

    		//if we are parented already, remove ourselves
    	if(parent != null) {
    		parent.remove_child(this);
    	} //remove

    	parent = other;

    		//detaching parent
    	if(parent == null) {

    		pos = pos.clone();
    		rotation = rotation.clone();

    	} else {

    			//update absolute position
    		pos = parent.pos.clone().add( posRelative );
    			//update relative rotation
    		rotation = parent.rotation.clone().add( rotationRelative );
    			//add to parent as a child
    		parent.add_child(this);

    	} 

    	return parent;

    } //set_parent

    private function get_pos() { return pos; }                              //get_pos
    private function get_rotation() { return rotation; }                    //get_rotation
    private function get_scale() { return scale; }                          //get_scale
    
    private function get_scene() { return scene; }                          //get_scene
    private function set_scene(_scene:Scene) { return scene = _scene; }     //set_scene

    private function get_posRelative() { return posRelative; }              //get_posRelative
    private function get_rotationRelative() { return rotationRelative; }    //get_rotationRelative
    private function get_scaleRelative() { return scaleRelative; }          //get_scaleRelative

    private function get_parent() { return parent; }                        //get_parent

//Spatial transforms

        //An internal callback for when x y or z on a transform changes
    private function _pos_change(_v:Float) { this.set_pos(pos); }
        //An internal callback for when x y or z on a transform changes
    private function _scale_change(_v:Float) { this.set_scale(scale); }
        //An internal callback for when x y or z on a transform changes
    private function _rotation_change(_v:Float) { this.set_rotation(rotation); }

        //An internal function to attach position 
        //changes to a vector, so we can listen for `pos.x` as well
    private function _attach_listener( _v : Vector, listener ) {
        // trace('attaching listener');
        _v.listen_x = listener; 
        _v.listen_y = listener; 
        _v.listen_z = listener;
    } //_attach_listener

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

        //save me and all my children and components to disk
    public function serialize_to_disk(_destination_path:String) {

        if(!serialize) return;
        
        var _type = Type.getClassName(Type.getClass(this));
        var _destfile = _destination_path + 'entity.' + name + '.' + _type + '.json';

        var _data : Dynamic = get_serialize_data();

        var _file : sys.io.FileOutput = sys.io.File.write( _destfile, false);
            _file.writeString( luxe.utils.JSON.encode(_data) );
            _file.close();

    }

} //Entity
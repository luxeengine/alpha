package luxe;

import phoenix.Matrix4;

import luxe.Vector;
import luxe.components.Components;

//Objects -> Entity
class Entity extends Objects {

	public var components(get,never) : Map<String, Component>;
	private var _components : Components;

    public var events : luxe.Events;
    public var children : Array<Entity>;
    public var fixed_rate : Float = 0.0167;

    var _destroyed : Bool = false;

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

    private var _last_scale:Vector;

    public function new() {

    	super();

    	name = 'Entity';
    	
    	_components = new Components( this );
    	children = new Array<Entity>();
		events = new luxe.Events( Luxe.core );

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

	} //_init

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

			//once we have started everything we can create out fixed rate update
			//but only top tier objects call this, all their children are fixed under the parent rate
			//for now, that is.
		if(fixed_rate != 0 && parent == null && !_destroyed) {
	    	haxe.Timer.delay( _fixed_update, Std.int(fixed_rate*1000) );
	    } //fixed_rate		

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

			//only root objects call the fixed update loop
		if(fixed_rate != 0 && parent == null && !_destroyed) {
	    	haxe.Timer.delay( _fixed_update, Std.int(fixed_rate*1000) );
	    } //fixed_rate

	} //_fixed_update

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

    public function addChild(child:Entity) {

    	children.push(child);

    } //addChild

    public function removeChild(child:Entity) {

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
        // trace('should apply listener now');
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
    		parent.removeChild(this);
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
    		parent.addChild(this);

    	} 

    	return parent;

    } //set_parent

    private function get_pos() { return pos; }                              //get_pos
    private function get_rotation() { return rotation; }                    //get_rotation
    private function get_scale() { return scale; }                          //get_scale

    private function get_posRelative() { return posRelative; }              //get_posRelative
    private function get_rotationRelative() { return rotationRelative; }    //get_rotationRelative
    private function get_scaleRelative() { return scaleRelative; }          //get_scaleRelative

    private function get_parent() { return parent; }                        //get_parent

//Spatial transforms

        //An internal callback for when x y or z on a transform changes
    private function _pos_change(_v:Float) { this.set_pos(pos); }
        //An internal callback for when x y or z on a transform changes
    private function _scale_change(_v:Float) { this.set_scale(scale); 
        // trace('changing scale in entity ' + _v); 
        // untyped __js__('console.log("TTT")');
    }
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

} //Entity
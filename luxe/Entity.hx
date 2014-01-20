package luxe;

import luxe.Input.MouseEvent;
import luxe.Input.KeyEvent;
import luxe.Input.TouchEvent;

import phoenix.Matrix4;

import luxe.Vector;
import luxe.Scene;
import luxe.components.Components;

//Objects -> Entity
class Entity extends Objects {

	public var components (get,never) : Map<String, Component>;
	private var _components : Components;

    public var events : luxe.Events;
    public var children : Array<Entity>;
    
    @:isVar public var fixed_rate (get,set) : Float = 0;

    var fixed_rate_timer : haxe.Timer;

    public var _destroyed : Bool = false;
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

    	name = 'entity.' + id;
    	
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

    } //new

	@:noCompletion public function _init() {		

			//init the parent first
		_call(this, 'init');

		if(name == null) throw "name on entity is null? " + this;

			//init all the components attached directly to us
		for(_component in components) {
            _debug("\t entity " + name + " calling init on component " + _component.name );
			_call(_component, '_init');
            _debug('\t- ');
		} //for each component

			//now init our children, so they do the same
		for(_child in children) {
            _debug("\t parent " + name + " calling init on child " + _child.name );
			_child._init();
		} //for each child

            //flag internally
        inited = true;

	} //_init

	@:noCompletion public function _reset() {

		_debug('calling reset on ' + name, true);

			//reset the parent first
		_call(this, 'reset');

			//reset all the components attached directly to us
		for(_component in components) {
			_call(_component, 'reset');
		} //for each component

			//now reset our children, so they do the same
		for(_child in children) {
			_child._reset();
		} //for each child

            //start the fixed rate timer
		_start_fixed_rate_timer( fixed_rate );

            //flag internally
        started = true;

	} //_reset

	public function destroy() {

        _debug('calling destroy on ' + name + ' with ' + children.length + ' children and ' + Lambda.count(components) + " components / " + id);

			//first destroy children
		for(_child in children) {
            _debug('\t calling destroy on child ' + _child.name);
			_child.destroy();
		} //for each child
        
			//destroy all the components attached directly to us
		for(_component in components) {
			_call(_component, 'destroyed');
		} //for each component

			//destroy the actual one last
		_call(this, 'destroyed');

            //remove it from it's parent if any
        if(parent != null) {
            _debug("\t removing " + name + "/" + id + " from parent " + parent.name + " / " + parent.id );
            parent.remove_child(this);
        }

            //kill any fixed rate timers
        _stop_fixed_rate_timer();

			//mark the flag
		_destroyed = true;

            //remove from the scene it's in if any
        _debug( "removing " + name + " / " + id + " from scene " + scene );

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

        _debug('calling _onkeyup on ' + name, true);

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

        _debug('calling _onkeydown on ' + name, true);

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

        _debug('calling _onmousedown on ' + name, true );

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

        _debug('calling _onmouseup on ' + name, true);

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

    @:noCompletion public function _onmousemove(e:MouseEvent) {

        _debug('calling _onmousemove on ' + name, true);

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

        _debug('calling _ontouchbegin on ' + name, true);

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

        _debug('calling _ontouchend on ' + name, true);

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

        _debug('calling _ontouchmove on ' + name, true);

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

        _debug('calling _ongamepadaxis on ' + name, true);

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

        _debug('calling _ongamepadball on ' + name, true);

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

        _debug('calling _ongamepadhat on ' + name, true);

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

        _debug('calling _ongamepadbuttondown on ' + name, true);

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

        _debug('calling _ongamepadbuttonup on ' + name, true);

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

    @:noCompletion public function _oninputdown(_name:String,e:Dynamic) {

        _debug('calling _oninputdown on ' + name, true);

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

    @:noCompletion public function _oninputup(_name:String,e:Dynamic) {

        _debug('calling _oninputup on ' + name, true);

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
            _debug("calling update AFTER DESTROYED on " + name + " / " + id );
            return;
        }

        _debug('calling update on ' + name, true);

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

	@:noCompletion public function _fixed_update() {

			//Not allowed post destroy
		if(_destroyed) return;

		_debug('calling fixed_update on ' + name, true);

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

    public function add<T1,T2>(type:Class<T1>, ?_name:String='', ?_data:T2 ) : T1 {
        return _components.add( type, _name, _data );
    } //add

    public function remove<T>(?_name:String='', ?_data:T ) : Bool {
    	return _components.remove( _name, _data );
    } //remove

    public function get(_name:String, ?_in_children:Bool = false, ?_first_only:Bool = true ) : Dynamic {
    	return _components.get( _name, _in_children, _first_only );
    } //get

    public function has( _name:String ) : Bool {
    	return _components.has( _name );
    } //has

    private function get_components() {
    	return _components.components;
    } //get_components

    private function _add_child( child:Entity ) {
        
        children.push(child);

        _debug( name + " : add child : " + child.name );

            //children inherit the updates and such from the parent, so they shouldn't be in the root of the scene
        if(child.scene != null) {
            _debug( name + " add child " + child.name + " being parented, removing from scene root of " + child.scene.name);
            var removed = child.scene.remove( child );
        } else {
            _debug(name + " add child " + child.name + " being parented, but not from a scene");
        }

    }

    public function add_child( child:Entity ) {

            //and update the parent link
        if(child.parent != this) {
            child.parent = this;
        }

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

    @:hide public function internal_parent_pos_changed(_parent_pos:Vector) {
    		//our position is updated as parent_pos+relativePos
    	pos = _parent_pos.clone().add( posRelative );

    }//internal_parent_pos_changed

    @:hide public function internal_parent_rotation_changed(_parent_rotation:Vector) {
            //our rotation is updated as parent_rotation+relative
        rotation = _parent_rotation.clone().add( rotationRelative );

    }//internal_parent_pos_changed

    @:hide public function internal_parent_scale_changed(_parent_scale:Vector) {
    		//our scale is updated as parent_scale+relative
    	scale = _parent_scale.clone().add( scaleRelative );

    }//internal_parent_pos_changed

    private function set_parent( other:Entity ) {

        _debug('>>  ' + name + ' calling set parent to ' + other.name );
    		//if we are parented already, remove ourselves from that parent
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
    		parent._add_child(this);

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
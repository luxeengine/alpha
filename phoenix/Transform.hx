package phoenix;

import luxe.Objects;

import phoenix.Vector;
import phoenix.Quaternion;
import phoenix.Matrix4;

class Transform extends Objects {

    @:isVar public var parent           (default,set) : Transform;

    public var children : Array<Transform>;

        //The pos, rotation and scale values will always be relative
        //to the parent transform, when there is no explicit parent the
        //parent can be seen as the world, making the world and local values
        //reflect the same thing. 
        //      pos == always local to parent
        //      pos_world == always absolute world position

    @:isVar public var pos                  (default,set) : Vector;
    @:isVar public var rotation             (default,set) : Quaternion;
    @:isVar public var scale                (default,set) : Vector;

    @:isVar public var pos_world            (get,    set) : Vector;
    @:isVar public var rotation_world       (default,set) : Quaternion;
    @:isVar public var scale_world          (default,set) : Vector;

    @:isVar public var local                (get,    set) : Matrix4;
    @:isVar public var world                (get,    set) : Matrix4;

    public var ignore_listeners : Bool = false;
    public var pos_changed : Vector -> Void;
    public var rotation_changed : Quaternion -> Void;
    public var scale_changed : Vector -> Void;

        //:todo:
        //this will compensate for parent transforms when 
        //attaching or detaching a transform from it's parent.
        //in other words, local position will change and leave absolute position in tact 
        //such that things don't go flying into space when changing their parent.
        //if you prefer the snapping and explicit parent changes, set to false
    public var compensate : Bool = true;

    public var dirty_world : Bool = false;
    
    var _refreshing : Bool = false;
    var _setup : Bool = true;

    public function new() {

        super();

        name = 'transform';

        children = [];

        local = new Matrix4();
        world = new Matrix4();

        pos_world = new Vector();
        rotation_world = new Quaternion();
        scale_world = new Vector(1,1,1);

        pos = new Vector();
        rotation = new Quaternion();
        scale = new Vector(1,1,1);

        _setup = false;

    }

        //refresh will make sure that the world position reflects the parent 
        //transform in relation to the local transform
    public function refresh() {

        if(_setup) return; 

        _refreshing = true; 

        dirty_world = false;

        if(parent != null) {

            if(parent.dirty_world) {
                parent.refresh();
            }

            local.compose(pos, rotation, scale);
            world = world.multiplyMatrices( parent.world, local );

            var t = world.decompose();

                pos_world = t.pos;
                rotation_world = t.rotation;
                scale_world = t.scale;

        } else { //parent != null

            pos_world = pos;
            rotation_world = rotation;
            scale_world = scale;

            local.compose(pos,rotation,scale);
            world.copy(local);

            // trace("update world " + world.getPosition());

        }

        _refreshing = false;

    } //refresh

    function set_parent( _p:Transform ) {   

        parent = _p;

        refresh();

        dirty_world = true;

        return parent;

    } //set_parent

    function get_world() : Matrix4 {

        if(parent != null && parent.dirty_world && !_refreshing) {
            refresh();
        }

        return world;
    }

    function get_local() {

        return local;

    }

    function set_local(_m:Matrix4) {

        return local = _m;

    }

    function set_world(_m:Matrix4) {

        dirty_world = true;

        return world = _m;
    }

    function set_pos_world( _p:Vector ) {

        dirty_world = true;

        return pos_world = _p;

    } //set_pos_world

    function set_rotation_world( _r:Quaternion ) {

        dirty_world = true;

        return rotation_world = _r;

    } //set_rotation_world

    function set_scale_world( _s:Vector ) {

        dirty_world = true;

        return scale_world = _s;

    } //set_scale_world


    function get_pos_world() : Vector {
        
        if(parent != null && parent.dirty_world && !_refreshing) {
            refresh();
        }

        return pos_world;

    } //get_pos_world

    function get_rotation_world() : Quaternion {
        
        if(parent != null && parent.dirty_world && !_refreshing) {
            refresh();
        }

        return rotation_world;

    } //get_rotation_world

    function get_scale_world() : Vector {
        
        if(parent != null && parent.dirty_world && !_refreshing) {
            refresh();
        }

        return scale_world;

    } //get_scale_world

    @:noCompletion function propogate_pos( _p:Vector ) {
        if(pos_changed != null && !ignore_listeners) {
            pos_changed(_p);
        }
    }

    function set_pos( _p:Vector ) {

        pos = _p.clone();

        refresh();

        _attach_listener( pos, _pos_change );

        propogate_pos(pos);

        return pos;

    } //set_pos

    var _refresh_rotation = false;

    function set_rotation( _r:Quaternion ) {

        rotation = _r.clone();

        refresh();

        _attach_listener_quat( rotation, _rotation_change );

        if(rotation_changed != null && !ignore_listeners) {
            rotation_changed( rotation );
        } 

        return rotation;

    } //set_rotation

    function set_scale( _s:Vector ) {

        scale = _s.clone();

        refresh();

        _attach_listener( scale, _scale_change );

        if(scale_changed != null && !ignore_listeners) {
            scale_changed(scale);
        } 

        return scale;

    } //set_scale

//Sub component change listeners

        //An internal callback for when x y or z on a transform changes
    function _pos_change(_v:Float) { this.set_pos(pos); }
        //An internal callback for when x y or z on a transform changes
    function _scale_change(_v:Float) { this.set_scale(scale); }
        //An internal callback for when x y or z on a transform changes
    function _rotation_change(_v:Float) { this.set_rotation(rotation); }

        //An internal function to attach position 
        //changes to a vector, so we can listen for `pos.x` as well
    function _attach_listener( _v : Vector, listener ) {
        _v.listen_x = listener;
        _v.listen_y = listener;
        _v.listen_z = listener;
    } //_attach_listener

    function _attach_listener_quat( _v : Quaternion, listener ) {
        _v.listen_x = listener;
        _v.listen_y = listener;
        _v.listen_z = listener;
        _v.listen_w = listener;
    } //_attach_listener_quat

} //Transform

package phoenix;

import luxe.Objects;

import phoenix.Vector;
import phoenix.Quaternion;
import phoenix.Matrix4;

class Spatial {

    @:isVar public var pos                  (default,set) : Vector;
    @:isVar public var rotation             (default,set) : Quaternion;
    @:isVar public var scale                (default,set) : Vector;

    @:isVar public var matrix               (get,    set) : Matrix4;

    public var ignore_listeners : Bool = false;
    
    @:noCompletion public var pos_changed : Vector -> Void;
    @:noCompletion public var rotation_changed : Quaternion -> Void;
    @:noCompletion public var scale_changed : Vector -> Void;

    var _setup : Bool = true;

    public function new() {

        matrix = new Matrix4();

        pos = new Vector();
        rotation = new Quaternion();
        scale = new Vector(1,1,1);

        _setup = false;

    } //new

        //assigns the local values (pos/rotation/scale) according to the matrix
    public function decompose() {

        var _transform = matrix.decompose();

        pos = _transform.pos;
        rotation = _transform.rotation;
        scale = _transform.scale;

    } //decompose

    function get_matrix() : Matrix4 {

        return matrix;

    } //get_matrix

    function set_matrix(_m:Matrix4) {

        return matrix = _m;

    } //set_matrix

    function propogate_pos( _p:Vector ) {
        if(pos_changed != null && !ignore_listeners) {
            pos_changed(_p);
        }
    } //propogate pos

    function propogate_rotation( _r:Quaternion ) {
        if(rotation_changed != null && !ignore_listeners) {
            rotation_changed(_r);
        }
    } //propogate rotation

    function propogate_scale( _s:Vector ) {
        if(scale_changed != null && !ignore_listeners) {
            scale_changed(_s);
        }
    } //propogate scale

    function set_pos( _p:Vector ) {

        pos = _p;

        Vector.listen( pos, _pos_change );

        propogate_pos(pos);

        return pos;

    } //set_pos

    function set_rotation( _r:Quaternion ) {

        rotation = _r;

        Quaternion.listen( rotation, _rotation_change );

        propogate_rotation(rotation);

        return rotation;

    } //set_rotation
    
    function set_scale( _s:Vector ) {

        scale = _s;

        Vector.listen( scale, _scale_change );

        propogate_scale(scale);

        return scale;

    } //set_scale

 //Sub component change listeners

        //An internal callback for when x y or z on a transform changes
    function _pos_change(_v:Float) { this.set_pos(pos); }
        //An internal callback for when x y or z on a transform changes
    function _scale_change(_v:Float) { this.set_scale(scale); }
        //An internal callback for when x y or z on a transform changes
    function _rotation_change(_v:Float) { this.set_rotation(rotation); }

} //Spatial

class Transform extends Objects {

        //access
    @:isVar public var parent (get,set) : Transform;
    @:isVar public var local (get,set) : Spatial;
    @:isVar public var world (get,set) : Spatial;
    @:isVar public var origin (get,set) : Vector;

        //Called when local values are changed 
    public var pos_changed : Vector -> Void;
    public var rotation_changed : Quaternion -> Void;
    public var scale_changed : Vector -> Void;    
    public var origin_changed : Vector -> Void;    
    public var parent_changed : Transform -> Void;    

        //alias to local.pos, local.rotation, local.scale
    public var pos                  (get,set) : Vector;
    public var rotation             (get,set) : Quaternion;
    public var scale                (get,set) : Vector;    

        //true if the transform needs refreshing
    public var dirty : Bool = true;

    var _origin_undo_matrix : Matrix4;
    var _pos_matrix : Matrix4;
    var _rotation_matrix : Matrix4;
    var _setup : Bool = true;
    var _cleaning : Bool = false;

    public function new() {

        super();

        name = 'transform';

        local = new Spatial();
        world = new Spatial();        

        _origin_undo_matrix = new Matrix4();
        _pos_matrix = new Matrix4();
        _rotation_matrix = new Matrix4();

        origin = new Vector();

        local.pos_changed = on_local_pos_change;
        local.rotation_changed = on_local_rotation_change;
        local.scale_changed = on_local_scale_change;

        _setup = false;

    } //new

        //when the local transforms change we become dirty
    function on_local_pos_change( v:Vector ) {
        
        dirty = true;
        
        if(pos_changed != null) { pos_changed(v); }

    } //local pos changed
        
    function on_local_rotation_change( r:Quaternion ) {
        
        dirty = true;

        if(rotation_changed != null) { rotation_changed(r); }

    } //local rotation changed

    function on_local_scale_change( s:Vector ) {

        dirty = true;

        if(scale_changed != null) { scale_changed(s); }

    } //local scale changed

    function get_local() : Spatial {

        return local;

    } //get_local

    function set_local(l:Spatial) : Spatial {

        dirty = true;

        l.pos_changed = on_local_pos_change;
        l.rotation_changed = on_local_rotation_change;
        l.scale_changed = on_local_scale_change;

        return local = l;

    } //set_local

        //whenever the world transform is requested, make sure it's up to date
    function get_world() : Spatial {

            //make sure the parent is updated before 
            //trying to clean our values
        if(parent != null) {
            dirty = true;
            if(parent.dirty) {                
                parent.clean();
            } //parent.dirty
        } //parent != null

        if(dirty && !_cleaning) {
            clean();
        } //dirty

        return world;

    } //get_world

    @:noCompletion public function clean() {
        
        if(!dirty) {
            return;
        }

            //flag to avoid loops
        _cleaning = true;

            //update local matrices
        _pos_matrix.makeTranslation( local.pos.x, local.pos.y, local.pos.z );
        _rotation_matrix.makeRotationFromQuaternion( local.rotation );
        _origin_undo_matrix.makeTranslation( -origin.x, -origin.y, -origin.z );

                //translate to origin
        local.matrix.makeTranslation( origin.x, origin.y, origin.z );

                //scale up relative to origin
            local.matrix.scale(local.scale);
                //rotation relative to origin
            local.matrix.multiply(_rotation_matrix);
                //apply position
            local.matrix.setPosition( local.pos );

            //undo origin translation
        local.matrix.multiply(_origin_undo_matrix);

            //update world matrix
        if(parent != null) {
            world.matrix = world.matrix.multiplyMatrices( parent.world.matrix, local.matrix );
        } else {
            world.matrix = local.matrix.clone();
        }

            //update world spatial
        world.decompose();

            //clear flags
        dirty = false;
        _cleaning = false;

    } //clean

    function get_origin() : Vector {

        return origin;

    } //get_origin

    function set_origin(o:Vector) : Vector {

        dirty = true;

        origin = o;

        if(origin_changed != null) {
            origin_changed(origin);
        }

        return origin;

    } //set_origin

    function set_world(w:Spatial) : Spatial {
        
        dirty = true;

        return world = w;

    } //set_world

    function get_parent() : Transform {

        return parent;

    } //get_parent

    function set_parent( _p:Transform ) {   

        dirty = true;

        parent = _p;

        if(parent_changed != null) {
            parent_changed(parent);
        }

        return parent;

    } //set_parent

    function get_pos() {
        return local.pos;
    }
    function get_rotation() {
        return local.rotation;
    }
    function get_scale() {
        return local.scale;
    }

    function set_pos(value:Vector) {
        return local.pos = value;
    }
    function set_rotation(value:Quaternion) {
        return local.rotation = value;
    }
    function set_scale(value:Vector) {
        return local.scale = value;
    }

} //Transform

package phoenix;

import luxe.Objects;

import phoenix.Vector;
import phoenix.Quaternion;
import phoenix.Matrix;
import snow.api.buffers.Float32Array;


class Transform extends ID {

    //access
    @:isVar public var parent (get,set) : Transform;
    @:isVar public var local (get,set) : Spatial;
    @:isVar public var world (get,set) : Spatial;
    @:isVar public var origin (get,set) : Vector;
        //true if the transform needs refreshing,
        //starts true since there are no values
    @:isVar public var dirty (default,set) : Bool = true;

        //alias to local.pos, local.rotation, local.scale
    public var pos                  (get,set) : Vector;
    public var rotation             (get,set) : Quaternion;
    public var scale                (get,set) : Vector;

    var _origin_undo_matrix : Matrix;
    var _pos_matrix : Matrix;
    var _rotation_matrix : Matrix;
    var _setup : Bool = true;
    var _cleaning : Bool = false;

        //List of handler functions
    var _clean_handlers : Array< Transform->Void >;
    var _dirty_handlers : Array< Transform->Void >;
    var _pos_handlers : Array< Vector->Void >;
    var _rotation_handlers : Array< Quaternion->Void >;
    var _scale_handlers : Array< Vector->Void >;
    var _origin_handlers : Array< Vector->Void >;
    var _parent_handlers : Array< Transform->Void >;

    public inline function new() {

        super('transform');

        local = new Spatial();
        world = new Spatial();

        _origin_undo_matrix = new Matrix();
        _pos_matrix = new Matrix();
        _rotation_matrix = new Matrix();

        origin = new Vector();

            //Whenever the local transform changes we need to know
        local.pos_changed = on_local_pos_change;
        local.rotation_changed = on_local_rotation_change;
        local.scale_changed = on_local_scale_change;

        _setup = false;

    } //new


    var _destroying = false;

    public function destroy() {

        _destroying = true;

            //no longer listening
        if(parent != null) {
            parent.unlisten(on_parent_cleaned);
        }

            //destroy resources and memory
        _clean_handlers = null;
        _dirty_handlers = null;
        _pos_handlers = null;
        _rotation_handlers = null;
        _scale_handlers = null;
        _origin_handlers = null;
        _parent_handlers = null;

            //clean up
        local.destroy();
        world.destroy();

        local = null;
        world = null;
        origin = null;
        _origin_undo_matrix = null;
        _pos_matrix = null;
        _rotation_matrix = null;

    } //destroy

    inline function set_dirty( _dirty:Bool ) : Bool {

        dirty = _dirty;

        if(  dirty &&
            !_setup &&
            _dirty_handlers != null &&
            _dirty_handlers.length > 0
        ) {
            propagate_dirty();
        }

        return dirty;

    } //set_dirty

        //when the local transforms change we become dirty
    inline function on_local_pos_change( v:Vector ) {

        dirty = true;

        if(_pos_handlers != null &&
           _pos_handlers.length > 0) {
                propagate_pos( v );
        }

    } //local pos changed

    inline function on_local_rotation_change( r:Quaternion ) {

        dirty = true;

        if(_rotation_handlers != null &&
           _rotation_handlers.length > 0) {
                propagate_rotation( r );
        }

    } //local rotation changed

    inline function on_local_scale_change( s:Vector ) {

        dirty = true;

        if(_scale_handlers != null &&
           _scale_handlers.length > 0) {
                propagate_scale( s );
        }

    } //local scale changed

    inline function on_parent_cleaned( p:Transform ) {

        dirty = true;

    } //on_parent_cleaned

    inline function get_local() : Spatial {

        return local;

    } //get_local

    inline function set_local( l:Spatial ) : Spatial {

        if(l != null) {

            dirty = true;

            l.pos_changed = on_local_pos_change;
            l.rotation_changed = on_local_rotation_change;
            l.scale_changed = on_local_scale_change;

        }

        return local = l;

    } //set_local

        //whenever the world transform is requested, make sure it's up to date
    inline function get_world() : Spatial {

        if( !_destroying ) {
            clean_check();
        }

        return world;

    } //get_world

    @:noCompletion public inline function clean_check() {

            //make sure the parent is updated
        if(parent != null) {

            if(parent.dirty) {
                parent.clean();
            } //parent.dirty

        } //parent != null

        if(dirty && !_cleaning) {
            clean();
        } //dirty

    }//clean_check

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

                //rotation relative to origin
            local.matrix.multiply(_rotation_matrix);
                //scale up relative to origin
            local.matrix.scale(local.scale);
                //apply position
            local.matrix.setPosition( local.pos );

            //undo origin translation
        local.matrix.multiply(_origin_undo_matrix);

            //update world matrix
        if(parent != null) {
            world.matrix = world.matrix.multiplyMatrices( parent.world.matrix, local.matrix );
        } else {
            world.matrix.copy(local.matrix);
        }

            //update world spatial,
            //saying false allows it to decide
            //if this code happens or not
        world.decompose(false);

            //clear flags
        dirty = false;
        _cleaning = false;

        if( _clean_handlers != null &&
            _clean_handlers.length > 0) {
                propagate_clean();
        }

    } //clean

    inline function toString() {
        return 'Transform ($id)';
    } //toString

    inline function get_origin() : Vector {

        return origin;

    } //get_origin

    inline function set_origin(o:Vector) : Vector {

        dirty = true;

        origin = o;

        if(_origin_handlers != null &&
           _origin_handlers.length > 0) {
            propagate_origin( origin );
        }

        return origin;

    } //set_origin

    inline function set_world(w:Spatial) : Spatial {

        if(w == null) {
            return world = w;
        }

        dirty = true;

        return world = w;

    } //set_world

    inline function get_parent() : Transform {

        return parent;

    } //get_parent

    inline function set_parent( _p:Transform ) {

        dirty = true;

            //clear existing listener
        if(parent != null) {
            parent.unlisten(on_parent_cleaned);
        }

        parent = _p;

        if(_parent_handlers != null &&
           _parent_handlers.length > 0) {
                propagate_parent( parent );
        }

        if(parent != null) {
            //we need to know when the parent transform is changed, this makes us dirty,
            //and since each full clean can clear the dirty flag, we use this to make sure it's always synced
            parent.listen(on_parent_cleaned);
        }

        return parent;

    } //set_parent

    inline function get_pos() {
        return local.pos;
    } //get_pos

    inline function get_rotation() {
        return local.rotation;
    } //get_rotation

    inline function get_scale() {
        return local.scale;
    } //get_scale


    inline function set_pos(value:Vector) {
        return local.pos = value;
    } //set_pos

    inline function set_rotation(value:Quaternion) {
        return local.rotation = value;
    } //set_rotation

    inline function set_scale(value:Vector) {
        return local.scale = value;
    } //set_scale


    inline function propagate_clean() {
        for(_handler in _clean_handlers) {
            if(_handler != null) {
                _handler(this);
            }
        }
    } //propagate clean

    inline function propagate_dirty() {
        for(_handler in _dirty_handlers) {
            if(_handler != null) {
                _handler(this);
            }
        }
    } //propagate dirty

    inline function propagate_pos( _pos:Vector ) {
        for(_handler in _pos_handlers) {
            if(_handler != null) {
                _handler(_pos);
            }
        }
    } //propagate pos

    inline function propagate_rotation( _rotation:Quaternion ) {
        for(_handler in _rotation_handlers) {
            if(_handler != null) {
                _handler(_rotation);
            }
        }
    } //propagate rotation

    inline function propagate_scale( _scale:Vector ) {
        for(_handler in _scale_handlers) {
            if(_handler != null) {
                _handler(_scale);
            }
        }
    } //propagate scale

    inline function propagate_origin( _origin:Vector ) {
        for(_handler in _origin_handlers) {
            if(_handler != null) {
                _handler(_origin);
            }
        }
    } //propagate origin

    inline function propagate_parent( _parent:Transform ) {
        for(_handler in _parent_handlers) {
            if(_handler != null) {
                _handler(_parent);
            }
        }
    } //propagate parent

    public inline function listen( _handler : Transform->Void ) {

        if(_clean_handlers == null) {
            _clean_handlers = [];
        }

        _clean_handlers.push( _handler );

    } //listen

    public inline function unlisten( _handler : Transform->Void ) {

        if(_clean_handlers == null) {
            return false;
        }

        return _clean_handlers.remove( _handler );

    } //unlisten

    public inline function listen_dirty( _handler : Transform->Void ) {

        if(_dirty_handlers == null) {
            _dirty_handlers = [];
        }

        _dirty_handlers.push( _handler );

    } //listen_dirty

    public inline function unlisten_dirty( _handler : Transform->Void ) {

        if(_dirty_handlers == null) {
            return false;
        }

        return _dirty_handlers.remove( _handler );

    } //unlisten_dirty

    public inline function listen_pos( _handler : Vector->Void ) {

        if(_pos_handlers == null) {
            _pos_handlers = [];
        }

        _pos_handlers.push( _handler );

    } //listen_pos

    public inline function unlisten_pos( _handler : Vector->Void ) {

        if(_pos_handlers == null) {
            return false;
        }

        return _pos_handlers.remove( _handler );

    } //unlisten_pos

    public inline function listen_scale( _handler : Vector->Void ) {

        if(_scale_handlers == null) {
            _scale_handlers = [];
        }

        _scale_handlers.push( _handler );

    } //listen_scale

    public inline function unlisten_scale( _handler : Vector->Void ) {

        if(_scale_handlers == null) {
            return false;
        }

        return _scale_handlers.remove( _handler );

    } //unlisten_scale

    public inline function listen_rotation( _handler : Quaternion->Void ) {

        if(_rotation_handlers == null) {
            _rotation_handlers = [];
        }

        _rotation_handlers.push( _handler );

    } //listen_rotation

    public inline function unlisten_rotation( _handler : Quaternion->Void ) {

        if(_rotation_handlers == null) {
            return false;
        }

        return _rotation_handlers.remove( _handler );

    } //unlisten_rotation

    public inline function listen_origin( _handler : Vector->Void ) {

        if(_origin_handlers == null) {
            _origin_handlers = [];
        }

        _origin_handlers.push( _handler );

    } //listen_origin

    public inline function unlisten_origin( _handler : Vector->Void ) {

        if(_origin_handlers == null) {
            return false;
        }

        return _origin_handlers.remove( _handler );

    } //unlisten_origin

    public inline function listen_parent( _handler : Transform->Void ) {

        if(_parent_handlers == null) {
            _parent_handlers = [];
        }

        _parent_handlers.push( _handler );

    } //listen_parent

    public inline function unlisten_parent( _handler : Transform->Void ) {

        if(_parent_handlers == null) {
            return false;
        }

        return _parent_handlers.remove( _handler );

    } //unlisten_parent

} //Transform

class Spatial {

    @:isVar public var pos                  (default,set) : Vector;
    @:isVar public var rotation             (default,set) : Quaternion;
    @:isVar public var scale                (default,set) : Vector;

    @:isVar public var matrix               (get,    set) : Matrix;

    public var floats : Float32Array;
    public var ignore_listeners : Bool = false;
    public var auto_decompose : Bool = false;

    @:noCompletion public var pos_changed : Vector -> Void;
    @:noCompletion public var rotation_changed : Quaternion -> Void;
    @:noCompletion public var scale_changed : Vector -> Void;

    var _setup : Bool = true;

    public inline function new() {

        matrix = new Matrix();
        floats = matrix.float32array();

        pos = new Vector();
        rotation = new Quaternion();
        scale = new Vector(1,1,1);

        _setup = false;

    } //new

    public inline function destroy() {

        matrix = null;
        floats = null;
        pos = null;
        rotation = null;
        scale = null;

    } //destroy

        //assigns the local values (pos/rotation/scale) according to the matrix
        //when called manually, will make sure it happens using force.
        //if force is false, auto_decompose will apply
    public inline function decompose( _force:Bool = true ) {

        if( auto_decompose || _force ) {

            var _transform = matrix.decompose();

            pos = _transform.pos;
            rotation = _transform.rotation;
            scale = _transform.scale;

        } //auto_decompose

        return this;

    } //decompose

    inline function get_matrix() : Matrix {

        return matrix;

    } //get_matrix

    inline function set_matrix(_m:Matrix) {

        matrix = _m;

            //when updating, update the float32array
        if( _m != null ) {
            floats = matrix.float32array();
        }

        return matrix;

    } //set_matrix

    inline function propagate_pos( _p:Vector ) {
        if(pos_changed != null && !ignore_listeners) {
            pos_changed(_p);
        }
    } //propagate pos

    inline function propagate_rotation( _r:Quaternion ) {
        if(rotation_changed != null && !ignore_listeners) {
            rotation_changed(_r);
        }
    } //propagate rotation

    inline function propagate_scale( _s:Vector ) {
        if(scale_changed != null && !ignore_listeners) {
            scale_changed(_s);
        }
    } //propagate scale

    inline function set_pos( _p:Vector ) {

        pos = _p;

        if( _p != null ) {

            Vector.Listen( pos, _pos_change );

            propagate_pos(pos);

        } //

        return pos;

    } //set_pos

    inline function set_rotation( _r:Quaternion ) {

        rotation = _r;

        if( _r != null ) {

            Quaternion.Listen( rotation, _rotation_change );

            propagate_rotation(rotation);

        } //

        return rotation;

    } //set_rotation

    inline function set_scale( _s:Vector ) {

        scale = _s;

        if( _s != null ) {

            Vector.Listen( scale, _scale_change );

            propagate_scale(scale);

        } //

        return scale;

    } //set_scale

 //Sub component change listeners

        //An internal callback for when x y or z on a transform changes
    inline function _pos_change(_v:Float) { this.set_pos(pos); }
        //An internal callback for when x y or z on a transform changes
    inline function _scale_change(_v:Float) { this.set_scale(scale); }
        //An internal callback for when x y or z on a transform changes
    inline function _rotation_change(_v:Float) { this.set_rotation(rotation); }

} //Spatial

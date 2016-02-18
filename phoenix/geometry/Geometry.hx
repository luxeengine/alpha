package phoenix.geometry;


import phoenix.geometry.Vertex;
import phoenix.Quaternion;
import phoenix.Rectangle;
import phoenix.Transform;
import phoenix.Vector;
import phoenix.Shader;
import phoenix.Texture;
import phoenix.Batcher;

import luxe.Log.*;
import luxe.options.GeometryOptions;

import snow.api.buffers.Float32Array;

import snow.modules.opengl.GL;

#if cpp
using cpp.NativeArray;
#end

@:allow(phoenix.Batcher)
class Geometry {

        //the positional transform information
    public var transform : Transform;

        //The list of vertices
    public var vertices : Array<Vertex>;

//:todo: This section is largely WIP
//and not considered API, should be treated as volatile

    var object_space : Bool = false;

    var buffer_based : Bool = false;
    var buffer_type : Int = GL.DYNAMIC_DRAW;
    var buffer_pos : Float32Array;
    var buffer_tcoords : Float32Array;
    var buffer_colors : Float32Array;
    var buffer_normals : Float32Array;

    var vb_pos : GLBuffer;
    var vb_tcoords : GLBuffer;
    var vb_colors : GLBuffer;
    var vb_normals : GLBuffer;

    var uniforms : Uniforms;

//End section

        //Batcher information
    public var added : Bool = false;
    public var batchers : Array<Batcher>;

        //state
    public var state : GeometryState;
    public var dropped : Bool = false;
    public var uuid : String = '';
    public var id : String = '';

        //State properties
    @:isVar public var primitive_type (get, set) : PrimitiveType;
    @:isVar public var texture (get, set) : Texture;
    @:isVar public var shader (get, set) : Shader;
    @:isVar public var depth (get, set) : Float;
    @:isVar public var clip_rect (get, set) : Rectangle;

    var shadow_primitive_type : PrimitiveType;
    var shadow_texture : Texture;
    var shadow_shader : Shader;
    var shadow_depth : Float = 0.0;
    var shadow_clip : Bool = false;

    var dirty_primitive_type : Bool = false;
    var dirty_texture : Bool = false;
    var dirty_shader : Bool = false;
    var dirty_depth : Bool = false;
    var dirty_clip : Bool = false;

        //Geometry properties
    @:isVar public var visible      (default, set) : Bool = true;
    @:isVar public var immediate    (default, default) : Bool = false;
    @:isVar public var locked       (get, set) : Bool = false;
    @:isVar public var dirty        (get, set) : Bool = false;
    @:isVar public var color        (default, set) : Color;

        //:voltile:wip: whether or not the dirty flag is used or not
        //if this is false, the geometry will submit even when not dirty
    public var dirty_based = true;

        //internal bool flag for clip sorting and clipping state
    @:noCompletion @:isVar public var clip (get, set) : Bool;

        //internal reuse cache value
    var _final_vert_position : Vector;

    public var key : GeometryKey;

        //This is a failsafe against all other geometry key values being identical
        //causing comparisons in a binary tree to fail. This value is never reset intentionally.
    static var _sequence_key : Int = -1;

    public function new(_options:GeometryOptions) {

        uuid = Luxe.utils.uniqueid();
        id = uuid;

        state = new GeometryState();
        vertices = [];
        batchers = [];

            //init transforms
        transform = new Transform();

            //init the empty vertex reuse
        _final_vert_position = new Vector();

            //geometry clipping
        clip_rect = null;
        clip = false;

            //this only applies if batcher is supplied, but is overriden with no_batcher_add
        var _do_add = true;


        id                   = def(_options.id,              uuid);
        color                = def(_options.color,           new Color());
        visible              = def(_options.visible,         true);
        immediate            = def(_options.immediate,       false);

        //:todo: This section is WIP and considered volatile/not api
        buffer_based         = def(_options.buffer_based,    false);
        object_space         = def(_options.object_space,    false);
        //end section

        state.depth          = def(_options.depth,           state.depth);
        state.texture        = def(_options.texture,         state.texture);
        state.primitive_type = def(_options.primitive_type,  state.primitive_type);
        state.shader         = def(_options.shader,          state.shader);

        if(_options.clip_rect != null) {
            var _r = _options.clip_rect;
            state.clip_x = _r.x;
            state.clip_y = _r.y;
            state.clip_w = _r.w;
            state.clip_h = _r.h;
        }

        transform.pos        = def(_options.pos,             transform.pos);
        transform.rotation   = def(_options.rotation,        transform.rotation);
        transform.scale      = def(_options.scale,           transform.scale);
        transform.origin     = def(_options.origin,          transform.origin);

        if(_options.no_batcher_add != null && _options.no_batcher_add == true) {
            _do_add = false;
        }

        _sequence_key++;

        key = new GeometryKey();

            key.uuid = uuid;
            key.timestamp = Luxe.time;
            key.sequence = _sequence_key;
            key.primitive_type = state.primitive_type;
            key.texture = state.texture;
            key.shader = state.shader;
            key.depth = state.depth;
            key.clip = state.clip;

        transform.id = uuid;
        transform.name = id;

            //only add it to a batcher if explicitly requested,
            //otherwise do not add to a batcher at all
        if(_options.batcher != null && _do_add) {
            _options.batcher.add( this );
        }

            //:todo: This is WIP/volatile and not considered api
        if(buffer_based) create_vbos();
        uniforms = new Uniforms();

    } //new

    public function key_string() {

        return
            'ts: '+ key.timestamp + '\n' +
            'sequence: '+ key.sequence + '\n' +
            'primitive_type: '+ key.primitive_type + '\n' +
            'texture: '+ (key.texture == null ? 'null' : key.texture.id) + '\n' +
            'shader: '+ (key.shader == null ? 'null' : key.shader.id) + '\n' +
            'depth: '+ key.depth + '\n' +
            'clip: '+ key.clip;

    } //key_string

    public function refresh_key() {

        // _sequence_key++;

        key.uuid = uuid;
        key.timestamp = Luxe.time;
        key.sequence = _sequence_key;
        key.primitive_type = state.primitive_type;
        key.texture = state.texture;
        key.shader = state.shader;
        key.depth = state.depth;
        key.clip = state.clip;

    } //refresh_key

    public function str() {
        if(!state.log) return;
        trace('\t\tgeometry ; ' + id);
        state.log = true;
        state.str();
        state.log = false;
    }

    public function drop( ?remove:Bool = true ) {

        if( remove && added ) {

            for(b in batchers) {
                b.remove( this, true );
            } //for each batcher

        }

        key = null;
        color = null;
        state = null;
        _final_vert_position = null;
        batchers = null;
        uuid = null;
        id = null;
        shadow_texture = null;
        shadow_shader = null;
        vertices = null;

        if(transform != null) {
            transform.destroy();
            transform = null;
        }

        if(uniforms != null) {
            uniforms.destroy();
            uniforms = null;
        }

        destroy_vbos();
        if(buffer_pos != null) {
            buffer_pos = null;
            buffer_tcoords = null;
            buffer_colors = null;
            buffer_normals = null;
        }

        dropped = true;

    } //drop

    public function add( v : Vertex ) {

        vertices.push( v );

    } //add

    public function remove( v : Vertex ) {

        vertices.remove(v);

    } //remove

    inline
    public function batch( vert_index : Int, tcoord_index:Int, color_index:Int, normal_index:Int,
                           vertlist : Float32Array, tcoordlist : Float32Array, colorlist : Float32Array, normallist : Float32Array
        ) {

        var _mat = transform.world.matrix;
        var _el = _mat.elements;

        #if cpp
            inline function tx(_x:Float,_y:Float,_z:Float) : Float return _el.unsafeGet(0) * _x + _el.unsafeGet(4) * _y + _el.unsafeGet(8)  * _z + _el.unsafeGet(12);
            inline function ty(_x:Float,_y:Float,_z:Float) : Float return _el.unsafeGet(1) * _x + _el.unsafeGet(5) * _y + _el.unsafeGet(9)  * _z + _el.unsafeGet(13);
            inline function tz(_x:Float,_y:Float,_z:Float) : Float return _el.unsafeGet(2) * _x + _el.unsafeGet(6) * _y + _el.unsafeGet(10) * _z + _el.unsafeGet(14);
        #else
            inline function tx(_x:Float,_y:Float,_z:Float) : Float return _el[0] * _x + _el[4] * _y + _el[8]  * _z + _el[12];
            inline function ty(_x:Float,_y:Float,_z:Float) : Float return _el[1] * _x + _el[5] * _y + _el[9]  * _z + _el[13];
            inline function tz(_x:Float,_y:Float,_z:Float) : Float return _el[2] * _x + _el[6] * _y + _el[10] * _z + _el[14];
        #end

        var _count = vertices.length;
        var _idx = 0;

        while(_idx < _count) {
            var v = vertices[_idx];

            var _vx = v.pos.x;
            var _vy = v.pos.y;
            var _vz = v.pos.z;

                //the old positions must be used to
                // transform correctly, for each of the components
            var _tvx = tx(_vx, _vy, _vz);
            var _tvy = ty(_vx, _vy, _vz);
            var _tvz = tz(_vx, _vy, _vz);

                vertlist[(vert_index+0)] = _tvx;
                vertlist[(vert_index+1)] = _tvy;
                vertlist[(vert_index+2)] = _tvz;
                vertlist[(vert_index+3)] = v.pos.w;

            vert_index += 4;

            var _vuv = v.uv.uv0;

                tcoordlist[(tcoord_index+0)] = _vuv.u;
                tcoordlist[(tcoord_index+1)] = _vuv.v;
                tcoordlist[(tcoord_index+2)] = _vuv.w;
                tcoordlist[(tcoord_index+3)] = _vuv.t;

            tcoord_index += 4;

                colorlist[(color_index+0)] = v.color.r;
                colorlist[(color_index+1)] = v.color.g;
                colorlist[(color_index+2)] = v.color.b;
                colorlist[(color_index+3)] = v.color.a;

            color_index += 4;

            #if phoenix_use_normals
                var _vn = v.normal;
                normallist[(normal_index+0)] = _vn.x;
                normallist[(normal_index+1)] = _vn.y;
                normallist[(normal_index+2)] = _vn.z;
                normallist[(normal_index+3)] = _vn.w;
            #end

            normal_index += 4;


            _idx++;

        } //each vertex

    } //batch

    @:noCompletion
    inline
    public function batch_object_space( vert_index : Int, tcoord_index:Int, color_index:Int, normal_index:Int,
                                        vertlist : Float32Array, tcoordlist : Float32Array, colorlist : Float32Array, normallist : Float32Array
        ) {

        for(v in vertices) {

            var _vpos = v.pos;
            var _vuv = v.uv.uv0;
            var _vcol = v.color;

                vertlist[(vert_index+0)] = _vpos.x;
                vertlist[(vert_index+1)] = _vpos.y;
                vertlist[(vert_index+2)] = _vpos.z;
                vertlist[(vert_index+3)] = _vpos.w;

            vert_index += 4;

                tcoordlist[(tcoord_index+0)] = _vuv.u;
                tcoordlist[(tcoord_index+1)] = _vuv.v;
                tcoordlist[(tcoord_index+2)] = _vuv.w;
                tcoordlist[(tcoord_index+3)] = _vuv.t;

            tcoord_index += 4;

                colorlist[(color_index+0)] = _vcol.r;
                colorlist[(color_index+1)] = _vcol.g;
                colorlist[(color_index+2)] = _vcol.b;
                colorlist[(color_index+3)] = _vcol.a;

            color_index += 4;

            #if phoenix_use_normals
                var _vnorm = v.normal;
                normallist[(normal_index+0)] = _vnorm.x;
                normallist[(normal_index+1)] = _vnorm.y;
                normallist[(normal_index+2)] = _vnorm.z;
                normallist[(normal_index+3)] = _vnorm.w;
            #end

            normal_index += 4;

        } //each vertex

    } //batch_object_space

    public function batch_into_arrays( vertlist : Array<Float>, tcoordlist : Array<Float>,
                           colorlist : Array<Float>, normallist : Array<Float> ) {

        for(v in vertices) {

                // the base position of the vert
            _final_vert_position.set( v.pos.x, v.pos.y, v.pos.z, v.pos.w );
                // apply the transform to the vert
            _final_vert_position.transform( transform.world.matrix );

                //submit vert positions
            vertlist.push( _final_vert_position.x );
            vertlist.push( _final_vert_position.y );
            vertlist.push( _final_vert_position.z );
            vertlist.push( _final_vert_position.w );

                //texture coordinates :todo: multiple uv sets
            tcoordlist.push( v.uv.uv0.u );
            tcoordlist.push( v.uv.uv0.v );
            tcoordlist.push( v.uv.uv0.w );
            tcoordlist.push( v.uv.uv0.t );

                //color values per vertex
            colorlist.push( v.color.r );
            colorlist.push( v.color.g );
            colorlist.push( v.color.b );
            colorlist.push( v.color.a );

            #if phoenix_use_normals
                normallist.push( v.normal.x );
                normallist.push( v.normal.y );
                normallist.push( v.normal.z );
                normallist.push( v.normal.w );
            #end

        } //each vertex

    } //batch_into_arrays

//Explicit vb

    function destroy_vbos() {
        if(vb_pos==null) return;
        GL.deleteBuffer(vb_pos);
        GL.deleteBuffer(vb_tcoords);
        GL.deleteBuffer(vb_colors);
        #if phoenix_use_normals
        GL.deleteBuffer(vb_normals);
        #end
    } //destroy_vbos

    inline
    function create_vbos() {
        if(vb_pos!=null) return;
        vb_pos = GL.createBuffer();
        vb_tcoords = GL.createBuffer();
        vb_colors = GL.createBuffer();
        #if phoenix_use_normals
        vb_normals = GL.createBuffer();
        #end
        dirty = true;
    }

    inline
    function bind() {
        bind_pos();
        bind_tcoords();
        bind_colors();
        #if phoenix_use_normals
        bind_normals();
        #end
    }


    inline
    function bind_pos() {
        GL.bindBuffer(GL.ARRAY_BUFFER, vb_pos);
        GL.vertexAttribPointer(Batcher.vert_attribute, 4, GL.FLOAT, false, 0, 0);
    }

    inline
    function bind_tcoords() {
        GL.bindBuffer(GL.ARRAY_BUFFER, vb_tcoords);
        GL.vertexAttribPointer(Batcher.tcoord_attribute, 4, GL.FLOAT, false, 0, 0);
    }

    inline
    function bind_colors() {
        GL.bindBuffer(GL.ARRAY_BUFFER, vb_colors);
        GL.vertexAttribPointer(Batcher.color_attribute, 4, GL.FLOAT, false, 0, 0);
    }

    #if phoenix_use_normals
    inline
    function bind_normals() {
        GL.bindBuffer(GL.ARRAY_BUFFER, vb_normals);
        GL.vertexAttribPointer(Batcher.normal_attribute, 4, GL.FLOAT, false, 0, 0);
    }
    #end

    inline
    function unbind() {
        GL.bindBuffer(GL.ARRAY_BUFFER, null);
    }

    inline
    function bind_and_upload() {

        bind_pos();
        GL.bufferData(GL.ARRAY_BUFFER, buffer_pos, buffer_type);

        bind_tcoords();
        GL.bufferData(GL.ARRAY_BUFFER, buffer_tcoords, buffer_type);

        bind_colors();
        GL.bufferData(GL.ARRAY_BUFFER, buffer_colors, buffer_type);

        #if phoenix_use_normals
        bind_normals();
        GL.bufferData(GL.ARRAY_BUFFER, buffer_normals, buffer_type);
        #end

    } //_bind_and_upload

    var _prev_count = 0;
    function update_buffers() : Bool {

        if(!dirty && dirty_based) return false;

        var _verts = vertices.length;

        //since vertices might change we recreate the buffers
        if((_verts != _prev_count) || buffer_pos == null) {
            var _length:Int = (vertices.length * 4);
            buffer_pos = null;
            buffer_normals = null;
            buffer_colors = null;
            buffer_tcoords = null;
            buffer_pos = new Float32Array(_length);
            buffer_tcoords = new Float32Array(_length);
            buffer_colors = new Float32Array(_length);
            #if phoenix_use_normals
            buffer_normals = new Float32Array(_length);
            #end
        }
        
        if(object_space) {
            batch_object_space(0,0,0,0,buffer_pos,buffer_tcoords,buffer_colors,buffer_normals);
        } else {
            batch(0,0,0,0,buffer_pos,buffer_tcoords,buffer_colors,buffer_normals);
        }

        dirty = false;

        return true;

    } //update_vb

    inline
    function draw() {
        //the buffer pos length is favoured because if dirty is not flagged,
        //and the vertices change, then the size of the buffers becomes inconsistent
        //with the draw call and Bad Things happen like memory corruption
        GL.drawArrays( primitive_type, 0, Std.int(buffer_pos.length/4) );
    }

//Transform

    public function translate( _offset:Vector ) {

        transform.pos.set_xyz( transform.pos.x+_offset.x, transform.pos.y+_offset.y, transform.pos.x+_offset.z );

    } // translate

    function set_locked( _locked:Bool ) : Bool {

        buffer_type = _locked ? GL.STATIC_DRAW : GL.DYNAMIC_DRAW;

        if(_locked && vb_pos == null) create_vbos();
        if(!_locked && vb_pos != null) destroy_vbos();

        return locked = _locked;

    } //set_locked

    inline function get_locked() : Bool {

        return locked;

    } //get_locked

    function set_dirty( _dirty:Bool ) : Bool {

        return dirty = _dirty;

    } //set_dirty

    inline function get_dirty() : Bool {

        return dirty;

    } //get_dirty

//Invariants that cause a shift in the geometry tree

    function refresh() {

            //remove from all batchers
        for(b in batchers) {
            b.remove( this, false );
        } //for each batcher

                //update the values from the shadow values, if needed
            if(dirty_primitive_type) {
                dirty_primitive_type = false;
                state.primitive_type = shadow_primitive_type;
            } //dirty_primitive_type

            if(dirty_texture) {
                dirty_texture = false;
                state.texture = shadow_texture;
            } //dirty_texture

            if(dirty_shader) {
                dirty_shader = false;
                state.shader = shadow_shader;
            } //dirty_shader

            if(dirty_depth) {
                dirty_depth = false;
                state.depth = shadow_depth;
            } //dirty_depth

            if(dirty_clip) {
                dirty_clip = false;
                state.clip = shadow_clip;
            } //dirty_clip

                //make sure the key is updated
           refresh_key();

        for(b in batchers) {
            b.add( this, false );
        } //for each batcher

    } //refresh

//Primitive Type

    inline function get_primitive_type() : PrimitiveType {

        return state.primitive_type;

    } //get_primitive_type

    function set_primitive_type( val : PrimitiveType ) : PrimitiveType {

        if(state.primitive_type != val) {
            shadow_primitive_type = val;
            dirty_primitive_type = true;
            refresh();
        }

        return primitive_type = val;

    } //set_primitive_type

//Texture

    inline function get_texture() : Texture {

        return state.texture;

    } //get_texture

    function set_texture(val : Texture) : Texture {

        if(state.texture != val) {
            shadow_texture = val;
            dirty_texture = true;
            refresh();
        }

        return texture = val;

    } //set_texture

//Visibility

    function set_visible(val : Bool) : Bool {

        return visible = val;

    } //set_visible

//Color

    function set_color(val : Color) : Color {

        if(vertices != null && vertices.length > 0) {
            for(v in vertices) {
                v.color = val;
            } //for each vertex
        }

        return color = val;

    } //set_color

//Shader

    inline function get_shader() : Shader {

        return state.shader;

    } //get_shader

    function set_shader(val : Shader) : Shader {

        if(state.shader != val) {
            shadow_shader = val;
            dirty_shader = true;
            refresh();
        }

        return shader = val;

    } //set_shader

//Depth

    inline function get_depth() : Float {

        return state.depth;

    } //get_depth


    function set_depth(val : Float) : Float {

        if(state.depth != val) {
            shadow_depth = val;
            dirty_depth = true;
            refresh();
        }

        return depth = val;

    } //set_depth

//Clip

    inline function get_clip() : Bool {

        return state.clip;

    } //get_clip

    function set_clip(val : Bool) : Bool {

        if(state.clip != val) {
            shadow_clip = val;
            dirty_clip = true;
            refresh();
        }

        return clip = val;

    } //set_clip

//Clip rect

    inline function get_clip_rect() : Rectangle {

        return clip_rect;

    } //get_clip_rect

    function set_clip_rect(val : Rectangle) : Rectangle {

        if(val == null) {
            clip = false;
        } else {
            clip = true;
            state.clip_x = val.x;
            state.clip_y = val.y;
            state.clip_w = val.w;
            state.clip_h = val.h;
        }

        return clip_rect = val;

    } //set_clip_rect


} //Geometry


class GeometryKey {

    public inline function new() {}

    public var timestamp : Float = 0;
    public var sequence : Int = 0;
    public var uuid : String = '';
    public var primitive_type : PrimitiveType;
    public var texture : Texture;
    public var shader : Shader;
    public var depth : Float = 0;
    public var clip : Bool = false;

} //GeometryKey

package phoenix.geometry;


import phoenix.geometry.Vertex;
import phoenix.Quaternion;
import phoenix.Rectangle;
import phoenix.Transform;
import phoenix.Vector;
import phoenix.Shader;
import phoenix.Texture;
import phoenix.Batcher;

import luxe.options.GeometryOptions;

import snow.utils.ByteArray;
import snow.utils.Float32Array;
import snow.utils.IMemoryRange;

import snow.render.opengl.GL;

class GeometryKey {

    public inline function new() {}

    public var timestamp : Float = 0;
    public var sequence : Int = 0;
    public var uuid : String = '';
    public var primitive_type : PrimitiveType;
    public var texture : Texture;
    public var shader : Shader;
    public var group : Int = 0;
    public var depth : Float = 0;
    public var clip : Bool = false;

} //GeometryKey

class Geometry {

        //the positional transform information
    public var transform : Transform;

        //The list of vertices
    public var vertices : Array<Vertex>;

        //Statically batched VBO's
    public var submitted : Bool = false;
    public var static_vertex_buffer : GLBuffer;
    public var static_tcoord_buffer : GLBuffer;
    public var static_vcolor_buffer : GLBuffer;
    public var static_normal_buffer : GLBuffer;

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
    @:isVar public var group (get, set) : Int;
    @:isVar public var clip_rect (get, set) : Rectangle;

    var shadow_primitive_type : PrimitiveType;
    var shadow_texture : Texture;
    var shadow_shader : Shader;
    var shadow_group : Int = 0;
    var shadow_depth : Float = 0.0;
    var shadow_clip : Bool = false;

    var dirty_primitive_type : Bool = false;
    var dirty_texture : Bool = false;
    var dirty_shader : Bool = false;
    var dirty_group : Bool = false;
    var dirty_depth : Bool = false;
    var dirty_clip : Bool = false;

        //Geometry properties
    @:isVar public var visible      (default, set) : Bool = true;
    @:isVar public var immediate    (default, default) : Bool = false;
    @:isVar public var locked       (get, set) : Bool = false;
    @:isVar public var dirty        (get, set) : Bool = false;
    @:isVar public var color        (default, set) : Color;

        //internal bool flag for clip sorting and clipping state
    @:noCompletion @:isVar public var clip (get, set) : Bool;

        //internal reuse cache value
    var _final_vert_position : Vector;

    public var key : GeometryKey;

        //This is a failsafe against all other geometry key values being identical
        //causing comparisons in a binary tree to fail. This value is never reset intentionally.
    static var _sequence_key : Int = -1;

    public function new( ?options:GeometryOptions ) {

        uuid = Luxe.utils.uniqueid();
        id = uuid;

        vertices = new Array<Vertex>();
        state = new GeometryState();
        batchers = new Array<Batcher>();

            //init transforms
        transform = new Transform();

            //init the empty vertex reuse
        _final_vert_position = new Vector();

            //geometry clipping
        clip_rect = null;
        clip = false;

            //this only applies if batcher is supplied, but is overriden with no_batcher_add
        var _do_add = true;

        if(options != null) {

            state.depth             = (options.depth == null)           ? state.depth           : options.depth;
            state.group             = (options.group == null)           ? state.group           : options.group;
            state.texture           = (options.texture == null)         ? state.texture         : options.texture;
            state.clip_rect         = (options.clip_rect == null)       ? state.clip_rect       : options.clip_rect;
            state.primitive_type    = (options.primitive_type == null)  ? state.primitive_type  : options.primitive_type;
            state.shader            = (options.shader == null)          ? state.shader          : options.shader;

            id                      = (options.id == null)              ? uuid                  : options.id;

            transform.pos           = (options.pos == null)             ? transform.pos         : options.pos;
            transform.rotation      = (options.rotation == null)        ? transform.rotation    : options.rotation;
            transform.scale         = (options.scale == null)           ? transform.scale       : options.scale;
            transform.origin        = (options.origin == null)          ? transform.origin      : options.origin;

            immediate               = (options.immediate == null)       ? false                 : options.immediate;
            visible                 = (options.visible == null)         ? true                  : options.visible;

            color                   = (options.color == null)           ? new Color()           : options.color;
            _do_add                 = (options.no_batcher_add == null)  ? true                  : options.no_batcher_add;

        } else { //options != null

                //assign required
            color = new Color();

        }

        _sequence_key++;

        key = new GeometryKey();

            key.uuid = uuid;
            key.timestamp = Luxe.time;
            key.sequence = _sequence_key;
            key.primitive_type = state.primitive_type;
            key.texture = state.texture;
            key.shader = state.shader;
            key.group = state.group;
            key.depth = state.depth;
            key.clip = state.clip;

        transform.id = uuid;
        transform.name = id;

            //only add it to a batcher if explicitly requested,
            //otherwise do not add to a batcher at all
        if(options != null && options.batcher != null && _do_add) {
            options.batcher.add( this );
        }

    } //new

    public function key_string() {

        return
            'ts: '+ key.timestamp + '\n' +
            'sequence: '+ key.sequence + '\n' +
            'primitive_type: '+ key.primitive_type + '\n' +
            'texture: '+ (key.texture == null ? 'null' : key.texture.id) + '\n' +
            'shader: '+ (key.shader == null ? 'null' : key.shader.id) + '\n' +
            'group: '+ key.group + '\n' +
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
        key.group = state.group;
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

        if(transform != null) {
            transform.destroy();
            transform = null;
        }

        dropped = true;

    } //drop

    public function add( v : Vertex ) {

        vertices.push( v );

        if(vertices.length > Luxe.renderer.batcher.max_verts) {
            throw "$id / Currently a single geometry cannot exceed the maximum vert count of " + Luxe.renderer.batcher.max_verts;
        }

    } //add

    public function remove( v : Vertex ) {

        vertices.remove(v);

    } //remove

    public function batch( vert_index : Int, tcoord_index:Int, color_index:Int, normal_index:Int,
                           vertlist : Float32Array, tcoordlist : Float32Array, colorlist : Float32Array, normallist : Float32Array
        ) {

        for(v in vertices) {

                //the base position of the vert
            _final_vert_position.set( v.pos.x, v.pos.y, v.pos.z, v.pos.w );
                //apply the transform to the vert
            _final_vert_position.transform( transform.world.matrix );

                    //submit vertex positions
                    //:todo: ask hugh about hxcpp ArrayImpl not being inline
            #if luxe_native
                vertlist.__set_d((vert_index+0), _final_vert_position.x);
                vertlist.__set_d((vert_index+1), _final_vert_position.y);
                vertlist.__set_d((vert_index+2), _final_vert_position.z);
                vertlist.__set_d((vert_index+3), _final_vert_position.w);
            #else
                vertlist[(vert_index+0)] = _final_vert_position.x;
                vertlist[(vert_index+1)] = _final_vert_position.y;
                vertlist[(vert_index+2)] = _final_vert_position.z;
                vertlist[(vert_index+3)] = _final_vert_position.w;
            #end

            vert_index += 4;

                    //texture coordinates :todo: multiple uv sets
            #if luxe_native
                tcoordlist.__set_d((tcoord_index+0), v.uv.uv0.u);
                tcoordlist.__set_d((tcoord_index+1), v.uv.uv0.v);
                tcoordlist.__set_d((tcoord_index+2), v.uv.uv0.w);
                tcoordlist.__set_d((tcoord_index+3), v.uv.uv0.t);
            #else
                tcoordlist[(tcoord_index+0)] = v.uv.uv0.u;
                tcoordlist[(tcoord_index+1)] = v.uv.uv0.v;
                tcoordlist[(tcoord_index+2)] = v.uv.uv0.w;
                tcoordlist[(tcoord_index+3)] = v.uv.uv0.t;
            #end

            tcoord_index += 4;

                //color values per vertex

            #if luxe_native
                colorlist.__set_d((color_index+0), v.color.r);
                colorlist.__set_d((color_index+1), v.color.g);
                colorlist.__set_d((color_index+2), v.color.b);
                colorlist.__set_d((color_index+3), v.color.a);
            #else
                colorlist[(color_index+0)] = v.color.r;
                colorlist[(color_index+1)] = v.color.g;
                colorlist[(color_index+2)] = v.color.b;
                colorlist[(color_index+3)] = v.color.a;
            #end


            color_index += 4;

            //         //normal directions
            //     normallist[(normal_index+0)] = v.normal.x;
            //     normallist[(normal_index+1)] = v.normal.y;
            //     normallist[(normal_index+2)] = v.normal.z;
            //     normallist[(normal_index+3)] = v.normal.w;

            // normal_index += 4;

        } //each vertex

    } //batch

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

                //normal directions
            normallist.push( v.normal.x );
            normallist.push( v.normal.y );
            normallist.push( v.normal.z );
            normallist.push( v.normal.w );

        } //each vertex

    } //batch_into_arrays

//Transform

    public function translate( _offset:Vector ) {

        transform.pos.set_xyz( transform.pos.x+_offset.x, transform.pos.y+_offset.y, transform.pos.x+_offset.z );

    } // translate

    function set_locked( _locked:Bool ) : Bool {

        return locked = _locked;

    } //set_locked

    function get_locked() : Bool {

        return locked;

    } //get_locked

    function set_dirty( _dirty:Bool ) : Bool {

        return dirty = _dirty;

    } //set_dirty

    function get_dirty() : Bool {

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

            if(dirty_group) {
                dirty_group = false;
                state.group = shadow_group;
            } //dirty_group

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

    function get_primitive_type() : PrimitiveType {

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

    function get_texture() : Texture {

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

        for(v in vertices) {
            v.color = val;
        } //for each vertex

        return color = val;

    } //set_color

//Shader

    function get_shader() : Shader {

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

    function get_depth() : Float {

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

//Group

    function get_group() : Int {

        return state.group;

    } //get_group

    function set_group(val : Int) : Int {

        if(state.group != val) {
            shadow_group = val;
            dirty_group = true;
            refresh();
        }

        return group = val;

    } //set_group

//Clip

    function get_clip() : Bool {

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

    function get_clip_rect() : Rectangle {

        return state.clip_rect;

    } //get_clip_rect

    function set_clip_rect(val : Rectangle) : Rectangle {

        if(val == null) {
            clip = false;
        } else {
            clip = true;
        }

        return state.clip_rect = val;

    } //set_clip_rect


} //Geometry



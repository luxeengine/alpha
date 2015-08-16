package phoenix.geometry;

import phoenix.Rectangle;
import phoenix.Texture;
import phoenix.Shader;
import phoenix.Batcher;

@:allow(phoenix.Batcher)
@:allow(phoenix.BatchState)
@:allow(phoenix.geometry.Geometry)
class GeometryState {

    var dirty:Bool;

    @:isVar var primitive_type(default, set) : PrimitiveType;
    @:isVar var shader(default, set) : Shader;
    @:isVar var texture(default, set) : Texture;
    @:isVar var depth(default, set) : Float;
    @:isVar var group(default, set) : Int;
    @:isVar var clip(default, set) : Bool;
    @:isVar var clip_x(default, set) : Float;
    @:isVar var clip_y(default, set) : Float;
    @:isVar var clip_w(default, set) : Float;
    @:isVar var clip_h(default, set) : Float;

    var log : Bool = false;

    inline
    function new() {

        clip = false;
        clip_x = 0.0;
        clip_y = 0.0;
        clip_w = 0.0;
        clip_h = 0.0;
        texture = null;
        shader = null;
        group = 0;
        depth = 0.0;
        primitive_type = PrimitiveType.points;

        dirty = false;

    } //new

    inline
    function clone_onto( _other:GeometryState )  {

        _other.dirty = dirty;
        _other.texture = texture;
        _other.shader = shader;
        _other.group = group;
        _other.depth = depth;
        _other.primitive_type = primitive_type;
        _other.clip = clip;
        _other.clip_x = clip_x;
        _other.clip_y = clip_y;
        _other.clip_w = clip_w;
        _other.clip_h = clip_h;

    } //clone_onto

    function str() {

        if(!log) return;

        trace('\t+ GEOMETRYSTATE $dirty');
            trace('\t\tdepth - $depth');
            trace('\t\tgroup - $group');
            trace('\t\ttexture - ' + (( texture == null) ? 'null' :  texture.id ));
            if(texture != null) {
                trace('\t\t\t ${texture.texture}');
            }
            trace('\t\tshader - ' + (( shader == null) ? 'null' :  shader.id ));
            trace('\t\tprimitive_type - $primitive_type');
            trace('\t\tclip - $clip');
            trace('\t\tclip rect - $clip_x,$clip_y,$clip_w,$clip_h');
        trace('\t- GEOMETRYSTATE');

    } //str

    inline
    function clean() {

        dirty = false;

    } //clean

    // inline
    function update( other : GeometryState ) {

        if(depth != other.depth) {
            depth = other.depth;
        }

        if(group != other.group) {
            group = other.group;
        }

        if(texture != other.texture) {
            texture = other.texture;
        }

        if(shader != other.shader) {
            shader = other.shader;
        }

        if(primitive_type != other.primitive_type) {
            primitive_type = other.primitive_type;
        }

        if(clip != other.clip) {
            clip = other.clip;
        }

        if(clip_x != other.clip_x) {
            clip_x = other.clip_x;
        } //clip_x

        if(clip_y != other.clip_y) {
            clip_y = other.clip_y;
        } //clip_y

        if(clip_w != other.clip_w) {
            clip_w = other.clip_w;
        } //clip_w

        if(clip_h != other.clip_h) {
            clip_h = other.clip_h;
        } //clip_h

    } //update

//Primitive Type
    inline function set_primitive_type(val : PrimitiveType) : PrimitiveType {
        dirty = true;
        return primitive_type = val;
    }
//Texture
    inline function set_texture(val : Texture) : Texture {
        dirty = true;
        return texture = val;
    }
//Shader
    inline function set_shader(val : Shader) : Shader {
        dirty = true;
        return shader = val;
    }
//Depth
    inline function set_depth(val : Float) : Float {
        return depth = val;
    }
//Group
    inline function set_group(val : Int) : Int {
        dirty = true;
        return group = val;
    }
//Clip
    inline function set_clip(val : Bool) : Bool {
        dirty = true;
        return clip = val;
    }
//Clip rect
    inline function set_clip_x(val : Float) : Float {
        dirty = true;
        return clip_x = val;
    }
    inline function set_clip_y(val : Float) : Float {
        dirty = true;
        return clip_y = val;
    }
    inline function set_clip_w(val : Float) : Float {
        dirty = true;
        return clip_w = val;
    }
    inline function set_clip_h(val : Float) : Float {
        dirty = true;
        return clip_h = val;
    }
//

}

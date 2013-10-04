package phoenix.geometry;

import phoenix.Rectangle;
import phoenix.Texture;
import phoenix.Shader;
import phoenix.Batcher;

class GeometryState {
    
    public var dirty:Bool;

    @:isVar public var primitive_type(default, set) : PrimitiveType;
    @:isVar public var shader(default, set) : Shader;
    @:isVar public var texture(default, set) : Texture;
    @:isVar public var depth(default, set) : Float;
    @:isVar public var group(default, set) : Int;
    @:isVar public var clip(default, set) : Bool;
    @:isVar public var clip_rect(default, set) : Rectangle;

    public var log : Bool = false;

    public function new() {

        clip = false;
        clip_rect = new Rectangle();
        texture = null;
        shader = null;
        group = 0;
        depth = 0.0;
        primitive_type = PrimitiveType.none;

        dirty = false;

    }

    public function clone() : GeometryState {
        var new_state = new GeometryState();
        
            new_state.dirty = dirty;
            new_state.texture = texture;
            new_state.shader = shader;
            new_state.group = group;
            new_state.depth = depth;
            new_state.primitive_type = primitive_type;
            new_state.clip = clip;
            new_state.clip_rect = clip_rect.clone();

        return new_state;
    }

    public function str() {
        if(!log) return;

        trace('\t+ GEOMETRYSTATE ' + dirty);
            trace("\t\tdepth - "+ depth);
            trace("\t\tgroup - "+ group);
            trace("\t\ttexture - " + (( texture == null) ? 'null' :  texture.id ));
            if(texture != null) {
                trace("\t\t\t " + texture.texture);
            }
            trace("\t\tshader - " + (( shader == null) ? 'null' :  shader.id ));
            trace("\t\tprimitive_type - "+ primitive_type);
            trace("\t\tclip - "+ clip);
            trace("\t\tclip rect - "+ clip_rect );
        trace('\t- GEOMETRYSTATE');
    }    

    public function clean() {
        dirty = false;
        // trace('cleaned geometry state ');
    }

    public function ttrace(v:Dynamic) {
        if(!log) return;
        trace(v);
    }

    public function update( other : GeometryState ) {

        if(depth != other.depth) {
            ttrace("\t\tDepth change from " + depth + " to " + other.depth);
            depth = other.depth;
        } else {
            ttrace("\t\tNo change in depth");
        }

        if(group != other.group) {
            ttrace("\t\tGroup change from " + group + " to " + other.group);
            group = other.group;
        } else {
            ttrace("\t\tNo change in group");
        }

        if(texture != other.texture) {
            ttrace("\t\tTexture change from " + texture + " to " + other.texture);
            texture = other.texture;
        } else {
            ttrace("\t\tNo change in texture");
        }
        
        if(shader != other.shader) {
            var shadername = shader == null ? 'null' : shader.id;
            var othershadername = other.shader == null ? 'null' : other.shader.id;
            
            ttrace("\t\tShader change from " + shadername + " to " + othershadername);

            shader = other.shader;
        } else {
            ttrace("\t\tNo change in shader");
        }
        
        if(primitive_type != other.primitive_type) {
            ttrace("\t\tType change from " + primitive_type + " to " + other.primitive_type);
            primitive_type = other.primitive_type;
        } else {
            ttrace("\t\tNo change in Type");
        }
        
        if(clip != other.clip) {
            ttrace("\t\tclip change from " + clip + " to " + other.clip);
            clip = other.clip;
        } else {
            ttrace("\t\tNo change in clip");
        }   

        if(clip_rect != null) {
            if(!clip_rect.equal(other.clip_rect)) {
                ttrace("\t\tcliprect change from " + clip_rect + " to " + other.clip_rect);
                clip_rect.set(other.clip_rect.x,other.clip_rect.y, other.clip_rect.w, other.clip_rect.h);
            } else {
                ttrace("\t\tNo change in clip rec");
            }
        } //clip_rect
        
    }

//Primitive Type
    public function set_primitive_type(val : PrimitiveType) : PrimitiveType {       
        dirty = true;
        return primitive_type = val;
    }
//Texture
    public function set_texture(val : Texture) : Texture {      
        dirty = true;
        return texture = val;
    }
//Shader
    public function set_shader(val : Shader) : Shader {      
        dirty = true;
        return shader = val;
    }
//Depth
    public function set_depth(val : Float) : Float {
        return depth = val;
    }
//Group
    public function set_group(val : Int) : Int {        
        dirty = true; 
        return group = val;
    }
//Clip
    public function set_clip(val : Bool) : Bool {
        dirty = true;
        return clip = val;
    }
//Clip rect
    public function set_clip_rect(val : Rectangle) : Rectangle {
        dirty = true;
        return clip_rect = val;
    }
//

}

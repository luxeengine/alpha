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

    public function clone_onto( _other:GeometryState )  {
        
            _other.dirty = dirty;
            _other.texture = texture;
            _other.shader = shader;
            _other.group = group;
            _other.depth = depth;
            _other.primitive_type = primitive_type;
            _other.clip = clip;
            _other.clip_rect.copy_from( clip_rect );

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

    public function update( other : GeometryState ) {

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

        if(clip_rect != null) {
            if(!clip_rect.equal(other.clip_rect)) {
                clip_rect.set(other.clip_rect.x,other.clip_rect.y, other.clip_rect.w, other.clip_rect.h);
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

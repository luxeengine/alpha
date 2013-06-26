package phoenix.geometry;

import phoenix.Texture;
import phoenix.Batcher;

class GeometryState {
    
    public var dirty:Bool;

    @:isVar public var primitive_type(default, set) : PrimitiveType;
    @:isVar public var texture(default, set) : Texture;
    @:isVar public var depth(default, set) : Float;
    @:isVar public var group(default, set) : Int;
    @:isVar public var clip(default, set) : Bool;

    public var log : Bool = true;

    public function new() {

        clip = false;
        texture = null;
        group = 0;
        depth = 0.0;
        primitive_type = PrimitiveType.none;

        dirty = false;

    }

    public function clone() : GeometryState {
        var new_state = new GeometryState();
        
            new_state.dirty = dirty;
            new_state.texture = texture;
            new_state.group = group;
            new_state.depth = depth;
            new_state.primitive_type = primitive_type;

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
            trace("\t\tprimitive_type - "+ primitive_type);
            trace("\t\tclip - "+ clip);
        trace('\t- GEOMETRYSTATE');     
    }    

    public function clean() {
        dirty = false;
    }

    public function compare( other:GeometryState ) {
        
        if( depth < other.depth ) return -1;
        if( depth == other.depth && group < other.group ) return -1;

        var textureid : Dynamic = texture != null ? texture.id : 0;
        var other_textureid : Dynamic = other.texture != null ? other.texture.id : 0;

        trace("TID " + textureid);
        trace("OTHER TID " + other_textureid);

        var clip_value : Int;
        if(clip == true && other.clip == true) clip_value = 0;
        if(clip == false && other.clip == true) clip_value = -1;
        if(clip == true && other.clip == false) clip_value = 1;

        if( depth == other.depth && group == other.group && textureid < other_textureid ) return -1;
        
        // todo
        // if( depth == other.depth && group == other.group && textureid == other_textureid && primitive_type < other.primitive_type) return -1;
        // if( depth == other.depth && group == other.group && textureid == other_textureid && primitive_type == other.primitive_type && (clip_value >= 0)) return -1;

        return 1;
    }

    public function update( other : GeometryState ) {
        depth = other.depth;
        group = other.group;
        texture = other.texture;
        primitive_type = other.primitive_type;
        clip = other.clip;
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
//Depth
    public function set_depth(val : Float) : Float {        
        dirty = true;      
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
//

}

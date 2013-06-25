package phoenix.geometry;

import phoenix.geometry.Vertex;
import phoenix.Texture;
import phoenix.Batcher;

import nmegl.utils.ByteArray;
import nmegl.utils.Float32Array;
import nmegl.utils.IMemoryRange;


class Geometry {

	public var vertices : Array<Vertex>;

	public var enabled : Bool = true;
	public var locked : Bool = false;

	public var state : GeometryState;
	public var dropped : Bool = false;

	public var primitive_type(get_primitive_type, set_primitive_type) : PrimitiveType;
	public var texture(get_texture, set_texture) : Texture;
	public var depth(get_depth, set_depth) : Float;
	public var group(get_group, set_group) : Int;
	public var clip(get_clip, set_clip) : Bool;

	public function new() {
		
		vertices = new Array<Vertex>();
		state = new GeometryState();

	}


	public function drop() {
		dropped = true;
	}

	public function compare( other:Geometry ) {
		return state.compare( other.state );
	}

	public function add( v : Vertex ) {
		vertices.push( v );
	}

	public function remove( v : Vertex ) {
		vertices.remove(v);
	}

	public function batch( vertlist : Array<Float>, tcoordlist : Array<Float> ) {
		for(v in vertices) {
			
			vertlist.push( v.pos.x );
			vertlist.push( v.pos.y );
			vertlist.push( v.pos.z );

			tcoordlist.push( v.uv[0].u );
			tcoordlist.push( v.uv[0].v );

		}
	}

//Primitive Type
	public function get_primitive_type() : PrimitiveType {
		return state.primitive_type;
	}

	public function set_primitive_type(val : PrimitiveType) : PrimitiveType {		
		state.primitive_type = val;
		return state.primitive_type;
	}
//Texture
	public function get_texture() : Texture {
		return state.texture;
	}

	public function set_texture(val : Texture) : Texture {		
		state.texture = val;
		return state.texture;
	}
//Depth
	public function get_depth() : Float {
		return state.depth;
	}

	public function set_depth(val : Float) : Float {		
		state.depth = val;		
		return state.depth;
	}
//Group
	public function get_group() : Int {
		return state.group;
	}

	public function set_group(val : Int) : Int {		
		state.group = val;		
		return state.group;
	}
//Clip
	public function get_clip() : Bool {
		return state.clip;
	}

	public function set_clip(val : Bool) : Bool {		
		state.clip = val;		
		return state.clip;
	}
//


}
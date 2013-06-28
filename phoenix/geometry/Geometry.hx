package phoenix.geometry;

import phoenix.geometry.Vertex;
import phoenix.Texture;
import phoenix.Batcher;

import lime.utils.ByteArray;
import lime.utils.Float32Array;
import lime.utils.IMemoryRange;


class Geometry {

	public var vertices : Array<Vertex>;

	public var enabled : Bool = true;
	public var locked : Bool = false;

	public var state : GeometryState;
	public var dropped : Bool = false;
	public var intid : Int = 0;

	public var primitive_type(get_primitive_type, set_primitive_type) : PrimitiveType;
	public var texture(get_texture, set_texture) : Texture;
	public var depth(get_depth, set_depth) : Float;
	public var group(get_group, set_group) : Int;
	public var clip(get_clip, set_clip) : Bool;

	public function new(options:Dynamic) {
		
		intid = Std.int(Math.random() * 9999); 
		vertices = new Array<Vertex>();
		state = new GeometryState();

		if(options != null) {
			state.depth = options.depth == null ? state.depth : options.depth;
			state.group = options.group == null ? state.group : options.group;
			state.texture = options.texture == null ? state.texture : options.texture;
			state.clip = options.clip == null ? state.clip : options.clip;
			state.primitive_type = options.primitive_type == null ? state.primitive_type : options.primitive_type;

			// trace("creating geometry " + intid +  " \t\t " + options );
		}

	}

	public function str() {
		if(!state.log) return;
		trace('\t\tgeometry ; ');
		state.log = true;
		state.str();
		state.log = false;
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

	public function batch( vertlist : Array<Float>, tcoordlist : Array<Float>, normallist : Array<Float> ) {
		for(v in vertices) {
			
			vertlist.push( v.pos.x );
			vertlist.push( v.pos.y );
			vertlist.push( v.pos.z );

			normallist.push( v.normal.x );
			normallist.push( v.normal.y );
			normallist.push( v.normal.z );

			tcoordlist.push( v.uv[0].u );
			tcoordlist.push( v.uv[0].v );

		}
	}

//Primitive Type
	public function get_primitive_type() : PrimitiveType {
		return state.primitive_type;
	}

	public function set_primitive_type(val : PrimitiveType) : PrimitiveType {		
		return state.primitive_type = val;
	}
//Texture
	public function get_texture() : Texture {
		return state.texture;
	}

	public function set_texture(val : Texture) : Texture {		
		return state.texture = val;
	}
//Depth
	public function get_depth() : Float {
		return state.depth;
	}

	public function set_depth(val : Float) : Float {		
		return state.depth = val;
	}
//Group
	public function get_group() : Int {
		return state.group;
	}

	public function set_group(val : Int) : Int {		
		return state.group = val;
	}
//Clip
	public function get_clip() : Bool {
		return state.clip;
	}

	public function set_clip(val : Bool) : Bool {
		return state.clip = val;
	}
//


}
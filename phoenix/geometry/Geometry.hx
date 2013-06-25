package phoenix.geometry;

import phoenix.geometry.Vertex;
import phoenix.Texture;
import phoenix.Batcher;



class Geometry {

	public var vertices : Array<Vertex>;
	public var primitive_type : PrimitiveType;

	public var enabled : Bool = true;
	public var locked : Bool = false;

	public var texture : Texture;
	public var state : GeometryState;
	public var dropped : Bool = false;

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

	public function batch( vlist : Array<Vertex> ) {
		
	}

//Depth
	public function get_depth() : Float {
		return state.depth;
	}

	public function set_depth(val : Float) : Float {		
		state.depth = val;
		state.dirty = true;
		return state.depth;
	}
//Group
	public function get_group() : Int {
		return state.group;
	}

	public function set_group(val : Int) : Int {		
		state.group = val;
		state.dirty = true;
		return state.group;
	}
//Clip
	public function get_clip() : Bool {
		return state.clip;
	}

	public function set_clip(val : Bool) : Bool {		
		state.clip = val;
		state.dirty = true;
		return state.clip;
	}
//


}
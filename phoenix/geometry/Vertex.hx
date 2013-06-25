package phoenix.geometry;

import phoenix.geometry.TextureCoord;
import phoenix.Vector;
import phoenix.Color;

import nmegl.utils.Float32Array;

	//for now this is convenience
	//since uv's is an array
enum UV {
	zero;
	one;
	two;
	three;
}


class Vertex {

	public var pos : Vector;
	public var color : Color;
	public var uv : Map<Int, TextureCoord>;

	// public var vert_array(get_vert_array, null) : Float32Array;
	// public var tcoord_array(get_tcoord_array, null) : Float32Array;

	public function new(_pos : Vector, _color:Color = null) {

		uv = new Map<Int, TextureCoord>();
		
		pos = _pos;
		color = (_color == null) ? new Color() : _color;

	}

	public function get_vert_array() : Float32Array {
		return new Float32Array([pos.x, pos.y, pos.z]);
	}
	public function get_tcoord_array(ind:Int) : Float32Array {
		return new Float32Array([uv[ind].u, uv[ind].v]);
	}


}
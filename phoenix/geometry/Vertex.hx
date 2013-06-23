package phoenix.geometry;

import phoenix.geometry.TextureCoord;
import phoenix.Vector;
import phoenix.Color;

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

	public function new(_pos : Vector, _color:Color = null) {

		uv = new Map<Int, TextureCoord>();
		
		pos = _pos;
		color = (_color == null) ? new Color() : _color;

	}


}
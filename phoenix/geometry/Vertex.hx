package phoenix.geometry;

import phoenix.geometry.TextureCoord;
import phoenix.Vector;
import phoenix.Color;

import lime.utils.Float32Array;

class Vertex {

	public var pos : Vector;
	public var color : Color;
	public var uv : TextureCoordSet;
	public var normal : Vector;

	public function new(_pos : Vector, _normal:Vector = null, _color:Color = null) {

		uv = new TextureCoordSet();
		
		pos = _pos;
		normal = (_normal == null) ? new Vector() : _normal;
		color = (_color == null) ? new Color() : _color;

	}

}
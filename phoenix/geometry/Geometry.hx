package phoenix.geometry;

import phoenix.geometry.Vertex;
import phoenix.Texture;
import phoenix.Batcher;


class Geometry {

	public var vertices : Array<Vertex>;
	public var geometry_type : PrimitiveType;
	public var texture : Texture;

	public function new() {
		
		vertices = new Array<Vertex>();

	}

	public function add( v : Vertex ) {
		vertices.push( v );
	}

	public function remove( v : Vertex ) {
		vertices.remove(v);
	}

}
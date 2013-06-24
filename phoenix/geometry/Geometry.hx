package phoenix.geometry;

import phoenix.geometry.Vertex;
import phoenix.Texture;

class Geometry {

	public var vertices : Array<Vertex>;

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
package phoenix.geometry;

import phoenix.geometry.Vertex;

class Geometry {

	public var vertices : Array<Vertex>;

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
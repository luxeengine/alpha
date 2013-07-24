package phoenix.geometry;

import lab.Vector;
import phoenix.Batcher;
import phoenix.geometry.Geometry;


class LineGeometry extends Geometry {
	@:isVar public var p0(default,set) : Vector;
	@:isVar public var p1(default,set) : Vector;

	public function new( options : Dynamic ) {
		super(options);
	
			p0 = new Vector();
			p1 = new Vector();

		set(options);
	}

	public function set_p0(_p:Vector) : Vector {
		if(vertices.length == 0) return p0 = _p;

			vertices[0].pos.x = _p.x;
			vertices[0].pos.y = _p.y;

		return p0 = _p;
	}

	public function set_p1(_p:Vector) : Vector {
		if(vertices.length == 0) return p0 = _p;

			vertices[1].pos.x = _p.x;
			vertices[1].pos.y = _p.y;

		return p1 = _p;
	}

	public function set(options:Dynamic) {

		vertices.splice(0, vertices.length);

		//p0
		var vert0 : Vertex = new Vertex( new Vector( options.p0.x, options.p0.y ) );
			vert0.uv[0] = new TextureCoord(0,0);

		var vert1 : Vertex = new Vertex( new Vector( options.p1.x, options.p1.y ) );
			vert1.uv[0] = new TextureCoord(1,0);

		add(vert0);
		add(vert1);

        primitive_type = PrimitiveType.line_strip;
        immediate = false;

	}
	
	
}
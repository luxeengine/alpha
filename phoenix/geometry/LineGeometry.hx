package phoenix.geometry;

import luxe.Vector;
import phoenix.Batcher;
import phoenix.geometry.Geometry;


class LineGeometry extends Geometry {
	
	@:isVar public var p0(default,set) : Vector;
	@:isVar public var p1(default,set) : Vector;

	public function new( options : Dynamic ) {

		if(options.color == null)  { options.color  = new Color(); }
		if(options.color0 == null) { options.color0 = options.color; }
		if(options.color1 == null) { options.color1 = options.color; }

		super(options);
	
			p0 = new Vector();
			p1 = new Vector();


		set(options);
	}

	public function set_p0(_p:Vector) : Vector {
		if(vertices.length == 0) return p0 = _p;

			vertices[0].pos.x = _p.x;
			vertices[0].pos.y = _p.y;
			vertices[0].pos.z = _p.z;

		return p0 = _p;
	}

	public function set_p1(_p:Vector) : Vector {
		if(vertices.length == 0) return p0 = _p;

			vertices[1].pos.x = _p.x;
			vertices[1].pos.y = _p.y;
			vertices[1].pos.z = _p.z;

		return p1 = _p;
	}

	public function set(options:Dynamic) {

		vertices.splice(0, vertices.length);

		//p0
		var vert0 : Vertex = new Vertex( new Vector( options.p0.x, options.p0.y, options.p0.z ) );
			vert0.uv[0] = new TextureCoord(0,0);
			vert0.color = options.color0;

		var vert1 : Vertex = new Vertex( new Vector( options.p1.x, options.p1.y, options.p1.z ) );
			vert1.uv[0] = new TextureCoord(1,0);
			vert1.color = options.color1;

		add(vert0);
		add(vert1);

        primitive_type = PrimitiveType.line_strip;
        immediate = options.immediate;

	}
	
	
}
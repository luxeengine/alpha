package phoenix.geometry;

import luxe.Vector;
import phoenix.Batcher;
import phoenix.geometry.Geometry;


class RectangleGeometry extends Geometry {

	public function new( options : Dynamic ) {
		super(options);
		set(options);
	}

	public function set(options:Dynamic) {

		vertices.splice(0, vertices.length);

			//tl
		var vert0 : Vertex = new Vertex( new Vector( options.x, options.y ) );
			vert0.uv[0] = new TextureCoord(0,0);
			//tr
		var vert1 : Vertex = new Vertex( new Vector( options.x+options.w, options.y ) );
			vert1.uv[0] = new TextureCoord(1,0);
			//br
		var vert2 : Vertex = new Vertex( new Vector( options.x+options.w, options.y+options.h ) );
			vert2.uv[0] = new TextureCoord(1,1);
			//bl
		var vert3 : Vertex = new Vertex( new Vector( options.x, options.y+options.h ) );
			vert3.uv[0] = new TextureCoord(0,1);


		add(vert0);
		add(vert1);
		add(vert2);
		add(vert3);
		add(vert0);

        primitive_type = PrimitiveType.line_strip;
        immediate = (options.immediate == null) ? false : options.immediate;

	}
	
	
}
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
		var vert0 : Vertex = new Vertex( new Vector( 0, 0 ) );
			vert0.uv.uv0.set(0,0);
			//tr
		var vert1 : Vertex = new Vertex( new Vector( options.w, 0 ) );
			vert1.uv.uv0.set(1,0);
			//br
		var vert2 : Vertex = new Vertex( new Vector( options.w, options.h ) );
			vert2.uv.uv0.set(1,1);
			//bl
		var vert3 : Vertex = new Vertex( new Vector( 0, options.h ) );
			vert3.uv.uv0.set(0,1);


		add(vert0);
		add(vert1);
		add(vert2);
		add(vert3);
		add(vert0);

        primitive_type = PrimitiveType.line_strip;
        immediate = (options.immediate == null) ? false : options.immediate;
        enabled = (options.enabled == null) ? true : options.enabled;
        color = (options.color == null) ? new Color() : options.color;

        	//finally translate it
        pos.set(options.x, options.y);

	}
	
	
}
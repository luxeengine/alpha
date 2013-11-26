package phoenix.geometry;

import phoenix.geometry.Vertex ;
import phoenix.Vector;
import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.Circle;

class ArcGeometry extends CircleGeometry {

	public function new( options : Dynamic ) {

		super(options);

			//remove the first center point from the geometry because it is a line_loop
		vertices.shift();
			//set to line type
		primitive_type = PrimitiveType.line_strip;

	} //new

} //RingGeometry

package phoenix.geometry;

import phoenix.geometry.Vertex ;
import phoenix.Vector;
import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.Circle;

class RingGeometry extends CircleGeometry {

	public function new( options : Dynamic ) {

		super(options);

			//set to line type
		primitive_type = PrimitiveType.line_loop;

	} //new

} //RingGeometry

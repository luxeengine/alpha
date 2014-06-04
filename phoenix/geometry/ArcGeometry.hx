package phoenix.geometry;

import phoenix.geometry.Vertex ;
import phoenix.geometry.RingGeometry;
import phoenix.Vector;
import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.Circle;

class ArcGeometry extends RingGeometry {

	public function new( options : Dynamic ) {

		super(options);

			//remove the first center point 
			//and the last extra vert
		vertices.pop();
		vertices.pop();

			//set to line type
		primitive_type = PrimitiveType.lines;

	} //new

} //RingGeometry

package phoenix.geometry;

import phoenix.geometry.Vertex ;
import phoenix.geometry.RingGeometry;
import phoenix.Vector;
import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.Circle;

import luxe.options.GeometryOptions.CircleGeometryOptions;

class ArcGeometry extends RingGeometry {

	public function new( ?options : CircleGeometryOptions ) {

		super(options);

			//remove the first center point
			//and the last extra vert
		vertices.pop();
		vertices.pop();

			//set to line type
		primitive_type = PrimitiveType.lines;

	} //new

} //RingGeometry

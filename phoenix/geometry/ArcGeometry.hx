package phoenix.geometry;

import luxe.Log.*;
import phoenix.Vector;
import phoenix.geometry.Vertex;
import phoenix.geometry.Geometry;
import phoenix.Batcher.PrimitiveType;
import luxe.options.GeometryOptions.CircleGeometryOptions;


class ArcGeometry extends RingGeometry {

    public function new(_options:CircleGeometryOptions) {

        super(_options);

            //remove the first center point
            //and the last extra vert
        vertices.pop();
        vertices.pop();

    } //new

} //ArcGeometry

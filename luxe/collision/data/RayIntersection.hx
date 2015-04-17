package luxe.collision.data;

import luxe.Vector;
import luxe.collision.shapes.*;
import luxe.collision.data.*;

/** Ray intersection data obtained by testing two rays for intersection. */
class RayIntersection {

        /** The first ray in the test */
    public var ray1:Ray;
        /** The second ray in the test */
    public var ray2:Ray;

        /** u value for ray1. */
    public var u1:Float;
        /** u value for ray2. */
    public var u2:Float;

    public function new(ray1:Ray, u1:Float, ray2:Ray, u2:Float) {

        this.ray1 = ray1;
        this.ray2 = ray2;

        this.u1 = u1;
        this.u2 = u2;

    } //new

} //RayIntersection
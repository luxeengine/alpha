package luxe.collision.shapes;

import luxe.Vector;
import luxe.collision.shapes.*;
import luxe.collision.data.*;

class Ray {

        /** The start point of the ray. */
    public var start:Vector;
        /** The end point of the ray. */
    public var end:Vector;
        /** The direction of the ray.
            Returns a cached vector, so modifying it will affect this instance.
            Updates only when the dir value is accessed. */
    public var dir (get, never):Vector;
        /** Whether or not the ray is infinite. */
    public var infinite:Bool;

        /** Create a new ray with the start and end point,
            which determine the direction of the ray, and optionally specifying
            that this ray is an infinite one. */
    public function new(_start:Vector, _end:Vector, _infinite:Bool = true) {

        start = _start;
        end = _end;
        infinite = _infinite;

        //internal
        dir_cache = new Vector(end.x - start.x, end.y - start.y);

    } //

//properties

    var dir_cache : Vector;
    function get_dir() {
        dir_cache.x = end.x - start.x;
        dir_cache.y = end.y - start.y;
        return dir_cache;
    }

}
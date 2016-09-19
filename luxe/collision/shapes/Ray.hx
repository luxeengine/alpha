package luxe.collision.shapes;

import luxe.Vector;
import luxe.collision.shapes.*;
import luxe.collision.data.*;

/** A ray with a start, end, direction 
    and infinite state for collision queries. */
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
    public var infinite:InfiniteState;

        /** Create a new ray with the start and end point,
            which determine the direction of the ray, and optionally specifying
            that this ray is infinite in some way. */
    public function new(_start:Vector, _end:Vector, ?_infinite:InfiniteState) {

        start = _start;
        end = _end;
        infinite = _infinite == null ? not_infinite : _infinite;

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

    /** A flag for the infinite state of a Ray. */
enum InfiniteState {

        /** The line is a fixed length 
            between the start and end points. */
    not_infinite;
        /** The line is infinite 
            from it's starting point. */
    infinite_from_start;
        /** The line is infinite in both 
            directions from it's starting point. */
    infinite;

} //InfiniteState

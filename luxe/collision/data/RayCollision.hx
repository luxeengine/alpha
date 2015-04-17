package luxe.collision.data;

import luxe.Vector;
import luxe.collision.shapes.*;
import luxe.collision.data.*;

/** Ray collision intersection data, obtained by testing a shape and a ray. */
class RayCollision {

        /** Shape the intersection was with. */
    public var shape:Shape;
        /** The ray involved in the intersection. */
    public var ray:Ray;

        /** Distance along ray that the intersection start at. */
    public var start:Float;
        /** Distance along ray that the intersection ended at. */
    public var end:Float;

    public function new( _shape:Shape, _ray:Ray, _start:Float, _end:Float ) {

        ray = _ray;
        shape = _shape;
        start = _start;
        end = _end;

    } //new

} //RayCollision


/** A static extension class helper for RayCollision */
class RayCollisionHelper {

        /** Convenience: get the start point along the line as a vector.
            It is possible the start point is not along the ray itself, when
            the `start` value is < 0, the ray start is inside the shape.
            If you need that point, use the ray.start point,
            i.e `if(data.start < 0) point = data.ray.start; else point = data.hitStart();  ` */
    public static function hitStart( data:RayCollision ) : Vector {
        var dir = data.ray.dir;
        var offsetx = dir.x * data.start;
        var offsety = dir.y * data.start;
        return new Vector( data.ray.start.x + offsetx, data.ray.start.y + offsety );
    }

        /** Convenience: get the end point along the line as a vector.
            Note that it is possible that this extends beyond the length of the ray,
            when RayCollision `end` value is > 1, i.e the end of the ray is inside the shape area.
            If you need that point, you would use ray.end as the point,
            i.e `if(data.end > 1) point = data.ray.end; else point = data.hitEnd();` */
    public static function hitEnd( data:RayCollision ) : Vector {
        var dir = data.ray.dir;
        var offsetx = dir.x * data.end;
        var offsety = dir.y * data.end;
        return new Vector( data.ray.start.x + offsetx, data.ray.start.y + offsety );
    }

} //RayCollisionHelper

package luxe.collision.data;

import luxe.Vector;
import luxe.collision.shapes.*;
import luxe.collision.data.*;

/** Ray collision intersection data, obtained by testing a shape and a ray. */
@:publicFields
class RayCollision {

        /** Shape the intersection was with. */
    var shape:Shape;
        /** The ray involved in the intersection. */
    var ray:Ray;

        /** Distance along ray that the intersection start at. */
    var start:Float = 0.0;
        /** Distance along ray that the intersection ended at. */
    var end:Float = 0.0;

    @:noCompletion
    inline function new() {}

    inline function reset() {

        ray = null;
        shape = null;
        start = 0.0;
        end = 0.0;

        return this;

    } //reset

    inline function copy_from(other:RayCollision) {

        ray = other.ray;
        shape = other.shape;
        start = other.start;
        end = other.end;

    } //copy_from

    inline function clone() {

        var _clone = new RayCollision();

        _clone.copy_from(this);

        return _clone;

    } //copy_from

} //RayCollision


/** A static extension class helper for RayCollision */
class RayCollisionHelper {

        /** Convenience: get the start X point along the line.
            It is possible the start point is not along the ray itself, when
            the `start` value is < 0, the ray start is inside the shape.
            If you need that point, use the ray.start point,
            i.e `if(data.start < 0) point = data.ray.start; else point = data.hitStart();  ` */
    public static inline function hitStartX( data:RayCollision ) : Float {
        return data.ray.start.x + (data.ray.dir.x * data.start);
    }

        /** Convenience: get the start Y point along the line */
    public static inline function hitStartY( data:RayCollision ) : Float {
        return data.ray.start.y + (data.ray.dir.y * data.start);
    }

        /** Convenience: get the end X point along the line.
            Note that it is possible that this extends beyond the length of the ray,
            when RayCollision `end` value is > 1, i.e the end of the ray is inside the shape area.
            If you need that point, you would use ray.end as the point,
            i.e `if(data.end > 1) point = data.ray.end; else point = data.hitEnd();` */
    public static inline function hitEndX( data:RayCollision ) : Float {
        return data.ray.start.x + (data.ray.dir.x * data.end);
    }

        /** Convenience: get the end point along the line.
            Note that it is possible that this extends beyond the length of the ray,
            when RayCollision `end` value is > 1, i.e the end of the ray is inside the shape area.
            If you need that point, you would use ray.end as the point,
            i.e `if(data.end > 1) point = data.ray.end; else point = data.hitEnd();` */
    public static inline function hitEndY( data:RayCollision ) : Float {
        return data.ray.start.y + (data.ray.dir.y * data.end);
    }

} //RayCollisionHelper

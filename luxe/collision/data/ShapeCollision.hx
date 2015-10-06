package luxe.collision.data;

import luxe.Vector;
import luxe.collision.shapes.*;
import luxe.collision.data.*;

/** Collision data, obtained by testing two shapes for a collision. */
class ShapeCollision {

        /** the overlap amount */
    public var overlap : Float = 0;
        /** a vector that when subtracted to shape 1 will separate it from shape 2 */
    public var separation : Vector;

        /** the first shape */
    public var shape1 : Shape;
        /** the second shape */
    public var shape2 : Shape;
        /** unit vector on the axis of the collision (the normal of the face that was collided with) */
    public var unitVector : Vector;

    @:noCompletion
    public function new() {
    } //new

} //ShapeCollision

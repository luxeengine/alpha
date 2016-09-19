package luxe.collision.data;

import luxe.Vector;
import luxe.collision.shapes.*;
import luxe.collision.data.*;

/** Collision data, obtained by testing two shapes for a collision. */
@:publicFields
class ShapeCollision {

   //

        /** The overlap amount */
    var overlap : Float = 0.0;
        /** X component of the separation vector, when subtracted from shape 1 will separate it from shape 2 */
    var separationX : Float = 0.0;
        /** Y component of the separation vector, when subtracted from shape 1 will separate it from shape 2 */
    var separationY : Float = 0.0;
        /** X component of the unit vector, on the axis of the collision (i.e the normal of the face that was collided with) */
    var unitVectorX : Float = 0.0;
        /** Y component of the unit vector, on the axis of the collision (i.e the normal of the face that was collided with) */
    var unitVectorY : Float = 0.0;

    var otherOverlap : Float = 0.0;
    var otherSeparationX : Float = 0.0;
    var otherSeparationY : Float = 0.0;
    var otherUnitVectorX : Float = 0.0;
    var otherUnitVectorY : Float = 0.0;

        /** The shape that was tested */
    var shape1 : Shape;
        /** The shape that shape1 was tested against */
    var shape2 : Shape;

    @:noCompletion
    inline function new() {

    } //

    inline function reset() {

        shape1 = shape2 = null;
        overlap = separationX = separationY = unitVectorX = unitVectorY = 0.0;
        otherOverlap = otherSeparationX = otherSeparationY = otherUnitVectorX = otherUnitVectorY = 0.0;
        
        return this;

    } //reset

    inline function clone() {

        var _clone = new ShapeCollision();

        _clone.copy_from(this);

        return _clone;

    } //clone

    inline function copy_from(_other:ShapeCollision) {

        overlap = _other.overlap;
        separationX = _other.separationX;
        separationY = _other.separationY;
        unitVectorX = _other.unitVectorX;
        unitVectorY = _other.unitVectorY;
        otherOverlap = _other.otherOverlap;
        otherSeparationX = _other.otherSeparationX;
        otherSeparationY = _other.otherSeparationY;
        otherUnitVectorX = _other.otherUnitVectorX;
        otherUnitVectorY = _other.otherUnitVectorY;
        shape1 = _other.shape1;
        shape2 = _other.shape2;

    } //copy_from

} //ShapeCollision

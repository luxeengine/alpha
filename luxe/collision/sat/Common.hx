package luxe.collision.sat;

import luxe.Vector;

/** Common math utilities used internally */
class Common {

       /** Internal api - find the normal axis of a vert in the list at index */
    public static function findNormalAxis(vertices:Array<Vector>, index:Int):Vector {

        var vector1 = vertices[index];
            //make sure you get a real vertex, not one that is outside the length of the vector.
        var vector2 = (index >= vertices.length - 1) ? vertices[0] : vertices[index + 1];
            //take the two vertices, make a line out of them, and find the normal of the line
        var normalAxis = new Vector(-(vector2.y - vector1.y), vector2.x - vector1.x);

        return normalAxis.normalize();

    } //findNormalAxis

} //Common
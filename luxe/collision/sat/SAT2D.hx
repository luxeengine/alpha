package luxe.collision.sat;

import luxe.Vector;
import luxe.collision.shapes.*;
import luxe.collision.data.*;
import luxe.collision.sat.Common;

/** Implementation details for the 2D SAT collision queries.
    Used by the various shapes, and Collision API, mostly internally.  */
class SAT2D {

        /** Internal api - test a circle against a polygon */
    public static function testCircleVsPolygon( circle:Circle, polygon:Polygon, flip:Bool=false ) : ShapeCollision {

        var ep : Float = 0.0000000001;
        var test1 : Float; //numbers for testing max/mins
        var test2 : Float;
        var test : Float;

        var min1 : Float = 0; //same as above
        var max1 : Float = 0x3FFFFFFF;
        var min2 : Float = 0;
        var max2 : Float = 0x3FFFFFFF;
        var normalAxis:Vector = new Vector();
        var offset : Float;
        var vectorOffset:Vector = new Vector();
        var vectors:Array<Vector>;
        var shortestDistance : Float = 0x3FFFFFFF;
        var collisionData = new ShapeCollision();
        var distMin : Float;

        var distance : Float = 0xFFFFFFFF;
        var testDistance : Float = 0x3FFFFFFF;
        var closestVector:Vector = new Vector(); //the vector to use to find the normal

        // find offset
        vectorOffset = new Vector(-circle.x,-circle.y);
        vectors = polygon.transformedVertices.copy();

        //adds some padding to make it more accurate
        if(vectors.length == 2) {
            var temp:Vector = new Vector(-(vectors[1].y - vectors[0].y), vectors[1].x - vectors[0].x);
            temp.truncate(ep);
            vectors.push( vectors[1].clone().add(temp) );
        }

        // find the closest vertex to use to find normal
        for(i in 0 ... vectors.length) {

            // trace(i + ' @ ' + vectors[i]);

            distance =  (circle.x - (vectors[i].x)) * (circle.x - (vectors[i].x)) +
                        (circle.y - (vectors[i].y)) * (circle.y - (vectors[i].y));

            if(distance < testDistance) { //closest has the lowest distance
                testDistance = distance;
                closestVector.x = vectors[i].x;
                closestVector.y = vectors[i].y;
            }

        } //for

        //get the normal vector
        normalAxis = new Vector(closestVector.x - circle.x, closestVector.y - circle.y);
        normalAxis.normalize(); //normalize is(set its length to 1)

        // project the polygon's points
        min1 = normalAxis.dot(vectors[0]);
        max1 = min1; //set max and min

        for(j in 1 ... vectors.length) { //project all its points, starting with the first(the 0th was done up there^)
            test = normalAxis.dot(vectors[j]); //dot to project
            if(test < min1) {
                min1 = test;
            } //smallest min is wanted
            if(test > max1) {
                max1 = test;
            } //largest max is wanted
        }

        // project the circle
        max2 = circle.transformedRadius; //max is radius
        min2 -= circle.transformedRadius; //min is negative radius

        // offset the polygon's max/min
        offset = normalAxis.dot(vectorOffset);
        min1 += offset;
        max1 += offset;

        // do the big test
        test1 = min1 - max2;
        test2 = min2 - max1;

        if(test1 > 0 || test2 > 0) { //if either test is greater than 0, there is a gap, we can give up now.
            return null;
        }

            // circle distance check
        distMin = -(max2 - min1);
        if(flip) distMin *= -1;
        if(Math.abs(distMin) < shortestDistance) {
            collisionData.unitVector = normalAxis;
            collisionData.overlap = distMin;
            shortestDistance = Math.abs(distMin);
        }

            // find the normal axis for each point and project
        for(i in 0 ... vectors.length) {

            normalAxis = Common.findNormalAxis(vectors, i);

            // project the polygon(again? yes, circles vs. polygon require more testing...)
            min1 = normalAxis.dot(vectors[0]); //project
            max1 = min1; //set max and min

            //project all the other points(see, cirlces v. polygons use lots of this...)
            for(j in 1 ... vectors.length) {
                test = normalAxis.dot(vectors[j]); //more projection
                if(test < min1) {
                    min1 = test;
                } //smallest min
                if(test > max1) {
                    max1 = test;
                } //largest max
            }

            // project the circle(again)
            max2 = circle.transformedRadius; //max is radius
            min2 = -circle.transformedRadius; //min is negative radius

            //offset points
            offset = normalAxis.dot(vectorOffset);
            min1 += offset;
            max1 += offset;

            // do the test, again
            test1 = min1 - max2;
            test2 = min2 - max1;

                //failed.. quit now
            if(test1 > 0 || test2 > 0) {
                return null;
            }

            distMin = -(max2 - min1);
            if(flip) distMin *= -1;
            if(Math.abs(distMin) < shortestDistance) {
                collisionData.unitVector = normalAxis;
                collisionData.overlap = distMin;
                shortestDistance = Math.abs(distMin);
            }

        } //for

        //if you made it here, there is a collision!!!!!

        collisionData.shape2 = if(flip) polygon else circle;
        collisionData.shape1 = if(flip) circle else polygon;
        collisionData.separation = new Vector(-collisionData.unitVector.x * collisionData.overlap,
                                                -collisionData.unitVector.y * collisionData.overlap); //return the separation distance

        if(flip) collisionData.unitVector.invert();

        return collisionData;

    } //testCircleVsPolygon

        /** Internal api - test a circle against a circle */
    public static function testCircleVsCircle( circle1:Circle, circle2:Circle ) : ShapeCollision {
        //

            //add both radii together to get the colliding distance
        var totalRadius = circle1.transformedRadius + circle2.transformedRadius;
            //find the distance between the two circles using Pythagorean theorem. No square roots for optimization
        var distancesq = (circle1.x - circle2.x) * (circle1.x - circle2.x) + (circle1.y - circle2.y) * (circle1.y - circle2.y);

            //if your distance is less than the totalRadius square(because distance is squared)
        if(distancesq < totalRadius * totalRadius) {

                //find the difference. Square roots are needed here.
            var difference : Float = totalRadius - Math.sqrt(distancesq);

            var collisionData =  new ShapeCollision();

                collisionData.shape1 = circle1;
                collisionData.shape2 = circle2;
                collisionData.unitVector = new Vector(circle1.x - circle2.x, circle1.y - circle2.y);
                collisionData.unitVector.normalize();

                    //find the movement needed to separate the circles
                collisionData.separation = new Vector( collisionData.unitVector.x * difference,
                                                       collisionData.unitVector.y * difference );

                    //the magnitude of the overlap
                collisionData.overlap = collisionData.separation.length;

            return collisionData;

        } //if distanceSq

        return null;

    } //testCircleVsCircle

        /** Internal api - test a polygon against another polygon */
    public static function testPolygonVsPolygon( polygon1:Polygon, polygon2:Polygon, flip:Bool=false ) : ShapeCollision {

        var result1 = checkPolygons(polygon1, polygon2, flip);

        if(result1 == null) return null;

        var result2 = checkPolygons(polygon2, polygon1, !flip);

        if (result2 == null) return null;

            //take the closest overlap
        (Math.abs(result1.overlap) < Math.abs(result2.overlap)) ?
            return result1:
            return result2;

    } //testPolygonVsPolygon

        /** Internal api - test a ray against a circle */
    public static function testRayVsCircle( ray:Ray, circle:Circle ) : RayCollision {

        var delta = ray.end.clone().subtract(ray.start);
        var ray2circle = ray.start.clone().subtract(circle.position);

        var a = delta.lengthsq;
        var b = 2 * delta.dot(ray2circle);
        var c = ray2circle.dot(ray2circle) - circle.radius * circle.radius;

        var d:Float = b * b - 4 * a * c;

        if (d >= 0) {

            d = Math.sqrt(d);

            var t1:Float = (-b - d) / (2 * a);
            var t2:Float = (-b + d) / (2 * a);

            if (ray.infinite || t1 <= 1.0) {
                return new RayCollision(circle, ray, t1, t2);
            }

        } //d>=0

        return null;

    } //testRayVsCircle

        /** Internal api - test a ray against a polygon */
    public static function testRayVsPolygon( ray:Ray, polygon:Polygon ) : RayCollision {

        var delta = ray.end.clone().subtract(ray.start);
        var vertices = polygon.transformedVertices;

        var min_u:Float = Math.POSITIVE_INFINITY;
        var max_u:Float = 0.0;

        if (vertices.length > 2) {

            var v1 = vertices[vertices.length - 1];
            var v2 = vertices[0];

            var r = intersectRayRay(ray.start, delta, v1, v2.clone().subtract(v1));

            if (r != null && r.ub >= 0.0 && r.ub <= 1.0) {
                if (r.ua < min_u) min_u = r.ua;
                if (r.ua > max_u) max_u = r.ua;
            }

            for (i in 1...vertices.length) {

                v1 = vertices[i - 1];
                v2 = vertices[i];

                r = intersectRayRay(ray.start, delta, v1, v2.clone().subtract(v1));

                if (r != null && r.ub >= 0.0 && r.ub <= 1.0) {
                    if (r.ua < min_u) min_u = r.ua;
                    if (r.ua > max_u) max_u = r.ua;
                }

            } //each vert

            if(ray.infinite || min_u <= 1.0) {
                return new RayCollision(polygon, ray, min_u, max_u);
            }

        } //vert length > 2

        return null;

    } //testRayVsPolygon

        /** Internal api - test a ray against another ray */
    public static function testRayVsRay( ray1:Ray, ray2:Ray ) : RayIntersection {

        var delta1 = ray1.end.clone().subtract(ray1.start);
        var delta2 = ray2.end.clone().subtract(ray2.start);

        var dx = ray1.start.clone().subtract(ray2.start);

        var d = delta2.y * delta1.x - delta2.x * delta1.y;

        if (d == 0.0) return null;

        var u1 = (delta2.x * dx.y - delta2.y * dx.x) / d;
        var u2 = (delta1.x * dx.y - delta1.y * dx.x) / d;

        if ((ray1.infinite || u1 <= 1.0) && (ray2.infinite || u2 <= 1.0)) return new RayIntersection(ray1, u1, ray2, u2);

        return null;

    } //testRayVsRay

//Helpers

        /** Internal api - generate a bresenham line between given start and end points */
    public static function bresenhamLine( start:Vector, end:Vector ) : Array<Vector> {
        //

            //the array of all the points on the line
        var points:Array<Vector> = [];
        var steep:Bool = Math.abs(end.y - start.y) > Math.abs(end.x - start.x);
            //check if rise is greater than run
        var swapped:Bool = false;

            //reflect the line
        if(steep) {
            start = swap(start);
            end = swap(end);
        } //if steep

             //make sure the line goes downward
        if(start.x > end.x) {

            var t:Float = start.x;

            start.x = end.x;
            end.x = t;
            t = start.y;
            start.y = end.y;
            end.y = t;
            swapped = true;

        } //if start.x > end.x

            //x slope
        var deltax:Float = end.x - start.x;
            //y slope, positive because the lines always go  down
        var deltay:Float = Math.abs(end.y - start.y);
            //error is used instead of tracking the y values.
        var error:Float = deltax / 2;
        var ystep:Float;
        var y:Float = start.y;

        if(start.y < end.y) {
            ystep = 1;
        } else {
            ystep = -1;
        }

        var x:Int = Std.int(start.x);
        for(x in Std.int(start.x) ... Std.int(end.x)) { //for each point

            if(steep) {
                points.push(new Vector(y, x)); //if its steep, push flipped version
            } else {
                points.push(new Vector(x, y)); //push normal
            }

            error -= deltay; //change the error

            if(error < 0) {
                y += ystep; //if the error is too much, adjust the ystep
                error += deltax;
            }
        }

        if(swapped) {
            points.reverse();
        }

        return points;

    } //bresenhamLine

//Internal helpers

        /** Internal api - implementation details for testPolygonVsPolygon */
    static function checkPolygons( polygon1:Polygon, polygon2:Polygon, flip:Bool=false ) : ShapeCollision {

        var ep : Float = 0.0000000001;
        var test1 : Float; // numbers to use to test for overlap
        var test2 : Float;
        var testNum : Float; // number to test if its the new max/min
        var min1 : Float; //current smallest(shape 1)
        var max1 : Float; //current largest(shape 1)
        var min2 : Float; //current smallest(shape 2)
        var max2 : Float; //current largest(shape 2)
        var axis:Vector; //the normal axis for projection
        var offset : Float;
        var vectors1:Array<Vector>; //the points
        var vectors2:Array<Vector>; //the points
        var shortestDistance : Float = 0x3FFFFFFF;
        var collisionData = new ShapeCollision();

        vectors1 = polygon1.transformedVertices.copy();
        vectors2 = polygon2.transformedVertices.copy();

            // add a little padding to make the test work correctly for lines
        if(vectors1.length == 2) {
            var temp = new Vector(-(vectors1[1].y - vectors1[0].y), vectors1[1].x - vectors1[0].x);
            temp.truncate(ep);
            vectors1.push(vectors1[1].add(temp));
        }

        if(vectors2.length == 2) {
            var temp = new Vector(-(vectors2[1].y - vectors2[0].y), vectors2[1].x - vectors2[0].x);
            temp.truncate(ep);
            vectors2.push(vectors2[1].add(temp));
        }

            // loop to begin projection
        for(i in 0 ... vectors1.length) {

                // get the normal axis, and begin projection
            axis = Common.findNormalAxis(vectors1, i);

                // project polygon1
            min1 = axis.dot(vectors1[0]);
            max1 = min1; //set max and min equal

            for(j in 1 ... vectors1.length) {
                testNum = axis.dot(vectors1[j]); //project each point
                if(testNum < min1) {
                    min1 = testNum;
                } //test for new smallest
                if(testNum > max1) {
                    max1 = testNum;
                } //test for new largest
            }

            // project polygon2
            min2 = axis.dot(vectors2[0]);
            max2 = min2; //set 2's max and min

            for(j in 1 ... vectors2.length) {
                testNum = axis.dot(vectors2[j]); //project the point
                if(testNum < min2) {
                    min2 = testNum;
                } //test for new min
                if(testNum > max2) {
                    max2 = testNum;
                } //test for new max
            }

            // and test if they are touching
            test1 = min1 - max2; //test min1 and max2
            test2 = min2 - max1; //test min2 and max1
            if(test1 > 0 || test2 > 0) { //if they are greater than 0, there is a gap
                return null; //just quit
            }

            var distMin : Float = -(max2 - min1);
            if(flip) distMin *= -1;
            if(Math.abs(distMin) < shortestDistance) {
                collisionData.unitVector = axis;
                collisionData.overlap = distMin;
                shortestDistance = Math.abs(distMin);
            }
        }

        //if you're here, there is a collision

        collisionData.shape1 = if(flip) polygon2 else polygon1;
        collisionData.shape2 = if(flip) polygon1 else polygon2;
        collisionData.separation = new Vector(-collisionData.unitVector.x * collisionData.overlap,
                                                -collisionData.unitVector.y * collisionData.overlap); //return the separation, apply it to a polygon to separate the two shapes.
        if(flip) collisionData.unitVector.invert();

        return collisionData;

    } //checkPolygons

        /** Internal api - swap x and y of a vector, returning a new vector. :todo: this is silly */
    static inline function swap(v:Vector) : Vector return new Vector(v.y, v.x);

        /** Internal api - same thing as rayRay, except without using Ray objects - saves the construction of a Ray object when testing Polygon/Ray. */
    static function intersectRayRay(a:Vector, adelta:Vector, b:Vector, bdelta:Vector) : { ua:Float, ub:Float } {

        var dx = a.clone().subtract(b);

        var d = bdelta.y * adelta.x - bdelta.x * adelta.y;

        if (d == 0.0) return null;

        var ua = (bdelta.x * dx.y - bdelta.y * dx.x) / d;
        var ub = (adelta.x * dx.y - adelta.y * dx.x) / d;

        return { ua : ua, ub : ub };

    } //intersectRayRay

} //SAT2D

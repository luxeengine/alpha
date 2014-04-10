package luxe.collision;

import luxe.collision.shapes.Shape;
import luxe.collision.shapes.Circle;
import luxe.collision.shapes.Polygon;

import luxe.collision.CollisionData;
import luxe.collision.ShapeDrawer;

import luxe.Vector;

class Collision {
    
    public function new() {
        throw "Collision is a static class. No instances can be created.";
    } //new
        
        //will never return null, always length 0 array
    public static function testShapeList( shape1:Shape, shapes:Array<Shape> ) : Array<CollisionData> {
        
        var results : Array<CollisionData> = [];

        for(other_shape in shapes) {
            var result = testShapes(shape1, other_shape);
            if(result != null) {
                results.push(result);
            } //result != null
        } //for all shapes passed in

        return results;

    } //testShapeList

    public static function testShapes( shape1:Shape, shape2:Shape ): CollisionData {

        if( Std.is(shape1, Circle) && Std.is(shape2, Circle) ) {
            return checkCircles(cast(shape1,Circle), cast(shape2,Circle));
        }

        if( Std.is(shape1,Polygon) && Std.is(shape2,Polygon) ) {
            if(checkPolygons(cast(shape2,Polygon), cast(shape1,Polygon)) != null) {
                return checkPolygons(cast(shape1,Polygon), cast(shape2,Polygon));
            }
        }

        if(Std.is(shape1,Circle)) {
            return checkCircleVsPolygon(cast(shape1,Circle), cast(shape2,Polygon));
        }

        if(Std.is(shape2,Circle)) {
            return checkCircleVsPolygon(cast(shape2,Circle), cast(shape1,Polygon));
        }

        return null;

    } //testShapes

    public static function rayCollision( lineStart:Vector, lineEnd:Vector, shapes:Array<Shape> ) : Bool {
            
            //check against each shape
        for(_shape in shapes) {

                //if the shape is a circle
            if( Std.is(_shape,Circle) ) { 

                if( testCircleLine( cast _shape, lineStart, lineEnd) ) {
                    return true;
                }

            } else {

                    //if it's not a circle, it's a polygon
                var line:Array<Vector> = bresenhamLine( lineStart, lineEnd );

                for(_point in line) {
                    if( pointInPoly( _point, cast _shape) ) {
                        return true;
                    } //if the point is inside the polygon
                } //for each point in the line

           } //shape ! is circle

        } //for _shape in shapes

        return false;

    } //rayCollision
    
    public static function testCircleLine( circle:Circle, lineStart:Vector, lineEnd:Vector ) : Bool {

            //set up some variables we will use to check for a collision
        var d:Vector = lineEnd.clone().subtract(lineStart);
            //vector representing the length of the line
        var f:Vector = lineStart.clone().subtract(circle.position);
            //vector representing distance from start of line to circle center
        var a:Float = d.dot(d);
        var b:Float = 2 * f.dot(d);
        var c:Float = f.dot(f) - circle.radius * circle.radius;
        var discrm:Float = b * b - 4 * a * c;
            //quadratic equation
        if(discrm < 0) {
            return false;
        } else {

            discrm = Math.sqrt(discrm);
            
            var t1:Float = (-b + discrm) / (2 * a);
            var t2:Float = (-b - discrm) / (2 * a);

                if(t1 >= 0 && t1 <= 1) {
                    return true;
                } else {
                    return false;
                }

        }
            
            //by default return false    
        return false;

    } //testCircleLine

    static function swap(a:Float,b:Float) : Vector {

        var t:Float = a;
        
            a = b; 
            b = t;

        return new Vector(a,b);

    } //swap

    public static function bresenhamLine( start:Vector, end:Vector ) : Array<Vector> {
            
            //the array of all the points on the line
        var points:Array<Vector> = []; 
        var steep:Bool = Math.abs(end.y - start.y) > Math.abs(end.x - start.x);
        //check if rise is greater than run
        var swapped:Bool = false;

        if(steep) {
                //reflect the line
            start = swap(start.x, start.y); 
            end = swap(end.x, end.y);
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

    public static function pointInPoly(point:Vector, poly:Polygon):Bool {

        var sides:Int = poly.transformedVertices.length; //amount of sides the polygon has
        var i:Int = 0;
        var j:Int = sides - 1;
            //how many sides have we passed through?
        var oddNodes:Bool = false; 
        for(i in 0 ... sides) { 

            if( (poly.transformedVertices[i].y < point.y && poly.transformedVertices[j].y >= point.y) || 
                (poly.transformedVertices[j].y < point.y && poly.transformedVertices[i].y >= point.y)) 
            {
                if( poly.transformedVertices[i].x + 
                    (point.y - poly.transformedVertices[i].y) / 
                    (poly.transformedVertices[j].y - poly.transformedVertices[i].y) * 
                    (poly.transformedVertices[j].x - poly.transformedVertices[i].x) < point.x) 
                {
                    oddNodes = !oddNodes;
                } //second if

            } //first if

            j = i;
        } //for each side

        return oddNodes; //return oddNodes

    } //point in poly

    private static function checkCircleVsPolygon(circle:Circle, polygon:Polygon):CollisionData {

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

        var distance : Float = 0xFFFFFFFF;
        var testDistance : Float = 0x3FFFFFFF;
        var closestVector:Vector = new Vector(); //the vector to use to find the normal
        
        // find offset
        vectorOffset = new Vector(-circle.x,-circle.y);
        vectors = polygon.transformedVertices.copy(); 
        
        //adds some padding to make it more accurate
        if(vectors.length == 2) {
            var temp:Vector = new Vector(-(vectors[1].y - vectors[0].y), vectors[1].x - vectors[0].x);
            temp.truncate(0.0000000001);
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
            
        }
        
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
        
        // find the normal axis for each point and project
        for(i in 0 ... vectors.length) {
            normalAxis = findNormalAxis(vectors, i);
            
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
            
            if(test1 > 0 || test2 > 0) {
                
                //failed.. quit now
                return null;
                
            }
            
        }
        
        //if you made it here, there is a collision!!!!!
        
        var collisionData:CollisionData = new CollisionData();
        collisionData.overlap = -(max2 - min1);
        collisionData.unitVector = normalAxis;
        collisionData.shape1 = polygon;
        collisionData.shape2 = circle;
        collisionData.separation = new Vector(normalAxis.x * (max2 - min1) * -1, normalAxis.y * (max2 - min1) * -1); //return the separation distance
        
        return collisionData;

    } //checkCircleVsPolygon
    
    private static function checkCircles(circle1:Circle, circle2:Circle):CollisionData {

        var totalRadius : Float = circle1.transformedRadius + circle2.transformedRadius; //add both radii together to get the colliding distance
        var distanceSquared : Float = (circle1.x - circle2.x) * (circle1.x - circle2.x) + (circle1.y - circle2.y) * (circle1.y - circle2.y); //find the distance between the two circles using Pythagorean theorem. No square roots for optimization
        
        if(distanceSquared < totalRadius * totalRadius) { //if your distance is less than the totalRadius square(because distance is squared)
            var difference : Float = totalRadius - Math.sqrt(distanceSquared); //find the difference. Square roots are needed here.
            var collisionData:CollisionData = new CollisionData(); //new CollisionData class to hold all the data for this collision
            collisionData.separation = new Vector((circle2.x - circle1.x) * difference, (circle2.y - circle1.y) * difference); //find the movement needed to separate the circles
            collisionData.shape1 = circle1;
            collisionData.unitVector = new Vector(circle2.x - circle1.x, circle2.y - circle1.y);
            collisionData.unitVector.normalize();
            collisionData.overlap = collisionData.separation.length;
            return collisionData;
        }

        return null; //no collision, return null

    } //checkCircles
    
    private static function checkPolygons(polygon1:Polygon, polygon2:Polygon):CollisionData {

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
        var collisionData:CollisionData = new CollisionData();
        vectors1 = polygon1.transformedVertices.copy();
        vectors2 = polygon2.transformedVertices.copy();
        // add a little padding to make the test work correctly for lines
        if(vectors1.length == 2) {
            var temp:Vector = new Vector(-(vectors1[1].y - vectors1[0].y), vectors1[1].x - vectors1[0].x);
            temp.truncate(0.0000000001);
            vectors1.push(vectors1[1].add(temp));
        }
        if(vectors2.length == 2) {
            var temp:Vector = new Vector(-(vectors2[1].y - vectors2[0].y), vectors2[1].x - vectors2[0].x);
            temp.truncate(0.0000000001);
            vectors2.push(vectors2[1].add(temp));
        }
        
        // loop to begin projection
        for(i in 0 ... vectors1.length) {

            // get the normal axis, and begin projection
            axis = findNormalAxis(vectors1, i);
            
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
            var distance : Float = -(max2 - min1);
            if(Math.abs(distance) < shortestDistance) {
                collisionData.unitVector = axis;
                collisionData.overlap = distance;
                shortestDistance = Math.abs(distance);
            }
        }
        
        //if you're here, there is a collision
        collisionData.shape1 = polygon1;
        collisionData.shape2 = polygon2;
        collisionData.separation = new Vector(collisionData.unitVector.x * collisionData.overlap, collisionData.unitVector.y * collisionData.overlap); //return the separation, apply it to a polygon to separate the two shapes.
        
        return collisionData;

    } //checkPolygons
    
    private static function findNormalAxis(vertices:Array<Vector>, index:Int):Vector {
        var vector1:Vector = vertices[index];
        var vector2:Vector = (index >= vertices.length - 1) ? vertices[0] : vertices[index + 1]; //make sure you get a real vertex, not one that is outside the length of the vector.
        
        var normalAxis:Vector = new Vector(-(vector2.y - vector1.y), vector2.x - vector1.x); //take the two vertices, make a line out of them, and find the normal of the line
        normalAxis.normalize(); //normalize the line(set its length to 1)
        return normalAxis;
    } //findNormalAxis


} //Collision

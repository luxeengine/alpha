package hxcollision;

	import hxcollision.shapes.BaseShape;
	import hxcollision.shapes.Circle;
	import hxcollision.shapes.Polygon;
	import hxcollision.math.Vector2D;

	import hxcollision.CollisionData;
	
	class Collision {
		
		public function new() {
			throw "Collision is a static class. No instances can be created.";
		}
		
		public static function fake():Void {

		}
		public static function testShapes( shape1:BaseShape, shape2:BaseShape ): CollisionData {

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
		}
		
		private static function checkCircleVsPolygon(circle:Circle, polygon:Polygon):CollisionData {

			var test1 : Float; //numbers for testing max/mins
			var test2 : Float;
			var test : Float;
			
			var min1 : Float = 0; //same as above
			var max1 : Float = 0x3FFFFFFF;
			var min2 : Float = 0;
			var max2 : Float = 0x3FFFFFFF;
			var normalAxis:Vector2D = new Vector2D();
			var offset : Float;
			var vectorOffset:Vector2D = new Vector2D();
			var vectors:Array<Vector2D>;

			var distance : Float;
			var testDistance : Float = 0x3FFFFFFF;
			var closestVector:Vector2D = new Vector2D(); //the vector to use to find the normal
			
			// find offset
			vectorOffset = new Vector2D(polygon.x - circle.x, polygon.y - circle.y);
			vectors = polygon.vertices.copy(); //we don't want the transformed ones here, we transform the points later
			
			//adds some padding to make it more accurate
			if(vectors.length == 2) {
				var temp:Vector2D = new Vector2D(-(vectors[1].y - vectors[0].y), vectors[1].x - vectors[0].x);
				temp.truncate(0.0000000001);
				vectors.push( vectors[1].cloneVector().add(temp) );
			}
			
			// find the closest vertex to use to find normal
			for(i in 0 ... vectors.length) {
				distance = (circle.x - (polygon.x + vectors[i].x)) * (circle.x - (polygon.x + vectors[i].x)) + (circle.y - (polygon.y + vectors[i].y)) * (circle.y - (polygon.y + vectors[i].y));
				if(distance < testDistance) { //closest has the lowest distance
					testDistance = distance;
					closestVector.x = polygon.x + vectors[i].x;
					closestVector.y = polygon.y + vectors[i].y;
				}
				
			}
			
			//get the normal vector
			normalAxis = new Vector2D(closestVector.x - circle.x, closestVector.y - circle.y);
			normalAxis.normalize(); //normalize is(set its length to 1)
			
			// project the polygon's points
			min1 = normalAxis.dotProduct(vectors[0]);
			max1 = min1; //set max and min
			
			for(j in 1 ... vectors.length) { //project all its points, starting with the first(the 0th was done up there^)
				test = normalAxis.dotProduct(vectors[j]); //dotProduct to project
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
			offset = normalAxis.dotProduct(vectorOffset);
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
				min1 = normalAxis.dotProduct(vectors[0]); //project
				max1 = min1; //set max and min
				
				//project all the other points(see, cirlces v. polygons use lots of this...)
				for(j in 1 ... vectors.length) {
					test = normalAxis.dotProduct(vectors[j]); //more projection
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
				offset = normalAxis.dotProduct(vectorOffset);
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
			collisionData.separation = new Vector2D(normalAxis.x * (max2 - min1) * -1, normalAxis.y * (max2 - min1) * -1); //return the separation distance
			return collisionData;
		}
		
		private static function checkCircles(circle1:Circle, circle2:Circle):CollisionData {
			var totalRadius : Float = circle1.transformedRadius + circle2.transformedRadius; //add both radii together to get the colliding distance
			var distanceSquared : Float = (circle1.x - circle2.x) * (circle1.x - circle2.x) + (circle1.y - circle2.y) * (circle1.y - circle2.y); //find the distance between the two circles using Pythagorean theorem. No square roots for optimization
			
			if(distanceSquared < totalRadius * totalRadius) { //if your distance is less than the totalRadius square(because distance is squared)
				var difference : Float = totalRadius - Math.sqrt(distanceSquared); //find the difference. Square roots are needed here.
				var collisionData:CollisionData = new CollisionData(); //new CollisionData class to hold all the data for this collision
				collisionData.separation = new Vector2D((circle2.x - circle1.x) * difference, (circle2.y - circle1.y) * difference); //find the movement needed to separate the circles
				collisionData.shape1 = circle1;
				collisionData.unitVector = new Vector2D(circle2.x - circle1.x, circle2.y - circle1.y);
				collisionData.unitVector.normalize();
				collisionData.overlap = collisionData.separation.length;
				return collisionData;
			}
			return null; //no collision, return null
		}
		
		private static function checkPolygons(polygon1:Polygon, polygon2:Polygon):CollisionData {
			var test1 : Float; // numbers to use to test for overlap
			var test2 : Float;
			var testNum : Float; // number to test if its the new max/min
			var min1 : Float; //current smallest(shape 1)
			var max1 : Float; //current largest(shape 1)
			var min2 : Float; //current smallest(shape 2)
			var max2 : Float; //current largest(shape 2)
			var axis:Vector2D; //the normal axis for projection
			var offset : Float;
			var vectors1:Array<Vector2D>; //the points
			var vectors2:Array<Vector2D>; //the points
			var shortestDistance : Float = 0x3FFFFFFF;
			var collisionData:CollisionData = new CollisionData();
			vectors1 = polygon1.transformedVertices.copy();
			vectors2 = polygon2.transformedVertices.copy();
			// add a little padding to make the test work correctly for lines
			if(vectors1.length == 2) {
				var temp:Vector2D = new Vector2D(-(vectors1[1].y - vectors1[0].y), vectors1[1].x - vectors1[0].x);
				temp.truncate(0.0000000001);
				vectors1.push(vectors1[1].add(temp));
			}
			if(vectors2.length == 2) {
				var temp:Vector2D = new Vector2D(-(vectors2[1].y - vectors2[0].y), vectors2[1].x - vectors2[0].x);
				temp.truncate(0.0000000001);
				vectors2.push(vectors2[1].add(temp));
			}
			
			// loop to begin projection
			for(i in 0 ... vectors1.length) {
				// get the normal axis, and begin projection
				axis = findNormalAxis(vectors1, i);
				
				// project polygon1
				min1 = axis.dotProduct(vectors1[0]);
				max1 = min1; //set max and min equal
				
				for(j in 1 ... vectors1.length) {
					testNum = axis.dotProduct(vectors1[j]); //project each point
					if(testNum < min1) {
						min1 = testNum;
					} //test for new smallest
					if(testNum > max1) {
						max1 = testNum;
					} //test for new largest
				}
				
				// project polygon2
				min2 = axis.dotProduct(vectors2[0]);
				max2 = min2; //set 2's max and min
				
				for(j in 1 ... vectors2.length) {
					testNum = axis.dotProduct(vectors2[j]); //project the point
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
			collisionData.separation = new Vector2D(collisionData.unitVector.x * collisionData.overlap, collisionData.unitVector.y * collisionData.overlap); //return the separation, apply it to a polygon to separate the two shapes.
			return collisionData;
		}
		
		private static function findNormalAxis(vertices:Array<Vector2D>, index:Int):Vector2D {
			var vector1:Vector2D = vertices[index];
			var vector2:Vector2D = (index >= vertices.length - 1) ? vertices[0] : vertices[index + 1]; //make sure you get a real vertex, not one that is outside the length of the vector.
			
			var normalAxis:Vector2D = new Vector2D(-(vector2.y - vector1.y), vector2.x - vector1.x); //take the two vertices, make a line out of them, and find the normal of the line
			normalAxis.normalize(); //normalize the line(set its length to 1)
			return normalAxis;
		}
	}

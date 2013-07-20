package hxcollision;

	import nme.geom.Point;
	import hxcollision.shapes.BaseShape;
	import hxcollision.math.Vector2D;
	
	class CollisionData {

			// the overlap
		public var overlap : Float = 0; 
			// a vector that when subtracted to shape A will separate it from shape B
		public var separation : Vector2D;
		
			// the first shape
		public var shape1 : BaseShape;
			// the second shape
		public var shape2 : BaseShape;

			// unit vector in the direction that you need to move
		public var unitVector : Vector2D; 
		
			//Constructor
		public function new() {
			separation = new Vector2D(); 
			unitVector = new Vector2D();
		}
	}

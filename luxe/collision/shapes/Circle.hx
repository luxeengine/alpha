package luxe.collision.shapes;

	import luxe.collision.math.Vector2D;
	import luxe.collision.shapes.Shape;
	
	class Circle extends Shape {

		private var _radius:Float;

		public var radius( get_radius, never ) : Float;
		public var transformedRadius( get_transformedRadius, never ) : Float;
		
		private function get_radius():Float {
			return _radius;
		}
		
		private function get_transformedRadius():Float {
			return _radius * scaleX;
		}
		
		public function new(x:Float, y:Float, radius:Float) {
			super( x, y );
			_radius = radius;
			name = 'circle ' + _radius;
		}

	}

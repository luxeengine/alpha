package hxcollision.shapes;

	import nme.display.Graphics;
	import hxcollision.math.Vector2D;
	import hxcollision.shapes.BaseShape;
	
	class Circle extends BaseShape {

		private var _radius:Float;

		public var radius( get_radius, never ) : Float;
		public var transformedRadius( get_transformedRadius, never ) : Float;
		
		private function get_radius():Float {
			return _radius;
		}
		
		private function get_transformedRadius():Float {
			return _radius * scaleX;
		}
		
		public function new(radius:Float, position:Vector2D) {
			super( position );
			_radius = radius;			
		}
		
		override public function draw( graphics:Graphics ) : Void {
			graphics.drawCircle(x, y, transformedRadius);
		}
	}

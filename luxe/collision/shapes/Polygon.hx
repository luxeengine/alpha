package luxe.collision.shapes;
	
	import luxe.collision.math.Vector2D;
	import luxe.collision.shapes.Shape;
	
	class Polygon extends Shape {
		
		public function new( x:Float, y:Float, vertices:Array<Vector2D> ) {

			super( x,y );
			
			name = vertices.length + 'polygon';

			_vertices = vertices;			
		}
		
		override public function destroy() : Void {

			var _count : Int = _vertices.length;
			for(i in 0 ... _count) {
				_vertices[i] = null;
			}

			_vertices = null;
			super.destroy();
		}
		

		
		public static function create( x:Float, y:Float, sides:Int, radius:Float=100):Polygon {
			if(sides < 3) {
				throw 'Polygon - Needs at least 3 sides';
			}

			var rotation:Float = (Math.PI * 2) / sides;
			var angle:Float;
			var vector:Vector2D;
			var vertices:Array<Vector2D> = new Array<Vector2D>();

			for(i in 0 ... sides) {
				angle = (i * rotation) + ((Math.PI - rotation) * 0.5);
				vector = new Vector2D();
				vector.x = Math.cos(angle) * radius;
				vector.y = Math.sin(angle) * radius;
				vertices.push(vector);
			}
			return new Polygon(x,y,vertices);
		}
		
		public static function rectangle(x:Float, y:Float, width:Float, height:Float, centered:Bool = true):Polygon {
			
			var vertices:Array<Vector2D> = new Array<Vector2D>();

			if(centered) {

				vertices.push( new Vector2D( -width / 2, -height / 2) );
				vertices.push( new Vector2D(  width / 2, -height / 2) );
				vertices.push( new Vector2D(  width / 2,  height / 2) );
				vertices.push( new Vector2D( -width / 2,  height / 2) );

			} else {

				vertices.push( new Vector2D( 0, 0 ) );
				vertices.push( new Vector2D( width, 0 ) );
				vertices.push( new Vector2D( width, height) );
				vertices.push( new Vector2D( 0, height) );

			}

			return new Polygon(x,y,vertices);
		}
		
		public static function square(x:Float, y:Float, width:Float, centered:Bool = true):Polygon {
			return rectangle(x, y, width, width, centered);
		}
	}

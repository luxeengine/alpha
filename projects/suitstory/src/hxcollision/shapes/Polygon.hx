package hxcollision.shapes;
	
	import nme.display.Graphics;
	import hxcollision.math.Vector2D;
	import hxcollision.shapes.BaseShape;
	
	class Polygon extends BaseShape {
		
		public function new( vertices:Array<Vector2D>, position:Vector2D ) {

			super(position);
			
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
		
		override public function draw( graphics:Graphics ) : Void {
			
			var v : Array<Vector2D> = transformedVertices.copy();

			graphics.moveTo( v[0].x, v[0].y );

			var _count : Int = _vertices.length;
			for(i in 0 ... _count) {
				graphics.lineTo(v[i].x, v[i].y);
			}

			graphics.lineTo(v[0].x, v[0].y);
		}
		
		public static function normalPolygon(sides:Int, radius:Float=100, position:Vector2D=null):Polygon {
			if(sides < 3) {
				throw 'Polygon - Needs at least 3 sides';
			}
			
			if(position == null) {
				position = new Vector2D();
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
			return new Polygon(vertices, position);
		}
		
		public static function rectangle(width:Float, height:Float, position:Vector2D, centered:Bool = true):Polygon {
			
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

			return new Polygon(vertices, position);
		}
		
		public static function square(width:Float, position:Vector2D):Polygon {
			return rectangle(width, width, position);
		}
	}

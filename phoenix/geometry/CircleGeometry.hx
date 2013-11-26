package phoenix.geometry;

import phoenix.geometry.Vertex ;
import phoenix.Vector;
import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.Circle;

class CircleGeometry extends Geometry {

	public function new( options : Dynamic ) {

		super(options);
        
        if(options == null) return;

        if(options.end_angle == null) {
        	options.end_angle = 360;
        }

        if(options.steps == null) {
        	options.steps = Luxe.utils.geometry.segments_for_smooth_circle( options.r );
        }

            //Apply the new options rect
		set( new Circle(options.x, options.y, options.r), options.steps, phoenix.utils.Maths.degToRad(options.end_angle) );

        if(options.enabled != null) enabled = options.enabled;

	} //new

	public function set( _circle:Circle, _steps:Int, _end_angle:Float  ) {

			//adapted from
			//http://slabode.exofire.net/circle_draw.shtml
		primitive_type = PrimitiveType.triangle_fan;

			//add the center of the circle
		var center : Vertex = new Vertex( new Vector( 0, 0 ) );
			center.color = color;	

				//Precompute the value based on segments
			var theta = _end_angle / _steps;

			var tangential_factor = Math.tan( theta );
			var radial_factor = Math.cos( theta );
			
			var x : Float = _circle.r; 
			var y : Float = 0; 
		    
			for( i in 0 ... _steps ) {

				var __x = x;
				var __y = y;

				var vert = new Vertex(new Vector( __x,__y ));
					vert.color = color;

				add(vert);
		        
					var tx = -y; 
					var ty = x; 
			        
					x += tx * tangential_factor; 
					y += ty * tangential_factor; 
			        
					x *= radial_factor;
					y *= radial_factor;

			} //for

		//and finally, set the position
		pos.set( _circle.x, _circle.y );
	}

} //CircleGeometry

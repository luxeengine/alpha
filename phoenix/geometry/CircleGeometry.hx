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

            //some default values so that the circle is visible with no values
        var _radius = 16;

        if(options.end_angle == null) {
        	options.end_angle = 360;
        }        

        if(options.start_angle == null) {
        	options.start_angle = 0;
        }

        if(options.r != null) {
            _radius = options.r;
        }

        if(options.steps == null) {
            if(options.smooth == null) {
                options.steps = Luxe.utils.geometry.segments_for_smooth_circle( _radius );
            } else {
                var _smooth : Float = options.smooth;
                options.steps = Luxe.utils.geometry.segments_for_smooth_circle( _radius, _smooth );
            }
        }

            //Apply the new options 
		set( options.x, options.y, _radius, options.steps, options.start_angle, options.end_angle );

        if(options.enabled != null) enabled = options.enabled;

	} //new

	public function set( _x:Float, _y:Float, _r:Float, _steps:Int, _start_angle:Float=0, _end_angle:Float=360 ) {

			//adapted from
			//http://slabode.exofire.net/circle_draw.shtml
		primitive_type = PrimitiveType.triangle_fan;

			//add the center of the circle
		var center : Vertex = new Vertex( new Vector( 0, 0 ) );
			center.color = color;

            var _start_angle_rad = luxe.utils.Maths.degToRad(_start_angle);
            var _end_angle_rad = luxe.utils.Maths.degToRad(_end_angle);

			var _range = _end_angle_rad - _start_angle_rad;

				//Precompute the value based on segments
			var theta = _range / _steps;

			var tangential_factor = Math.tan( theta );
			var radial_factor = Math.cos( theta );
			
			var x : Float = _r * Math.cos(_start_angle_rad); 
			var y : Float = _r * Math.sin(_start_angle_rad);
		    
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
		pos.set( _x, _y );
	}

} //CircleGeometry

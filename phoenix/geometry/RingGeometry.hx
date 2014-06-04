package phoenix.geometry;

import phoenix.geometry.Vertex ;
import phoenix.Vector;
import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.Circle;

class RingGeometry extends CircleGeometry {

	public function new( options : Dynamic ) {

		super(options);

			//set to line type
		primitive_type = PrimitiveType.lines;

	} //new

	override public function set( _x:Float, _y:Float, _rx:Float, _ry:Float, _steps:Int, _start_angle:Float=0, _end_angle:Float=360 ) {

            //adapted from
            //http://slabode.exofire.net/circle_draw.shtml
            
        primitive_type = PrimitiveType.triangles;

            var _start_angle_rad = luxe.utils.Maths.degToRad(_start_angle);
            var _end_angle_rad = luxe.utils.Maths.degToRad(_end_angle);

            var _range = _end_angle_rad - _start_angle_rad;

                //Precompute the value based on segments
            var theta = _range / _steps;

            var tangential_factor = Math.tan( theta );
            var radial_factor = Math.cos( theta );
            
            var x : Float = _rx * Math.cos(_start_angle_rad); 
            var y : Float = _rx * Math.sin(_start_angle_rad);

            //now work out the ratio between _x and _y 
            var radial_ratio : Float = _rx / _ry;
            if(radial_ratio == 0) radial_ratio = 0.000000001;
            
            var _index = 0;
            var _segment_pos = [];
            for( i in 0 ... _steps ) {

                var __x = x;
                var __y = y / radial_ratio;

                    //the position of this current segment
                var _seg = new Vector( __x,__y );
                    //we store them to reference them behind
                _segment_pos.push(_seg);

                    //one for the segment position
                add(new Vertex( _seg, color ));

                    //and if past 0, one for the prev segment to close the tri
                if(_index > 0) {
                    var prevvert = _segment_pos[_index];
                    add(new Vertex( prevvert.clone(), color ));
                }

                var tx = -y;
                var ty = x;

                x += tx * tangential_factor; 
                y += ty * tangential_factor; 
                
                x *= radial_factor;
                y *= radial_factor;                    

                _index++;

            } //for

                //wrap it up
            add( new Vertex( _segment_pos[0], color ) );

        //and finally, set the position
        transform.pos = new Vector( _x, _y );
        
    } //set	

} //RingGeometry

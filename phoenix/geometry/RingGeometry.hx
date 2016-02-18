package phoenix.geometry;

import luxe.Log.*;
import phoenix.Vector;
import phoenix.geometry.Vertex;
import phoenix.geometry.Geometry;
import phoenix.Batcher.PrimitiveType;
import luxe.options.GeometryOptions.CircleGeometryOptions;


class RingGeometry extends Geometry {

	public function new(_options:CircleGeometryOptions) {

        _options.primitive_type = PrimitiveType.lines;

        super(_options);

            //some default values so that the circle is visible with no values
        var _radius_x = 32.0;
        var _radius_y = 32.0;

        def(_options.end_angle, 360);
        def(_options.start_angle, 0);

        if(_options.r != null) {
            _radius_x = _options.r;
            _radius_y = _options.r;
        }

        if(_options.rx != null) {
            _radius_x = _options.rx;
        }

        if(_options.ry != null) {
            _radius_y = _options.ry;
        }

        if(_options.steps == null) {
            if(_options.smooth == null) {
                var _max = Math.max(_radius_x, _radius_y);
                _options.steps = Luxe.utils.geometry.segments_for_smooth_circle( _max );
            } else {
                var _smooth = _options.smooth;
                var _max = Math.max(_radius_x, _radius_y);
                _options.steps = Luxe.utils.geometry.segments_for_smooth_circle( _max, _smooth );
            }
        }

            //Apply the new options
        set( _options.x, _options.y, _radius_x, _radius_y, _options.steps, _options.start_angle, _options.end_angle );

	} //new

	public function set( _x:Float, _y:Float, _rx:Float, _ry:Float, _steps:Int, _start_angle_degrees:Float=0, _end_angle_degrees:Float=360 ) {

            //adapted from
            //http://slabode.exofire.net/circle_draw.shtml

            var _start_angle_rad = luxe.utils.Maths.radians(_start_angle_degrees);
            var _end_angle_rad = luxe.utils.Maths.radians(_end_angle_degrees);

            var _range = _end_angle_rad - _start_angle_rad;

                //Precompute the value based on segments
            var theta = _range / _steps;

            var tangential_factor = Math.tan( theta );
            var radial_factor = Math.cos( theta );

            var x : Float = _rx * Math.cos(_start_angle_rad);
            var y : Float = _rx * Math.sin(_start_angle_rad);

            //now work out the ratio between _x and _y
            //:todo: epsilon
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

                //if steps is < 0 no segments were added
            if(_segment_pos.length > 0) {
                add( new Vertex( _segment_pos[0].clone(), color ) );
            }

        //and finally, set the position
        transform.pos = new Vector( _x, _y );

    } //set

} //RingGeometry

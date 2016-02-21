package phoenix.geometry;

import luxe.Log.*;
import phoenix.Vector;
import phoenix.geometry.Vertex;
import phoenix.geometry.Geometry;
import phoenix.Batcher.PrimitiveType;
import luxe.options.GeometryOptions.CircleGeometryOptions;


class CircleGeometry extends Geometry {

    public function new(_options:CircleGeometryOptions) {

        _options.primitive_type = PrimitiveType.triangles;

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

    public function set( _x:Float, _y:Float, _rx:Float, _ry:Float, _steps:Int, _start_angle:Float=0, _end_angle:Float=360 ) {

            //adapted from
            //http://slabode.exofire.net/circle_draw.shtml

            var half_pi = Math.PI/2;
            var _start_angle_rad = luxe.utils.Maths.radians(_start_angle) - half_pi;
            var _end_angle_rad = luxe.utils.Maths.radians(_end_angle) - half_pi;

            var _range = _end_angle_rad - _start_angle_rad;

                //how much % of 360 is this, to limit step count?
            _steps = Math.ceil((Math.abs(_range)/(Math.PI*2)) * _steps );

                //Precompute the value based on segments
            var theta = _range / _steps;

            var tangential_factor = Math.tan( theta );
            var radial_factor = Math.cos( theta );

            var x = _rx * Math.cos(_start_angle_rad);
            var y = _rx * Math.sin(_start_angle_rad);

            //now work out the ratio between _x and _y
            var radial_ratio = _rx / _ry;
            if(radial_ratio == 0) {
                radial_ratio = 0.000000001;
            }

            var _index = 0;
            var _segment_pos = [];
            for( i in 0 ... _steps+1 ) {

                var __x = x;
                var __y = y / radial_ratio;

                    //the position of this current segment
                var _seg = new Vector( __x,__y );
                    //we store them to reference them behind
                _segment_pos.push(_seg);

                    //and if past first node, close the prev tri with new seg pos
                if(_index > 0) {
                    add(new Vertex( _seg, color )); //2
                }

                    //one for the center point
                add( new Vertex( new Vector( 0,0 ), color ) ); //0

                    //one for the segment position
                add(new Vertex( _seg, color )); //1

                var tx = -y;
                var ty = x;

                x += tx * tangential_factor;
                y += ty * tangential_factor;

                x *= radial_factor;
                y *= radial_factor;

                _index++;

            } //for

        add(new Vertex( _segment_pos[_steps], color )); //1

            //and finally, set the position
        transform.pos = new Vector( _x, _y );

    } //set


} //CircleGeometry

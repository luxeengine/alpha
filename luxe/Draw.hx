package luxe;

import luxe.Color;
import phoenix.geometry.Geometry;
import phoenix.geometry.LineGeometry;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.RectangleGeometry;
import phoenix.geometry.CircleGeometry;
import phoenix.Batcher;
import phoenix.geometry.RingGeometry;
import phoenix.geometry.ArcGeometry;
import phoenix.geometry.PlaneGeometry;
import phoenix.geometry.Vertex;

import luxe.options.GeometryOptions;

class Draw {


    @:noCompletion public var core : Core;


    @:noCompletion public function new( _core:Core ) {

        core = _core;

    } //new

    public function line( options:LineGeometryOptions ) {

        if(options.p0 == null) { throw "draw.line requires p0:Vector, and p1:Vector"; }
        if(options.p1 == null) { throw "draw.line requires p0:Vector, and p1:Vector"; }
        if(options.id == null) { options.id = 'line.geometry'; }
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

            return new LineGeometry(options);

    } // line

    public function box( options:QuadGeometryOptions ) {

        if(options.id == null) { options.id = 'quad.geometry'; }
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        return new QuadGeometry(options);

    } //box

    public function rectangle( options:RectangleGeometryOptions ) {

        if(options.id == null) { options.id = 'rectangle.geometry'; };
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        return new RectangleGeometry(options);

    } //rectangle

    public function ring( options:CircleGeometryOptions ) {

        if(options.id == null) { options.id = 'ring.geometry'; };
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        return new RingGeometry(options);

    } //ring

    public function arc( options:CircleGeometryOptions ) {

        if(options.id == null) { options.id = 'arc.geometry'; };
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        return new ArcGeometry(options);

    } //arc

    public function circle( options:CircleGeometryOptions ) {

        if(options.id == null) { options.id = 'circle.geometry'; };
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        return new CircleGeometry(options);

    } //circle

    public function ngon(options:Dynamic) : Geometry {

        if(options.id == null) { options.id = 'ngon.geometry'; };
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        var _sides : Int = 3;
        var _radius : Float = 64;
        var _solid : Bool = false;
        var _x : Float = 0;
        var _y : Float = 0;
        var _angle : Float = 0;

        if(options.sides != null) {
            _sides = options.sides;
        }

        if(options.r != null) { _radius = options.r; }
        if(options.x != null) { _x = options.x; }
        if(options.y != null) { _y = options.y; }
        if(options.angle != null) { _angle = options.angle; }
        if(options.solid != null) { _solid = options.solid; }

        var _geometry = new Geometry(options);

        if(!_solid) {
            _geometry.primitive_type = PrimitiveType.line_loop;
        } else {
            _geometry.primitive_type = PrimitiveType.triangle_fan;
        }

        var _two_pi : Float = 2 * Math.PI;
        var _sides_over_pi : Float = Math.PI / _sides;
        var _sides_over_twopi : Float = _two_pi / _sides;
        var _angle_rad : Float = luxe.utils.Maths.degToRad(_angle);

        if(_solid) {
                //add the center vertex
            _geometry.add(
                new Vertex(
                    new Vector( _x, _y, 0 ),
                    options.color
                )
            ); //add
        }

        var _count : Int = _sides+1;
        var _start : Int = (_solid == false) ? 1 : 0;

        for(i in _start ... _count ) {

            var __x = (_radius * Math.sin(_angle_rad + (_sides_over_pi) + (i * (_sides_over_twopi))));
            var __y = (_radius * Math.cos(_angle_rad + (_sides_over_pi) + (i * (_sides_over_twopi))));

            _geometry.add(
                new Vertex(
                    new Vector( _x + __x, _y + __y, 0 ),
                    options.color
                )
            ); //add

        } //for all sides

        return _geometry;

    } //ngon

    public function texture( options:Dynamic ) {

        if(options.id == null) { options.id = 'texture.geometry'; };
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        var _x = 0;
        var _y = 0;
        var _w = 0;
        var _h = 0;

            //this is an arbitrary default
        var _tw = 64;
        var _th = 64;

            if(options.texture != null) {
                _tw = options.texture.width;
                _th = options.texture.height;

                if(options.size == null) {
                    _w = _tw;
                    _h = _th;
                }
            }

            if(options.pos != null) {
                _x = options.pos.x;
                _y = options.pos.y;
            }
            if(options.size != null) {
                _w = options.size.x;
                _h = options.size.y;
            }

            options.x = _x;
            options.y = _y;
            options.w = _w;
            options.h = _h;

            var _quad = new QuadGeometry(options);

            var _ux = 0;
            var _uy = 0;
            var _uw = _tw;
            var _uh = _th;

            if(options.uv != null) {
                _ux = options.uv.x;
                _uy = options.uv.y;
                _uw = options.uv.w;
                _uh = options.uv.h;
            }

            _quad.uv( new Rectangle(_ux, _uy, _uw, _uh) );

        return _quad;

    } //texture

    public function text( options:Dynamic ) {

        if(options.id == null) { options.id = 'text.geometry'; };
        if(options.font == null) { options.font = Luxe.renderer.font; }
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        var _text = options.font.draw_text(options);

        return _text;

    } //text

    public function plane( ?options:PlaneGeometryOptions ) {

        if(options.id == null) { options.id = 'plane.geometry'; };
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        return new PlaneGeometry( options );

    } //_plane


} //Draw

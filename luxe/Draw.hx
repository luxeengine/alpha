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
import luxe.options.DrawOptions;

/**
    The `Luxe.draw` API class implementation.
    This class handles quick access to drawing common geometry options,
    and is a facilitator for higher level drawing. These can be used given to a `Visual` to convert
    them into a higher level entity for use with the default scene.
 */
class Draw {

//Public API

        /** Draw a line geometry between points `p0` and `p1` with options */
    public function line( options:DrawLineOptions ) {

        if(options.p0 == null) { throw "draw.line requires p0:Vector, and p1:Vector"; }
        if(options.p1 == null) { throw "draw.line requires p0:Vector, and p1:Vector"; }
        if(options.id == null) { options.id = 'line.geometry'; }
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

            return new LineGeometry(options);

    } // line

        /** Draw a rectangle outline at the specified `x`,`y`,`w`,`h` with options */
    public function rectangle( options:DrawRectangleOptions ) {

        if(options.id == null) { options.id = 'rectangle.geometry'; };
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        return new RectangleGeometry(options);

    } //rectangle

        /** Draw a solid rectangle box at the specified `x`,`y`,`w`,`h` with options */
    public function box( options:DrawBoxOptions ) {

        if(options.id == null) { options.id = 'quad.geometry'; }
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        return new QuadGeometry(options);

    } //box

        /** Draw a circle outline at the specified `x`,`y` with radius `r` (or `rx`,`ry` optionally for an ellipse), with options */
    public function ring( options:DrawRingOptions ) {

        if(options.id == null) { options.id = 'ring.geometry'; };
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        return new RingGeometry(options);

    } //ring

        /** Draw a solid circle at the specified `x`,`y` with radius `r` (or `rx`,`ry` optionally for an ellipse), with options */
    public function circle( options:DrawCircleOptions ) {

        if(options.id == null) { options.id = 'circle.geometry'; };
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        return new CircleGeometry(options);

    } //circle

        /** Draw an arc (open circle) at the specified `x`,`y`, between `start_angle` and `end_angle` with radius `r` (or `rx`,`ry` optionally for an ellipsical arc), with options */
    public function arc( options:DrawArcOptions ) {

        if(options.id == null) { options.id = 'arc.geometry'; };
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        return new ArcGeometry(options);

    } //arc

        /** Draw an n-sided polygon (3 sides for triangle, 6 for hexagon etc) at `x`,`y` with a radius `r` and `sides` with options  */
    public function ngon( options:DrawNgonOptions ) : Geometry {

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

        /** Draw a textured `box` with image `texture` at `x`,`y`,`w`,`h` OR with `pos` and `size`, and `uv` with options */
    public function texture( options:DrawTextureOptions ) {

        if(options.id == null) { options.id = 'texture.geometry'; };
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        var _x : Float = 0;
        var _y : Float = 0;
        var _w : Float = 0;
        var _h : Float = 0;

            //this is an arbitrary default
        var _tw : Int = 64;
        var _th : Int = 64;

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

            if(options.x == null) {
                options.x = _x;
            }

            if(options.y == null) {
                options.y = _y;
            }

            if(options.w == null) {
                options.w = _w;
            }

            if(options.h == null) {
                options.h = _h;
            }

            var _quad = new QuadGeometry(options);

            var _ux : Float = 0;
            var _uy : Float = 0;
            var _uw : Float = _tw;
            var _uh : Float = _th;

            if(options.uv != null) {
                _ux = options.uv.x;
                _uy = options.uv.y;
                _uw = options.uv.w;
                _uh = options.uv.h;
            }

            _quad.uv( new Rectangle(_ux, _uy, _uw, _uh) );

        return _quad;

    } //texture

        /** Draw `text` at `pos` using `font` (or no font for default font) with options */
    public function text( options:Dynamic ) {

        if(options.id == null) { options.id = 'text.geometry'; };
        if(options.font == null) { options.font = Luxe.renderer.font; }
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        var _text = options.font.draw_text(options);

        return _text;

    } //text

        //hidden as 3D specifics aren't in the API yet.
        /** Draw a plane (three dimensional quad) with options */
    @:noCompletion public function plane( ?options:DrawPlaneOptions ) {

        if(options.id == null) { options.id = 'plane.geometry'; };
        if(options.batcher == null) { options.batcher = Luxe.renderer.batcher; }

        return new PlaneGeometry( options );

    } //_plane


//Internal API

    @:noCompletion public var core : Core;
    @:noCompletion public function new( _core:Core ) {

        core = _core;

    } //new


} //Draw

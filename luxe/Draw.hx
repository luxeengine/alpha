package luxe;

import luxe.Log.*;
import luxe.Color;
import phoenix.Batcher;
import phoenix.geometry.*;

    //:todo: move text options to the options package
import phoenix.geometry.TextGeometry.TextGeometryOptions;

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

        assertnull(options.p0, 'draw.line requires p0:Vector, and p1:Vector');
        assertnull(options.p1, 'draw.line requires p0:Vector, and p1:Vector');

        def(options.id, 'line.geometry');
        def(options.batcher, Luxe.renderer.batcher);

            return new LineGeometry(options);

    } // line

        /** Draw a rectangle outline at the specified `x`,`y`,`w`,`h` with options */
    public function rectangle( options:DrawRectangleOptions ) {

        def(options.id, 'rectangle.geometry');
        def(options.batcher, Luxe.renderer.batcher);

        return new RectangleGeometry(options);

    } //rectangle

        /** Draw a solid rectangle box at the specified `x`,`y`,`w`,`h` with options */
    public function box( options:DrawBoxOptions ) {

        def(options.id, 'quad.geometry');
        def(options.batcher, Luxe.renderer.batcher);

        return new QuadGeometry(options);

    } //box

        /** Draw a circle outline at the specified `x`,`y` with radius `r` (or `rx`,`ry` optionally for an ellipse), with options */
    public function ring( options:DrawRingOptions ) {

        def(options.id, 'ring.geometry');
        def(options.batcher, Luxe.renderer.batcher);

        return new RingGeometry(options);

    } //ring

        /** Draw a solid circle at the specified `x`,`y` with radius `r` (or `rx`,`ry` optionally for an ellipse), with options */
    public function circle( options:DrawCircleOptions ) {

        def(options.id, 'circle.geometry');
        def(options.batcher, Luxe.renderer.batcher);

        return new CircleGeometry(options);

    } //circle

        /** Draw an arc (open circle) at the specified `x`,`y`, between `start_angle` and `end_angle` with radius `r` (or `rx`,`ry` optionally for an ellipsical arc), with options */
    public function arc( options:DrawArcOptions ) {

        def(options.id, 'arc.geometry');
        def(options.batcher, Luxe.renderer.batcher);

        return new ArcGeometry(options);

    } //arc

        /** Draw an n-sided polygon (3 sides for triangle, 6 for hexagon etc) at `x`,`y` with a radius `r` and `sides` with options  */
    public function ngon( options:DrawNgonOptions ) : Geometry {

        def(options.id, 'ngon.geometry');
        def(options.batcher, Luxe.renderer.batcher);

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

        if(!_solid) {
            options.primitive_type = PrimitiveType.lines;
        } else {
            options.primitive_type = PrimitiveType.triangle_fan;
        }

        var _geometry = new Geometry(options);
        var _two_pi : Float = 2 * Math.PI;
        var _sides_over_pi : Float = Math.PI / _sides;
        var _sides_over_twopi : Float = _two_pi / _sides;
        var _angle_rad : Float = luxe.utils.Maths.radians(_angle);
        var _color = options.color;

        if(_solid) {
                //add the center vertex
            _geometry.add( new Vertex( new Vector( _x, _y ), _color ) );
        }

        var _count : Int = (_solid == false) ? _sides : _sides+1;
        var _points:Array<Vector> = [];

        for(i in 0 ... _count ) {

            var __x   = (_radius * Math.sin(_angle_rad + (_sides_over_pi) + (i * (_sides_over_twopi))));
            var __y   = (_radius * Math.cos(_angle_rad + (_sides_over_pi) + (i * (_sides_over_twopi))));
            var __pos = new Vector( _x + __x, _y + __y, 0 );

            _geometry.add( new Vertex( __pos, _color ) );

            if(!_solid) {
                if(i > 0) {
                    var _last = _points[i - 1];
                    _geometry.add( new Vertex( __pos, _color ) );
                }
            }

            _points.push(__pos);

        } //for all sides

        if(!_solid) {
            _geometry.add( new Vertex( _points[0], _color ) );
        }

        return _geometry;

    } //ngon

        /** Draw an arbitrary polygon of points with options.
            Uses triangle fans (no additional verts added) for solid,
            Uses lines for non-solid, adding verts as needed to form lines. */
    public function poly( options:DrawPolygonOptions ) {

        def(options.id, 'poly.geometry');
        def(options.batcher, Luxe.renderer.batcher);
        def(options.solid, true);
        def(options.close, false);

        var _default_col:Color = null;
        var _has_colors = (options.colors != null);
        if(!_has_colors) _default_col = def(options.color, new Color());

        if(options.solid) {

            def(options.primitive_type, PrimitiveType.triangle_fan);

            var _geometry = new Geometry(options);

            var _idx = 0;
            var _l = options.points.length;
            for(_point in options.points) {
                var _color = _has_colors ? options.colors[_idx] : _default_col;
                _geometry.add(new Vertex(_point, _color));
                ++_idx;
            }

            return _geometry;

        } else {

            def(options.primitive_type, PrimitiveType.lines);

            var _geometry = new Geometry(options);

            var _idx = 0;
            var _l = options.points.length;

            for(_point in options.points) {
                var _color = _has_colors ? options.colors[_idx] : _default_col;
                _geometry.add(new Vertex(_point, _color));
                if(_idx < _l-2) {
                    var _color_next = _has_colors ? options.colors[_idx+1] : _default_col;
                    _geometry.add(new Vertex(options.points[_idx+1], _color_next));
                }
                ++_idx;
            }

            if(options.close) {
                var _last = options.points.length-1;
                var _color1 = _has_colors ? options.colors[0] : _default_col;
                var _color2 = _has_colors ? options.colors[_last] : _default_col;
                _geometry.add(new Vertex(options.points[_last], _color1));
                _geometry.add(new Vertex(options.points[0], _color2));
            }

            return _geometry;

        }

    } //poly

        /** Draw a textured `box` with image `texture` at `x`,`y`,`w`,`h` OR with `pos` and `size`, and `uv` with options */
    public function texture( options:DrawTextureOptions ) {

        def(options.id, 'texture.geometry');
        def(options.batcher, Luxe.renderer.batcher);

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

            def(options.x, _x);
            def(options.y, _y);
            def(options.w, _w);
            def(options.h, _h);

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

        /** Draw `text` with options (default font used if none specified) */
    public function text( options:TextGeometryOptions ) {

        def(options.batcher, Luxe.renderer.batcher);

        return new TextGeometry(options);

    } //text

//Internal API

    var core : Core;
    @:allow(luxe.Core)
    function new( _core:Core ) {

        core = _core;

    } //new


} //Draw

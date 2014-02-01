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

class Draw {

    @:noCompletion public var core : Core;
    @:noCompletion public function new( _core:Core ) { core = _core; }

    private function default_options(options:Dynamic) {

        options.font = (options.font == null) ? Luxe.renderer.default_font : options.font;
        options.color = (options.color == null) ? new Color() : options.color;
        options.depth = (options.depth == null) ? 0 : options.depth;
        options.group = (options.group == null) ? 0 : options.group;
        options.immediate = (options.immediate == null) ? false : options.immediate;
        options.batcher = (options.batcher == null)  ? Luxe.renderer.default_batcher : options.batcher;
        options.pos = (options.pos == null)  ? new Vector() : options.pos;

            //return
        return options; 
    }

    public function line(options:Dynamic) {

    	if(options.p0 == null) throw "draw.line requires p0:Vector, and p1:Vector";
    	if(options.p1 == null) throw "draw.line requires p0:Vector, and p1:Vector";
    	
    	options = default_options(options);

        if(options.id == null) { options.id = 'line.geometry'; };

    	var _line = new LineGeometry(options);

    	options.batcher.add(_line, false);

    	return _line;

    } // line

    public function box(options:Dynamic) {
        
        options = default_options(options);

        if(options.id == null) { options.id = 'quad.geometry'; };

        var _box = new QuadGeometry(options);

            options.batcher.add(_box, false);

        return _box;

    } //box

    public function rectangle(options:Dynamic) {

        options = default_options(options);

        if(options.id == null) { options.id = 'rectangle.geometry'; };

    	var _rect = new RectangleGeometry(options);

    	   options.batcher.add(_rect, false);

    	return _rect;
    	
    } //rectangle

    public function text(options:Dynamic) {

        options = default_options(options);

        if(options.id == null) { options.id = 'text.geometry'; };

        var _text = options.font.draw_text(options);  

        return _text;
    } //text


    public function ring(options:Dynamic) {

        options = default_options(options);

        if(options.id == null) { options.id = 'ring.geometry'; };

        var _ring = new RingGeometry(options);

            options.batcher.add(_ring, false);

        return _ring;

    } //ring

    public function arc(options:Dynamic) {

        options = default_options(options);

        if(options.id == null) { options.id = 'arc.geometry'; };

        var _arc = new ArcGeometry(options);

            options.batcher.add(_arc, false);

        return _arc;

    } //arc    

    public function circle(options:Dynamic) {

        options = default_options(options);

        if(options.id == null) { options.id = 'circle.geometry'; };

        var _circle = new CircleGeometry(options);

            options.batcher.add(_circle);

        return _circle;
    } //circle

    public function ngon(options:Dynamic) : Geometry {

        options = default_options(options);

        if(options.id == null) { options.id = 'ngon.geometry'; };

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
                    new Vector(),
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
                    new Vector(),
                    options.color
                )
            ); //add

        } //for all sides

        options.batcher.add(_geometry);

        return _geometry;

    }

    public function plane(options:Dynamic) {
        
        options = default_options(options);

        if(options.id == null) { options.id = 'plane.geometry'; };

        var _plane = new PlaneGeometry(options);

           options.batcher.add(_plane, false);

        return _plane;

    } //_plane


    public function axis3D(?options:Dynamic=null) {
            
        if(options == null) options = {};
        var _scale = options.scale == null ? 100 : options.scale;
        
        options = default_options(options);

//X axis
        line({
            immediate:options.immediate,
            p0 : new Vector(0, _scale, 0),
            p1 : new Vector(0, -_scale, 0),
            color : new Color(0,0.6,0,0.2),
            batcher : options.batcher,
        });
//Z axis
        line({
            immediate:options.immediate,
            p0 : new Vector(0, 0, _scale),
            p1 : new Vector(0, 0, -_scale),
            color : new Color(0,0,0.6,1),
            batcher : options.batcher,
        });
//X axis
        line({
            immediate:options.immediate,
            p0 : new Vector(-_scale, 0, 0),
            p1 : new Vector(_scale, 0, 0),
            color : new Color(0.6,0,0,1),
            batcher : options.batcher,
        });   

    } //axis3D

}


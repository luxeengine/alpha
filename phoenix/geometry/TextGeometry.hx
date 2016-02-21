package phoenix.geometry;

import luxe.options.GeometryOptions;
import luxe.utils.Maths;

import phoenix.BitmapFont;
import phoenix.geometry.Vertex;
import phoenix.geometry.Geometry;
import phoenix.Batcher;
import phoenix.Color;
import phoenix.Rectangle;

import luxe.Log.*;

using luxe.utils.unifill.Unifill;

@:enum abstract EvTextGeometry(Int) from Int to Int {
    var unknown = 0;
    var update_text = 1;
}

typedef TextGeometryOptions = {

    > GeometryOptions,

    ? text: String,
    ? font: BitmapFont,
    ? point_size: Float,
    ? line_spacing: Float,
    ? letter_spacing: Float,
    ? letter_snapping : Bool,

    ? bounds : Rectangle,
    ? bounds_wrap : Bool,

    ? align : TextAlign,
    ? align_vertical : TextAlign,

    ? sdf: Bool,
    ? smoothness: Float,
    ? thickness: Float,

    ? outline: Float,
    ? outline_color: Color,

    ? glow_threshold: Float,
    ? glow_amount: Float,
    ? glow_color: Color

}

class TextGeometry extends Geometry {

    //regular font stuff

        @:isVar public var text (default,set) : String = '';
        @:isVar public var font (default,default) : BitmapFont;
        @:isVar public var point_size (default,set) : Float = 32.0;
        @:isVar public var line_spacing (default,set) : Float = 0.0;
        @:isVar public var letter_spacing (default,set) : Float = 0.0;
        @:isVar public var letter_snapping (default,set) : Bool = false;

        @:isVar public var bounds (default,set) : Rectangle;
        @:isVar public var bounds_wrap (default,set) : Bool = false;

        @:isVar public var align (default,set) : TextAlign;
        @:isVar public var align_vertical (default,set) : TextAlign;

    //distance field specific

        public var sdf : Bool = false;
        public var unique : Bool = false;

        @:isVar public var smoothness (default,set) : Float = 0.75;
        @:isVar public var thickness (default,set) : Float = 0.5;

        @:isVar public var outline (default,set) : Float = 0;
        @:isVar public var outline_color (default,set) : Color;

        @:isVar public var glow_threshold (default,set) : Float = 0;
        @:isVar public var glow_amount (default,set) : Float = 0;
        @:isVar public var glow_color (default,set) : Color;

    //sizing cached information

        public var line_widths : Array<Float>;
        public var text_width : Float = 0;
        public var text_height : Float = 0;
        public var line_offsets : Array< Array<Float> >;
        public var lines : Array<String>;

    //access to change events

        @:noCompletion
        public var emitter : luxe.Emitter<EvTextGeometry>;

    //internal

        var cache : Array< Array<Vertex> >;
        var options : TextGeometryOptions;

        var text_h_w : Float = 0;
        var text_h_h : Float = 0;
        public var point_ratio : Float = 1;

        var dirty_sizing (default,set) : Bool = true;
        var dirty_align: Bool = true;

    //common

        static var tab_regex : EReg = new EReg('\t','gim');

    public function new(_options:TextGeometryOptions) {

        options = _options;
        emitter = new luxe.Emitter<EvTextGeometry>();

        assertnull(options, 'TextGeometry requires non-null options');

        //order here before super() is important

                //make sure sdf flag is early enough
            if(options.sdf != null) sdf = options.sdf;
                //use the default font if none specified
            font = def(options.font, Luxe.renderer.font);
                //the default font is always sdf enabled
            if(font == Luxe.renderer.font) { sdf = true; }

                //if a custom shader is not given,
                //use the default sdf or normal textured
                //but if they have a custom shader, flag
                //the instance as unique so their options are mutable
            if(options.shader == null) {
                if(sdf) {
                    options.shader = Luxe.renderer.shaders.bitmapfont.shader;
                } else {
                    options.shader = Luxe.renderer.shaders.textured.shader;
                }
            } else {
                    //only unique if not the default
                if(options.shader != Luxe.renderer.shaders.bitmapfont.shader) {
                    unique = true;
                }
            }

            options.primitive_type = PrimitiveType.triangles;

            super( options );

        //setup

        cache = [];
        line_widths = [];
        line_offsets = [[],[]];
        lines = [];
        outline_color = new Color();
        glow_color = new Color();

        default_options();

    } //new

//Public API

        /** Remove any cached vertices that are unused by the current text. */
    #if release inline #end
    public function tidy() {

        var _vertidx = Math.floor(vertices.length / 6);
        var _diff = cache.length - _vertidx;

        if(_diff > 0) {

            // _verbose('tidy: remove $_diff from cache');

            var extra = cache.splice(_vertidx, _diff);
            var c = extra.length;
            while(c > 0) {
                c--;
                var vert = extra.pop();
                    vert = null;
            }

        } //diff>0

    } //tidy


//Internal

    override function drop( ?remove:Bool = true ) {

        text = null;
        font = null;
        bounds = null;
        outline_color = null;
        glow_color = null;
        if(line_widths != null) {
            line_widths.splice(0,line_widths.length);
            line_widths = null;
        }
        if(line_offsets != null) {
            line_offsets.splice(0,line_offsets.length);
            line_offsets = null;
        }
        if(lines != null) {
            lines.splice(0,lines.length);
            lines = null;
        }
        emitter = null;
        options = null;
        if(cache != null) {
            while(cache.length > 0) {
                var c = cache.pop();
                while(c.length > 0) {
                    var v = c.pop();
                    v.destroy();
                    v = null;
                }
                c = null;
            }
            cache = null;
        }

        super.drop(remove);

    } //drop


    function default_options() {

            //:todo: currently only
            //one page is supported
            //because each vertex would
            //need to know the page it's on
            //and that would be best served
            //by the new batcher attributes
            //as to not muddy everything up
        texture = font.pages[0];

        //normal font stuff

            if(options.letter_snapping != null) letter_snapping = options.letter_snapping;
            if(options.letter_spacing != null) letter_spacing = options.letter_spacing;
            if(options.line_spacing != null) line_spacing = options.line_spacing;
            if(options.point_size != null) point_size = options.point_size;

            if(options.bounds != null) bounds = options.bounds;
            if(options.bounds_wrap != null) bounds_wrap = options.bounds_wrap;

            def(options.align, TextAlign.left);
            def(options.align_vertical, TextAlign.top);

            align = options.align;
            align_vertical = options.align_vertical;

        //sdf based
        //these will be set anyway, but ignored if not sdf

            if(options.thickness != null) thickness = options.thickness;
            if(options.smoothness != null) smoothness = options.smoothness;

            if(options.outline != null) outline = options.outline;
            if(options.outline_color != null) outline_color = options.outline_color;

            if(options.glow_threshold != null) glow_threshold = options.glow_threshold;
            if(options.glow_amount != null) glow_amount = options.glow_amount;
            if(options.glow_color != null) glow_color = options.glow_color;

            if(sdf) flush_uniforms();

            //text must be last, as it relies on the rest
        if(options.text != null) text = options.text;

    } //default_options

    #if release inline #end
    function set_text(_text:String) : String {

        if(_text == null) {
            _debug('null text passed into TextGeometry!');
            _text = '';
        }

            //don't care if it's the same value
        if(text != _text) {

                //update the value
            text = _text;

            if(text != '') {

                dirty_sizing = true;
                update_text();

            } else {
                vertices.splice(0, vertices.length);
            }

        } //same val

        return text;

    } //set_text

    #if release inline #end
    function stats() {
        return 'letters:${(vertices.length/6)} / cache:${ cache.length }';
    }

    #if release inline #end
    function update_sizes() {

        if(!dirty_sizing) return false;

            //:todo: tab width
        var drawn_text = tab_regex.replace(text, '    ');
        if(bounds_wrap && bounds != null) {
            drawn_text = font.wrap_string_to_bounds(drawn_text, bounds, point_size, letter_spacing);
        }

        lines.splice(0, lines.length);
        lines = drawn_text.split('\n');

            line_widths.splice(0, line_widths.length);

            text_width = font.width_of(drawn_text, point_size, letter_spacing, line_widths);
            text_height = font.height_of_lines(lines, point_size, line_spacing);
            text_h_w = text_width / 2;
            text_h_h = text_height / 2;
            point_ratio = point_size / font.info.point_size;

            dirty_sizing = false;

        return true;

    } //update_sizes


    // #if release inline #end
    function update_text() {

        var _pos_x = 0.0;
        var _pos_y = 0.0;
        var _bounds_based = (bounds != null);

        if(_bounds_based) {
            transform.pos.x = _pos_x = bounds.x;
            transform.pos.y = _pos_y = bounds.y;
        }

        var _cur_x = 0.0;
        var _cur_y = 0.0;
        var _line_idx = 0;
        var _total_idx = 0;
        var _is_char = true;
        var _was_dirty = update_sizes();

        inline function _step() {
            _cur_y += (font.info.line_height + line_spacing) * point_ratio;
            _cur_x = 0;
        }

        for(_line in lines) {

                //Calculate alignment offsets
                //Left is at 0, so it's handled already, same as top
            var _line_x_offset = 0.0;
            var _line_y_offset = 0.0;

            if(dirty_align) {

                if(!_bounds_based) {

                    _line_x_offset = switch(align) {
                        case center: -(line_widths[_line_idx]/2.0);
                        case right: -line_widths[_line_idx];
                        default: 0.0;
                    }

                    _line_y_offset = switch(align_vertical) {
                        case center: -text_h_h;
                        case bottom: -text_height;
                        default: 0.0;
                    }

                } else {

                    _line_x_offset = switch(align) {
                        case center: -(line_widths[_line_idx]/2.0) + (bounds.w/2);
                        case right: -line_widths[_line_idx] + (bounds.w);
                        default: 0.0;
                    }

                    _line_y_offset = switch(align_vertical) {
                        case center: (bounds.h/2) - text_h_h;
                        case bottom: (bounds.h) - text_height;
                        default: 0.0;
                    }

                }

                    //store it in the cache for later
                line_offsets[0][_line_idx] = _line_x_offset;
                line_offsets[1][_line_idx] = _line_y_offset;

            } else {

                _line_x_offset = line_offsets[0][_line_idx];
                _line_y_offset = line_offsets[1][_line_idx];

            }

            if( _line_idx != 0 ){
                _step();
            } //_line_idx

                //for each character in the line

            var _idx = 0;
            for(_uglyph in _line.uIterator()) {

                var _index = _uglyph.toInt();
                var _char = font.info.chars.get(_index);
                _is_char = (_char != null && _index > 32);

                    //:todo: make this a small preset vert set matching �
                    //or the missing char box style char, rather than just a space
                if(!_is_char) {
                    _char = font.space_char;
                }

                if(_is_char) {

                        //the geometry positioning
                    var _quad_x  = _line_x_offset + _cur_x + ( _char.xoffset * point_ratio );
                    var _quad_y  = _line_y_offset + _cur_y + ( _char.yoffset * point_ratio );

                    if(letter_snapping) {
                        //:todo: TextGeometry; letter_snapping test against round/floor with pixel fonts with @EduardoLopes
                        _quad_x = Math.floor(_quad_x);
                        _quad_y = Math.floor(_quad_y);
                    }
                        //the texture page
                    var _page = font.pages[_char.page];
                        //work out the coordinates for the uv's
                    var _u1 = _char.x/_page.width_actual;
                    var _v1 = _char.y/_page.height_actual;
                    var _u2 = (_char.x + _char.width) / _page.width_actual;
                    var _v2 = (_char.y + _char.height) / _page.height_actual;

                    update_char( _total_idx,
                                 _quad_x, _quad_y, _char.width*point_ratio, _char.height*point_ratio,
                                 _u1, _v1, _u2, _v2, color );

                        //this should only count
                        //visual characters
                    _total_idx++;

                } //don't draw non visible char

                    //after the letter,
                    //the x movement forward
                var _x_inc = _char.xadvance;

                    //adjust for kerning + tracking(letterspace)
                if( _idx < _line.length-1 ) {
                    _x_inc += font.kerning( _index, _line.uCharCodeAt(_idx+1) );
                    if(_index >= 32) {
                        _x_inc += letter_spacing;
                    }
                }

                _x_inc *= point_ratio;

                    //apply it with the point size ratio
                _cur_x += _x_inc;

                    //increment char index
                _idx++;

            } //for each letter in string

                //increase the line counter
            _line_idx++;

        } //each line

            //for unused vertices, we remove
            //them from the visible set,
            //keeping them in cache (only tidy() cleans cache)
        var _vertidx = Std.int(vertices.length / 6);
        var _diff = _vertidx - _total_idx;

        if(_diff > 0) {
            vertices.splice(_total_idx * 6, _diff * 6);
        }

            //if it was true, it's false now
        dirty_align = false;
        emitter.emit(EvTextGeometry.update_text);

    } //update_text

    // #if release inline #end
    function update_char( _letteridx:Int, _x:Float, _y:Float, _w:Float, _h:Float, _u:Float, _v:Float, _u2:Float, _v2:Float, _color:Color ) {

        var vert0:Vertex; var vert1:Vertex; var vert2:Vertex;
        var vert3:Vertex; var vert4:Vertex; var vert5:Vertex;

        var quad = cache[_letteridx];

            //if no cache at this index we need to add vertices
        if(quad == null) {

            // _debug(' idx $_letteridx out of cache range, adding cache index');

            vert0 = new Vertex( new Vector( _x, _y ), _color );
            vert1 = new Vertex( new Vector( _x+_w, _y ), _color );
            vert2 = new Vertex( new Vector( _x+_w, _y+_h ), _color );

            vert3 = new Vertex( new Vector( _x, _y+_h ), _color );
            vert4 = new Vertex( new Vector( _x, _y ), _color );
            vert5 = new Vertex( new Vector( _x+_w, _y+_h), _color );

            quad = [vert0, vert1, vert2, vert3, vert4, vert5];
            cache[_letteridx] = quad;

        } else {

            // _debug(' idx $_letteridx in cache, setting cache index');
            //this cache index existed as vertices so we fetch them

            vert0 = quad[0]; vert1 = quad[1]; vert2 = quad[2];
            vert3 = quad[3]; vert4 = quad[4]; vert5 = quad[5];

                //then update the values
            vert0.pos.set_xy( _x    , _y    );
            vert1.pos.set_xy( _x+_w , _y    );
            vert2.pos.set_xy( _x+_w , _y+_h );
            vert3.pos.set_xy( _x    , _y+_h );
            vert4.pos.set_xy( _x    , _y    );
            vert5.pos.set_xy( _x+_w , _y+_h );

        } //quad != null

        vert0.uv.uv0.set_uv( _u  , _v  );
        vert1.uv.uv0.set_uv( _u2 , _v  );
        vert2.uv.uv0.set_uv( _u2 , _v2 );
        vert3.uv.uv0.set_uv( _u  , _v2 );
        vert4.uv.uv0.set_uv( _u  , _v  );
        vert5.uv.uv0.set_uv( _u2 , _v2 );

            //now, if the vert count is lower than the index, add these
            //to the geometry itself. This must be done each time since
            //the vertices length potentially changes after each char
        var _vertidx = Math.floor(vertices.length / 6);

        if(_vertidx <= _letteridx) {
            add( vert0 ); add( vert1 );  add( vert2 );
            add( vert3 ); add( vert4 );  add( vert5 );
        }

    } //update_char

//Setters

    #if release inline #end
    function set_dirty_sizing(_b:Bool) {

            dirty_align = true;

        return dirty_sizing = _b;

    } //set_dirty_sizing

    #if release inline #end
    function set_bounds( _bounds:Rectangle ) {

        bounds = _bounds;

        if(bounds == null) return bounds;

        dirty_sizing = true;
        update_text();

        return bounds;

    } //set_bounds

    #if release inline #end
    function set_bounds_wrap( _wrap:Bool ) {

        bounds_wrap = _wrap;

            dirty_sizing = true;
            update_text();

        return bounds_wrap;

    } //set_bounds_wrap

    #if release inline #end
    function set_letter_snapping( _snap:Bool ) {

        letter_snapping = _snap;

            dirty_sizing = true;
            update_text();

        return letter_snapping;

    } //set_letter_snapping

    #if release inline #end
    function set_line_spacing(_line_spacing:Float) {

        line_spacing = _line_spacing;

            dirty_sizing = true;
            update_text();

        return line_spacing;

    } //set_line_spacing

    #if release inline #end
    function set_letter_spacing(_letter_spacing:Float) {

        letter_spacing = _letter_spacing;

            dirty_sizing = true;
            update_text();

        return letter_spacing;

    } //set_leading

    #if release inline #end
    function set_align( _align:TextAlign ) {

        align = _align;

            dirty_align = true;
            update_text();

        return align;

    } //set_align

    #if release inline #end
    function set_align_vertical( _align_vertical:TextAlign ) {

        align_vertical = _align_vertical;

            dirty_align = true;
            update_text();

        return align_vertical;

    } //set_align_vertical

    #if release inline #end
    function set_point_size( s:Float ) {

        if(s < 0) s = 0;
        point_size = s;

            dirty_sizing = true;
            update_text();

        return point_size;

    } //set_point_size


//SDF specific features


    #if release inline #end
    function set_smoothness(s:Float) {

        if(s < 0) s = 0;

        if(shader != null && sdf && unique) {
            shader.set_float('smoothness',s);
        }

        return smoothness = s;

    } //set_smoothness

    #if release inline #end
    function set_thickness(s:Float) {

        if(s < 0) s = 0;

        if(shader != null && sdf && unique) {
            shader.set_float('thickness',s);
        }

        return thickness = s;

    } //set_thickness

    #if release inline #end
    function set_outline(s:Float) {

        s = Maths.clamp(s, 0.0, 1.0);

        if(shader != null && sdf && unique) {
            shader.set_float('outline',s);
        }

        return outline = s;

    } //set_outline

    #if release inline #end
    function set_glow_threshold(s:Float) {

        if(s < 0) s = 0;

        if(shader != null && sdf && unique) {
            shader.set_float('glow_threshold',s);
        }

        return glow_threshold = s;

    } //set_glow_threshold

    #if release inline #end
    function set_glow_amount(s:Float) {

        if(s < 0) s = 0;

        if(shader != null && sdf && unique) {
            shader.set_float('glow_amount',s);
        }

        return glow_amount = s;

    } //set_glow_amount

    #if release inline #end
    function set_outline_color(c:Color) {

        if(c == null) return outline_color = c;

        if(shader != null && sdf && unique) {
            shader.set_color('outline_color', c);
        }

        return outline_color = c;

    } //set_outline_color

    #if release inline #end
    function set_glow_color(c:Color) {

        if(c == null) return glow_color = c;

        if(shader != null && sdf && unique) {
            shader.set_color('glow_color', c);
        }

        return glow_color = c;

    } //set_glow_color

        //internal convenience for when
        //the shader type changes to sdf
        //and values need refreshing
    #if release inline #end
    function flush_uniforms() {
        if(shader != null && sdf) {
            shader.set_float('smoothness', smoothness);
            shader.set_float('thickness', thickness);
            shader.set_float('outline', outline);
            shader.set_float('glow_threshold', glow_threshold);
            shader.set_float('glow_amount', glow_amount);
            shader.set_color('outline_color', outline_color);
            shader.set_color('glow_color', glow_color);
        }
    }


} //TextGeometry

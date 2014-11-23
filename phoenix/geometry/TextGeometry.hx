package phoenix.geometry;

import luxe.options.GeometryOptions;
import luxe.utils.Maths;

import phoenix.BitmapFont;
import phoenix.geometry.Vertex;
import phoenix.geometry.Geometry;
import phoenix.Batcher;
import phoenix.Color;
import phoenix.Rectangle;


using unifill.Unifill;

typedef TextGeometryOptions = {

    > GeometryOptions,

    ? text: String,
    ? font: BitmapFont,
    ? point_size: Float,

    ? bounds : Rectangle,
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
        @:isVar public var point_size (default,set) : Float = 32;
        @:isVar public var bounds (default,set) : Rectangle;
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

    //internal

        var cache : Array< Array<Vertex> >;
        var options : TextGeometryOptions;

    //common

        static var newline_regex : EReg = new EReg('\r\n','gim');

    public function new( _options:TextGeometryOptions ) {

        options = _options;

        if(options == null) throw "TextGeometry: requires non-null options at the moment";

        //order here before super() is important

                //make sure sdf flag is early enough
            if(options.sdf != null) sdf = options.sdf;
                //use the default font if none specified
            font = (options.font == null) ? Luxe.renderer.font : options.font;
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

                //we need to enforce clarity on usage
            if(options.pos != null && options.bounds != null) {
                throw 'TextGeometry; specified both pos and bounds options which is an invalid combination. You use either pos, or bounds, not both at the same time';
            }

            super( options );
            primitive_type = PrimitiveType.triangles;

        //setup

        cache = [];
        line_widths = [];
        line_xoffsets = [];
        line_yoffsets = [];
        lines = [];
        outline_color = new Color();
        glow_color = new Color();

        default_options();

    } //new

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

            if(options.point_size != null) point_size = options.point_size;
            if(options.bounds != null) bounds = options.bounds;

            if(options.align == null) options.align = TextAlign.left;
            if(options.align_vertical == null) options.align_vertical = TextAlign.left;

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

    inline function set_text(_text:String) : String {

            //don't care if it's the same value
        if(text != _text) {

                //update the value
            text = _text;

            if(text != '') {
                    //first remove \r\n for consistency
                text = newline_regex.replace(text, '\n');
                    //cache lines already split up
                lines.splice(0,lines.length);
                lines = _text.split('\n');
                    //refresh the text
                update_text();
            } else {
                vertices.splice(0, vertices.length);
            }

        } //same val

        return text;

    } //set_text

    public inline function stats() {
        return 'letters:${(vertices.length/6)} / cache:${ cache.length }';
    }

        /** Remove any cached vertices that are unused by the current text. */
    public inline function tidy() {

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

    var line_widths : Array<Float>;
    var line_xoffsets : Array<Float>;
    var line_yoffsets : Array<Float>;
    var lines : Array<String>;

    var text_width : Float = 0;
    var text_height : Float = 0;
    var text_h_w : Float = 0;
    var text_h_h : Float = 0;

    #if !debug inline #end
    function update_text() {

            //:todo:
        var _tab_width = 4;

        var _pos_x = 0.0;
        var _pos_y = 0.0;
        var _bounds_based = (bounds != null);

        if(_bounds_based) {
            transform.pos.x = _pos_x = bounds.x;
            transform.pos.y = _pos_y = bounds.y;
        }

        var _ratio = point_size / font.info.point_size;
        var _cur_x = 0.0;
        var _cur_y = 0.0;

        var _line_idx = 0;
        var _total_idx = 0;

        line_widths.splice(0, line_widths.length);
        text_width = font.width_of(text, point_size, line_widths);
        text_height = font.height_of_lines(lines, point_size);
        text_h_w = text_width / 2;
        text_h_h = text_height / 2;

        for(_line in lines) {

                //Calculate alignment offsets
                //Left is at 0, so it's handled already, same as top
            var _line_x_offset = 0.0;
            var _line_y_offset = 0.0;

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
            line_xoffsets[_line_idx] = _line_x_offset;
            line_yoffsets[_line_idx] = _line_y_offset;

                //:todo: text specific leading

            if( _line_idx != 0 ){

                    //if not the first line, add line height
                _cur_y += font.info.line_height * _ratio;
                    //reset x offset for line
                _cur_x = 0;

            } //_line_idx

                //for each character in the line

            var _idx = 0;
            for(_uglyph in _line.uIterator()) {

                var _index = _uglyph.toInt();
                var _char = font.info.chars.get(_index);

                    //fill in missing characters with a space
                    //:todo: there is probably a better option
                    //to visualize this is missing
                if(_char == null) {
                    _char = font.space_char;
                }

                    //the x movement forward
                var _x_inc = _char.xadvance;

                    //adjust for kerning
                if( _idx < _line.length-1 ) {
                    _x_inc += font.kerning( _index, _line.uCharAt(_idx+1).uCharCodeAt(0) );
                }

                    //increase tab spacing
                if( _index == 8 ) {
                    _x_inc += font.space_char.xadvance * _tab_width;
                }

                if(_char != font.space_char) {

                        //the geometry positioning
                    var _quad_x  = _line_x_offset + _cur_x + ( _char.xoffset * _ratio );
                    var _quad_y  = _line_y_offset + _cur_y + ( _char.yoffset * _ratio );
                        //the texture page
                    var _page = font.pages[_char.page];
                        //work out the coordinates for the uv's
                    var _u1 = _char.x/_page.width_actual;
                    var _v1 = _char.y/_page.height_actual;
                    var _u2 = (_char.x + _char.width) / _page.width_actual;
                    var _v2 = (_char.y + _char.height) / _page.height_actual;

                    update_char( _total_idx,
                                 _quad_x, _quad_y, _char.width*_ratio, _char.height*_ratio,
                                 _u1, _v1, _u2, _v2, color );

                        //this should only count
                        //visual characters
                    _total_idx++;

                }

                    //after the letter, increase the cur x
                _cur_x += _x_inc * _ratio;
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

    } //update_text

    #if !debug inline #end
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

    #if !debug inline #end
    function set_bounds( _bounds:Rectangle ) {

        bounds = _bounds;

            // update_text();

        return bounds;

    } //set_bounds

    #if !debug inline #end
    function set_align( _align:TextAlign ) {

        align = _align;

            // update_text();

        return align;

    } //set_align

    #if !debug inline #end
    function set_align_vertical( _align_vertical:TextAlign ) {

        align_vertical = _align_vertical;

            // update_text();

        return align_vertical;

    } //set_align_vertical

    #if !debug inline #end
    function set_point_size( s:Float ) {

        if(s < 0) s = 0;
        point_size = s;

            // update_text();

        return point_size;

    } //set_point_size

    #if !debug inline #end
    function set_smoothness(s:Float) {

        if(s < 0) s = 0;

        if(shader != null && sdf && unique) {
            shader.set_float('smoothness',s);
        }

        return smoothness = s;

    } //set_smoothness

    #if !debug inline #end
    function set_thickness(s:Float) {

        if(s < 0) s = 0;

        if(shader != null && sdf && unique) {
            shader.set_float('thickness',s);
        }

        return thickness = s;

    } //set_thickness

    #if !debug inline #end
    function set_outline(s:Float) {

        s = Maths.clamp(s, 0.0, 1.0);

        if(shader != null && sdf && unique) {
            shader.set_float('outline',s);
        }

        return outline = s;

    } //set_outline

    #if !debug inline #end
    function set_glow_threshold(s:Float) {

        if(s < 0) s = 0;

        if(shader != null && sdf && unique) {
            shader.set_float('glow_threshold',s);
        }

        return glow_threshold = s;

    } //set_glow_threshold

    #if !debug inline #end
    function set_glow_amount(s:Float) {

        if(s < 0) s = 0;

        if(shader != null && sdf && unique) {
            shader.set_float('glow_amount',s);
        }

        return glow_amount = s;

    } //set_glow_amount

    #if !debug inline #end
    function set_outline_color(c:Color) {

        if(shader != null && sdf && unique) {
            shader.set_color('outline_color', c);
        }

        return outline_color = c;

    } //set_outline_color

    function set_glow_color(c:Color) {

        if(shader != null && sdf && unique) {
            shader.set_color('glow_color', c);
        }

        return glow_color = c;

    } //set_glow_color

        //internal convenience for when
        //the shader type changes to sdf
        //and values need refreshing
    #if !debug inline #end
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

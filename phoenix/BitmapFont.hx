package phoenix;

import luxe.Vector;
import luxe.resource.Resource;
import luxe.resource.ResourceManager;

import luxe.options.FontOptions;
import luxe.options.TextOptions;

import phoenix.Batcher;
import phoenix.BitmapFont.TextAlign;
import phoenix.geometry.CompositeGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.TextureCoord;
import phoenix.geometry.Vertex;
import phoenix.Rectangle;
import phoenix.Texture;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;

enum TextAlign {
    left;
    right;
    center;
    top;
    bottom;
}

private typedef Character = {
    var id: Int;
    var x: Float;
    var y: Float;
    var width: Float;
    var height: Float;
    var xoffset: Float;
    var yoffset: Float;
    var xadvance: Float;
    var page: Int;
}


typedef FontInfo = {
    var face: String;
    var point_size: Float;
    var base_size: Float;
    var chars: Map<Int, Character>;
    var char_count: Int;
    var pages: Array<{ id : Int, file : String }>;
    var line_height: Float;
    var kernings: Map< Int, Map<Int, Float> >;
}


class BitmapFont extends Resource {

    public var pages : Map<Int, Texture>;
    public var info : FontInfo;
    public var options : BitmapFontOptions;

    public var onload : BitmapFont -> Void;
    public var loaded : Bool = false;

        //cached refrence of the ' '(32)
        //character for sizing on tabs/spaces
    var space_char:Character;
    var items_loaded : Int = 0;

    public function new( ?_options:BitmapFontOptions ) {

        id = 'font.${Luxe.utils.uniqueid()}';

        options = (_options == null) ? { id:id } : _options;
        default_options();

        super( options.resources, ResourceType.font );

        pages = new Map();

    } //new

    //Public api

            /** Create this bitmap font from the given string data,
                with path to search for textures, onload callback
                and if textures are already loaded, a custom array of pages */
        public function from_string(
            _bitmapfont_data : String,
            ?_path : String = 'assets/',
            ?_onload : BitmapFont->Void ,
            ?_custom_pages:Array<Texture> )
        {

                //store the listener
            onload = _onload;
                //parse the file
            info = Parser.parse(_bitmapfont_data);
                //set the id to the face name
            id = 'font.${info.face}';
                //store cached values
            space_char = info.chars.get(32);
                //load any texture pages
            load_pages(_path, _custom_pages);

        } //from_string


            /** Get the kerning between two glyphs, 0 if none.
                A glyph int id is the value from 'c'.charCodeAt(0) */
        public inline function kerning(_first:Int, _second:Int) {

            var _map = info.kernings.get(_first);

            if(_map != null && _map.exists(_second)) {
                return _map.get(_second);
            }

            return 0;

        } //kerning

    public inline function width_of( _string:String, _point_size:Float = 1.0, ?_line_widths:Array<Float> ) : Float {

        //:todo: #98 hardcoded tab width
        var _tab_width = 4;
            //current width counter
        var _cur_x = 0.0;
            //maximum width found
        var _max_w = 0.0;
            //the size ratio between font and given size
        var _ratio = _point_size / info.point_size;
            //if given an array to cache line widths into
        var _push_widths = (_line_widths != null);

            //Iterate over each character,
            //acculumating the size
        var i = 0;
        while( i < _string.length ) {

            var _glyph = _string.charAt(i);

            if( _glyph == '\n' ) {

                _max_w = Math.max( _max_w, _cur_x );
                if(_push_widths) _line_widths.push(_cur_x);
                _cur_x = 0;

            } else {

                var _spacing = 0.0;
                var _index = _glyph.charCodeAt(0);
                var _char = info.chars.get(_index);

                    //insert character width
                if(_char != null) _spacing = _char.xadvance;
                    //insert tabs spacing
                if( _glyph == '\t' ) _spacing += space_char.xadvance * _tab_width;
                    //insert kerning values, if any
                if( i < _string.length - 1 ){
                    var _next_index = _string.charAt(i+1).charCodeAt(0);
                    _spacing += kerning( _index, _next_index );
                }

                _cur_x += (_spacing * _ratio);

            }

            ++i;

        } //while char in string

            //account for the remaining length
        if(_push_widths) _line_widths.push(_cur_x);

            //adjust for any last additions
        return Math.max( _max_w, _cur_x );

    } //width_of

    public inline function height_of( _string:String, _point_size:Float ) : Float {

        return height_of_lines(_string.split('\n'), _point_size);

    } //height_of


        /** Return the dimensions of a given string, at the specified point size.
            You can also use width_of or height_of, this is a convenience for those */
    public inline function dimensions_of( _string:String, _point_size:Float, _into:Vector ) : Vector {

        var _width = width_of(_string, _point_size);
        var _height = height_of(_string, _point_size);

        return _into.set_xy( _width, _height );

    } //dimensions

    //Public static api

        public static function load( ?_options:BitmapFontOptions ) : BitmapFont {

            if(_options == null || _options.id == null ) {
                throw "BitmapFont: load cannot work without a file id to load from.";
            }

            var font = new BitmapFont( _options );
            var file_path = haxe.io.Path.join([font.options.path, font.options.id]);

            Luxe.loadText( file_path, function( font_data:luxe.resource.TextResource ) {

                font.from_string( font_data.text, font.options.path, font.options.onload );
                font.options.resources.cache(font);

            });

            return font;

        } //load

    //internal

        inline function height_of_lines( _lines:Array<String>, _point_size:Float ) : Float {

            var _ratio = _point_size / info.point_size;
            return _lines.length * (info.line_height * _ratio);

        } //height_of

        function default_options() {

            if(options.id == null) {
                options.id = id;
            }

            if(options.path == null) {
                options.path = 'assets/';
            }

            if(options.resources == null) {
                options.resources = Luxe.resources;
            }

            if(options.mipmaps == null) {
                options.mipmaps = false;
            }

            if(options.filter == null) {
                options.filter = FilterType.linear;
            }

            if(options.filter_min == null) {
                options.filter_min = FilterType.linear;
            }

            if(options.filter_mag == null) {
                options.filter_mag = FilterType.linear;
            }

        } //default_options

    //internal load handlers

        function on_completely_loaded() {

            loaded = true;

            if(onload != null) {
                onload( this );
            }

        } //on_completely_loaded

        public function one_item_loaded(t:Texture) {

            var total_items = Lambda.count(pages);
                //increment the current count
            items_loaded++;

                //if completely done
            if(items_loaded == total_items) {
                on_completely_loaded();
            }

        } //one_item_loaded

        function load_pages( ?_path:String = 'assets/', ?_custom_pages:Array<Texture> ) {

            if(_custom_pages == null) {

                for(_page in info.pages) {

                    var _t = Luxe.loadTexture( _path + _page.file );
                    _t.onload = function(_) {

                        pages.set(_page.id, _t);
                        _t.filter_min = FilterType.linear;
                        //:todo:options
                        // _t.filter_mag = FilterType.linear;
                        // _t.generate_mipmaps();

                        one_item_loaded(_t);

                    } //onload

                } //each page

            } else {

                var _id : Int = 0;

                for(_page in _custom_pages) {
                    pages.set(_id, _page);
                    ++_id;
                }

                    //still need the callback for explicit textures
                on_completely_loaded();

            } //if custom pages

        } //load_pages


            //Wip refactoring, see #98
    public function draw_text( opt : TextOptions ) {

        inline function def_text_options(_opt:TextOptions) {

            if(_opt.text == null)       _opt.text = '';
            if(_opt.pos == null)        _opt.pos = new Vector();
            if(_opt.color == null)      _opt.color = new Color();

            if(opt.size != null && opt.point_size == null) opt.point_size = opt.size;
            if(_opt.point_size == null) _opt.point_size = info.point_size;

            if(_opt.depth == null)      _opt.depth = 0.0;
            if(_opt.group == null)      _opt.group = 0;
            if(_opt.visible == null)    _opt.visible = true;
            if(_opt.immediate == null)  _opt.immediate = false;
            if(_opt.batcher == null)    _opt.batcher = Luxe.renderer.batcher;

            if(_opt.align == null)      _opt.align = TextAlign.left;
            if(_opt.align_vertical == null) _opt.align_vertical = TextAlign.top;

            return _opt;

        } //def_text_options

        opt = def_text_options(opt);

        var _final_geom = (opt.geometry == null) ? new CompositeGeometry(null) : opt.geometry;

        var _pos_x = opt.pos.x;
        var _pos_y = opt.pos.y;
        var _bounds_based : Bool = false;

        if(opt.bounds != null) {
            _bounds_based = true;
            _pos_x = opt.bounds.x;
            _pos_y = opt.bounds.y;
        }

            //no texture? return empty geometry
        if(pages[0] == null) {
            log("Warning ; " + id + " font trying to draw without a texture.");
            return _final_geom;
        }

            //an array of geometry items, one for each unique texture
        var _geoms : Array<Geometry> = new Array<Geometry>();
        var _page_count = Lambda.count(pages);

        _verbose('creating geometry for each unique texture : ' + _page_count + ' at ' + opt.depth + '\n with ' + opt.color + ' and ' + opt.align + ' and at ' + opt.pos );

        for(i in 0 ... _page_count ) {

            var _g = new Geometry({
                texture : pages[i],
                color : opt.color,
                depth : opt.depth,
                visible : opt.visible,
                immediate : opt.immediate
            });

            _g.id = 'text.page'+i+'.'+opt.text.substr(0,8);

            _g.primitive_type = PrimitiveType.triangles;
            _g.immediate = opt.immediate;
            _geoms.push( _g );

        } //for each page

        var _ratio_x = 0.0,
            _ratio_y = _ratio_x = opt.point_size / info.point_size;

        var _cur_x = 0.0;
        var _cur_y = 0.0;

        var _lines = opt.text.split('\n');

        var _line_idx = 0;
        var _line_widths = [];
        var _txt_width = width_of(opt.text, opt.point_size, _line_widths);
        var _txt_height = height_of_lines(_lines, opt.point_size);
        var _txt_half_w = _txt_width / 2;
        var _txt_half_h = _txt_height / 2;

        for(_line in _lines) {

            var _align_x_offset = 0.0;

                //Calculate alignment position
                //Left is at 0, so it's handled already
            _align_x_offset = switch(opt.align) {
                case center: _txt_half_w - (_line_widths[_line_idx]/2.0);
                case right: _txt_width - _line_widths[_line_idx];
                default: 0.0;
            }

                //if not the first line, add height
            if( _line_idx != 0 ){
                _cur_y += info.line_height * _ratio_y;
                _cur_x = 0;
            }

            for(i in 0 ... _line.length) {

                var _glyph = _line.charAt(i);
                var _index = _glyph.charCodeAt(0);
                var _char = info.chars.get(_index);

                    //hmm, a null character code?
                    //maybe insert something visible?
                if(_char == null) {
                    _char = space_char;
                }

                    //find the geometry to add it to
                var _geom = _geoms[_char.page];

                    //Texture size for this page
                var _tw = pages[_char.page].width_actual;
                var _th = pages[_char.page].height_actual;

                    //work out the coordinates for the uv's
                var _u  = _char.x/_tw;
                var _v  = _char.y/_th;
                var _u2 = (_char.x + _char.width) / _tw;
                var _v2 = (_char.y + _char.height) / _th;
                var _x  = _align_x_offset + _cur_x + ( _char.xoffset * _ratio_x );
                var _y  = _cur_y + _char.yoffset * _ratio_y;
                var _w  = _char.width * _ratio_x;
                var _h  = _char.height * _ratio_y;

                var _x_inc : Float = _char.xadvance;
                if( i < _line.length-1 ){
                    var _next_index = _line.charAt(i+1).charCodeAt(0);
                    _x_inc += kerning( _index, _next_index );
                }

                if( _glyph == '\t' ){
                    //:todo:, hardcoded 4 tab size
                    _x_inc += space_char.xadvance * 4;
                }

                _cur_x += _x_inc * _ratio_x;

                // _x = Math.round(_x);
                // _y = Math.round(_y);

                    //First triangle

               var vert0 = new Vertex( new Vector( _x, _y ), opt.color );
                   vert0.uv.uv0.set_uv(_u,_v);

                var vert1 = new Vertex( new Vector( _x+_w, _y ), opt.color );
                   vert1.uv.uv0.set_uv(_u2, _v);

                var vert2 = new Vertex( new Vector( _x+_w, _y+_h ), opt.color );
                    vert2.uv.uv0.set_uv(_u2, _v2);

                   //Second triangle

                var vert3 = new Vertex( new Vector( _x, _y+_h ), opt.color );
                    vert3.uv.uv0.set_uv(_u, _v2);

                var vert4 = new Vertex( new Vector( _x, _y ), opt.color );
                    vert4.uv.uv0.set_uv(_u, _v);

                var vert5 = new Vertex( new Vector( _x+_w, _y+_h), opt.color );
                    vert5.uv.uv0.set_uv(_u2, _v2);

                   //Add to the geomery

                _geom.add( vert0 ); _geom.add( vert1 );  _geom.add( vert2 );
                _geom.add( vert3 ); _geom.add( vert4 );  _geom.add( vert5 );

            } //for each string

                //next line (if any)
            _line_idx++;

        } //line in lines

            //alignment offsets
        var _offset_x = 0.0;
        var _offset_y = 0.0;

        if(!_bounds_based) {

            _offset_x = switch(opt.align) {
                case center: _txt_half_w;
                case right: _txt_width;
                case _: 0.0;
            }

        } else {

            var _b_w_h = (opt.bounds.w/2);
            var _b_h_h = (opt.bounds.h/2);

            _offset_x = switch(opt.align) {
                case center: -(_b_w_h - _txt_half_w);
                case right: -(opt.bounds.w - _txt_width);
                case _: 0.0;
            }

            _offset_y = switch(opt.align_vertical) {
                case center:  -(_b_h_h - _txt_half_h);
                case bottom:  -(opt.bounds.h - _txt_height);
                case _: 0.0;
            }

        } //_bounds_based

            //replace the composite with the children geometry we just created
        _final_geom.replace( _geoms );
        _final_geom.add_to_batcher( opt.batcher );

            //translate all of the new text according to the actual position
        _final_geom.transform.origin.set_xy( _offset_x, _offset_y );
        _final_geom.transform.pos.set_xy( _pos_x, _pos_y );

        // _verbose('drew text ${opt.text.substr(0,10)} at ${_final_geom.transform.pos} with origin ${_final_geom.transform.origin}');

        _final_geom.id += 'drawn_text- ' + opt.text.substr(0,10);
        _final_geom.immediate = opt.immediate;
        _final_geom.visible = opt.visible;

        return _final_geom;

    } //draw_text

    function toString() {
        return "BitmapFont(" + id + ")";
    }

} //BitmapFont


private class Parser {

    //public api

        public static function parse( _font_data:String ) : FontInfo {

            if(_font_data.length == 0) {
                throw "BitmapFont:Parser: _font_data is 0 length";
            }

            var _info : FontInfo = {
                face : '',
                chars : new Map(),
                point_size : 0, base_size : 0,
                char_count : 0, line_height : 0,
                pages : [], kernings : new Map()
            };

            var _lines : Array<String> = _font_data.split("\n");

            for(_line in _lines) {
                var _tokens = _line.split(" ");
                for(_current in _tokens) {
                    parse_token(_current, _tokens, _info);
                }
            }

            return _info;

        } //parse

    //internal

        static function parse_token( _token:String, _tokens:Array<String>, _info:FontInfo ) {

                //remove the first token
            _tokens.shift();
                //fetch the items from the line
            var _items = tokenize_line(_tokens);

            switch (_token) {

                case 'info': {
                    _info.face = unquote(_items['face']);
                    _info.point_size = Std.parseFloat(_items['size']);
                }

                case 'common': {
                    _info.line_height = Std.parseFloat(_items['lineHeight']);
                    _info.base_size = Std.parseFloat(_items['base']);
                }

                case 'page': {
                    _info.pages.push({
                        id : Std.parseInt(_items['id']),
                        file : trim(unquote(_items['file']))
                    });
                }

                case 'chars': {
                    _info.char_count = Std.parseInt(_items["count"]);
                }

                case 'char': {

                    var _char : Character = {
                        id : Std.parseInt(_items["id"]),
                        x : Std.parseFloat(_items["x"]),
                        y : Std.parseFloat(_items["y"]),
                        width : Std.parseFloat(_items["width"]),
                        height : Std.parseFloat(_items["height"]),
                        xoffset : Std.parseFloat(_items["xoffset"]),
                        yoffset : Std.parseFloat(_items["yoffset"]),
                        xadvance : Std.parseFloat(_items["xadvance"]),
                        page : Std.parseInt(_items["page"])
                    }

                    _info.chars.set(_char.id, _char);

                }

                case 'kerning': {

                    var _first = Std.parseInt(_items["first"]);
                    var _second = Std.parseInt(_items["second"]);
                    var _amount = Std.parseFloat(_items["amount"]);

                    var _map = _info.kernings.get(_first);
                    if(_map == null) {
                        _map = new Map();
                        _info.kernings.set(_first, _map);
                    }

                    _map.set(_second, _amount);

                }

                default:
            }

        } //parse_token

        static function tokenize_line( _tokens:Array<String> ) {

            var _item_map : Map<String, String> = new Map();

                for(_token in _tokens) {
                    var _items = _token.split("=");
                    _item_map.set( _items[0], _items[1] );
                }

            return _item_map;

        } //tokenize_line

        inline static function trim(_s:String) { return StringTools.trim(_s); }
        inline static function unquote(_s:String) {
            if(_s.indexOf('"') != -1) {
                _s = StringTools.replace(_s,'"', '');
            } return _s;
        } //unquote

} //BitmapFontParser


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
import phoenix.geometry.TextGeometry;
import phoenix.Rectangle;
import phoenix.Texture;

import luxe.Log.log;
import luxe.Log._debug;
import luxe.Log._verbose;

using luxe.utils.unifill.Unifill;

@:enum abstract TextAlign(Int) from Int to Int {
    var left = 0;
    var right = 1;
    var center = 2;
    var top = 3;
    var bottom = 4;
} //TextAlign

typedef Character = {
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
    public var space_char: Character;
        //for loading pages and reporting done
    var items_loaded: Int = 0;
    var items_total: Int = 0;

    static var generic_names : Array<String> = ['font','', ' '];

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
            ?_path: String = 'assets/',
            ?_onload: BitmapFont->Void ,
            ?_custom_pages: Array<Texture>,
            ?_silent: Bool = false )
        {

                //store the listener
            if(_onload != null) onload = _onload;
                //parse the file
            info = Parser.parse(_bitmapfont_data);
                //set the id to the face name
            id = '${info.face}';
                //store cached values
            space_char = info.chars.get(32);
                //load any texture pages
            load_pages(_path, _custom_pages);

            if(generic_names.indexOf(id) != -1) {
                var _warning = 'warning / font loaded with a generic or no name as "$id". ';
                    _warning += 'This could lead to bugs or confusion, or not being able to retrieve the font ';
                    _warning += 'later from the resources. The font name is set in the "face" property inside the .fnt file.';
                log(_warning);
            }

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

    public function wrap_string_to_bounds( _string:String, _bounds:Rectangle, _point_size:Float=1.0, _letter_spc:Float=0.0 ) : String {

        if(_bounds == null) {
            return _string;
        }

        var _cur_x = 0.0; var _idx = 0;
        var _final_str = '';

        inline function _wordw(_str:String) {
            return width_of(_str, _point_size, _letter_spc);
        }

        var _spacew = _wordw(' ');

        inline function _dowrap(_w:Float, _str:String) {
            if(_cur_x + _w > _bounds.w) {
                _cur_x = 0;
                _final_str += '\n';
            }

            _cur_x += _w;
            _final_str += _str;
        } //_dowrap

            var _strings = _string.split(' ');
            var _count = _strings.length;

            for(_str in _strings) {
                if(_str.uIndexOf('\n') == -1) {
                    if(_str == '') _str = ' ';
                    _dowrap( _wordw(_str), _str );
                } else {
                    var _widx = 0;
                    var _words = _str.split('\n');
                    for(_word in _words) {

                        if(_word != '') {
                            _dowrap( _wordw(_word), _word );
                        } else {
                            _cur_x = 0;
                        }

                        if(_widx < _words.length-1) {
                            _final_str += '\n';
                            _cur_x = 0;
                        }

                        _widx++;

                    } //each word
                } //no spaces

                if(_idx < _count-1) {
                    _final_str += ' ';
                    _cur_x += _spacew + _letter_spc;
                }

                _idx++;

            } //each word

        return _final_str;

    } //wrap_string_to_bounds

    public inline function width_of( _string:String, _point_size:Float = 1.0, _letter_spc:Float = 0.0, ?_line_widths:Array<Float> ) : Float {

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
        var _len = _string.uLength();
        for( _uglyph in _string.uIterator() ) {

            var _index = _uglyph.toInt();

                // 10 = \n
            if( _index == 10 ) {

                _max_w = Math.max( _max_w, _cur_x );
                if(_push_widths) _line_widths.push(_cur_x);
                _cur_x = 0;

            } else {

                var _char = info.chars.get(_index);
                if(_char == null) {
                    _char = space_char;
                }

                var _spacing = _char.xadvance;

                    //insert kerning values, if any
                if( i < _len - 1 ) {

                    var _next_index = _string.uCharCodeAt(i+1);
                    _spacing += kerning( _index, _next_index );

                        //if not a new line, add the letter spacing
                    if(_next_index >= 32) {
                        _spacing += _letter_spc;
                    }
                }

                _cur_x += _spacing * _ratio;

            }

            ++i;

        } //while char in string

            //account for the remaining length
        if(_push_widths) _line_widths.push(_cur_x);

            //return the max width found
        return Math.max( _max_w, _cur_x );

    } //width_of

    public inline function height_of( _string:String, _point_size:Float, _line_spc:Float=0.0 ) : Float {

        return height_of_lines(_string.split('\n'), _point_size, _line_spc);

    } //height_of


        /** Return the dimensions of a given string, at the specified point size.
            You can also use width_of or height_of, this is a convenience for those */
    public inline function dimensions_of( _string:String, _point_size:Float, _into:Vector, _letter_spc:Float=0.0, _line_spc:Float=0.0 ) : Vector {

        var _width = width_of(_string, _point_size, _letter_spc);
        var _height = height_of(_string, _point_size, _line_spc);

        return _into.set_xy( _width, _height );

    } //dimensions

    //Public static api

        public static function load( ?_options:BitmapFontOptions ) : BitmapFont {

            if(_options == null || _options.id == null ) {
                throw "BitmapFont: load cannot work without a file id to load from.";
            }

            if(_options.silent == null) _options.silent = false;

            var font = new BitmapFont( _options );
            var file_path = haxe.io.Path.join([font.options.path, font.options.id]);

            Luxe.loadText( file_path, function( font_data:luxe.resource.TextResource ) {

                font.from_string( font_data.text, font.options.path, font.options.onload, null, font.options.silent );
                font.options.resources.cache(font);

            }, true);

            return font;

        } //load

    //internal

        public inline function height_of_lines( _lines:Array<String>, _point_size:Float, _line_spc:Float=0.0 ) : Float {

            var _ratio = _point_size / info.point_size;
            return _lines.length * ((info.line_height + _line_spc) * _ratio);

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

        function do_onload() {

            loaded = true;

            if(onload != null) {
                onload( this );
            }

        } //do_onload

        function page_loaded(t:Texture) {

                //increment the current count
            items_loaded++;

                //if completely done
            if(items_loaded == items_total) {
                do_onload();
            }

        } //page_loaded

        function load_pages( ?_path:String = 'assets/', ?_custom_pages:Array<Texture> ) {

            if(_custom_pages == null) {

                items_total = Lambda.count(info.pages);

                for(_page in info.pages) {

                    var _t = Luxe.loadTexture( _path + _page.file, null, options.silent );
                    if(_t != null) {
                        _t.onload = function(_) {

                            pages.set(_page.id, _t);

                            _t.slot = _page.id;
                            _t.filter = options.filter;
                            _t.filter_min = options.filter_min;
                            _t.filter_mag = options.filter_mag;

                            if(options.mipmaps) {
                                _t.generate_mipmaps();
                            }

                            page_loaded(_t);

                        } //onload
                    } else {
                        throw 'BitmapFont: "${info.face}" specified a page "${_page.file}" with a missing texture at $_path';
                    }

                } //each page

            } else {

                items_total = _custom_pages.length;

                var _id : Int = 0;
                for(_page in _custom_pages) {
                    _page.slot = _id;
                    pages.set(_id, _page);
                    ++_id;
                }

                    //still need the callback for explicit textures
                do_onload();

            } //if custom pages

        } //load_pages

            //Wip refactoring, see #98
    public function draw_text( opt : TextGeometryOptions ) {

            opt.font = this;

        return new TextGeometry(opt);

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


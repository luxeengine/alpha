package luxe.importers.bitmapfont;

import luxe.importers.bitmapfont.BitmapFontData;

class BitmapFontParser {

    //public api

        public static function parse( _font_data:String ) : BitmapFontData {

            if(_font_data.length == 0) {
                throw "BitmapFont:Parser: _font_data is 0 length";
            }

            var _info : BitmapFontData = {
                face : null,
                chars : new Map(),
                point_size : 0, base_size : 0,
                char_count : 0, line_height : 0,
                pages : [], kernings : new Map()
            };

            var _lines : Array<String> = _font_data.split("\n");

            if(_lines.length == 0) {
                throw "BitmapFont; invalid font data specified for parser.";
            }

            var _first = _lines[0];
            if(StringTools.ltrim(_first).substr(0, 4) != 'info') {
                throw "BitmapFont; invalid font data specified for parser. Format should be plain ascii text .fnt file only currently.";
            }

            for(_line in _lines) {
                var _tokens = _line.split(" ");
                for(_current in _tokens) {
                    parse_token(_current, _tokens, _info);
                }
                _tokens = null;
            }

            _lines = null;

            return _info;

        } //parse

    //internal

        static function parse_token( _token:String, _tokens:Array<String>, _info:BitmapFontData ) {

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

            _items = null;

        } //parse_token

        static function tokenize_line( _tokens:Array<String> ) {

            var _item_map : Map<String, String> = new Map();

                for(_token in _tokens) {
                    var _items = _token.split("=");
                    _item_map.set( _items[0], _items[1] );
                    _items = null;
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

package phoenix;

import luxe.resource.Resource;
import luxe.Resources;

// import luxe.options.FontOptions;
import luxe.options.ResourceOptions;
import luxe.options.TextOptions;
import luxe.importers.bitmapfont.BitmapFontData;
import luxe.importers.bitmapfont.BitmapFontParser;

import phoenix.Batcher;
import phoenix.geometry.TextGeometry;
import phoenix.Rectangle;
import phoenix.Vector;
import phoenix.Texture;
import snow.api.Promise;
import snow.types.Types.Error;
import snow.systems.assets.Asset;

import luxe.Log.*;

using luxe.utils.unifill.Unifill;

@:enum abstract TextAlign(Int) from Int to Int {
    var left = 0;
    var right = 1;
    var center = 2;
    var top = 3;
    var bottom = 4;
} //TextAlign


class BitmapFont extends Resource {

        /** The map of font texture pages to their id. */
    public var pages: Map<Int, Texture>;
        /** The bitmap font data */
    public var info (default, set): BitmapFontData;
        /** Cached reference of the ' '(32) character, for sizing on tabs/spaces */
    public var space_char: Character;

        /** Optional texture path. */
    var texture_path: String;

    public function new( _options:BitmapFontOptions ) {

        assertnull(_options);

        _options.resource_type = ResourceType.font;

        super( _options );

        if(_options.texture_path != null) {
            texture_path = _options.texture_path;
        } else {
            texture_path = haxe.io.Path.directory(id);
        }

        pages = new Map();

        if(_options.pages != null) assertnull(_options.font_data, 'BitmapFont create from pages + font_data requires both of those options');
        if(_options.font_data != null) {

            assertnull(_options.pages, 'BitmapFont create from pages + font_data requires both of those options');

            info = BitmapFontParser.parse(_options.font_data);
            apply_pages(_options.pages);

        } //font_data

    } //new

//Public api
    //

        /** Returns the kerning between two glyphs, or 0 if none.
            A glyph int id is the value from 'c'.charCodeAt(0) */
    public inline function kerning(_first:Int, _second:Int) {

        var _map = info.kernings.get(_first);

        if(_map != null && _map.exists(_second)) {
            return _map.get(_second);
        }

        return 0;

    } //kerning

        /** Wrap the given string to the given rectangle, using the given metrics.
            Returns a new array, with each line of the string split across the bounds. */
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

        /** Returns the width of the given line, which assumes the line is already split up (does not split the string), using the given metrics. */
    public function width_of_line( _string:String, _point_size:Float=1.0, _letter_spc:Float=0.0 ) {
        //
            //current x pos
        var _cur_x = 0.0;
            //current w pos
        var _cur_w = 0.0;
            //the size ratio between font and given size
        var _ratio = _point_size / info.point_size;

        var i = 0;
        var _len = _string.uLength();

        for( _uglyph in _string.uIterator() ) {

            var _index = _uglyph.toInt();
            var _char = info.chars.get(_index);
            if(_char == null) _char = space_char;

                //some characters (like spaces) have no width but an advance
                //which is relevant/needed
            var _cw = (_char.xoffset + Math.max(_char.width, _char.xadvance)) * _ratio;
            var _cx = _cur_x + (_char.xoffset * _ratio);

            var _spacing = _char.xadvance;
            if( i < _len-1 ) {
                var _next_index = _string.uCharCodeAt(i+1);
                _spacing += kerning( _index, _next_index );
                if(_next_index >= 32) { _spacing += _letter_spc; }
            }

            _cur_x += _spacing * _ratio;
            _cur_w = Math.max(_cur_w, _cx+_cw);

            ++i;
        } //each char

        return _cur_w;

    } //width_of_line

        /** Returns the width of the given string, using the given metrics.
            This will split the string and populate the optional _line_widths array with each line width of the string */
    public inline function width_of( _string:String, _point_size:Float = 1.0, _letter_spc:Float = 0.0, ?_line_widths:Array<Float> ) : Float {
        //
            //if given an array to cache line widths into
        var _max_w = 0.0;
        var _push_widths = (_line_widths != null);
        var _lines = _string.uSplit('\n');

        for(_line in _lines) {

            var _cur_w = width_of_line(_line, _point_size, _letter_spc);

            _max_w = Math.max( _max_w, _cur_w );

            if(_push_widths) {
                _line_widths.push(_cur_w);
            }

        } //each line

            //return the max width found
        return _max_w;

    } //width_of

        /** Returns the height of a string, using the given metrics. */
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

        /** Get the height of the given lines with the given metrics. */
    public inline function height_of_lines( _lines:Array<String>, _point_size:Float, _line_spc:Float=0.0 ) : Float {

        var _ratio = _point_size / info.point_size;

        return _lines.length * ((info.line_height + _line_spc) * _ratio);

    } //height_of
    
        /** Return the point size at which a line of text will occupy a given pixel height. */
        //:todo: Implement test/usage case
    public inline function line_height_to_point_size( _pixel_height:Float, _line_spc:Float=0.0 ) : Float {

        return _pixel_height * ( info.point_size / ( info.line_height + _line_spc ) );

    } //line_height_to_point_size

//Resource api

    override function clear() {

        info = null;
        var _i = 0;
        for(_pageid in pages.keys()) {
            var _page = pages.get(_pageid);
            _page.destroy();
            pages.remove(_pageid);
            _page = null;
        }

    } //clear

    override public function reload() {

        assert(state != ResourceState.destroyed);

        clear();

        return new Promise(function(resolve, reject) {

            state = ResourceState.loading;

                //fetch the bitmap font data
            var _font_get = Luxe.snow.assets.text(id);

            _font_get.then(function(_asset:AssetText) {

                    //parse the data
                info = BitmapFontParser.parse( _asset.text );
                _asset.destroy();
                _asset = null;

                assertnull(info);

                var _tex_get = [];

                for(_page in info.pages) {

                    var _path = haxe.io.Path.join([ texture_path, _page.file ]);
                    var _prior = system.texture(_path);

                    if(_prior != null) {
                        _tex_get.push( _prior.reload() );
                    } else {
                        _tex_get.push( system.load_texture(_path) );
                    }

                }  //each page

                Promise.all(_tex_get).then(function(_pages:Array<Texture>){

                    apply_pages(_pages);

                    state = ResourceState.loaded;
                    resolve(this);

                }).error(function(_error){

                    state = ResourceState.failed;
                    reject(_error);

                });

            }).error(function(_error){

                state = ResourceState.failed;
                reject(_error);

            });

        }); //promise

    } //reload

//Internal

    function apply_pages(_pages:Array<Texture>) {

        var _pageid : Int = 0;

        for(_page in _pages) {
            _page.slot = _pageid;
            pages.set(_pageid, _page);
            ++_pageid;
        } //each page

    } //apply_pages

    function set_info(_info:BitmapFontData) {

        info = _info;

        if(info != null) {
            space_char = info.chars.get(32);
        }

        return info;

    } //_info

    override function toString() {
        return "BitmapFont(" + id + ")";
    }

} //BitmapFont



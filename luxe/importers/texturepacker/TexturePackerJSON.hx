package luxe.importers.texturepacker;

import luxe.importers.texturepacker.TexturePackerData;

enum TexturePackerJSONType {
    hash;
    array;
}

class TexturePackerJSON {

    public static function parse( json:Dynamic, ?json_type:TexturePackerJSONType ) : TexturePackerData {

            //check validity if possible?
        var _has_frames = Reflect.field( json, 'frames' ) != null;
        var _has_meta = Reflect.field( json, 'meta' ) != null;

        if(!_has_frames) {
            trace("TexturePacker : No frames property on the json object given (kinda needed!)");
            return null;
        }

        var meta : TexturePackerMeta = null;
        var frames : Array<TexturePackerFrame> = null;

            //parse the meta first if any
        if(_has_meta) {
            meta = parse_meta( json.meta );
        } // _has_meta ?

            //parse the frame next

        if(json_type == null) {

                //no specified type? try guessing
            var is_array = Std.is( json.frames, Array );
            if(!is_array) {
                var is_hash = Std.is( json.frames, Dynamic );
                json_type = TexturePackerJSONType.hash;
            } else {
                json_type = TexturePackerJSONType.array;
            }

        } //json_type

        luxe.Log._verbose("Parsing json with type : " + json_type);

        switch(json_type) {
            case hash: {
                frames = parse_frames_hash( json.frames );
            }
            case array: {
                frames = parse_frames_array( json.frames );
            }
        } //json_type

            //for now, sort the frames by name
        frames.sort( function(a:TexturePackerFrame, b:TexturePackerFrame) {
            return (a.filename < b.filename) ? -1 : 1;
        });

        return new TexturePackerData(meta, frames);

    } //parse

    static function parse_frame( name:String, json:Dynamic ) {

        if(json == null) return null;

        var _frame              = parse_rect( Reflect.field(json,"frame") );
        var _spriteSourceSize   = parse_rect( Reflect.field(json,"spriteSourceSize") );
        var _sourceSize         = parse_size( Reflect.field(json,"sourceSize") );

        var _rotated : Bool = Reflect.field(json,"rotated");
        var _trimmed : Bool = Reflect.field(json,"trimmed");

        return {
            filename            : name,
            frame               : _frame,
            sourceSize          : _sourceSize,
            spriteSourceSize    : _spriteSourceSize,
            rotated             : _rotated,
            trimmed             : _trimmed,
            uv                  : new luxe.Rectangle(_frame.x, _frame.y, _frame.w, _frame.h),
            size                : new luxe.Vector(_spriteSourceSize.w, _spriteSourceSize.h),
            origin              : new luxe.Vector(_sourceSize.w - _spriteSourceSize.w, _sourceSize.h - _spriteSourceSize.h)
        };

    } //parse_frame

    static function parse_frames_hash( json:Dynamic ) {

        if(json == null) return null;

        var _results : Array<TexturePackerFrame> = [];

            //hash uses keys
        for(_frame_name in Reflect.fields(json)) {

            var _frame = Reflect.field(json, _frame_name);

            _results.push( parse_frame(_frame_name, _frame) );

        } //for each frame in the keys

        return _results;

    } //parse_frames_hash

    static function parse_frames_array( json:Dynamic ) {

        if(json == null) return null;

        var _results : Array<TexturePackerFrame> = [];

        var _frames_list : Array<Dynamic> = cast json;
        for(_frame in _frames_list) {

            var _frame_name : String = Reflect.field(_frame, "filename");

            _results.push( parse_frame(_frame_name, _frame) );

        } //for each frame in the array

        return _results;

    } //parse_frames_array

    static function parse_meta( json:Dynamic ) : TexturePackerMeta {

        if(json == null) return null;

        var _app        = Reflect.field( json, 'app' );
        var _version    = Reflect.field( json, 'version' );
        var _image      = Reflect.field( json, 'image' );
        var _format     = Reflect.field( json, 'format' );
        var _size       = Reflect.field( json, 'size' );
        var _scale      = Reflect.field( json, 'scale' );

        return {
            app     : _app,
            version : _version,
            image   : _image,
            format  : _format,
            size    : parse_size(_size),
            scale   : Std.parseFloat(_scale)
        };

    } //parse_meta

    static function parse_rect( json:Dynamic ) : TexturePackerRect {

        if(json == null) return null;

        var _x : Float = Std.parseFloat(Reflect.field(json, "x"));
        var _y : Float = Std.parseFloat(Reflect.field(json, "y"));
        var _w : Float = Std.parseFloat(Reflect.field(json, "w"));
        var _h : Float = Std.parseFloat(Reflect.field(json, "h"));

        return { x:_x, y:_y, w:_w, h:_h };

    } //parse_rect

    static function parse_size( json:Dynamic ) : TexturePackerSize {

        if(json == null) return null;

        var _w : Float = Std.parseFloat(Reflect.field(json, "w"));
        var _h : Float = Std.parseFloat(Reflect.field(json, "h"));

        return { w:_w, h:_h };

    } //parse_rect

} //TexturePackerJSON

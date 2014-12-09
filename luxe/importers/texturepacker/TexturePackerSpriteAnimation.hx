package luxe.importers.texturepacker;

import luxe.importers.texturepacker.TexturePackerJSON;
import luxe.importers.texturepacker.TexturePackerData;


// "walk" : {
//     "frame_size":{ "x":"48", "y":"48" },
//     "frameset": ["1-12"],
//     "events" : [{"frame":8, "event":"foot.1"}, {"frame":1, "event":"foot.2"}, { "frame": 6 }],
//     "pingpong":"false",
//     "loop": "true",
//     "speed": "18"
// }

class TexturePackerSpriteAnimation {


    public static function parse( data:TexturePackerData, anim_name:String='anim' ) : Dynamic {

        var json_anim : Dynamic = {
            raw : data,
            pingpong : false,
            loop : false,
            frame_sources : [],
            speed : 30
        };

            //the placements for the frames
        var count : Int = data.frames.length;
        var start : Int = 1;

            //frameset will be straight array, all frames
        json_anim.frameset = [ '"' + start + '-' + count + '"' ];

        if(data != null && data.frames.length != 0) {
            json_anim.frame_size = { x:data.frames[0].sourceSize.w, y:data.frames[0].sourceSize.h };
        }

            //now for each frame, add them as a frame_size
            //and offset based on the data in the import
        var index : Int = 1;
        for(_frame in data.frames) {

            var _frame_source = parse_source(_frame);
                _frame_source.frame = index;

            json_anim.frame_sources.push( _frame_source );

            index++;
        }

        var final_json : Dynamic = {};

            Reflect.setField(final_json, anim_name, json_anim );

        return final_json;

    } //parse

        //given a single named animation sequence in the data, this will extract and return
        //any frames specific to the named animation
    @:noCompletion public static function parse_by_sequence( data:TexturePackerData, name:String ) : Dynamic {

            //these defaults are changed later
            //post parsing anyway, but should be exposed
        var json_anim : Dynamic = {
            raw : data,
            pingpong : false,
            loop : false,
            frame_sources : [],
            frameset : []
        };

            //used for finding a sequence by item1, item-1, or item_1
        var _pattern_regex : EReg = null;

        var _type0_re : EReg = new EReg('('+name+')(\\d+\\b)', 'gi');
        var _type1_re : EReg  = new EReg('('+name+')(_\\d+\\b)', 'gi');
        var _type2_re : EReg  = new EReg('('+name+')(-\\d+\\b)', 'gi');

            //now we search for the frames we are looking for
        var matched : Array<TexturePackerFrame> = [];

        for(_frame in data.frames) {
            if( _type0_re.match(_frame.filename) ) {
                matched.push(_frame);
            } else if(_type1_re.match(_frame.filename)) {
                matched.push(_frame);
            } else if(_type2_re.match(_frame.filename)) {
                matched.push(_frame);
            }
        }

            //for each matched frame, we add its information to the final json
        var _index : Int = 1;
        for(match in matched) {

            var src = parse_source(match);
                src.frame = _index;

            json_anim.frame_sources.push( src );

            _index++;

        } //each match

        json_anim.frameset.push( '1-' + (_index-1) );

        return json_anim;

    } //parse_by_name

        //this returns multiple named animations as a single blob
    public static function parse_by_sequences( data:TexturePackerData, names:Array<String> ) : Dynamic {

        var frames : Array<Dynamic> = [];

        for(name in names) {
            frames.push( {name:name, data:parse_by_sequence(data, name) });
        }

        var final_json = {};

        for(frame in frames) {
            Reflect.setField( final_json, frame.name, frame.data );
        }

        return final_json;

    } //parse_by_names

//Internal API

   static function parse_source( _frame:TexturePackerFrame ) : Dynamic {

        var _frame_source : Dynamic = {};

            _frame_source.pos = {
                x:_frame.spriteSourceSize.x,
                y:_frame.spriteSourceSize.y
            };

            _frame_source.size = {
                x:_frame.sourceSize.w,
                y:_frame.sourceSize.h
            };

            _frame_source.source = {
                x: _frame.frame.x,
                y: _frame.frame.y,
                w: _frame.frame.w,
                h: _frame.frame.h
            };

        return _frame_source;

    } //parse_source

}
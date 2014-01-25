package luxe.importers;

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
            raw : data
        };

            //for now, sort the frames by name
        data.frames.sort( function(a:TexturePackerFrame, b:TexturePackerFrame) {
            return (a.filename < b.filename) ? -1 : 1;
        });

            //the placements for the frames
        var count : Int = data.frames.length;
        var start : Int = 1;

            //frameset will be straight array, all frames
        json_anim.frameset = [ '"' + start + '-' + count + '"' ];
        
        json_anim.pingpong = false;
        json_anim.loop = false;
        json_anim.speed = 30;

        if(data != null && data.frames.length != 0) {
            json_anim.frame_size = { x:data.frames[0].sourceSize.w, y:data.frames[0].sourceSize.h };
        }

            //the source frame information
        json_anim.frame_sources = [];

            //now for each frame, add them as a frame_size 
            //and offset based on the data in the import
        var index : Int = 1;
        for(_frame in data.frames) {

            var _frame_source : Dynamic = {};

                _frame_source.frame = index;                
                
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

            json_anim.frame_sources.push( _frame_source );

            index++;
        }

        var final_json : Dynamic = {};

            Reflect.setField(final_json, anim_name, json_anim );

        return final_json;

    } //parse

}
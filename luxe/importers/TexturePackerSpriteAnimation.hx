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
    
    public static function parse( data:TexturePackerData ) {

        var resulting_json = {
            raw : data
        };

            //frameset will be straight array, all frames
        var count : Int = data.frames.length;
        var start : Int = 1;

        // resulting_json.frameset = [ start + "-" + count ];
        // resulting_json.

        return resulting_json;

    } //parse

}
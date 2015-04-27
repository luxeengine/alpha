package luxe.importers.bitmapfont;

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

typedef BitmapFontData = {
    var face: String;
    var point_size: Float;
    var base_size: Float;
    var chars: Map<Int, Character>;
    var char_count: Int;
    var pages: Array<{ id : Int, file : String }>;
    var line_height: Float;
    var kernings: Map< Int, Map<Int, Float> >;
}

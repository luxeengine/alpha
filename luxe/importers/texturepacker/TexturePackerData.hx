package luxe.importers.texturepacker;

typedef TexturePackerSize = { w : Float, h : Float }
typedef TexturePackerRect = { x : Float, y : Float, w : Float, h : Float }

typedef TexturePackerMeta = {
    ?app : String,
    ?version : String,
    ?image : String,
    ?format : String,
    ?size : TexturePackerSize,
    ?scale : Float
}

typedef TexturePackerFrame = {    
    
    frame : TexturePackerRect,
    sourceSize : TexturePackerSize,
    spriteSourceSize : TexturePackerRect,

    ?filename : String,
    ?rotated : Bool,
    ?trimmed : Bool,

    uv : luxe.Rectangle,
    size : luxe.Vector,
    origin : luxe.Vector
}

class TexturePackerData {
    
    public var meta : TexturePackerMeta;
    public var frames : Array<TexturePackerFrame>;
    public var frame_map : Map<String, TexturePackerFrame>;

    public function new( _meta:TexturePackerMeta, _frames:Array<TexturePackerFrame>) {
        
        frames = _frames;
        meta = _meta;
        frame_map = new Map();

        for(_frame in frames) {
            frame_map.set( haxe.io.Path.withoutExtension(_frame.filename), _frame );
        }

    } //new

    public function frame(name:String) {
        return frame_map.get(name);
    } //frame

} //TexturePackerData


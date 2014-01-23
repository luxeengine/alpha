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
    ?trimmed : Bool
}

typedef TexturePackerData = {
    ?meta : TexturePackerMeta,
    ?frames : Array<TexturePackerFrame>
}


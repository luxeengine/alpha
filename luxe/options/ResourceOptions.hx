package luxe.options;

import phoenix.BitmapFont;
import phoenix.Texture;

typedef ResourceOptions = {
    ? id : String,
    ? silent : Bool
} //ResourceOptions

typedef FontOptions = {
    > ResourceOptions,
    ? onloaded : BitmapFont
} //FontOptions

typedef TextureOptions = {
    > ResourceOptions,
    ? onloaded : Texture
} //TextureOptions

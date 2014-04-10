package luxe.options;

import phoenix.BitmapFont;
import phoenix.Texture;

typedef ResourceOptions = {
    ? id : String,
    ? silent : Bool
} //ResourceOptions

typedef FontOptions<T> = {
    > ResourceOptions,
    ? onloaded : BitmapFont   
} //FontOptions

typedef TextureOptions = {
    > ResourceOptions,
    ? onloaded : Texture
} //TextureOptions

package luxe.options;

import phoenix.BitmapFont;
import phoenix.Texture;

typedef ResourceOptions = {
    ? id : String,
    ? silent : Bool
}

typedef FontOptions<T> = {
    > ResourceOptions,
    ? onloaded : BitmapFont   
}

typedef TextureOptions = {
    > ResourceOptions,
    ? onloaded : Texture,
    
}
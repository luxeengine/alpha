package luxe.options;

import luxe.Rectangle;
import luxe.options.VisualOptions;

typedef SpriteOptions = {

  > VisualOptions,

        /** if set, the sprite will be centered */
    @:optional var centered : Bool;
        /** if set, the sprite will be flipped horizontally */
    @:optional var flipx : Bool;
        /** if set, the sprite will be flipped vertically */
    @:optional var flipy : Bool;
        /** specify the uv rectangle inside the texture, in texture space (pixels) */
    @:optional var uv : Rectangle;

} //SpriteOptions

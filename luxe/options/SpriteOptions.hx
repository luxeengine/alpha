package luxe.options;

import luxe.Rectangle;
import luxe.options.VisualOptions;

typedef SpriteOptions<T> = {

  > VisualOptions<T>,

    ?centered : Bool,
    ?flipx : Bool,
    ?flipy : Bool,
    ?uv : Rectangle

} //SpriteOptions

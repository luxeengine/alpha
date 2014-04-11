package luxe.options;

import luxe.options.SpriteOptions;

typedef NineSliceOptions<T> = {
    
    > SpriteOptions<T>,

    ? enabled : Bool,
    
    ? top : Float,
    ? left : Float,
    ? right : Float,
    ? bottom : Float,    

    ? source_x : Float,
    ? source_y : Float,
    ? source_w : Float,
    ? source_h : Float
}

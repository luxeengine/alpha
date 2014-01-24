package luxe.options;

import luxe.Vector;
import luxe.Scene;

typedef EntityOptions<T> = {
    ?name : String,
    ?pos : Vector,
    ?scale : Vector,
    ?init_with:T,
    ?scene : Scene,
    ?no_scene : Bool
}
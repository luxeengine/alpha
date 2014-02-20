package luxe.options;

import luxe.Vector;
import luxe.Scene;

typedef EntityOptions<T> = {
    ?name : String,
    ?pos : Vector,
    ?scale : Vector,
    ?init_with:T,
    ?scene : Scene,
    ?parent : Entity,
    ?no_scene : Bool
}
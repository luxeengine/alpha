package luxe.options;

import luxe.Vector;
import luxe.Scene;

typedef EntityOptions<T> = {
    ?name : String,
    ?pos : Vector,
    ?scale : Vector,
    ?scene : Scene,
    ?parent : Entity,
    ?no_scene : Bool
} //EntityOptions

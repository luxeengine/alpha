package luxe.options;

import luxe.Vector;
import luxe.Scene;

typedef EntityOptions = {

        /** the entity name. highly recommended you set this. */
    @:optional var name : String;
        /** the transform position */
    @:optional var pos : Vector;
        /** the transform scale */
    @:optional var scale : Vector;
        /** if set, add to given scene. If not set, will add to default scene (unless no_scene) */
    @:optional var scene : Scene;
        /** if set, set parent to given entity */
    @:optional var parent : Entity;
        /** if true, do not add to any scene */
    @:optional var no_scene : Bool;

} //EntityOptions

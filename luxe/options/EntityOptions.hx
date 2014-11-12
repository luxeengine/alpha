package luxe.options;

import luxe.Vector;
import luxe.Scene;

typedef EntityOptions = {

        /** the entity name. highly recommended you set this. */
    @:optional var name : String;
        /**
            If shared names prefer a unique name, set this to true.   
            For example, `{ name:'enemy', name_unique:true }` would   
            generate a unique enemy.tp28h type of name for later filtering,   
            where the unique part would be the entity id
        */
    @:optional var name_unique : Bool;
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

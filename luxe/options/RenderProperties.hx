package luxe.options;

import phoenix.Batcher;

typedef RenderProperties = {

        /** the batcher to add the geometry to. If not specified, the default batcher is used. */
    @:optional var batcher : Batcher;
        /** if immediate, this geometry is dropped from the batcher at the end of the frame. */
    @:optional var immediate : Bool;
        /** the visibility */
    @:optional var visible : Bool;
        /** the geometry depth value (see guides)*/
    @:optional var depth : Float;
        /** the geometry group id (see guides)*/
    @:optional var group : Int;

} //RenderProperties

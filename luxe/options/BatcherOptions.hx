package luxe.options;

import phoenix.Camera;

typedef BatcherOptions = {

        /** The name of this batcher. highly recommended you set this. */
    @:optional var name : String;
        /** set to true, to disable adding to the renderer */
    @:optional var no_add : Bool;
        /** a phoenix camera view for the batcher. If you have a luxe.Camera, use the .view property from it. */
    @:optional var camera : Camera;
        /** the order/layer for this batcher in the renderer. */
    @:optional var layer : Int;

} //BatcherOptions
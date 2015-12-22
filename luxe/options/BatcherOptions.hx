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
        /** The maximum number of vertices to fit into a single batch.
            This controls how much preallocated memory a single batcher will use.
            The default is 2^14 (16k), which is around 1mb for the batcher preallocation */
    @:optional var max_verts : Int;

} //BatcherOptions
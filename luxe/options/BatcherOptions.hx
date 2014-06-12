package luxe.options;

import phoenix.Camera;

typedef BatcherOptions = {

        //The name of this batcher
    ? name : String,
        //set to true, to disable adding to the renderer
    ? no_add : Bool,
        //a phoenix camera view for the batcher
    ? camera : Camera,
        //the layer for this batcher
    ? layer : Int

} //BatcherOptions
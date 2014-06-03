package luxe.options;

import luxe.Vector;
import phoenix.Batcher;
import phoenix.Texture;

typedef MeshOptions = {
    
    ? batcher : Batcher,
    ? file : String,
    ? texture : Texture,
    ? pos : Vector,
    ? rotation : Quaternion,
    ? scale : Vector
    
}

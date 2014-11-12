package luxe.options;

import luxe.Vector;
import phoenix.Batcher;
import phoenix.Texture;
import phoenix.geometry.Geometry;

typedef MeshOptions = {

    ? name : String,
    ? batcher : Batcher,
    ? file : String,
    ? string : String,
    ? texture : Texture,
    ? pos : Vector,
    ? rotation : Quaternion,
    ? scale : Vector,
    ? geometry : Geometry

}

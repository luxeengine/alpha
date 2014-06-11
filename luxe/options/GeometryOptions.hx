package luxe.options;

import luxe.Color;
import luxe.Quaternion;
import luxe.Rectangle;
import luxe.Vector;
import phoenix.Shader;
import phoenix.Texture;
import phoenix.Batcher;

typedef GeometryOptions = {

    ? id : String,
    ? batcher : Batcher,

    ? pos : Vector,
    ? rotation : Quaternion,
    ? scale : Vector,
    ? origin : Vector,

    ? color : Color,
    ? immediate : Bool,
    ? visible : Bool,

    ? depth : Float,
    ? group : Int,
    ? texture : Texture,
    ? primitive_type : PrimitiveType,
    ? shader : Shader,
    ? clip_rect : Rectangle

}
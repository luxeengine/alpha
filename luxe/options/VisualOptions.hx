package luxe.options;

import luxe.Vector;
import luxe.Color;

import phoenix.Batcher;
import phoenix.Texture;
import phoenix.Shader;

import phoenix.geometry.Geometry;

import luxe.options.EntityOptions;

typedef VisualOptions<T> = { 

  > EntityOptions<T>,
  
    ?size : Vector,
    ?origin : Vector,
    ?color : Color,
    ?batcher : Batcher,
    ?texture : Texture,
    ?shader : Shader,
    ?depth : Float,
    ?group : Int,
    ?rotation_z : Float,
    ?visible : Bool,    
    ?serialize : Bool,
    ?geometry : Geometry,
    ?no_geometry : Bool,
    ?no_batcher_add : Bool
}
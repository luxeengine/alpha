package luxe.options;

import luxe.Vector;
import luxe.Color;

import phoenix.Batcher;
import phoenix.Texture;
import phoenix.Shader;

import phoenix.geometry.Geometry;

import luxe.options.EntityOptions;

typedef VisualOptions = {

  > EntityOptions,

        /** the size of the geometry to create */
    @:optional var size : Vector;
        /** the transform origin. */
    @:optional var origin : Vector;
        /** the base color for the geometry */
    @:optional var color : Color;
        /** the batcher to add this geometry to (unless no_batcher_add). If not specified, the default batcher is used. */
    @:optional var batcher : Batcher;
        /** the texture for the geometry */
    @:optional var texture : Texture;
        /** the shader for the geometry */
    @:optional var shader : Shader;
        /** the geometry depth value (see guides)*/
    @:optional var depth : Float;
        /** the geometry group id (see guides)*/
    @:optional var group : Int;
        /** the rotation around the z access, in degrees. convenience. */
    @:optional var rotation_z : Float;
        /** the visibility */
    @:optional var visible : Bool;
        /** if specified, this geometry will be used instead. */
    @:optional var geometry : Geometry;
        /** if specified, no geometry will be created. */
    @:optional var no_geometry : Bool;
        /** if specified, the geometry will not be added to any batcher. */
    @:optional var no_batcher_add : Bool;

} //VisualOptions

package luxe.options;

import luxe.Vector;
import luxe.Color;

import phoenix.Texture;
import phoenix.Shader;

import phoenix.geometry.Geometry;

import luxe.options.EntityOptions;
import luxe.options.RenderProperties;

typedef VisualOptions = {

    > RenderProperties,
    > EntityOptions,

        /** the size of the geometry to create */
    @:optional var size : Vector;
        /** the base color for the geometry */
    @:optional var color : Color;
        /** the texture for the geometry */
    @:optional var texture : Texture;
        /** the shader for the geometry */
    @:optional var shader : Shader;
        /** the rotation around the z access, in degrees. convenience. */
    @:optional var rotation_z : Float;
        /** if specified, this geometry will be used instead. */
    @:optional var geometry : Geometry;
        /** if specified, no geometry will be created. */
    @:optional var no_geometry : Bool;
        /** if specified, the geometry will not be added to any batcher. */
    @:optional var no_batcher_add : Bool;

} //VisualOptions

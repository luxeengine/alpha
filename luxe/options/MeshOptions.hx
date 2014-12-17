package luxe.options;

import luxe.Vector;
import phoenix.Texture;
import phoenix.geometry.Geometry;

import luxe.options.RenderProperties;
import luxe.options.TransformProperties;

typedef MeshOptions = {

    > RenderProperties,
    > TransformProperties,

        /** */
    @:optional var name : String;
        /** */
    @:optional var file : String;
        /** */
    @:optional var string : String;
        /** */
    @:optional var texture : Texture;
        /** */
    @:optional var geometry : Geometry;

    @:optional var onload:luxe.Mesh->Void;

} //MeshOptions

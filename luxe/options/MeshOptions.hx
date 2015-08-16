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
        /** */
    @:optional var no_batcher_add : Bool;

//:todo: note this section is WIP, considered volatile/not api

    @:noCompletion 
    @:optional var buffer_based : Bool;
    @:noCompletion
    @:optional var object_space : Bool;

//end section

} //MeshOptions

package luxe.options;

import luxe.options.SpriteOptions;


    /** Options for a Nineslice scaled entity, extending from `Sprite` allowing scaleable graphics to be drawn from a small image. See the guide for examples. */
typedef NineSliceOptions = {

    > SpriteOptions,

        /** the top size of the nineslice, in the texture (pixels) */
    @:optional var top : Float;
        /** the left size of the nineslice, in the texture (pixels) */
    @:optional var left : Float;
        /** the right size of the nineslice, in the texture (pixels) */
    @:optional var right : Float;
        /** the bottom size of the nineslice, in the texture (pixels) */
    @:optional var bottom : Float;

        /** The source x position within the texture. used for atlas based nineslice images */
    @:optional var source_x : Float;
        /** The source y position within the texture. used for atlas based nineslice images */
    @:optional var source_y : Float;
        /** The source width, within the texture. used for atlas based nineslice images */
    @:optional var source_w : Float;
        /** The source height, within the texture. used for atlas based nineslice images */
    @:optional var source_h : Float;

} //Nineslice Options

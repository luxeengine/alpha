package luxe.options;

typedef ColorOptions = {

        /** The blue component. applies to `Color` only. */
    @:optional var r : Float;
        /** The green component. applies to `Color` only. */
    @:optional var g : Float;
        /** The blue component. applies to `Color` only. */
    @:optional var b : Float;
        /** The alpha component. applies to all `Color` types.*/
    @:optional var a : Float;
        /** The hue component. applies to `ColorHSV` and `ColorHSL` only.*/
    @:optional var h : Float;
        /** The saturation component. applies to `ColorHSV` and `ColorHSL` only.*/
    @:optional var s : Float;
        /** The lightness component. applies to `ColorHSL` only. */
    @:optional var l : Float;
        /** The value component. applies to `ColorHSV` only. */
    @:optional var v : Float;

} //ColorOptions

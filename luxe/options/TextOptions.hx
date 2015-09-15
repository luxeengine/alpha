package luxe.options;

import phoenix.BitmapFont;

typedef TextOptions = {

    > luxe.options.VisualOptions,

        /** */
    @:optional var text: String;
        /** */
    @:optional var font: BitmapFont;
        /** */
    @:optional var point_size: Float;
        /** */
    @:optional var line_spacing: Float;
        /** */
    @:optional var letter_spacing: Float;

        /** */
    @:optional var bounds : Rectangle;
        /** */
    @:optional var bounds_wrap : Bool;
        /** */
    @:optional var align : TextAlign;
        /** */
    @:optional var align_vertical : TextAlign;

        /** */
    @:optional var sdf: Bool;
        /** */
    @:optional var smoothness: Float;
        /** */
    @:optional var thickness: Float;

        /** */
    @:optional var outline: Float;
        /** */
    @:optional var outline_color: Color;

        /** */
    @:optional var glow_threshold: Float;
        /** */
    @:optional var glow_amount: Float;
        /** */
    @:optional var glow_color: Color;

} //TextOptions
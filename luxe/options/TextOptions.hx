package luxe.options;

import phoenix.BitmapFont;
import phoenix.geometry.CompositeGeometry;

typedef TextOptions = {

    > luxe.options.VisualOptions,

        /** */
    @:optional var text: String;
        /** */
    @:optional var font: BitmapFont;
        /** */
    @:optional var point_size: Float;

        /** */
    @:optional var bounds : Rectangle;
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
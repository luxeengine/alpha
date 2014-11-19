package luxe.options;

import phoenix.BitmapFont;
import phoenix.Batcher;
import phoenix.geometry.CompositeGeometry;

typedef TextOptions = {

    > luxe.options.VisualOptions,

    ? text: String,
    ? font: BitmapFont,
    ? point_size: Float,

    ? bounds : Rectangle,
    ? align : TextAlign,
    ? align_vertical : TextAlign,

    ? sdf: Bool,
    ? smoothness: Float,
    ? thickness: Float,

    ? outline: Float,
    ? outline_color: Color,

    ? glow_threshold: Float,
    ? glow_amount: Float,
    ? glow_color: Color,

} //TextOptions
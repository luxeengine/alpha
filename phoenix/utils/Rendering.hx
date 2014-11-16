package phoenix.utils;

import snow.render.opengl.GL;
import phoenix.Batcher.PrimitiveType;
import phoenix.Batcher.BlendMode;

class Rendering {

	public static function gl_blend_mode_from_BlendMode(_b:BlendMode) {

        switch(_b) {
            case zero:
                return GL.ZERO;
            case one:
                return GL.ONE;
            case src_color:
                return GL.SRC_COLOR;
            case one_minus_src_color:
                return GL.ONE_MINUS_SRC_COLOR;
            case src_alpha:
                return GL.SRC_ALPHA;
            case one_minus_src_alpha:
                return GL.ONE_MINUS_SRC_ALPHA;
            case dst_alpha:
                return GL.DST_ALPHA;
            case one_minus_dst_alpha:
                return GL.ONE_MINUS_DST_ALPHA;
            case dst_color:
                return GL.DST_COLOR;
            case one_minus_dst_color:
                return GL.ONE_MINUS_DST_COLOR;
            case src_alpha_saturate:
                return GL.SRC_ALPHA_SATURATE;
        }
    } //BlendMode convert


    public static function get_elements_for_type( type:PrimitiveType, length:Int ) {
            // line_strip || line_loop || triangle_strip || triangle_fan are separated from being batched
        switch( type ) {
            case points:
                return Std.int(length/4);
            case lines:
                return Std.int(length/4);
            case line_strip:
                return Std.int(length/4);
            case line_loop:
                return Std.int(length/4);
            case triangle_strip:
                return Std.int(length/4);
            case triangle_fan:
                return Std.int(length/4);
            default:
                return Std.int(length/4);
        }
    } //get_opengl_type_length
    
    public static inline function fovx_to_y(fovx:Float, aspect:Float):Float {
        return (180 / Math.PI) * (2 * Math.atan(Math.tan(fovx * (Math.PI / 180) / 2) * (1 / aspect)));
    } //fovx_to_y

} //Rendering

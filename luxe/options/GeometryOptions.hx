package luxe.options;

import luxe.Color;
import luxe.Quaternion;
import luxe.Rectangle;
import luxe.Vector;
import phoenix.Shader;
import phoenix.Texture;
import phoenix.Batcher;


typedef GeometryOptions = {

    ? id : String,

    ? no_batcher_add : Bool,
    ? batcher : Batcher,

    ? pos : Vector,
    ? rotation : Quaternion,
    ? scale : Vector,
    ? origin : Vector,

    ? color : Color,
    ? immediate : Bool,
    ? visible : Bool,

    ? depth : Float,
    ? group : Int,
    ? texture : Texture,
    ? primitive_type : PrimitiveType,
    ? shader : Shader,
    ? clip_rect : Rectangle

} //GeometryOptions

typedef RectangleGeometryOptions = {

    > GeometryOptions,

    ? x : Float,
    ? y : Float,
    ? w : Float,
    ? h : Float

} //RectangleGeometryOptions

typedef QuadGeometryOptions = {

    > RectangleGeometryOptions,

    ? flipx : Bool,
    ? flipy : Bool

} //QuadGeometryOptions


typedef LineGeometryOptions = {

    > GeometryOptions,

        /** the start point of the line */
    ? p0 : Vector,
        /** the end point of the line */
    ? p1 : Vector,

        /** specified only if per vertex color is desired, use .color for both */
    ? color0 : Color,
        /** specified only if per vertex color is desired, use .color for both */
    ? color1 : Color

} //LineGeometryOptions


typedef CircleGeometryOptions = {

    > GeometryOptions,

        //x position
    ? x : Float,
        //y position
    ? y : Float,
        //radius
    ? r : Float,
        //x radius (ellipse, optional!)
    ? rx : Float,
        //y radius (ellipse, optional!)
    ? ry : Float,

        //starting angle of circle (pie/arc)
    ? start_angle : Float,
        //ending angle of circle (pie/arc)
    ? end_angle : Float,

        //the smoothing steps to apply when auto stepping
    ? smooth : Float,
        //a fixed number of steps/sides, will auto step smoothly if not specified (using smooth above)
    ? steps : Int

} //CircleGeometryOptions


typedef PlaneGeometryOptions = {

    > QuadGeometryOptions,

    ? z : Float

} //PlaneGeometryOptions


package luxe.options;

import luxe.Color;
import luxe.Quaternion;
import luxe.Rectangle;
import luxe.Vector;
import phoenix.Shader;
import phoenix.Texture;
import phoenix.Batcher;


typedef GeometryOptions = {

    > RenderProperties,
    > TransformProperties,

        /** The geometry id. if none given, a unique id is generated. */
    @:optional var id : String;
        /** if specified, the geometry will not be added to any batcher. */
    @:optional var no_batcher_add : Bool;

        /** the base color */
    @:optional var color : Color;
        /** the texture for the geometry */
    @:optional var texture : Texture;
        /** the shader for the geometry */
    @:optional var shader : Shader;

        /** the primitive type of the geometry. lines, triangles, point etc */
    @:optional var primitive_type : PrimitiveType;
        /** If specified, the geometry will be clipped to this rectangle region (in world space). */
    @:optional var clip_rect : Rectangle;

} //GeometryOptions

/** Options for drawing or creating rectangle based geometry, phoenix.geometry.RectangleGeometry */
typedef RectangleGeometryOptions = {

    > GeometryOptions,

        /** x position */
    @:optional var x : Float;
        /** y position */
    @:optional var y : Float;
        /** width */
    @:optional var w : Float;
        /** height */
    @:optional var h : Float;
        /** optional existing rect. oveerrides x/y/w/h */
    @:optional var rect : Rectangle;

} //RectangleGeometryOptions

/** Options for drawing or creating quad based geometry, phoenix.geometry.QuadGeometry */
typedef QuadGeometryOptions = {

    > RectangleGeometryOptions,

        /** Whether or not the quad is flipped horizontally */
    @:optional var flipx : Bool;
        /** Whether or not the quad is flipped vertically */
    @:optional var flipy : Bool;

} //QuadGeometryOptions

/** Options for drawing or creating line based geometry, phoenix.geometry.LineGeometry */
typedef LineGeometryOptions = {

    > GeometryOptions,

        /** the start point of the line */
    @:optional var p0 : Vector;
        /** the end point of the line */
    @:optional var p1 : Vector;

        /** specified only if per vertex color is desired, use .color for both */
    @:optional var color0 : Color;
        /** specified only if per vertex color is desired, use .color for both */
    @:optional var color1 : Color;

} //LineGeometryOptions

/** Options for drawing or creating circle based geometry, phoenix.geometry.CircleGeometry */
typedef CircleGeometryOptions = {

    > GeometryOptions,

        /** x position */
    @:optional var x : Float;
        /** y position */
    @:optional var y : Float;
        /** radius */
    @:optional var r : Float;
        /** x radius. For an ellipse, optional. */
    @:optional var rx : Float;
        /** y radius. For an ellipse, optional. */
    @:optional var ry : Float;

        /** Starting angle of circle, in degrees (pie/arc) */
    @:optional var start_angle : Float;
        /** Ending angle of circle, in degrees (pie/arc) */
    @:optional var end_angle : Float;

        /** the smoothing factor to auto calculate steps */
    @:optional var smooth : Float;
        /** a fixed number of steps/sides, will auto step smoothly if not specified (using smooth above) */
    @:optional var steps : Int;

} //CircleGeometryOptions


//:todo: hidden until 3d api is more official.
@:noCompletion typedef PlaneGeometryOptions = {

    > QuadGeometryOptions,

        /** z position */
    @:optional var z : Float;

} //PlaneGeometryOptions


package luxe.options;

import luxe.options.GeometryOptions;
import luxe.Rectangle;
import luxe.Vector;
import phoenix.Texture;

typedef DrawLineOptions      = LineGeometryOptions;
typedef DrawBoxOptions       = QuadGeometryOptions;
typedef DrawRectangleOptions = RectangleGeometryOptions;
typedef DrawRingOptions      = CircleGeometryOptions;
typedef DrawArcOptions       = CircleGeometryOptions;
typedef DrawCircleOptions    = CircleGeometryOptions;

typedef DrawNgonOptions = {

    > GeometryOptions,

        /** The number of sides. For a triangle, 3. For a square, 4, etc. */
    @:optional var sides : Int;
        /** the radius of the ngon,
        around the center point x,y */
    @:optional var r : Float;
        /** center point x */
    @:optional var x : Float;
        /** center point y */
    @:optional var y : Float;
        /** an offset rotation angle in degrees */
    @:optional var angle : Float;
        /** whether or not this is an outline or a solid filled ngon */
    @:optional var solid : Bool;

} //DrawNgonOptions

typedef DrawPolygonOptions = {

    > GeometryOptions,

        /** The list of points to add to the polyline */
    var points : Array<Vector>;

        /** Whether or not the polygon is solid. */
    @:optional var solid : Bool;

        /** Whether or not the polygon will be closed (the first and last vertex are connected). */
    @:optional var close : Bool;

        /** The list of colors, per point. Must match length with the points list */
    @:optional var colors : Array<Color>;

} //DrawPolygonOptions

typedef DrawTextureOptions = {

    > QuadGeometryOptions,

        /** the size to draw the texture at. An alternative to `w`,`h`. If this is specifed, w,h is ignored. */
    @:optional var size : Vector;
        /** the uv coordinates for the created quad, in texture size (pixels) */
    @:optional var uv : Rectangle;

} //DrawTextureOptions

    //:todo : hidden as 3d is not part of the API yet
@:noCompletion typedef DrawPlaneOptions = PlaneGeometryOptions;
    //dummy class for naming the file appropriately
@:noCompletion private class DrawOptions {}
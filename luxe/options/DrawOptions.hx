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

    ? sides : Int,
        //the radius of the ngon,
        //around the center point x,y
    ? r : Float,
        //center x
    ? x : Float,
        //center y
    ? y : Float,
        //an offset rotation in degrees
    ? angle : Float,
        //whether or not to fill it in
    ? solid : Bool

} //DrawNgonOptions

typedef DrawTextureOptions = {

    > QuadGeometryOptions,

        //the size to draw the texture at. An alternative to `w`,`h`
    ? size : Vector,
        //the uv coordinates for the created quad, in texture size (pixels)
    ? uv : Rectangle

} //DrawTextureOptions

    //:todo : hidden as 3d is not part of the API yet
@:noCompletion typedef DrawPlaneOptions = PlaneGeometryOptions;
    //dummy class for naming the file appropriately
@:noCompletion class DrawOptions {}
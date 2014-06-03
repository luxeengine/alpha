package luxe.options;

import phoenix.Rectangle;
import phoenix.Camera.ProjectionType;

typedef ProjectionOptions = {

        //ortho
    ? x1        : Float, 
    ? y1        : Float,
    ? x2        : Float, 
    ? y2        : Float,
        //perspective
    ? fov       : Float,
    ? aspect    : Float,
        //common
    ? near      : Float,
    ? far       : Float,
    ? viewport  : Rectangle

} //ProjectionOptions


typedef CameraOptions = {

    > ProjectionOptions,

    ? name : String,
    ? projection : ProjectionType,
    ? cull_backfaces : Bool,     //ortho: false, persp: true
    ? depth_test : Bool         //ortho: false, persp: true

}

    //Don't like this naming here, 
    //but will have to do for now.
typedef LuxeCameraOptions = {
    
    > CameraOptions,

    ? view : phoenix.Camera,
    ? no_scene : Bool,

}
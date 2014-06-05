package luxe.options;

import phoenix.Rectangle;
import phoenix.Camera.ProjectionType;

typedef CameraOptions = {

    ? name : String,

    ? projection : ProjectionType,
        //ortho: false, persp: true
    ? cull_backfaces : Bool,    
        //ortho: false, persp: true 
    ? depth_test : Bool,
        //perspective only
    ? fov       : Float,
        //perspective only
    ? aspect    : Float,
        //near clipping plane, common
    ? near      : Float,
        //far clipping plane, common
    ? far       : Float,
        //the bounds of the viewport, common
    ? viewport  : Rectangle

} //CameraOptions

    //Don't like this naming here, 
    //but will have to do for now.
typedef LuxeCameraOptions = {
    
    > CameraOptions,

    ? view : phoenix.Camera,
    ? no_scene : Bool,

}
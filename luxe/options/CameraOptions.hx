package luxe.options;

import phoenix.Rectangle;
import phoenix.Camera.ProjectionType;
import phoenix.Camera.FOVType;

typedef CameraOptions = {

        /** The camera view name. highly recommended you set this. */
    @:optional var camera_name : String;
        /** The type of projection to use. ortho, perspective */
    @:optional var projection : ProjectionType;
        /** Whether or not to cull backfaces, defaults: ortho(false), perspective(true) */
    @:optional var cull_backfaces : Bool;
        /** Whether or not depth testing should be enabled. defaults: ortho(false), perspective(true) */
    @:optional var depth_test : Bool;
        /** the vertical field of view, in degrees. perspective only */
    @:optional var fov       : Float;
        /** the field of view type (vertical or horizontal). perspective only */
    @:optional var fov_type  : FOVType;
        /** The aspect ratio. usually `view width/view height`. perspective only */
    @:optional var aspect    : Float;
        /** the near clipping plane, common to ortho + perspective */
    @:optional var near      : Float;
        /** the far clipping plane, common to ortho + perspective */
    @:optional var far       : Float;
        /** the bounds of the viewport, common to ortho + perspective */
    @:optional var viewport  : Rectangle;

} //CameraOptions

    /**Don't like this naming here, tentative. Will have to do for now. */
typedef LuxeCameraOptions = {

    > CameraOptions,
    > EntityOptions,

        /** Give this luxe entity camera a pre-existing phoenix view camera */
    @:optional var view : phoenix.Camera;

} //LuxeCameraOptions
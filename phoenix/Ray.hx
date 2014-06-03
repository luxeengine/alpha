package phoenix;

import phoenix.Rectangle;
import phoenix.Vector;
import phoenix.Camera;

class Ray { 

    public var origin : Vector;
    public var end : Vector;
    public var dir : Vector;

    var camera : Camera;
    var viewport : Rectangle;

        //optional viewport size
    public function new( _screen_pos:Vector, _camera:Camera, ?_viewport:Rectangle=null ) {

        if(_viewport == null) {
            _viewport = new Rectangle(0,0,Luxe.screen.w, Luxe.screen.h);
        }

        if(_camera == null) throw "Camera required for a ray!";

        camera = _camera;
        viewport = _viewport;

       refresh(_screen_pos);

    } //new

    public function refresh( _screen_pos:Vector ) {

            //calculate the x and y in normalized device coordinates first [-1, 1] on both axis
        var ndc_x : Float = (_screen_pos.x/viewport.w  - 0.5) * 2.0;
        var ndc_y : Float = ((viewport.h - _screen_pos.y)/viewport.h - 0.5) * 2.0;

            //To calculate a ray we use [0,1] for the depth so we can get a direction
        var start_ndc : Vector = new Vector( ndc_x, ndc_y, 0.0, 1.0 );
        var end_ndc : Vector = new Vector( ndc_x, ndc_y, 1.0, 1.0 );
            //So we have a near and a far clipping space coords for the mouse, now unproject it using the camera
        origin = camera.unproject(start_ndc);
        end = camera.unproject(end_ndc);
        dir = Vector.Subtract(end, origin);

    } //refresh

} //Ray
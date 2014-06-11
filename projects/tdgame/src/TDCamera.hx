
import luxe.Camera;
import luxe.Vector;
import luxe.Input;

import phoenix.Matrix;
import luxe.Component;

class TDCamera extends Component {

        //the camera upon which to act
    public var camera : Camera;
        //the speed at which to move
    public var speed : Float = 2;

            //local values

            //movement state
        var left:Bool = false;
        var right:Bool = false;
        var forward:Bool = false;
        var back:Bool = false;
            //whether or not we are enabled
        var active:Bool = false;

    public function init() {

            //Listen for input so we can move around
        Luxe.input.add('left', KeyValue.left);
        Luxe.input.add('left', KeyValue.key_A);
        Luxe.input.add('right', KeyValue.right);
        Luxe.input.add('right', KeyValue.key_D);
        Luxe.input.add('forward', KeyValue.up);
        Luxe.input.add('forward', KeyValue.key_W);
        Luxe.input.add('back', KeyValue.down);
        Luxe.input.add('back', KeyValue.key_S);

    }

    public function update(dt:Float) {
        if(forward) { camera.pos.z -= speed * dt; }
        if(back)    { camera.pos.z += speed * dt; }
        if(left)    { camera.pos.x -= speed * dt; }
        if(right)   { camera.pos.x += speed * dt; }
    }


        //Dir = < 0 or > 0 to zoom in or out
    public function zoom( dir:Float ) {

        var _forward = new Vector(0,0,-1);
        var rotmat = new Matrix().makeRotationFromQuaternion(camera.view.rotation);

            _forward.transform( rotmat );
            _forward.normalize();

        camera.pos.z += _forward.z * dir;
        camera.pos.y += _forward.y * dir;

    } //zoom

    public function onmousewheel( e:MouseEvent ) {
        switch(e.button) {
            case MouseButton.wheel_down:
                zoom(-1);
            case MouseButton.wheel_up:
                zoom(1);
            default:
        } //switch
    } //onmousedown

    public function oninputdown( name:String, e:InputEvent ) {
        switch(name) {
            case 'left': left = true;
            case 'right': right = true;
            case 'forward': forward = true;
            case 'back': back = true;
        } //switch
    } //oninputdown
    
    public function oninputup( name:String, e:InputEvent ) {
        switch(name) {
            case 'left': left = false;
            case 'right': right = false;
            case 'forward': forward = false;
            case 'back': back = false;
        } //switch
    } //oninputup

}
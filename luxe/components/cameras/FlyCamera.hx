package luxe.components.cameras;

import luxe.Vector;
import luxe.Input;

import phoenix.Matrix;
import phoenix.Camera;

import luxe.utils.Maths;
import luxe.Camera.ProjectionType;

import luxe.options.CameraOptions;

class FlyCamera extends luxe.Camera {

    public var move_forward : Bool;
    public var move_back : Bool;
    public var move_left : Bool;
    public var move_right : Bool;

    public var move_speed : Float = 5;
    public var move_speed_scale : Float = 1;
    public var sensitivity_x : Float = 0.0025;
    public var sensitivity_y : Float = 0.0025;

    var newpos : Vector;
    var mouse_delta : Vector;

    public var forward  : Vector;
    public var right : Vector;
    public var up : Vector;

    var yaw : Float = 0;
    var pitch : Float = 0;

    var pitch_rotation_matrix : Matrix;
    var yaw_rotation_matrix : Matrix;

    var ready = false;

    static var halfPI = Math.PI*0.5;
    static var twoPI = Math.PI*2;

    public function new( _options:LuxeCameraOptions ) {

        super(_options);

        mouse_delta = new Vector(0,0);

        newpos = new Vector();
        forward = new Vector(0,0,-1);
        right = new Vector(-1,0,0);
        up = new Vector(0,1,0);

        pitch_rotation_matrix = new Matrix();
        yaw_rotation_matrix = new Matrix();

    } //new


    public function reset() {
            //about 2m tall
        pos = new Vector(0, 1, 5);

    } //start

    public override function update(dt:Float) {

            //Update the parent in case it's doing stuff
        super.update(dt);

            //Don't want to process until ready
        if(!ready) {
            return;
        }

            //start from our existing position
        newpos.set_xyz(pos.x, pos.y, pos.z);

        var move_diff = move_speed * move_speed_scale * dt;

        if(mouse_delta.x != 0 || mouse_delta.y != 0) {

            // mouse_delta.x = Maths.clamp(mouse_delta.x, -1, 1);
            // mouse_delta.y = Maths.clamp(mouse_delta.y, -1, 1);

                //Update movement facing from mouse difference
            move_look(mouse_delta.x, mouse_delta.y);

            var final_rotation : Matrix = null;

                //Camera isn't looking at something
            if(view.target == null) {

                    //Make sure we clear values
                pitch_rotation_matrix.identity();
                yaw_rotation_matrix.identity();

                    //rotating the yaw around the local Y (up) axis
                yaw_rotation_matrix.makeRotationY( yaw );

                    //update the right vector of our orientation
                right = yaw_rotation_matrix.right();

                    //Rotate the pitch around the right hand (local x) axis
                pitch_rotation_matrix.makeRotationAxis( right, pitch );

                    //the combination of the yaw and pitch applied to a single rotation matrix
                final_rotation = pitch_rotation_matrix.multiply(yaw_rotation_matrix);

                    //Apply it to the camera view
                rotation = rotation.setFromRotationMatrix(final_rotation);

            }

                //Make sure this stays set
            mouse_delta.set_xy(0, 0);

        }

        if(move_forward) {
            newpos.add( Vector.Multiply(forward, move_diff) );
        }
        if(move_back) {
            newpos.subtract( Vector.Multiply(forward, move_diff) );
        }

        if(move_left) {
            newpos.subtract( Vector.Multiply(right, move_diff) );
        }
        if(move_right) {
            newpos.add( Vector.Multiply(right, move_diff) );
        }

            //update the position for the camera
        pos = newpos;

            //once transform updates
        right = view.view_matrix.right();
        forward = view.view_matrix.forward();
        up = view.view_matrix.up();


    } //update

    function move_look(xDelta:Float,yDelta:Float) {

            yaw -= xDelta*sensitivity_x;

        while (yaw < 0) {
            yaw += twoPI;
        }

        while (yaw >= twoPI) {
            yaw -= twoPI;
        }

            pitch -= yDelta*sensitivity_y;

        while (pitch < - halfPI) {
            pitch = -halfPI;
        }

        while (pitch > halfPI) {
            pitch = halfPI;
        }

    } //move_look

    var locked = false;
    override function onmouseup(e:MouseEvent) {

        if(e.button == MouseButton.left && !ready) {
            enable();
        }

        if(e.button == MouseButton.left && !locked) {
            locked = true;
            Luxe.snow.runtime.window_grab(locked);
        } else if(e.button == MouseButton.right && locked) {
            locked = false;
            Luxe.snow.runtime.window_grab(locked);
            ready = false;
        }

    } //onmouseup

    public function enable() {

        mouse_delta.set_xy( 0,0 );

        ready = true;

    } //enable

    override function onmousemove(e:MouseEvent) {

        if(!ready) return;
        if(Luxe.core.console_visible) {
            return;
        }

        mouse_delta.set_xy(e.xrel, e.yrel);

    } //onmousemove

    override function onkeydown(e) {

            //disabling console, don't allow spinning to new position
        if(e.scancode == Scan.grave && Luxe.core.console_visible == true) {
            mouse_delta.set_xy(0,0);
        }

        if(e.keycode == Key.up || e.keycode == Key.key_w) {
            move_forward = true;
        }
        if(e.keycode == Key.down || e.keycode == Key.key_s) {
            move_back = true;
        }
        if(e.keycode == Key.left || e.keycode == Key.key_a) {
            move_left = true;
        }
        if(e.keycode == Key.right || e.keycode == Key.key_d) {
            move_right = true;
        }

        if(e.keycode == Key.lshift || e.keycode == Key.rshift) {
            move_speed_scale = 4;
        }

    } //onkeydown

    override function onkeyup(e) {

        if(e.keycode == Key.up || e.keycode == Key.key_w) {
            move_forward = false;
        }
        if(e.keycode == Key.down || e.keycode == Key.key_s) {
            move_back = false;
        }
        if(e.keycode == Key.left || e.keycode == Key.key_a) {
            move_left = false;
        }
        if(e.keycode == Key.right || e.keycode == Key.key_d) {
            move_right = false;
        }
        if(e.keycode == Key.lshift || e.keycode == Key.rshift) {
            move_speed_scale = 1;
        }

    } //onkeyup

} //FlyCamera

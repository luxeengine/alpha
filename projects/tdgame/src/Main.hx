
import luxe.components.render.MeshComponent;
import luxe.Entity;
import luxe.Mesh;
import luxe.Vector;
import luxe.Input;
import phoenix.Camera;
import phoenix.Matrix4;
import phoenix.Texture;
import phoenix.utils.Maths;

class Main extends luxe.Game {

    var floor : Entity;
    var floor_mesh : MeshComponent;

    var tower : Entity;
    var tower_mesh : MeshComponent;

    var tower_texture : Texture;
    var floor_texture : Texture;
    var camera : phoenix.Camera;

    var left:Bool = false;
    var right:Bool = false;
    var forward:Bool = false;
    var back:Bool = false;

    public function ready() {

        floor_texture = Luxe.loadTexture('assets/floor.png');
        tower_texture = Luxe.loadTexture('assets/tower.png');
        
        tower = Luxe.scene.create(Entity, 'tower');

        tower_mesh = tower.add(MeshComponent, 'mesh');
            tower_mesh.file = 'assets/tower2.obj';
            tower_mesh.texture = tower_texture;

        floor = Luxe.scene.create(Entity, 'floor');

        floor_mesh = floor.add(MeshComponent, 'mesh');
            floor_mesh.file = 'assets/tower1.obj';
            floor_mesh.texture = floor_texture;

        camera = new phoenix.Camera({
            projection: ProjectionType.perspective,
            fov:30, 
            near:0.01,
            aspect:Luxe.screen.w/Luxe.screen.h
        });

        camera.pos = new Vector(0,4,3);
        camera.rotation.setFromEuler(new Vector(Maths.degToRad(-60),0,0));

        Luxe.renderer.default_batcher.view = camera;

        Luxe.input.add('left', KeyValue.left);
        Luxe.input.add('left', KeyValue.key_A);
        Luxe.input.add('right', KeyValue.right);
        Luxe.input.add('right', KeyValue.key_D);
        Luxe.input.add('forward', KeyValue.up);
        Luxe.input.add('forward', KeyValue.key_W);
        Luxe.input.add('back', KeyValue.down);
        Luxe.input.add('back', KeyValue.key_S);

    } //ready

    public function zoom(dir:Float) {
        var forward = new Vector(0,0,-1);
        var rotmat = new Matrix4().makeRotationFromQuaternion(camera.rotation);

            forward.applyMatrix4( rotmat );
            forward.normalize();

        camera.pos.z += forward.z * dir;
        camera.pos.y += forward.y * dir;
    }

    public function get_camera_point(?start:Vector=null) : Vector {
        if(start == null) start = camera.pos;

        var direction = new Vector(0,0,-1);
        var rotmat = new Matrix4().makeRotationFromQuaternion(camera.rotation);
            direction.applyMatrix4( rotmat );
            direction.normalize();

            //T = [planeNormal•(pointOnPlane - rayOrigin)]/planeNormal•rayDirection;
            //pointInPlane = rayOrigin + (rayDirection * T);
            var planeNormal = new Vector(0,-1,0);
            var pointOnPlane = new Vector();
            var rayOrigin = start;
                //for [ ] 
            var part1 = planeNormal.dot( Vector.Subtract(pointOnPlane, rayOrigin) );
            var part2 = planeNormal.dot( direction );
            var T = part1 / part2;

            var scaled_direction = direction.multiplyScalar(T);
            var pointInPlane = Vector.Add(start, scaled_direction);

            return pointInPlane;
    }

    // Convert mouse position to 3D
    function screenToWorld(point:Vector) : Vector {

        // Find near and far plane intersections
        var point3f = new Vector(point.x, Luxe.screen.w * 0.5 - point.y, 0.0);
        var nearPlane = unproject(point3f);
        var farPlane = unproject(new Vector(point3f.x, point3f.y, 1.0));

        // Calculate X, Y and return point
        var theta = (0.0 - nearPlane.z) / (farPlane.z - nearPlane.z);
        return new Vector(
            nearPlane.x + theta * (farPlane.x - nearPlane.x), 
            nearPlane.y + theta * (farPlane.y - nearPlane.y), 
            0.0
            );

    }

    // Unproject a coordinate back to to camera
    function unproject(point:Vector) {

        // Find the inverse Modelview-Projection-Matrix
        var _mInvMVP : Matrix4 = camera.projection_matrix.clone().multiply(camera.modelview_matrix); //mProjection * mModelView;
        var mInvMVP : Matrix4 = new Matrix4();
        mInvMVP = mInvMVP.getInverse(_mInvMVP);

            // Transform to normalized coordinates in the range [-1, 1]

        var pointNormal = new Vector();
            pointNormal.x = (point.x - 0) / Luxe.screen.w * 2.0 - 1.0;
            pointNormal.y = (point.y - 0) / Luxe.screen.h * 2.0;
            pointNormal.z = 2.0 * point.z - 1.0;
            pointNormal.w = 1.0;

        // Find the object's coordinates
        var pointCoord : Vector = pointNormal.applyMatrix4(mInvMVP);
        if (pointCoord.w != 0.0)
            pointCoord.w = 1.0 / pointCoord.w;

        // Return coordinate
        return new Vector(
                pointCoord.x * pointCoord.w, 
                pointCoord.y * pointCoord.w, 
                pointCoord.z * pointCoord.w
            );

    }


    public function oninputdown( name:String, e:Dynamic ) {
        switch(name) {
            case 'left': left = true;
            case 'right': right = true;
            case 'forward': forward = true;
            case 'back': back = true;
        }
    }
     public function oninputup( name:String, e:Dynamic ) {
        switch(name) {
            case 'left': left = false;
            case 'right': right = false;
            case 'forward': forward = false;
            case 'back': back = false;
        }
     }

    public function onmousedown( e:MouseEvent ) {
        if(e.button == MouseButton.wheel_down || e.button == MouseButton.wheel_up) {
            switch(e.button) {
                case MouseButton.wheel_down:
                    zoom(-1);
                case MouseButton.wheel_up:
                    zoom(1);
                default:
            }
        }
    }

     public function onmouseup( e:MouseEvent ) {

        // camera.onmouseup(e);

    } //onmouseup
  
    public function onmousemove( e:MouseEvent ) {
        // camera.onmousemove(e);
        var mp_world = screenToWorld(e.pos);
        tower.pos = get_camera_point( camera.pos.clone().add(mp_world) );
    }

    public function onkeydown( e:KeyEvent ) {
        // camera.onkeydown(e);
    }

    public function onkeyup( e:KeyEvent ) {
        
        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }

        // camera.onkeyup(e);

    } //onkeyup

    var spd : Float = 2;
    public function update(dt:Float) {

        if(forward)     { camera.pos.z -= spd * dt; }
        if(back)        { camera.pos.z += spd * dt; }
        if(left)        { camera.pos.x -= spd * dt; }
        if(right)       { camera.pos.x += spd * dt; }

        

    } //update

    public function shutdown() {

    } //shutdown
}



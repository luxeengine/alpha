
import luxe.Color;
import luxe.components.cameras.FlyCamera;
import luxe.components.render.MeshComponent;

import luxe.Entity;
import luxe.Mesh;
import luxe.Vector;
import luxe.Input;
import phoenix.Batcher;
import phoenix.Camera;
import phoenix.Matrix4;
import phoenix.Texture;
import phoenix.utils.Maths;

//import luxe.components.physics.three.MeshCollider;

class Main extends luxe.Game {

    var floor : Entity;
    var floor_mesh : MeshComponent;

    var tower : Entity;
    var tower_mesh : MeshComponent;

    var camthingy : Entity;
    var camthingy_mesh : MeshComponent;

    var tower_texture : Texture;
    var floor_texture : Texture;
    var camera : phoenix.Camera;
    var flycam : FlyCamera;

    var hudview : Batcher;
    var hudcam : luxe.Camera;

    var left:Bool = false;
    var right:Bool = false;
    var forward:Bool = false;
    var back:Bool = false;
    var fly:Bool = false;

    public function ready() {

        floor_texture = Luxe.loadTexture('assets/floor.png');
        tower_texture = Luxe.loadTexture('assets/tower.png');
        
        tower = Luxe.scene.create(Entity, 'tower');

        tower_mesh = tower.add(MeshComponent, 'mesh');
            tower_mesh.file = 'assets/tower2.obj';
            tower_mesh.texture = tower_texture;

        floor = Luxe.scene.create(Entity, 'floor');

        var floormesh = new Mesh({
            file : 'assets/tower1.obj',
            texture : floor_texture
        });

        floor_mesh = floor.add(MeshComponent, 'mesh');
            floor_mesh.mesh =  floormesh;

        // var mc = floor.add( MeshCollider, 'collider');
        //     mc.mesh = floormesh;

        camthingy = Luxe.scene.create(Entity, 'tower');

        camthingy_mesh = camthingy.add(MeshComponent, 'mesh');
            camthingy_mesh.file = 'assets/cam.obj';
            camthingy_mesh.texture = floor_texture;


        camera = new phoenix.Camera({
            projection: ProjectionType.perspective,
            fov:30, 
            near:0.1, far:1000,
            aspect:Luxe.screen.w/Luxe.screen.h
        });

        flycam = new FlyCamera({
            projection: ProjectionType.perspective,
            fov:60, 
            near:0.1,
            far:1000,
            aspect:Luxe.screen.w/Luxe.screen.h
        });

        camera.pos = new Vector(0,10,8);
        camera.rotation.setFromEuler(new Vector(Maths.degToRad(-60),0,0));

        flycam.view.pos = new Vector(0,10,8);
        flycam.view.rotation.setFromEuler(new Vector(Maths.degToRad(-60),0,0));

        Luxe.renderer.default_batcher.view = camera;

        Luxe.input.add('left', KeyValue.left);
        Luxe.input.add('left', KeyValue.key_A);
        Luxe.input.add('right', KeyValue.right);
        Luxe.input.add('right', KeyValue.key_D);
        Luxe.input.add('forward', KeyValue.up);
        Luxe.input.add('forward', KeyValue.key_W);
        Luxe.input.add('back', KeyValue.down);
        Luxe.input.add('back', KeyValue.key_S);
        
        Luxe.input.add('change_camera', KeyValue.key_C);

        hudcam = new luxe.Camera({name:'hudview'});
        hudview = new Batcher(Luxe.renderer, 'hudview');
        hudview.view = hudcam.view;
        hudview.layer = 2;

        Luxe.renderer.add_batch(hudview);

    } //ready

    public function zoom(dir:Float) {
        var forward = new Vector(0,0,-1);
        var rotmat = new Matrix4().makeRotationFromQuaternion(camera.rotation);

            forward.applyMatrix4( rotmat );
            forward.normalize();

        camera.pos.z += forward.z * dir;
        camera.pos.y += forward.y * dir;
    }   

        //ray+plane intersection
    public function get_camera_point(?start:Vector=null, ?dir:Vector=null) : Vector {

        if(start == null) start = camera.pos;
        if(dir == null) {
            var _direction = new Vector(0,0,-1);
            var rotmat = new Matrix4().makeRotationFromQuaternion(camera.rotation);
                _direction.applyMatrix4( rotmat );
                _direction.normalize();
            dir = _direction;
        }

        //T = [planeNormal•(pointOnPlane - rayOrigin)]/planeNormal•rayDirection;
        //pointInPlane = rayOrigin + (rayDirection * T);
        var planeNormal = new Vector(0,-1,0);
        var pointOnPlane = new Vector();
        var rayOrigin = start.clone();
            //for [ ] 
        var part1 = planeNormal.dot( Vector.Subtract(pointOnPlane, rayOrigin) );
        var part2 = planeNormal.dot( dir );
        var T = part1 / part2;

        var scaled_direction = Vector.Multiply(dir, T);
        var pointInPlane = Vector.Add(start, scaled_direction);

        return pointInPlane;
    }

    public function oninputdown( name:String, e:Dynamic ) {
        switch(name) {
            case 'left': left = true;
            case 'right': right = true;
            case 'forward': forward = true;
            case 'back': back = true;
            case 'change_camera': 
                fly = !fly;
                if(fly) {
                    trace('fly cam activated');
                    Luxe.renderer.default_batcher.view = flycam.view;
                    Luxe.scene.add(flycam);
                } else {
                    trace('game cam activated');
                    Luxe.renderer.default_batcher.view = camera;
                    Luxe.scene.remove(flycam);
                    Luxe.showCursor(true);
                    Luxe.lockCursor(false);
                }
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

        if(!fly) {
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

    }

     public function onmouseup( e:MouseEvent ) {

        if(fly) {
            flycam.onmouseup(e);
        }

    } //onmouseup
  
    var raystart : Vector;
    var rayend : Vector;
    var raydir : Vector;
    var textp : Vector;

    public function onmousemove( e:MouseEvent ) {
        if(!fly) {

        var ndc_x = (e.pos.x/Luxe.screen.w  - 0.5) * 2.0;
        var ndc_y = ((Luxe.screen.h - e.pos.y)/Luxe.screen.h - 0.5) * 2.0;
        var start_ndc : Vector = new Vector( ndc_x, ndc_y, 0, 1.0 );
        var end_ndc : Vector = new Vector( ndc_x, ndc_y, 1.0, 1.0 );

            var n = camera.unprojectVector(start_ndc);
            var f = camera.unprojectVector(end_ndc);

            raystart = n;
            rayend = f;
            raydir = Vector.Subtract(f, n);
            
                if(textp == null) textp = new Vector();
                if(raydir == null) raydir = new Vector();
                if(raystart == null) raystart = new Vector();
                if(rayend == null) rayend = new Vector();            

        }

        if(fly) {
            flycam.onmousemove(e);
        }
    }

    public function onkeydown( e:KeyEvent ) {
        if(fly) {
            flycam.onkeydown(e);
        }
    }

    public function onkeyup( e:KeyEvent ) {
        
        if(e.key == KeyValue.key_Q) {
            Luxe.shutdown();
        }

        if(fly) {
            flycam.onkeyup(e);
        }

    } //onkeyup

    var spd : Float = 2;
    public function update(dt:Float) {

        if(raystart != null && raydir != null) {
            var tp = get_camera_point(raystart, raydir);
                tp.x = 0.5+Math.floor(tp.x);
                tp.z = 0.5+Math.floor(tp.z);
            tower.pos = tp;
        }
        
        textp = camera.projectVector(tower.pos.clone());
        var widthHalf = (Luxe.screen.w/2);
        var heightHalf = (Luxe.screen.h/2);
        textp.x = ( textp.x * widthHalf ) + widthHalf;
        textp.y = - ( textp.y * heightHalf ) + heightHalf;

        Luxe.draw.text({
            text:'HP: 100/100',
            immediate : true,
            color : new Color(0.6,0,0,1),
            pos: textp,
            batcher: hudview
        });

        Luxe.draw.line({
            immediate:true,
            p0 : new Vector(0, 100, 0),
            p1 : new Vector(0, -100, 0),
            color : new Color(0,0.6,0,0.2)
        });

        Luxe.draw.line({
            immediate:true,
            p0 : new Vector(0, 0, 100),
            p1 : new Vector(0, 0, -100),
            color : new Color(0,0,0.6,1)
        });

        Luxe.draw.line({
            immediate:true,
            p0 : new Vector(-100, 0, 0),
            p1 : new Vector(100, 0, 0),
            color : new Color(0.6,0,0,1)
        });

        if(!fly) {
            if(forward)     { camera.pos.z -= spd * dt; }
            if(back)        { camera.pos.z += spd * dt; }
            if(left)        { camera.pos.x -= spd * dt; }
            if(right)       { camera.pos.x += spd * dt; }
        }

        camthingy.pos = camera.pos;
        camthingy.rotation = new Vector( Maths.degToRad(-90),0,0);

    } //update

    public function shutdown() {

    } //shutdown
}



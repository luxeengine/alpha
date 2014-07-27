
import phoenix.Texture;
import phoenix.Batcher;
import phoenix.Camera;

import phoenix.geometry.LineGeometry;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;
import phoenix.geometry.TextureCoord;
import phoenix.Quaternion;

import luxe.Input;
import luxe.Vector;
import luxe.Text;
import luxe.Color;
import luxe.Entity;
import luxe.Mesh;
import luxe.utils.Maths;

import snow.render.opengl.GL;

import phoenix.formats.obj.Reader;

import luxe.components.cameras.FlyCamera;
import luxe.components.render.MeshComponent;

import luxe.components.physics.bullet.three.BoxCollider;
import luxe.components.physics.bullet.three.PlaneCollider;
import luxe.components.physics.bullet.three.SphereCollider;
import luxe.components.physics.bullet.three.MeshCollider;
import luxe.components.physics.bullet.three.RigidBody;


class Main extends luxe.Game {

    var batch3d : Batcher;
    var cam3d : FlyCamera;

    var tex : Texture;
    var tex2 : Texture;
    var tex3 : Texture;
    var tex4 : Texture;

    var rotation : Vector;
    var info : Text;

    var follow : Bool = false;

    override function ready() {

        Luxe.screen.cursor.grab = false;
        Luxe.screen.cursor.visible = true;

        Luxe.renderer.clear_color = new Color().rgb(0x990099);

        rotation = new Vector(-20, 0, 0);

        tex = Luxe.loadTexture('assets/diff.png');
        tex2 = Luxe.loadTexture('assets/transform.png');
        tex3 = Luxe.loadTexture('assets/sphere.png');
        tex4 = Luxe.loadTexture('assets/cube.png');

        batch3d = new Batcher(Luxe.renderer);

        Luxe.renderer.add_batch(batch3d);

            //The camera for the scene
        cam3d = new FlyCamera({
            projection: ProjectionType.perspective,
            fov:90,
            near:0.01,
            far:100,
            aspect:Luxe.screen.w/Luxe.screen.h
        });

        info = new luxe.Text({
            color : new Color().rgb(0xf6007b),
            pos : new Vector(10,10),
            font : Luxe.renderer.font,
            size : 20
        });

            //Apply it to our mesh renderer
        batch3d.view = cam3d.view;
#if !luxe_html5
            //Apply it to the physics handler debug view
        batch3d.add(Luxe.physics.bullet.debugdraw.geometry);
#end
            //Load the mesh files
        load_level_into( );
            //Add camera to scene
        Luxe.scene.add( cam3d );

        var l1 = Luxe.draw.line({
            p0 : new Vector(0-10, 0, 0-10),
            p1 : new Vector(0+10, 0, 0-10),
            batcher : batch3d
        });
        var l2 = Luxe.draw.line({
            p0 : new Vector(0-10, 0, 0-10),
            p1 : new Vector(0-10, 0, 0+10),
            batcher : batch3d
        });
        var l3 = Luxe.draw.line({
            p0 : new Vector(0-10, 0, 0+10),
            p1 : new Vector(0+10, 0, 0+10),
            batcher : batch3d
        });
        var l4 = Luxe.draw.line({
            p0 : new Vector(0+10, 0, 0-10),
            p1 : new Vector(0+10, 0, 0+10),
            batcher : batch3d
        });

    } //ready

    var room_mesh : Entity;
    var transform_mesh : Entity;
    var plane_entity : Entity;

        //current rigidbody for interaction
    var cube_rigidbody : RigidBody;

    var cubes : Array<Entity>;

    function load_level_into() {

        cubes = [];

        batch3d.view.pos.x = 0;
        batch3d.view.pos.y = 0;
        batch3d.view.pos.z = 0;

        var roommesh = new Mesh({
            file: 'assets/test_scene_0.obj',
            texture: tex,
            batcher: batch3d
        });

        roommesh.geometry.locked = true;

        room_mesh = Luxe.scene.create(Entity, 'room');

            var rmc = room_mesh.add(MeshComponent, 'mesh');

                room_mesh.get('mesh').mesh = roommesh;

            var mc = room_mesh.add(MeshCollider, 'collider');

                mc.mesh = roommesh;

            var mb = room_mesh.add(RigidBody, 'rigidbody');

                mb.mass = 0;
                mb.restitution = 0.5;
                mb.friction = 1;

        transform_mesh = Luxe.scene.create(Entity, 'transform');

            transform_mesh.add(MeshComponent, 'mesh');

                transform_mesh.get('mesh').file = 'assets/transform.obj';
                transform_mesh.get('mesh').texture = tex2;
                transform_mesh.get('mesh').batcher = batch3d;

        create_cube();

    } //load level

    function create_cube() {

            //Add a cube
        var cube = Luxe.scene.create(Entity, 'cube' + cubes.length);

            var cube_mesh = cube.add(MeshComponent, 'mesh');

                cube_mesh.file = 'assets/cube.obj';
                cube_mesh.texture = tex4;
                cube_mesh.batcher = batch3d;

                //Add a cube collider
            var collider = cube.add(BoxCollider, 'collider');

                collider.width = 1;
                collider.height = 1;
                collider.depth = 1;

            //Add a cube rigidbody
        var _cube_rigidbody = cube.add(RigidBody, 'rigidbody');

            _cube_rigidbody.pos = new Vector(0,10,0);
            _cube_rigidbody.mass = 1;
            _cube_rigidbody.restitution = 1.3;
            _cube_rigidbody.friction = 1.5;
            _cube_rigidbody.linearDamping = 0.05;

        if(cube_rigidbody == null) {
            cube_rigidbody = _cube_rigidbody;
        }

        cubes.push(cube);

    } //create_cube

    override function onkeydown( e:KeyEvent ) {

        if(e.keycode == Key.KEY_q) {
            cam3d.shake(2);
        }

        if(e.keycode == Key.ESCAPE) {
            Luxe.shutdown();
        }

        if(e.keycode == Key.SPACE) {
            Luxe.physics.bullet.paused = !Luxe.physics.bullet.paused;
        }

        if(e.keycode == Key.KEY_c) {
            create_cube();
        }

        if(e.keycode == Key.KEY_g) {
            Luxe.physics.bullet.draw = !Luxe.physics.bullet.draw;
        }

        if(e.keycode == Key.KEY_f) {
            follow = !follow;
            if(!follow) {
                cam3d.view.target = null;
            }
        }

        if(e.keycode == Key.EQUALS) {
            cam3d.view.fov += 10;
        }

        if(e.keycode == Key.MINUS) {
            cam3d.view.fov -= 10;
        }

        if(e.keycode == Key.KEY_e) {
            ramp = !ramp;
            if(ramp) {
                luxe.tween.Actuate.tween( Luxe.physics.bullet, 0.8, { step_rate:0.00167, rate:0.00167 });
            } else {
                luxe.tween.Actuate.tween( Luxe.physics.bullet, 0.8, { step_rate:0.0167, rate:0.0167 });
            }
        }

        cam3d.onkeydown(e);

    } //onkeydown

    var ramp = false;
    var hidden = false;
    var locked = false;

    override function onkeyup(e:KeyEvent) {

        if(e.keycode == Key.KEY_r) {
            cube_rigidbody.rigid_body.origin = new Vector(0,10,0);
            cube_rigidbody.rigid_body.linearVelocity = new Vector(0,0,0);
            cube_rigidbody.rigid_body.angularVelocity = new Vector(0,0,0);
            cube_rigidbody.rigid_body.activate();
        } //key_R

        cam3d.onkeyup(e);

    } //onkeyup

    override function onmousemove(e:MouseEvent) {

        cam3d.onmousemove(e);

    } //onmousemove

    override function onmousedown(e) {

        if(e.button == MouseButton.left) {
            cube_rigidbody.rigid_body.activate();
            cube_rigidbody.rigid_body.applyImpulse( Vector.MultiplyVector( cam3d.forward, new Vector(10,10,10)) , new Vector() );
        } else {
            info.text = cam3d.pos + ' ' + cam3d.rotation;
        }

    } //onmousedown

    override function onmouseup(e) {

        cam3d.onmouseup(e);

    } //onmouseup

    override function update(dt:Float) {

        if(follow) {
            cam3d.view.target = cube_rigidbody.rigid_body.origin;
        }

    } //update

} //Main



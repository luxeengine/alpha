

import phoenix.Matrix4;
import phoenix.Texture;
import phoenix.Batcher;
import phoenix.Camera;
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

import lime.gl.GL;

import phoenix.formats.obj.Reader;
import phoenix.utils.Maths;

import luxe.components.cameras.FlyCamera;
import luxe.components.render.MeshComponent;
import luxe.components.physics.PlaneCollider;
import luxe.components.physics.SphereCollider;
import luxe.components.physics.RigidBody;

class Main extends luxe.Game {

    var batch3d : Batcher;
    var cam3d : FlyCamera;

    var tex : Texture;
    var tex2 : Texture;
    var tex3 : Texture;

    var rotation : Vector;
    var info : Text;

    public function ready() {

        trace("game ready"); 

        Luxe.lockCursor(false);
        Luxe.showCursor(true);

        rotation = new Vector(-20, 0, 0);

        tex = Luxe.loadTexture('assets/diff.png');
        tex2 = Luxe.loadTexture('assets/transform.png');
        tex3 = Luxe.loadTexture('assets/sphere.png');

        batch3d = new Batcher(Luxe.renderer);

        Luxe.renderer.add_batch(batch3d);

            //The camera for the scene
        cam3d = new FlyCamera({
            projection: ProjectionType.perspective,
            fov:90, 
            near:0.01,
            aspect:Luxe.screen.w/Luxe.screen.h
        });

        info = new luxe.Text({
            color : new Color().rgb(0xf6007b),
            pos : new Vector(10,10),
            font : Luxe.renderer.default_font,
            size : 20
        });

            //Apply it to our mesh renderer
        batch3d.view = cam3d.view;
            //Load the mesh files
        load_level_into( batch3d );
            //Add camera to scene
        Luxe.scene.add( cam3d );

    } //derp

    var room_mesh : Entity;
    var transform_mesh : Entity;
    var sphere_mesh : Entity;
    var plane_entity : Entity;

    public function load_level_into(_batch:Batcher) {
      
        _batch.view.pos.x = 0;
        _batch.view.pos.y = 0;
        _batch.view.pos.z = 0;

        room_mesh = Luxe.scene.create(Entity, 'room');

            room_mesh.add(MeshComponent, 'mesh');

                room_mesh.get('mesh').file = 'assets/test_scene_0.obj';
                room_mesh.get('mesh').texture = tex; 
                room_mesh.get('mesh').batcher = _batch;

        transform_mesh = Luxe.scene.create(Entity, 'transform');

            transform_mesh.add(MeshComponent, 'mesh');

                transform_mesh.get('mesh').file = 'assets/transform.obj';
                transform_mesh.get('mesh').texture = tex2; 
                transform_mesh.get('mesh').batcher = _batch;

        sphere_mesh = Luxe.scene.create(Entity, 'sphere');

            sphere_mesh.add(MeshComponent, 'mesh');

                sphere_mesh.get('mesh').file = 'assets/sphere.obj';
                sphere_mesh.get('mesh').texture = tex3; 
                sphere_mesh.get('mesh').batcher = _batch;


        plane_entity = Luxe.scene.create(Entity, 'plane');

            plane_entity.add(PlaneCollider, 'collider');
            var pb = plane_entity.add(RigidBody, 'rigidbody');

            pb.mass = 0;

            //finally , add a sphere collider and rigidbody to the sphere entity
        sphere_mesh.add(SphereCollider, 'collider');
        var rb = sphere_mesh.add(RigidBody, 'rigidbody');

            rb.pos = new Vector(0,20,0);
            rb.mass = 1;

    } //load level

    public function onkeydown(e) {

        if(e.value == Input.Keys.key_Q) {
            cam3d.shake(1);
        }

        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }

        cam3d.onkeydown(e);
    }

    var hidden = false;
    var locked = false;
    public function onkeyup(e:Dynamic) {

        if(e.value == Input.Keys.key_4) {
            hidden = !hidden;
            Luxe.showCursor(hidden);
        }

        if(e.value == Input.Keys.key_5) {
            locked = !locked;
            Luxe.lockCursor(locked);
        }

        cam3d.onkeyup(e);
    }

    public function onmousemove(e:MouseEvent) {
        cam3d.onmousemove(e);
    }

    public function onmousedown(e) {
        info.text = ''+cam3d.pos;
    }   

    public function onmouseup(e) {
        cam3d.onmouseup(e);
    }

    public function update(dt:Float) {
        
    }

    public function shutdown() {

    }
}



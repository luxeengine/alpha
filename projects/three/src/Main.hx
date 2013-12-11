
import phoenix.Matrix4;
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

import lime.gl.GL;

import phoenix.formats.obj.Reader;

import luxe.components.cameras.FlyCamera;
import luxe.components.render.MeshComponent;

import luxe.components.physics.three.BoxCollider;
import luxe.components.physics.three.PlaneCollider;
import luxe.components.physics.three.SphereCollider;
import luxe.components.physics.three.MeshCollider;
import luxe.components.physics.three.RigidBody;

class Main extends luxe.Game {

    var batch3d : Batcher;
    var cam3d : FlyCamera;

    var tex : Texture;
    var tex2 : Texture;
    var tex3 : Texture;
    var tex4 : Texture;

    var rotation : Vector;
    var info : Text;

    public function ready() {

        trace("game ready"); 

        Luxe.lockCursor(false);
        Luxe.showCursor(true);

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

    } //derp

    var room_mesh : Entity;
    var transform_mesh : Entity;
    var cube_mesh : Entity;
    var plane_entity : Entity;

    var cube_rigidbody_component : RigidBody;
    var cube_mesh_component : MeshComponent;

    public function load_level_into(_batch:Batcher) {
      
        _batch.view.pos.x = 0;
        _batch.view.pos.y = 0;
        _batch.view.pos.z = 0;

        var roommesh = new Mesh({
            file: 'assets/test_scene_0.obj', 
            texture: tex, 
            batcher: batch3d
        });

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
                transform_mesh.get('mesh').batcher = _batch;

        cube_mesh = Luxe.scene.create(Entity, 'sphere');

            cube_mesh_component = cube_mesh.add(MeshComponent, 'mesh');

                cube_mesh.get('mesh').file = 'assets/cube.obj';
                cube_mesh.get('mesh').texture = tex4; 
                cube_mesh.get('mesh').batcher = _batch;

            //finally , add a cube collider and rigidbody to the cube entity
         var block_collider = cube_mesh.add(BoxCollider, 'collider');

            block_collider.width = 1;
            block_collider.height = 1;
            block_collider.depth = 1;

         cube_rigidbody_component = cube_mesh.add(RigidBody, 'rigidbody');

            cube_rigidbody_component.pos = new Vector(0,10,0);
            cube_rigidbody_component.mass = 1;
            cube_rigidbody_component.restitution = 1.3;
            cube_rigidbody_component.friction = 1.5;
            cube_rigidbody_component.linearDamping = 0.05;

    } //load level

    public function onkeydown(e) {

        if(e.value == Input.Keys.key_Q) {
            cam3d.shake(1);
        }

        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }

        if(e.value == Input.Keys.space) {
            Luxe.physics.pause( !Luxe.physics.paused );
        }

        cam3d.onkeydown(e);

    } //onkeydown

    var hidden = false;
    var locked = false;
    public function onkeyup(e:Dynamic) {

        if(e.value == Input.Keys.key_R) {
            cube_rigidbody_component.rigid_body.origin = new Vector(0,10,0);
            cube_rigidbody_component.rigid_body.linearVelocity = new Vector(0,0,0);
            cube_rigidbody_component.rigid_body.angularVelocity = new Vector(0,0,0);
            cube_rigidbody_component.rigid_body.activate();
        } //key_R

        if(e.value == Input.Keys.key_1) {
            cube_mesh_component.mesh.rotation = new Vector(0,0,0);
        } //key_4
        if(e.value == Input.Keys.key_2) {
            cube_mesh_component.mesh.rotation = new Vector(0,90,0);
        } //key_4
        if(e.value == Input.Keys.key_3) {
            cube_mesh_component.mesh.rotation = new Vector(0,-90,0);
        } //key_4
        if(e.value == Input.Keys.key_4) {
            cube_mesh_component.mesh.rotation = new Vector(90,0,0);
        } //key_5
        if(e.value == Input.Keys.key_5) {
            cube_mesh_component.mesh.rotation = new Vector(0,0,90);
        } //key_5

        cam3d.onkeyup(e);

    } //onkeyup

    public function onmousemove(e:MouseEvent) {

        cam3d.onmousemove(e);

    } //onmousemove

    public function onmousedown(e) {

        if(e.button == MouseButton.left) {
            cube_rigidbody_component.rigid_body.activate();
            cube_rigidbody_component.rigid_body.applyImpulse( Vector.MultiplyVector( cam3d.forward, new Vector(10,10,10)) , new Vector() );
        } else {
            info.text = cam3d.pos + ' ' + cam3d.rotation; 
        }

    } //onmousedown

    public function onmouseup(e) {

        cam3d.onmouseup(e);

    } //onmouseup

    // var _lines:Array<LineGeometry>;
    // var _first : Bool = true;
    // public function prerender() {        

    //     if(_lines != null) {
    //         _first = false;
    //     } else {
    //         _lines = [];
    //     }

    //     Luxe.physics.dynamicsWorld.debugDrawWorld();
    //     var verts = Luxe.physics.dynamicsWorld.getDebugDrawLineVertices();

    //     var i = 0;
    //     var _count = Std.int(verts.length/6);
    //     for(i in 0 ... _count) {
    //         //from.x,from.y,from.z 
    //         //to.x,to.y,to.z
    //         var _from = new Vector( verts[(i*6)+0], verts[(i*6)+1], verts[(i*6)+2] );
    //         var _to = new Vector( verts[(i*6)+3], verts[(i*6)+4], verts[(i*6)+5] );

    //         if(_first) {
                
    //             _lines.push(Luxe.draw.line({
    //                 immediate : false,
    //                 p0 : _from, p1 : _to,
    //                 color : new Color(1,1,1,0.2),
    //                 depth : 888,
    //                 batcher : batch3d
    //             }));

    //         } else {
    //             var _line = _lines[i];
    //             _line.p0 = _from;
    //             _line.p1 = _to;
    //         }

    //     } //_v

    // } //postrender

    public function update(dt:Float) {
        
    } //update

    public function shutdown() {

    } //shutdown

} //Main



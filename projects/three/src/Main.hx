

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

import lime.gl.GL;

import phoenix.formats.obj.Reader;
import phoenix.utils.Maths;

import FlyCamera;

class Main extends luxe.Game {

    var batch3d : Batcher;
    var cam3d : FlyCamera;

    var tex : Texture;
    var tex2 : Texture;

    var rotation : Vector;

    public function ready() {

        trace("game ready"); 

        Luxe.lockCursor(false);
        Luxe.showCursor(true);

        rotation = new Vector(-20, 0, 0);

        tex = Luxe.loadTexture('assets/diff.png');
        tex2 = Luxe.loadTexture('assets/transform.png');

        batch3d = new Batcher(Luxe.renderer);

        Luxe.renderer.add_batch(batch3d);

            //The camera for the scene
        cam3d = new FlyCamera({
            projection: ProjectionType.perspective,
            fov:90, 
            aspect:Luxe.screen.w/Luxe.screen.h
        });

            //Apply it to our mesh renderer
        batch3d.view = cam3d.view;
            //Load the mesh files
        load_level_obj_into( batch3d );
            //Add camera to scene
        Luxe.scene.add( cam3d );

    }

    public function add_mesh(id:String, t:Texture, _batch:Batcher) {

        var obj_file = lime.utils.Assets.getText(id);       
        var file_input = new haxe.io.StringInput( obj_file );
        var obj_mesh_data = new phoenix.formats.obj.Reader(file_input).read();

        var _geom = new Geometry({
            texture : t,
            type: PrimitiveType.triangles,
            immediate : false,
            depth : 2
        });

        var scale = 0.1;
        var p = new Vector(0,0,0);

        for(v in obj_mesh_data.vertices) {
           
           var normal : Vector = new Vector();
           if(v.normal != null) {
                normal = new Vector(v.normal.x, v.normal.y, v.normal.z);
           }
           var _v = new Vertex( new Vector( (v.pos.x * scale)+p.x , (v.pos.y * scale)+p.y, (v.pos.z * scale)+p.z), normal );
           if(v.uv != null) {
               _v.uv[0] = new TextureCoord( v.uv.u, 1.0 - v.uv.v );
           } else {
               _v.uv[0] = new TextureCoord( 0, 0 );
           }
           _geom.add( _v );
        }

       _batch.add(_geom);

    }

    public function load_level_obj_into(_batch:Batcher) {
      
        _batch.view.pos.x = 0;
        _batch.view.pos.y = 0;
        _batch.view.pos.z = 0;

        add_mesh('assets/test_scene_0.obj', tex, _batch);
        add_mesh('assets/transform.obj', tex2, _batch);

    }

    public function onkeydown(e) {
        if(e.value == Input.Keys.key_Q) {
            cam3d.shake(0.1);
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
    }   

    public function onmouseup(e) {
        cam3d.onmouseup(e);
    }

    public function update(dt:Float) {


    }

    public function shutdown() {

    }
}




import phoenix.Texture;
import phoenix.Batcher;
import phoenix.Camera;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;
import phoenix.geometry.TextureCoord;
import phoenix.Vector;

import lime.gl.GL;

import format.obj.Reader;

class Main extends lab.Game {
    
    var geom : QuadGeometry;
    var geom2 : QuadGeometry;
    var geom3 : Geometry;

    var batch : Batcher;
    var cam : Camera;

    var tex : Texture;
    var tex2 : Texture;

    public function ready() {

       trace("game ready");

       tex = core.renderer.load_texture('assets/usable_orange.png');
       tex2 = core.renderer.load_texture('assets/feather.png');     

        //2d layer
       batch = new Batcher(core.renderer);
       batch.layer = 1;
       core.renderer.add_batch(batch);

       cam = new Camera(ProjectionType.ortho, { x2:960, y2:640 });
       batch.view = cam;

       draw_2d_quad(batch);
       draw_cube_obj();
       
    }

    public function draw_2d_quad(_batch:Batcher) {

        geom = new QuadGeometry({
            x:32, y:8, width:128, height:128,
            texture : tex2,
            depth : 4
        });  
        
        geom2 = new QuadGeometry( {
            x:72, y:32, width:384, height:384,
            texture : tex,
            depth : 6
        });  
        
        _batch.add(geom);
        _batch.add(geom2);

    }

    public function draw_cube_obj() {
      
        core.renderer.default_batcher.view.pos.x = 0;
        core.renderer.default_batcher.view.pos.y = -150;
        core.renderer.default_batcher.view.pos.z = -600;

        core.renderer.default_batcher.view.set_perspective({fov:60, aspect:core.lime.config.width/core.lime.config.height });

        var obj_file = lime.utils.Assets.getText('assets/cube.obj');       
        var file_input = new haxe.io.StringInput( obj_file );

        var obj_mesh_data = new format.obj.Reader(file_input).read();

        geom3 = new Geometry({
            texture : tex2,
            primitive_type: PrimitiveType.triangles,
            depth : 2
        });

        var scale = 90;

        for(v in obj_mesh_data.vertices) {
           // trace('vertex from obj' v);
           var normal : Vector = new Vector();
           if(v.normal != null) {
                normal = new Vector(v.normal.x, v.normal.y, v.normal.z);
           }
           var _v = new Vertex( new Vector(v.pos.x * scale , v.pos.y * scale, v.pos.z * scale), normal );
           if(v.uv != null) {
               _v.uv[0] = new TextureCoord( v.uv.u, v.uv.v );
           } else {
               _v.uv[0] = new TextureCoord( 0, 0 );
           }
           geom3.add( _v );
        }

       core.renderer.default_batcher.add(geom3);

       // core.renderer.default_batcher.view.target = new Vector(0,0,0);
 
    }

    public function update() {

    }

    public function shutdown() {

    }
}



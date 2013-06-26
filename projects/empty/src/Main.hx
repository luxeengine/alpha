
import phoenix.Texture;
import phoenix.Batcher;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;
import phoenix.geometry.TextureCoord;
import phoenix.Vector;

import format.obj.Reader;

class Main extends lab.Game {
    
    var geom : QuadGeometry;
    var geom2 : QuadGeometry;
    var geom3 : Geometry;

    var tex : Texture;
    var tex2 : Texture;

    public function ready() {

       trace("game ready");

       tex = core.renderer.load_texture('assets/usable_orange.png');
       tex2 = core.renderer.load_texture('assets/feather.png');     

       draw_2d_quad();
       // draw_cube_obj();
    }

    public function draw_2d_quad() {

        geom = new QuadGeometry({
            x:32, y:32, width:256, height:256,
            texture : tex,
            depth : 4
        });  
        
        geom2 = new QuadGeometry( {
            x:340, y:32, width:512, height:512,
            texture : tex,
            depth : 6
        });  
        
        core.renderer.default_batcher.add(geom);
        core.renderer.default_batcher.add(geom2);

    }

    public function draw_cube_obj() {
      
        core.renderer.default_camera.pos.x = 0;
        core.renderer.default_camera.pos.y = -150;
        core.renderer.default_camera.pos.z = -300;

        core.renderer.default_camera.set_perspective({fov:90, aspect:core.lime.config.width/core.lime.config.height });

        var obj_file = lime.utils.Assets.getText('assets/cube.obj');       
        var file_input = new haxe.io.StringInput( obj_file );

        var obj_mesh_data = new format.obj.Reader(file_input).read();

        geom3 = new Geometry({
            texture : tex2,
            primitive_type: PrimitiveType.triangles,
            depth : 2
        });

        var scale = 50;

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
 
    }

    public function update() {

    }

    public function shutdown() {

    }
}



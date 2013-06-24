
import phoenix.Texture;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;
import phoenix.geometry.TextureCoord;
import phoenix.Vector;

import format.obj.Reader;

class Main extends lab.Game {
    
    var geom : QuadGeometry;
    var geom2 : Geometry;
    var tex : Texture;

    public function ready() {

       trace("game ready");

       tex = core.renderer.load_texture('assets/usable_orange.png');
       
       // draw_2d_quad();
       draw_cube_obj();
    }

    public function draw_2d_quad() {
        geom = new QuadGeometry( { x:60, y:60, width:256, height:256 } );  
        geom.texture = tex;
        core.renderer.default_batcher.add(geom);
    }

    public function draw_cube_obj() {
       
       core.renderer.default_camera.pos.x = 0;
       core.renderer.default_camera.pos.y = -20;
       core.renderer.default_camera.pos.z = -300;

       core.renderer.default_camera.set_perspective();

       var obj_file = nmegl.utils.Assets.getText('assets/cube.obj');       
       var file_input = new haxe.io.StringInput( obj_file );

       var obj_mesh_data = new format.obj.Reader(file_input).read();
       trace('Loaded mesh, found verts : ' + obj_mesh_data.vertices.length );


        geom2 = new Geometry();        

        for(v in obj_mesh_data.vertices) {
            // trace('vertex from obj' + v);
            var _v = new Vertex( new Vector(v.pos.x * 100 , v.pos.y* 100, v.pos.z* 100) );
            if(v.uv != null) {
                _v.uv[0] = new TextureCoord( v.uv.u, v.uv.v );
            } else {
                _v.uv[0] = new TextureCoord( 0, 0 );
            }
            geom2.add( _v );
        }

        geom2.texture = tex; 

        core.renderer.default_batcher.add(geom2);

    }

    public function update() {
        if(geom != null) {
            geom.verts['tl'].pos.y -= 0.2;
            geom.verts['tr'].pos.y -= 0.1;
        }
    }

    public function shutdown() {

    }
}



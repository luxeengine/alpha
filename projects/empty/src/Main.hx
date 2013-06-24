
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
       
       draw_2d_quad();
    }

    public function draw_2d_quad() {
        geom = new QuadGeometry( { x:60, y:60, width:512, height:512 } );  
        geom.texture = tex;
        core.renderer.default_batcher.add(geom);
    }


    public function update() {
        if(geom != null) {
            geom.verts['tl'].pos.y -= 0.1;
            geom.verts['tr'].pos.y -= 0.05;
        }
    }

    public function shutdown() {

    }
}



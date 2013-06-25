
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
    var tex2 : Texture;

    public function ready() {

       trace("game ready");

       tex = core.renderer.load_texture('assets/usable_orange.png');
       tex2 = core.renderer.load_texture('assets/feather.png');
       
       draw_2d_quad();
    }

    public function draw_2d_quad() {
        geom = new QuadGeometry( { x:32, y:32, width:128, height:128 } );  
        geom.texture = tex;
        core.renderer.default_batcher.add(geom);
        geom.depth = 1;

        geom2 = new QuadGeometry( { x:512, y:32, width:256, height:256 } );  
        geom2.texture = tex2;
        core.renderer.default_batcher.add(geom2);
         geom.depth = 2;
    }


    public function update() {
        if(geom != null) {
            // geom.verts['tl'].pos.y -= 0.2;
            // geom.verts['tr'].pos.y -= 0.01;
        }
    }

    public function shutdown() {

    }
}



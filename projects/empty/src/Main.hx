
import phoenix.Texture;
import phoenix.geometry.QuadGeometry;


class Main extends lab.Game {
    
    var geom : QuadGeometry;
    var tex : Texture;

    public function ready() {
        
       trace(" -- game ready");

       geom = new QuadGeometry( { x:60, y:60, width:256, height:256 } );
        
       core.renderer.default_batcher.add(geom);

       tex = core.renderer.load_texture('assets/usable_orange.png');
       geom.texture = tex;

    }

    public function update() {
        geom.verts['tl'].pos.y -= 0.2;
        geom.verts['tr'].pos.y -= 0.1;
    }

    public function shutdown() {

    }
}



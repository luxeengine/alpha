
import phoenix.Texture;
import phoenix.geometry.QuadGeometry;


class Main extends lab.Game {
    
    var geom : QuadGeometry;
    var tex : Texture;

    public function ready() {
       trace("I AM A GAME");

       geom = new QuadGeometry( { x:60, y:60, width:500, height:500 } );
        
       core.renderer.default_batcher.add(geom);

       tex = core.renderer.load_texture('assets/usable_orange.png');
       geom.texture = tex;

       trace(tex.id);
       trace(tex.width);
       trace(tex.height);
    }

    public function update() {
        geom.verts['tl'].pos.y -= 0.2;
        geom.verts['tr'].pos.y -= 0.1;
    }

    public function shutdown() {

    }
}



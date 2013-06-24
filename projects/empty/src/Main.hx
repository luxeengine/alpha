
import phoenix.Texture;
import phoenix.geometry.QuadGeometry;


class Main extends lab.Game {
	
	var geom : QuadGeometry;

    public function ready() {
	   trace("I AM A GAME");

	   geom = new QuadGeometry( { x:200, y:200, width:200, height:200 } );
	   
	   core.renderer.default_batcher.add(geom);

	}

    public function update() {
        geom.verts['tl'].pos.y -= 0.2;
		geom.verts['tr'].pos.y -= 0.1;
    }

    public function shutdown() {

    }
}



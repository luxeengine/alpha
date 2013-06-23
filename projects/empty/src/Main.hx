
import phoenix.Texture;
import phoenix.geometry.QuadGeometry;


class Main extends lab.Game {
	
	var geom : QuadGeometry;

    public function ready() {
	   trace("I AM A GAME");

	   geom = new QuadGeometry( { x:-100, y:-100, width:100, height:100 } );
	   
	   core.renderer.default_batcher.add(geom);


	}

    public function update() {
		geom.vertices[0].pos.y -= 0.1;
    }

    public function shutdown() {

    }
}



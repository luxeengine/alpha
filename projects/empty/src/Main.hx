
import phoenix.Texture;


class Main extends lab.Game {
	
    public function ready() {
	   trace("I AM A GAME");

	   var a : Map<Int, String>;
	   a = new Map();

	   a.set(1, '111');
	   a.set(2, '22');
	   a.set(3, '33');

	   trace(a[1]);
	   trace(a[3]);
	}

    public function update() {

    }

    public function shutdown() {

    }
}



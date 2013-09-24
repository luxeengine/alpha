
import luxe.Input;
import luxe.Mesh;

class Main extends luxe.Game {


	var mesh : Mesh;

    public function ready() {

    	Luxe.camera.view.set_perspective({
    		far:1000, near:0.1, aspect:Luxe.screen.w/Luxe.screen.h
    	});

    		//move up and back a bit
    	Luxe.camera.pos.set(0,0.5,2);

    		//create the mesh
    	mesh = new Mesh({ file:'assets/tower.obj', texture:Luxe.loadTexture('assets/tower.png') });

    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    var y = 0.0;
    public function update(dt:Float) {

    	mesh.rotation.y += 1 * dt;

    } //update

} //Main
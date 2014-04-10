
import luxe.Input;
import luxe.Entity;

import luxe.components.render.MeshComponent;

class Main extends luxe.Game {


	var tower:Entity;


    public function ready() {

    	Luxe.camera.view.set_perspective({
    		far:1000, near:0.1, aspect:Luxe.screen.w/Luxe.screen.h
    	});

    		//move up and back a bit
    	Luxe.camera.pos.set(0,0.5,2);

    		//create an empty entity
    	tower = Luxe.scene.create(Entity, 'tower');

			//attach a mesh component
    	var mesh = tower.add(MeshComponent, 'mesh');
			mesh.file = 'assets/tower.obj';
    		mesh.texture = Luxe.loadTexture('assets/tower.png');

    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {
    	
    	tower.rotation.y += 1 * dt;

    } //update


} //Main

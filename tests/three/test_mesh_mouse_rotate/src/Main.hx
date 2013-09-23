
import luxe.components.Components.Component;
import luxe.components.render.MeshComponent;
import luxe.Input;
import luxe.Entity;
import luxe.Vector;

class MouseRotate extends Component {
		
	public function init() {

	}

}

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

    		//attach a mouse rotate component
    	var mouserotate = tower.add(MouseRotate, 'rotate');

    } //ready

    var dragging = false;
    var mouse : Vector;

    public function onmousemove(e:MouseEvent) {
    	mouse = e.pos;
    }

    public function onmousedown(e:MouseEvent) {
    	dragging = true;
    	mouse = e.pos;
    }

    public function onmouseup(e:MouseEvent) {
    	dragging = false;
    	mouse = e.pos;
    }

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    var spdx : Float = 0;
    var spdy : Float = 0;
    var speed : Float = 120;

    public function update(dt:Float) {
    		
    	if(dragging) {
    		spdy = (Luxe.screen.h / 2 - mouse.y) / speed;
			spdx = (Luxe.screen.w / 2 - mouse.x) / speed;    	
		    tower.rotation.x = -spdy;
			tower.rotation.y = -spdx;
    	}

    } //update

} //Main
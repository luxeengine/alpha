package;

import luxe.Input;
import phoenix.Camera;

class Main extends luxe.Game {
	override function ready() {
        Luxe.camera.view.set_perspective( {
           near:0.1,
           far:1000,
           fov_type:FOVType.vertical,
           fov:60,
           aspect:Luxe.screen.w / Luxe.screen.h
        });
        
        Luxe.camera.pos.z = 2;
        Luxe.draw.rectangle( {
            x:0,
            y:0,
            w:1,
            h:1
        });
        
        
	}

	override function onkeyup(e:KeyEvent) {
		if(e.keycode == Key.escape)
			Luxe.shutdown();
	}
    
    override public function onkeydown(event:KeyEvent) {
        if (event.keycode == Key.space) {
            if (Luxe.camera.view.fov_type == FOVType.horizontal) {
                Luxe.camera.view.fov_type = FOVType.vertical;
            }
            else {
                Luxe.camera.view.fov_type = FOVType.horizontal;
            }
        }
        
        if (event.keycode == Key.up) {
            Luxe.camera.view.fov += 10;
        }
        else if (event.keycode == Key.down) {
            Luxe.camera.view.fov -= 10;
        }
    }

	override function update(dt:Float) {
	}
}

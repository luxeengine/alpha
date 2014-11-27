package;

import luxe.Vector;
import luxe.Input;
import phoenix.geometry.LineGeometry;

class Main extends luxe.Game {
	var y:Float = 200;
	var x:Float = 100;
	var geom:SplineGeometry;
	override function ready() {
		geom = new SplineGeometry( {
			p0:new Vector(0, 100, 0),
			p1:new Vector(x, y, 0),
			p2:new Vector(200, 0, 0),
			p3:new Vector(300, 100, 0),
			batcher:Luxe.renderer.batcher
		});
	}

	override function onkeyup(e:KeyEvent) {
		if(e.keycode == Key.escape)
			Luxe.shutdown();
	}
	
	override public function onkeydown(event:KeyEvent) {
		switch(event.keycode) {
			case Key.key_t:
				geom.lineWidth += 0.5;
			case Key.key_g:
				geom.lineWidth -= 0.5;
		}
	}

	override function update(dt:Float) {
		if (Luxe.input.keydown(Key.key_w)) {
			y -= 200 * dt;
			geom.set( {
				p0:new Vector(0, 100, 0),
				p1:new Vector(x, y, 0),
				p2:new Vector(200, 0, 0),
				p3:new Vector(300, 100, 0)
			});
			
		}
		else if (Luxe.input.keydown(Key.key_s)) {
			y += 200 * dt;
			geom.set( {
				p0:new Vector(0, 100, 0),
				p1:new Vector(x, y, 0),
				p2:new Vector(200, 0, 0),
				p3:new Vector(300, 100, 0)
			});
		}
		
		if (Luxe.input.keydown(Key.key_d)) {
			x += 200 * dt;
			geom.set( {
				p0:new Vector(0, 100, 0),
				p1:new Vector(x, y, 0),
				p2:new Vector(200, 0, 0),
				p3:new Vector(300, 100, 0)
			});
		}
		else if (Luxe.input.keydown(Key.key_a)) {
			x -= 200 * dt;
			geom.p1.x = x;
		}
		
		if (Luxe.input.keydown(Key.up)) {
			geom.DistPerPoint += 5;	
			trace(geom.DistPerPoint);
		}
		else if (Luxe.input.keydown(Key.down)) {
			geom.DistPerPoint -= 5;
			trace(geom.DistPerPoint);
		}
		
		if (Luxe.input.keydown(Key.key_r)) {
			geom.MinPoints += 1;	
			trace(geom.MinPoints);
		}
		else if (Luxe.input.keydown(Key.key_f)) {
			geom.MinPoints -= 1;
			trace(geom.MinPoints);
		}
		
		
	}
}

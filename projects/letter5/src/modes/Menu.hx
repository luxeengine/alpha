package modes;

import lab.Sprite;
import lab.Color;
import lab.Vector;
import lab.Input;
import lab.Modes;
import motion.Actuate;
import phoenix.geometry.LineGeometry;

class Menu extends Mode {
	
	public var game : Main;

	public var play : Sprite;

	public function init() {

		play = new Sprite({
			pos : new Vector(Lab.screen.w/2, Lab.screen.h/2),			
			texture : Lab.loadTexture('assets/menu_play.png'),
			depth : 2,
			color : new Color(1,1,1,0)
		});


	} //init

	public function onkeydown(e) {
        if(e.value == Input.Keys.escape) {
            Lab.shutdown();
        }
	} //onkeyup

	public function onmousemove(e) {
		var m = new Vector(e.x, e.y);
	}

	public function onmouseup(e) {		
		if(play.point_inside(game.mouse)) {
			game.modes.set('base');
		}
	} //onmousedown

	public function enter() {
		Actuate.tween(play.color, 0.75, {a:1}).delay(1);
		Actuate.tween(Lab.renderer.clear_color, 0.5, {r:0.0705,g:0.0705,b:0.0705}).delay(0.5);
	} //enter

	public function leave() {		
		Actuate.tween(play.color, 0.75, {a:0});
	} //leave


}
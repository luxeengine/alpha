package states;

import luxe.Sprite;
import luxe.Color;
import luxe.Vector;
import luxe.Input;
import luxe.States;
import luxe.tween.Actuate;
import phoenix.geometry.LineGeometry;

class Menu extends State {
	
	public var game : Main;

	public var play : Sprite;
	public var back : Sprite;
	public var logo : Sprite;

	public function init() {

		back = new Sprite({
			centered : false,
			pos : new Vector(),
			size : new Vector(Luxe.screen.w, Luxe.screen.h/2 - 32),
			color : new Color().rgb(0xf0f0f0)
		});



		var logo_texture = Luxe.loadTexture('assets/logo.png');
		var _logo_width = Luxe.screen.w-16;
		var _logo_scale = _logo_width / logo_texture.width;
		var _logo_height = logo_texture.height * _logo_scale;

		logo = new Sprite({
			pos : new Vector(Luxe.screen.w/2, (Luxe.screen.h/2)-(_logo_height*1)),
			size : new Vector( _logo_width, _logo_height ),
			texture : logo_texture,
			depth : 2,
			color : new Color(1,1,1,0)
		});

		play = new Sprite({
			pos : new Vector(Luxe.screen.w/2, Luxe.screen.h/2),			
			texture : Luxe.loadTexture('assets/menu_play.png'),
			depth : 2,
			color : new Color(1,1,1,0)
		});

	} //init

	public function onkeydown(e) {
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }
	} //onkeyup

	public function onmousemove(e) {
	}

	var toggle:Bool = true;
	public function onmouseup(e) {		
		// toggle = !toggle;
		// 	trace("toggling gc : " + toggle);
		// cpp.vm.Gc.enable(toggle);
		// // if(toggle) {

		// // }

		if(play.point_inside(game.mouse)) {
			game.states.set('base');
		}
	} //onmousedown

	public function enter() {
		Actuate.tween(play.color, 0.75, {a:1}).delay(1);
		Actuate.tween(back.color, 0.75, {a:1}).delay(1);
		Actuate.tween(logo.color, 1, {a:1}).delay(1);
		Actuate.tween(Luxe.renderer.clear_color, 0.5, {r:0.0705,g:0.0705,b:0.0705}).delay(0.5);
	} //enter

	public function leave() {		
		Actuate.tween(logo.color, 1, {a:0});
		Actuate.tween(play.color, 0.5, {a:0});
		Actuate.tween(back.color, 0.5, {a:0});
	} //leave


}
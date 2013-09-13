
package game;

import game.PlayerMovement;
import luxe.Input.KeyValue;
import luxe.Vector;
import luxe.Sprite;

import luxe.components.Components.Component;

class PlayerKeyInput extends Component {

	var left : Bool = false;
	var right : Bool = false;
	var up : Bool = false;
	var down : Bool = false;
	var sprint : Bool = false;

	var move : PlayerMovement;

	public function init() {

		Luxe.input.add('left', KeyValue.left);
		Luxe.input.add('left', KeyValue.key_A);

		Luxe.input.add('right', KeyValue.right);
		Luxe.input.add('right', KeyValue.key_D);

		Luxe.input.add('up', KeyValue.up);
		Luxe.input.add('up', KeyValue.key_W);

		Luxe.input.add('down', KeyValue.down);
		Luxe.input.add('down', KeyValue.key_S);
		
		Luxe.input.add('sprint', KeyValue.shift);

		move = get('move');

		if(move == null) {
			throw "PlayerKeyInput requires a PlayerMovement component attached!";
		}

		entity.events.listen('input.*', oninput );

	} //init

	public function update(dt:Float) {

		var speed = sprint ? move.speed * 1.7 : move.speed;

		if(left) {
			move.velocity.x = -speed;
		}
		if(right) {
			move.velocity.x = speed;
		}
		if(up) {
			move.velocity.y = -speed;
		}
		if(down) {
			move.velocity.y = speed;
		}
	}

	public function oninput( _event:Dynamic ) {
		if(_event.input_type == 'input.down') {

			switch(_event.input_name) {
				case "sprint":
					sprint = true;
				case "left":
					left = true;
				case "right":
					right = true;
				case "up":
					up = true;
				case "down":
					down = true;
			} //switch input name

		} else {

			switch(_event.input_name) {
				case "sprint":
					sprint = false;
				case "left":
					left = false;
				case "right":
					right = false;
				case "up":
					up = false;
				case "down":
					down = false;
			} //switch input name

		} //!input.down
	} //oninput


} //PlayerKeyInput


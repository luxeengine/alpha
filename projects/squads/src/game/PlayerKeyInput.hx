
package game;

import game.PlayerAim;
import game.PlayerMovement;
import game.PlayerShoot;
import game.PlayerWeapon;
import luxe.Input.KeyValue;
import luxe.Input.MouseButton;
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
    var shoot : PlayerShoot;
    var weapons : PlayerWeapon;
	var aim : PlayerAim;

    var sprite : Sprite;

	public function init() {

        sprite = cast entity;

		Luxe.input.add('left', KeyValue.left);
		Luxe.input.add('left', KeyValue.key_A);

		Luxe.input.add('right', KeyValue.right);
		Luxe.input.add('right', KeyValue.key_D);

		Luxe.input.add('up', KeyValue.up);
		Luxe.input.add('up', KeyValue.key_W);

		Luxe.input.add('down', KeyValue.down);
		Luxe.input.add('down', KeyValue.key_S);
		
        Luxe.input.add('sprint', KeyValue.shift);

        Luxe.input.add('shoot', KeyValue.key_Z);
        Luxe.input.add('shoot', MouseButton.left);

        Luxe.input.add('start', KeyValue.space);
        Luxe.input.add('quit', KeyValue.escape);

        Luxe.input.add('switchweapon_up', KeyValue.key_1);

        Luxe.input.add('switchweapon_up', MouseButton.wheel_up);
		Luxe.input.add('switchweapon_down', MouseButton.wheel_down);

        move = get('move');
        shoot = get('shoot');
        weapons = get('weapon');
		aim = get('aim');

		if(move == null) {
			throw "PlayerKeyInput requires a PlayerMovement component attached!";
		}

		entity.events.listen('input.*', oninput );        

	} //init

	public function update(dt:Float) {

		var speed = sprint ? move.speed * 1.5 : move.speed;

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

	} //update

	public function oninput( _event:Dynamic ) {

		if(_event.input_type == 'input.down') {

			switch(_event.input_name) {
				case "sprint":
					sprint = true;
				case "left":
					left = true;
                    // aim.direction.set(-1);
                    if(!up && !down) aim.direction.set(null, 0);
				case "right":
					right = true;
                    // aim.direction.set(1);
                    if(!up && !down) aim.direction.set(null, 0);
				case "up":
					up = true;
                    // aim.direction.set(null, -1);
                    if(!right && !left) aim.direction.set(0);
                case "down":
                    down = true;
                    // aim.direction.set(null, 1);
                    if(!right && !left) aim.direction.set(0);

                case "shoot":
                    shoot.onfiring();

                case "switchweapon_down":
                    weapons.cycle(-1);
				case "switchweapon_up":
					weapons.cycle(1);

			} //switch input name

            if(left || right || down || up) {
                if(!move.moving) {
                    move.moving = true;
                    entity.events.fire('player.onmoving');
                }
            }


		} else {

			switch(_event.input_name) {
				case "sprint":
					sprint = false;
				case "left":
					left = false;
                    // if(up || down) aim.direction.set(0);
				case "right":
					right = false;
                    // if(up || down) aim.direction.set(0);
				case "up":
					up = false;
                    // if(right || left) aim.direction.set(null, 0);
				case "down":
					down = false;
                    // if(right || left) aim.direction.set(null, 0);

                case "shoot":
                    shoot.onstopfiring();
                 
                case "start":
                    Luxe.events.fire('level.start');
                case "quit":
                    Luxe.events.fire('level.end');
                    

			} //switch input name

            if(!left && !right && !down && !up) {
                if(move.moving) {
                    move.moving = false;
                    entity.events.fire('player.onstopping');
                }
            }

		} //!input.down




	} //oninput


} //PlayerKeyInput


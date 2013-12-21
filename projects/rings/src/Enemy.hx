
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import luxe.tween.Actuate;
import luxe.components.Components.Component;

import Projectile;

class Enemy extends Component {

	public var alive : Bool = false;
	public var spawnpos : Float = 0;
	public var destpos : Float = 0;
	public var curr_dest : Float = 0;
	public var destdir : Int = 1;
	public var cpos : Float = 0;
	public var speed : Float = 0;
	public var main : Main;
	public var health : Float = 1;
	public var shoot_speed : Float = 100;
	public var fire_rate : Float = 10;
	public var alive_time : Float = 0;
	public var next_fire : Float = 0;

	public function init() {

		test = new Vector();

    	shoot_speed = 10 + (Math.random() * 20);
    	fire_rate = 1.5 + (Math.random() * 2);

	} //init

	public function take_damage(amount:Float) {
		health -= amount;
		if(health <= 0) {
			health = 0;			
			kill();
		}
	}

	public function do_fire() {

		if(alive) {
			fire();
			next_fire = alive_time + fire_rate;
		}

	}

	public function fire() {
		var b = main.e_bullets.get();
			b.pos.x = pos.x;
	    	b.pos.y = pos.y;
	    var d = Vector.Subtract(pos,main.player.pos);
	    	b.get('projectile').live( d.inverted.normalized.multiplyScalar(shoot_speed) );
	}

	public function kill(remove:Bool = true) {		
		var s:Sprite = cast entity;
			Actuate.tween(s.scale, 0.1, {x:3,y:3});
			s.color.tween(0.1, {a:0}).onComplete(function(){
				s.visible = false;
			});
			alive = false;
			if(remove) {
				main.enemies.remove(this);
			}
	}

	public function live() {

		var s:Sprite = cast entity;
			s.scale.x = 1;
			s.scale.y = 1;
			s.color.tween(0.2, {a:1}, true);
			s.visible = true;

		alive = true;

		var _angle_opp = 45 - Math.round(Math.random() * 90);
		var _angle_dest = 45 - Math.round(Math.random() * 90);
		var _opp_side = main.rotation + 180;
    	var _opp_off = main.wrap(_opp_side + (_angle_opp*2), 0, 360);

		spawnpos = _opp_off; 
		destpos = main.wrap(_opp_off + _opp_side, 0, 360);
		curr_dest = destpos;
		destdir = ((destpos - spawnpos) > 0) ? 1 : -1;

		speed = 10 + (Math.round(Math.random()*10));

		pos = new Vector( main.__x(spawnpos), main.__y(spawnpos) );

		cpos = spawnpos;

		// Actuate.tween(this, (speed), { cpos:destpos }, true).ease(luxe.tween.easing.Linear.easeNone).onUpdate(function(){
		// 	pos.x = main.__x(cpos);
		// 	pos.y = main.__y(cpos);
		// }).reflect().repeat();

		main.enemies.push(this);
		haxe.Timer.delay(do_fire, Std.int((1+fire_rate)*1000) );
	}

		//shoot?
	var test :Vector;

	function toggle_dest() {
		if(curr_dest == spawnpos) {
			curr_dest = destpos;
		} else {
			curr_dest = spawnpos;
		}	
	}
	function update_movement(dt:Float) {

		cpos += dt * speed * destdir;
		if(cpos < curr_dest && destdir < 0) {
			destdir = 1;
			toggle_dest();
		} 
		if(cpos > curr_dest && destdir > 0) {
			destdir = -1;
			toggle_dest();
		}

		pos.x = main.__x(cpos);
		pos.y = main.__y(cpos);
	}

	public function update( dt:Float ) {

		if(!alive) return;

		alive_time += dt;
		if(alive_time > next_fire) {
			do_fire();
		}

		update_movement(dt);

		var dx = main.player.pos.x - pos.x;
		var dy = main.player.pos.y - pos.y;
			test.set(dx,dy);
		if(test.length < 48) {
			main.take_damage(1);
			kill();
		}
	}

}
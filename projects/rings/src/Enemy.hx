
import luxe.Visual;
import luxe.Vector;
import luxe.Color;
import luxe.tween.Actuate;
import luxe.Component;

import Projectile;
import levels.Stage1Level1;

class Enemy extends Component {

	public var alive : Bool = false;
	public var spawnpos : Float = 0;
	public var destpos : Float = 0;
	public var curr_dest : Float = 0;
	public var destdir : Int = 1;
	public var cpos : Float = 0;
	public var speed : Float = 0;
	public var stage : Stage1Level1;
	public var health : Float = 1;
	public var shoot_speed : Float = 100;
	public var fire_rate : Float = 10;
	public var alive_time : Float = 0;
	public var next_fire : Float = 0;

	public function init( _main:Stage1Level1 ) {

		stage = _main;

		test = new Vector();

    	shoot_speed = 30 + (Math.random() * 40);
    	fire_rate = 0.4 + (Math.random() * 2);
    	next_fire = 0.5;

	} //init

	public function take_damage(amount:Float) {
		health -= amount;
		if(health <= 0) {
			health = 0;			
			kill();
			stage.kill_enemy();
		}
	}

	public function do_fire() {

		if(alive) {
			fire();
			next_fire = alive_time + fire_rate;
		}

	}

	public function fire() {
		Luxe.audio.play('shoot');
		var b = stage.enemy_bullets.get();
			b.pos.x = pos.x;
	    	b.pos.y = pos.y;
	    var d = Vector.Subtract(pos,stage.player.pos);
	    	b.get('projectile').live( d.inverted.normalized.multiplyScalar(shoot_speed) );
	}

	public function kill(remove:Bool = true) {	

		Luxe.audio.play('enemy_explode');	

		var s:Visual = cast entity;
			
			Actuate.tween(s.scale, 0.2, {x:3,y:3});

			s.color.tween( 0.1, { a:0 }).timescale().onComplete(function(){
				s.visible = false;
			});

			alive = false;
			if(remove) {
				stage.enemies.remove(this);
			}
	}

	public function live() {

		var s:Visual = cast entity;
			s.scale.x = 1;
			s.scale.y = 1;
			s.color.tween(0.2, {a:1}, true);
			s.visible = true;

		alive = true;

		var _angle_opp = 45 - Math.round(Math.random() * 90);
		var _angle_dest = 45 - Math.round(Math.random() * 90);
		var _opp_side = stage.rotation + 180;
    	var _opp_off = luxe.utils.Maths.wrap_angle(_opp_side + (_angle_opp*2), 0, 360);

		spawnpos = _opp_off;
		destpos = luxe.utils.Maths.wrap_angle(_opp_off + _opp_side, 0, 360);
		curr_dest = destpos;
		destdir = ((destpos - spawnpos) > 0) ? 1 : -1;

		speed = 15 + (Math.round(Math.random()*10));

		pos = new Vector( stage.__x(spawnpos), stage.__y(spawnpos) );

		cpos = spawnpos;

		// Actuate.tween(this, (speed), { cpos:destpos }, true).ease(luxe.tween.easing.Linear.easeNone).onUpdate(function(){
		// 	pos.x = stage.__x(cpos);
		// 	pos.y = stage.__y(cpos);
		// }).reflect().repeat();

		stage.enemies.push(this);
		next_fire = 0.5;
		alive_time = 0;

		// haxe.Timer.delay(do_fire, Std.int((3+fire_rate)*1000) );
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

		pos.x = stage.__x(cpos);
		pos.y = stage.__y(cpos);
	}

	public function update( dt:Float ) {

		if(!alive) return;

		alive_time += dt;

		if(alive_time > next_fire) {
			do_fire();
		}

		update_movement(dt);

		var dx = stage.player.pos.x - pos.x;
		var dy = stage.player.pos.y - pos.y;
			test.set(dx,dy);
		if(test.length < (stage.finger_size*0.3) ) {
			stage.take_damage(1);
			kill();
		}
	}

}
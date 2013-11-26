
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
	public var cpos : Float = 0;
	public var speed : Float = 0;
	public var main : Main;
	public var health : Float = 1;
	public var shoot_speed : Float = 100;
	public var fire_rate : Float = 10;

	public function init() {

		test = new Vector();

    	shoot_speed = 20 + (Math.random() * 30);
    	fire_rate = 1.5 + (Math.random() * 2);

	} //init

	public function take_damage(amount:Float) {
		health -= amount;
		if(health <= 0) {
			health = 0;			
			kill();
		}
	}

	public function start_shooting() {

		if(alive) {
			fire();	
			haxe.Timer.delay(start_shooting, Std.int(fire_rate*1000) );
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
		speed = 10 + (Math.round(Math.random()*10));

		pos = new Vector( main.__x(spawnpos), main.__y(spawnpos) );

		cpos = spawnpos;

		Actuate.tween(this, (speed), { cpos:destpos }, true).ease(luxe.tween.easing.Linear.easeNone).onUpdate(function(){
			pos.x = main.__x(cpos);
			pos.y = main.__y(cpos);
		}).reflect().repeat();

		main.enemies.push(this);
		haxe.Timer.delay(start_shooting, Std.int((1+fire_rate)*1000) );
	}

		//shoot?
	var test :Vector;

	public function update() {

		if(!alive) return;

		var dx = main.player.pos.x - pos.x;
		var dy = main.player.pos.y - pos.y;
			test.set(dx,dy);
		if(test.length < 48) {
			main.take_damage(1);
			kill();
		}
	}

}
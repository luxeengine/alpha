import luxe.Visual;
import luxe.Vector;
import luxe.Color;
import luxe.tween.Actuate;
import luxe.components.Components.Component;

import levels.Stage1Level1;

class Projectile extends Component {

	public var vel : Vector;	
	public var alive : Bool = false;
	public var stage : Stage1Level1;
	public var damage : Float = 1;
	var spawn_protect : Float = 0;
	var alive_time : Float = 0;

	public var bullettype : String = '';

	public function init( _stage:Stage1Level1 ) {
		stage = _stage;
		vel = new Vector();
		test = new Vector();
	} 

	public function live(_vel:Vector) {

		alive = true;
		vel = _vel;
		var s:Visual = cast entity;
			s.visible = true;
			s.color.a = 1;
			s.scale.x = 1;
			s.scale.y = 1;

		spawn_protect = 0.8;
		alive_time = 0;
		stage.projectiles.push(this);

	}

	public function kill(remove:Bool = true) {


		Luxe.audio.play('distant_explode');	

		var s:Visual = cast entity;
			alive = false;

			Actuate.tween(s.scale, 0.1, {x:3,y:3}).timescale().onComplete(function(){
				s.visible = false;
			});
			s.color.tween(0.1, {a:0}).timescale();

		if(remove) {
			stage.projectiles.remove(this);
		}
	}

	var test : Vector;

	public function update( dt:Float ) {

		if(!alive) return;

		alive_time += dt;

		pos = pos.clone().add( Vector.Multiply(vel,dt) );

		if( !Luxe.screen.point_inside( pos ) ) {			
			kill();			
			if(bullettype == 'player') {
				stage.lose_progress();
				stage.lose_progress();
				stage.lose_progress();
			}			
		}
		
		if(bullettype == 'player') {
			for(enemy in stage.enemies) {
				var s : Visual = cast enemy.entity;
				var r = (stage.finger_size*0.39);
					var dx = s.pos.x - pos.x;
					var dy = s.pos.y - pos.y;
						test.set(dx,dy);
				if(test.length < r) {
					enemy.take_damage(damage);
					Luxe.camera.shake(4);
					kill();
				}
			} //enemy
		} //player

		if(bullettype == 'enemy') {
			if(alive_time > 15) {
				kill();
			}
		}

		if(alive_time > spawn_protect) {
			var dx = stage.player.pos.x - pos.x;
			var dy = stage.player.pos.y - pos.y;
				test.set(dx,dy);
			var _fs : Float = (bullettype == 'enemy') ? 0.27 : 0.32;
			var s = stage.finger_size * _fs;
			if(test.length < (s)) {
				stage.take_damage(1);				
				kill();
			}
		}

	}

} //Projectile
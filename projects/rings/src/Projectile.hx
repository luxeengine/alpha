import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import luxe.tween.Actuate;
import luxe.components.Components.Component;

class Projectile extends Component {

	public var vel : Vector;	
	public var alive : Bool = false;
	public var main : Main;
	public var damage : Float = 1;
	var spawn_protect : Float = 0;
	var alive_time : Float = 0;

	public var bullettype : String = '';

	public function init() {
		vel = new Vector();
		test = new Vector();
	} 

	public function live(_vel:Vector) {
		alive = true;
		vel = _vel;
		var s:Sprite = cast entity;
			s.visible = true;
			s.color.a = 1;
			s.scale.x = 1;
			s.scale.y = 1;

		spawn_protect = 1.5;
		alive_time = 0;
		main.projectiles.push(this);

	}

	public function kill(remove:Bool = true) {

		var s:Sprite = cast entity;
			alive = false;

			Actuate.tween(s.scale, 0.1, {x:3,y:3}).timescale().onComplete(function(){
				s.visible = false;
			});
			s.color.tween(0.1, {a:0}).timescale();

		if(remove) {
			main.projectiles.remove(this);
		}
	}

	var test : Vector;

	public function update( dt:Float ) {

		if(!alive) return;

		alive_time += dt;

		pos = pos.clone().add( Vector.Multiply(vel,dt) );

		if( !Luxe.screen.point_inside( pos ) ) {
			kill();
		}
		
		if(bullettype == 'player') {
			for(enemy in main.enemies) {
				var s : Sprite = cast enemy.entity;
				var r = (main.finger_size*0.3);
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
			if(alive_time > 13) {
				kill();
			}
		}

		if(alive_time > spawn_protect) {
			var dx = main.player.pos.x - pos.x;
			var dy = main.player.pos.y - pos.y;
				test.set(dx,dy);
			if(test.length < 48) {
				main.take_damage(1);				
				kill();
			}
		}

	}

} //Projectile
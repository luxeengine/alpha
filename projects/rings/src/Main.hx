
import luxe.Color;
import luxe.components.Components.Component;
import luxe.Entity;
import luxe.Sprite;
import luxe.Input;
import luxe.tween.Actuate;
import luxe.Vector;
import phoenix.geometry.Geometry;
import phoenix.geometry.LineGeometry;

class Pool<T> {

	public var length : Int = 0;
	public var items : Array<T>;
	public var index : Int = 0;

	var precache : Bool = true;
	var _create : Int -> Int -> T;

	public function new( pool_size:Int, create_callback:Int->Int->T, _precache:Bool = true ){

		length = pool_size;	
		precache = _precache;
		items = [];
		_create = create_callback;

		if(precache) {
			for(i in 0 ... length) {
		 		items.push( _create(i, length) );
			}
		} //if precache

	} //new

	public function get() : T {		
		
		// trace("fetching " + index);

			//we want to make sure that we are creating items that don't exist to the max
		if(!precache && items.length < length) {
				//need to add a new one, so request it
			items.push( _create(index, length) );
		}

		var _item = items[index];
			
			//after, increase the index, so that the index is always
			//on the next free one. In other words list[index] is the next one, not the last used one
		index++;
		if(index > length-1) {
			index = 0;
		}

		// trace("now at " + index);

		return _item;

	} //get


} //Pool


class Enemy extends Component {

	public var alive : Bool = false;
	public var spawnpos : Float = 0;
	public var destpos : Float = 0;
	public var cpos : Float = 0;
	public var speed : Float = 0;
	public var main : Main;
	public var health : Float = 1;

	public function init() {
		test = new Vector();
	} 

	public function take_damage(amount:Float) {
		health -= amount;
		if(health <= 0) {
			health = 0;
			kill();
		}
	}

	public function kill() {		
		var s:Sprite = cast entity;
			Actuate.tween(s.scale, 0.1, {x:3,y:3});
			s.color.tween(0.1, {a:0}).onComplete(function(){
				s.visible = false;
			});			
			alive = false;
			main.enemies.remove(this);
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


class Projectile extends Component {

	public var vel : Vector;	
	public var alive : Bool = false;
	public var main : Main;
	public var damage : Float = 1;
	var spawn_protect : Float = 0;

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

		spawn_protect = haxe.Timer.stamp() + 1.5;
	}

	public function kill() {
		var s:Sprite = cast entity;
			alive = false;
			Actuate.tween(s.scale, 0.1, {x:3,y:3}).onComplete(function(){
				s.visible = false;
			});
	}

	var test : Vector;

	public function update(dt:Float) {

		if(!alive) return;

		pos = pos.clone().add( Vector.Multiply(vel,0.0166666666) );

		if( !Luxe.screen.point_inside( pos ) ) {
			kill();
		}

		for(enemy in main.enemies) {
			var s : Sprite = cast enemy.entity;
			var r = (main.finger_size*0.3);
				var dx = s.pos.x - pos.x;
				var dy = s.pos.y - pos.y;
					test.set(dx,dy);
			if(test.length < r) {
				enemy.take_damage(damage);
				kill();
			}
		} //enemy

		if(haxe.Timer.stamp() > spawn_protect) {
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

class Main extends luxe.Game {

	public var player : Sprite;
	public var distance : Float = 0;
	var center : Vector;
	var sqrt2 : Float = 1.414213562373095;
	var min_length : Float = 0;
	public var rotation : Float = 0;

	var dest : Geometry;
	var offset : Geometry;
	var power : LineGeometry;
	var finger : Geometry;

	public var finger_size : Float = 64;

	var p_bullets : Pool<Sprite>;
	var p_enemies : Pool<Sprite>;

	var healths : Array<Sprite>;

	public var enemies : Array<Enemy>;

    public function ready() {

    	distance = Luxe.screen.h*0.4;
    	finger_size = Luxe.screen.h*0.13;
    	min_length = sqrt2 * distance;
    	center = new Vector(Luxe.screen.w/2, Luxe.screen.h/2);

    	p_bullets = new Pool<Sprite>(20,
    		function(index,total){
    			var _s = new Sprite({
    				size : new Vector(finger_size*0.14, finger_size*0.14),
    				color : new Color(1,1,1,1),
    			});
    			_s.visible = false;
    			var _p = _s.add( Projectile, 'projectile' );
    				_p.main = this;
    			return _s;
    		}
    	); 

    	p_enemies = new Pool<Sprite>(10,
    		function(index,total){
    			var _s = new Sprite({
    				size : new Vector(finger_size*0.6, finger_size*0.6),
    				color : new Color(0.6,0.1,0,1),
    			});
    			// _s.rotation_z = Math.round(360*Math.random());
    			_s.visible = false;
    			var _e = _s.add( Enemy, 'enemy' );
    				_e.main = this;
    			return _s;
    		}
    	); 

    	healths = [];
    	for(i in 0 ... 3) {
    		healths.push(new Sprite({
    			pos : new Vector(20+(i*40), 30),
    			size : new Vector(26,26),
    			color : new Color(1, 0.3, 0.1, 1)
    		}));
    		healths[i].rotation_z = 45;
    	}

    	enemies = [];

    	_range_scale = new Vector();

    	dest = Luxe.draw.ring({
    		x : center.x, y:center.y,
    		r : 10,
    		color : new Color(0.3,0.5,0.8,1)
    	});
    	offset = Luxe.draw.ring({
    		x : center.x, y:center.y,
    		r : 8,
    		color : new Color(0.8,0.5,0.2,1)
    	});
    	power = Luxe.draw.line({
    		p0 : new Vector(), p1: new Vector(),
    		color : new Color(0.1,0.5,1,1)
    	});
    	finger = Luxe.draw.ring({
    		x : 0, y: 0, r : finger_size,
    		color : new Color(1,1,1,0.1)
    	});

    	power.enabled = false;

    	var mainring = Luxe.draw.ring({
    		x : center.x, y:center.y,
    		r : distance,
    		color : new Color(1,1,1,0.75)
    	});

    	mainring.locked = true;

    	var centering = Luxe.draw.ring({
    		x : center.x, y:center.y,
    		r : 4,
    		color : new Color(0.5,0,0,0.4)
    	});	

    	centering.locked = true;

		player = new Sprite({
			pos: new Vector(0,0),
			size: new Vector(64,48)
		});

		set_pos(90);

		p1 = new Vector();

		spawn_enemy();

    } //ready

    public function spawn_enemy() {
			//start spawning enemies
		var delay = (3 + Math.round(( Math.random() * 4 ))) * 1000;
		haxe.Timer.delay( spawn_enemy, delay );

		var e = p_enemies.get();
    	if(!e.get('enemy').alive) {	
    		e.get('enemy').live();
    	}

    } //spawn_

    public var health : Float = 3;
    public function take_damage(amount:Float) {
    	health -= amount;
    	if(health <= 0) {
    		health = 0;
    		kill();
    	}

    	//update UI
    	var i =  3 - Math.round(health);
    	for(_i in 0 ... i) {
    		healths[2-_i].visible = false;
    	}

    } //take_damage

    function kill() {
    		//reset
    	player.color.tween(0.4, {a:1}, true);
    	set_pos(90);

    		//kill all enemies
    	for(enemy in enemies) {
    		enemy.kill();
    	}

    		//health reset
    	health = 3;
    	for(_h in healths) {
    		_h.visible = true;
    	}

    } //kill

    function set_pos(r) {

    	player.pos.x =  __x(r);
    	player.pos.y =  __y(r);
    	player.rotation_z = r;
    	power.p0 = player.pos;
    	finger.pos = player.pos;

    	rotation = r;

    } //set_pos

    public function __x(d:Float) {    	
		return ( ((-distance)*Math.sin( phoenix.utils.Maths.degToRad(-d) )) + center.x );
    }

    public function __y(d:Float) {
    	return ( ((-distance)*Math.cos( phoenix.utils.Maths.degToRad(-d) )) + center.y );
    }

    var dragging = false;
    var inrange = false;
    var shid = true;

    public function onmousedown( e:MouseEvent ) {
    	var dx = e.pos.x - player.pos.x;
    	var dy = e.pos.y - player.pos.y;
		var scale = new Vector(dx,dy);
		if(scale.length < finger_size) {
			dragging = true;			
		}

		power.p1 = e.pos;
    		p1.x = e.pos.x;
    		p1.y = e.pos.y;

    } //onmousedown

    public function wrap(degrees:Float, lower:Float, upper:Float ) {
    	var _radians:Float = phoenix.utils.Maths.degToRad(degrees);
    	var _distance:Float = upper - lower;
      	var _times:Float = Math.floor((degrees - lower) / _distance);
      	return degrees - (_times * _distance);
    }

    var range_angle : Float = 0;
    var range_p_angle : Float = 0;
    var range_o_angle : Float = 0;
    var range_length : Float = 0;
    var _range_scale : Vector;
    var dhid  = false;

    var shoot_range = false;
    var shoot_power = 0.0;

    function get_inrange(pos:Vector) {

    	inrange = false;

    	var dx = pos.x - player.pos.x;
		var dy = pos.y - player.pos.y;

		_range_scale.set(dx,dy);

		range_length = _range_scale.length;
		range_p_angle = Math.abs(player.pos.rotationTo(center));
		range_angle = wrap( player.pos.rotationTo(pos) + range_p_angle, 0, 360);

		if((range_angle <= 45 && range_angle >=0) || (range_angle >= 315 && range_angle <= 360)) {				
			if(range_length > min_length) {
				range_o_angle = wrap(range_angle-45,0,90) - 45;
				inrange = true;
			} //if far enough away
		} //if within angle

		if(range_angle >= 90 && range_angle <= 270) {
			
			if(dragging) {
				var d = Vector.Subtract(p1,player.pos);
    			var p = d.length;

    			
    			if(p < 50) {
	    			p = 50;
	    			player.color.r = 1;
	    			player.color.g = 1;
	    			player.color.b = 1;
	    			shoot_range = false;
	    			shoot_power = 0;
	    		} else {
    				player.color.r = 0.2;
	    			player.color.g = 0.5;
	    			player.color.b = 1;
	    			shoot_power = p*1.5;    			
	    			shoot_range = true;
	    		}
    		}
    		
    		

		} else {
			if(shoot_range) {
				player.color.tween(0.3, {a:1});
			}
			shoot_range = false;
		}

    } //get_inrange

    var p1 : Vector;

    public function onmouseup( e:MouseEvent ) {

    	if(dragging) {
    		
    		dragging = false;    		
    		
    		get_inrange(e.pos);

    		dest.color.tween(1, {a:0}, true);
    		offset.color.tween(1, {a:0}, true);

    		player.color.r = 1;
			player.color.g = 1;
			player.color.b = 1;

    		power.enabled = false;
    		dhid = true;
    		shid = true;

    		if(inrange) {
    			inrange = false;
    				//make directly opposite 0 and far left -45 and far right 45
				move_player( rotation, range_o_angle );
    		}

    		if(shoot_range) {
    			shoot_range = false;
    			shoot();
    		}

    	} //dragging

    	power.p1 = e.pos;
    		p1.x = e.pos.x;
    		p1.y = e.pos.y;

    } //onmouseup

    function shoot() {
    	// trace("shooting at " + range_angle + ' with power ' + Vector.Subtract(p1,player.pos).length );

    	if(shoot_power > 0) {
    		var b = p_bullets.get();
	    		b.pos.x = player.pos.x;
	    		b.pos.y = player.pos.y;
	    		var d = Vector.Subtract(p1,player.pos);    		
	    		b.get('projectile').live( d.inverted.normalized.multiplyScalar(shoot_power) );
	    }

    }

    function move_player( angle_player:Float, angle_opp:Float ) {

    	player.color.tween(0.5, {a:0}, true).onComplete(function(){
    		
    		var _opp_side = angle_player + 180;
    			dest.pos.x = __x( _opp_side );
    			dest.pos.y = __y( _opp_side );
    		var _opp_off = _opp_side + (angle_opp*2);
    			offset.pos.x = __x( _opp_off );
    			offset.pos.y = __y( _opp_off );

    		var _final_angle = wrap( _opp_off, 0, 360);
    		
    			set_pos(_final_angle);

	    		player.color.tween(0.25, {a:1}, true).onComplete(function(){


	    		}); //fade in

    	}); //fade out

    } //move_player

    public function ontouchmove( e:TouchEvent ) {
    	ondrag( e.pos );
    }
    public function onmousemove( e:TouchEvent ) {
    	ondrag( e.pos );
    }

    public function ondrag( pos:Vector ) {
    	
    	power.p1 = pos;
    		p1.x = pos.x;
    		p1.y = pos.y;

    	var pre_in = inrange;
    	var pre_shoot = shoot_range;

    	get_inrange(pos);

    	if(pre_in && !inrange) {
    		dhid = true;
			dest.color.tween(0.5, {a:0}, true);
			offset.color.tween(0.5, {a:0}, true);
    	}

    	if(pre_shoot && !shoot_range) {
    		shid = true;
    		power.enabled = false;
    	}

    	if(dragging && inrange) {

    		if(dhid) {
    			dhid = false;
    			dest.color.tween(0.2, {a:0.2}, true);
    			offset.color.tween(0.2, {a:1}, true);
    		}

    		var _opp_side = rotation + 180;
    			dest.pos.x = __x( _opp_side );
    			dest.pos.y = __y( _opp_side );
    		var _opp_off = _opp_side + (range_o_angle*2);
    			offset.pos.x = __x( _opp_off );
    			offset.pos.y = __y( _opp_off );

    	} //dragging && in_range


    	if(dragging && shoot_range) {
    		
    		if(shid) {
    		    shid = false;
    			power.enabled = true;
    		}
    		
    	}

    } //ondrag

    var isr : Float = 90;
    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.space) {
        	
        }

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    	

    } //update

} //Main
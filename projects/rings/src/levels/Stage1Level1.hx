package levels;


import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import luxe.States;
import luxe.Color;
import luxe.Entity;
import luxe.Sprite;
import luxe.tween.Actuate;
import luxe.Vector;

import luxe.structural.Pool;

import phoenix.geometry.Geometry;
import phoenix.geometry.LineGeometry;

import Enemy;
import phoenix.geometry.RingGeometry;
import Projectile;

class Stage1Level1 extends State {

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
	var jumper : Geometry;

	public var finger_size : Float = 64;

    var player_bullets : Pool<Sprite>;
	public var enemy_bullets : Pool<Sprite>;
	var player_enemies : Pool<Sprite>;

	var healths : Array<Sprite>;

    public var enemies : Array<Enemy>;
	public var projectiles : Array<Projectile>;

    var dragging = false;
    var inrange = false;
    var shid = true;

    var range_angle : Float = 0;
    var range_p_angle : Float = 0;
    var range_o_angle : Float = 0;
    var range_length : Float = 0;
    var _range_scale : Vector;
    var dhid  = false;

    var shoot_range = false;
    var shoot_power = 0.0;

    var main:Main;
    var inited : Bool = false;

    var progress_bars : Pool<RingGeometry>;

    public function init( _main:Main ) {

        main = _main;

    	distance = Luxe.screen.h*0.3;
    	finger_size = Luxe.screen.h*0.13;
    	min_length = sqrt2 * distance;
    	center = new Vector(Luxe.screen.w/2, Luxe.screen.h/2);        

        player_bullets = new Pool<Sprite>(20,
            function(index,total){
                var _s = new Sprite({
                    size : new Vector(finger_size*0.14, finger_size*0.14),
                    color : new Color(1,1,1,1),
                });
                _s.visible = false;
                var _p = _s.add( Projectile, 'projectile', this );
                    _p.bullettype = 'player';
                return _s;
            }
        ); 

    	progress_bars = new Pool<RingGeometry>( 10,
            function(index,total){
                var _s = Luxe.draw.ring({
                    x : center.x, y : center.y,
                    r : (distance / (total+1)) * (index+1),
                    color : new Color(0,0,0,0.1).rgb(0xf6007b)
                });
                return _s;
            }
        );


        enemy_bullets = new Pool<Sprite>(30,
    		function(index,total) {
    			var _s = new Sprite({
    				size : new Vector(finger_size*0.1, finger_size*0.1),
    				color : new Color(0.8,0.3,0.1,1),
    			});
                
    			_s.visible = false;
    			var _p = _s.add( Projectile, 'projectile', this );
                    _p.bullettype = 'enemy';
    			return _s;
    		}
    	); 

    	player_enemies = new Pool<Sprite>(10,
    		function(index,total){
    			var _s = new Sprite({
    				size : new Vector(finger_size*0.6, finger_size*0.6),
    				color : new Color(0.6,0.1,0,1),
    			});
    			// _s.rotation_z = Math.round(360*Math.random());
    			_s.visible = false;
    			var _e = _s.add( Enemy, 'enemy', this );
    			return _s;
    		}
    	); 

    	healths = [];
    	for(i in 0 ... 3) {

    		healths.push(new Sprite({
    			pos : new Vector(30+(i*40), 30),
    			size : new Vector(26,26),
    			color : new Color(1, 0.3, 0.1, 1),
                rotation_z : _main.rot
    		}));

    	} //for 3 health blobs

    	enemies = [];
        projectiles = [];

    	_range_scale = new Vector();

    	dest = Luxe.draw.ring({
    		x : center.x, y:center.y,
    		r : 10,
    		color : new Color(0.3,0.5,0.8,0)
    	});
    	offset = Luxe.draw.ring({
    		x : center.x, y:center.y,
    		r : 8,
    		color : new Color(0.8,0.5,0.2,0)
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

        jumper = Luxe.draw.arc({
    		x : center.x, y:center.y,
    		r : distance*0.97,
    		color : new Color(0.2,0.5,1,0.5),
            end_angle : 180
    	});

    	mainring.locked = true;

		player = new Sprite({
			pos: new Vector(0,0),
			size: new Vector(64,48)
		});

		set_pos(90);

        jumper.rotation.setFromEuler(new Vector(0,0,luxe.utils.Maths.degToRad(rotation)));

		p1 = new Vector();		

        inited = true;

    } //ready

        //leave
    public function leave() {

    }

        //enter
    public function enter( _from_success:Bool=false ) {

        if(_from_success) {            
            kill();
            success = false;
            reset_progress();
            power.p1 = player.pos;
        }        

        dragging = false;
        spawn_enemy();
        
        for(_h in healths) {
            _h.rotation_z = main.rot;
        }
    }

    public function reset_progress() {

        if(success) return;

        progress_bars.index = 0;
        progress = 0;

        for( p in progress_bars.items ) {
            p.color.a = 0.1;
        }
    }

    public function spawn_enemy() {

        if(success) return;

		//start spawning enemies
		var delay = (1 + Std.random(6));	
        Luxe.time.schedule( delay , spawn_enemy );

        if(!inited) return;

		var e = player_enemies.get();
    	if(!e.get('enemy').alive) {	
    		e.get('enemy').live();
    	}

    } //spawn_

    public var health : Float = 3;
    public function take_damage(amount:Float) {

        if(success) return;
    	
        health -= amount;
    	if(health <= 0) {
    		health = 0;
    		kill();
            Luxe.camera.shake(20);
    	} else {
            Luxe.camera.shake(6);
        }

    	//update UI
    	var i =  3 - Math.round(health);
    	for(_i in 0 ... i) {
    		healths[2-_i].visible = false;
    	}

    } //take_damage

    function kill( ?_from_win : Bool=false ) {
    	
            //reset
    	player.color.tween(0.4, {a:1}, true);
    	
    		//kill all enemies
        for(enemy in enemies) {
            enemy.kill(false);
        }

    	for(proj in projectiles) {
    		proj.kill(false);
    	}

        enemies = [];
        projectiles = [];

        if(!_from_win) {
    
            set_pos(90);

            jumper.rotation.setFromEuler(new Vector(0,0,luxe.utils.Maths.degToRad(rotation)));            

            reset_progress();
                
                //health reset
            health = 3;
            for(_h in healths) {
                _h.visible = true;
            }

        } //_from_win

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
		return ( ((-distance)*Math.sin( luxe.utils.Maths.degToRad(-d) )) + center.x );
    }

    public function __y(d:Float) {
    	return ( ((-distance)*Math.cos( luxe.utils.Maths.degToRad(-d) )) + center.y );
    }

    public function onmousedown( e:MouseEvent ) {
        
        if(success) return;

		dragging = true;

		power.p1 = e.pos;
    		p1.x = e.pos.x;
    		p1.y = e.pos.y;

    } //onmousedown


    function get_inrange(pos:Vector) {

        if(success) return;

    	inrange = false;

    	var dx = pos.x - player.pos.x;
		var dy = pos.y - player.pos.y;

		_range_scale.set(dx,dy);

		range_length = _range_scale.length;
		range_p_angle = Math.abs(player.pos.rotationTo(center));
		range_angle = luxe.utils.Maths.wrap_angle( player.pos.rotationTo(pos) + range_p_angle, 0, 360);

		if((range_angle <= 45 && range_angle >=0) || (range_angle >= 315 && range_angle <= 360)) {				
			if(range_length > min_length) {
				range_o_angle = luxe.utils.Maths.wrap_angle(range_angle-45,0,90) - 45;
				inrange = true;
			} //if far enough away
		} //if within angle

		if(range_angle >= 90 && range_angle <= 270) {
			
    		var d = Vector.Subtract(p1,player.pos);
    		var p = d.length;
    		
    		if(p < (finger_size*0.7)) {
    			p = (finger_size*0.7);
    			player.color.r = 1;
    			player.color.g = 1;
    			player.color.b = 1;
    			shoot_range = false;
    			shoot_power = 0;
                Luxe.timescale = 1;
    		} else {
    			player.color.r = 0.2;
    			player.color.g = 0.5;
    			player.color.b = 1;
    			shoot_power = p * 1.5;
    			shoot_range = true;
                if(dragging) {

                    var slowp = 1.0 - (p/(finger_size*4));
                    if(slowp < 0.06) slowp = 0.06;
                    
                        Luxe.timescale = slowp;

                } else {
                    if(Luxe.timescale != 1) { Luxe.timescale = 1; }
                }
    		} //else

		} else {
			if(shoot_range) {
				player.color.tween(0.3, {a:1});
			}
			shoot_range = false;
		}

    } //get_inrange

    var p1 : Vector;

    public function onmouseup( e:MouseEvent ) {
        
        if(success) return;

    	if(dragging) {
    		dragging = false;
            if(Luxe.timescale != 1) { Luxe.timescale = 1; }
        } 		
    		
    		get_inrange(e.pos);

    		dest.color.tween(1, {a:0}, true);
            offset.color.tween(1, {a:0}, true);
    		jumper.color.tween(1, {a:0.5}, true);

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

    	power.p1 = e.pos;
    		p1.x = e.pos.x;
    		p1.y = e.pos.y;

    } //onmouseup

    function shoot() {
    	// trace("shooting at " + range_angle + ' with power ' + Vector.Subtract(p1,player.pos).length );
        if(success) return;
    	if(shoot_power > 0) {
    		var b = player_bullets.get();
	    		b.pos.x = player.pos.x;
	    		b.pos.y = player.pos.y;
	    		var d = Vector.Subtract(p1,player.pos);    		
	    		b.get('projectile').live( d.inverted.normalized.multiplyScalar(shoot_power) );
	    }

    }

    function move_player( angle_player:Float, angle_opp:Float ) {

        if(success) return;

    	player.color.tween(0.1, {a:0}, true).onComplete(function(){
    		
    		var _opp_side = angle_player + 180;
    			dest.pos.x = __x( _opp_side );
    			dest.pos.y = __y( _opp_side );
    		var _opp_off = _opp_side + (angle_opp*2);
    			offset.pos.x = __x( _opp_off );
    			offset.pos.y = __y( _opp_off );

    		var _final_angle = luxe.utils.Maths.wrap_angle( _opp_off, 0, 360);
    		
    			set_pos(_final_angle);

	    		player.color.a = 1;
                Luxe.camera.shake(1.4);

            jumper.rotation.setFromEuler(new Vector(0,0,luxe.utils.Maths.degToRad(rotation)));

    	}); //fade out

    } //move_player

    public function ontouchmove( e:TouchEvent ) {
        if(!inited) return;
        if(success) return;
    	ondrag( e.pos );
    }

    public function onmousemove( e:TouchEvent ) {
        if(!inited) return;
        if(success) return;
    	ondrag( e.pos );
    }

    var progress : Int = 0;
    var success : Bool = false;

    public function kill_enemy() {

        if(success) return;

        progress++;

        var b = progress_bars.get();
            b.color.tween( 0.2, {a:1}, true );

        if(progress == 10) {
            success = true;
            kill(true);
            main.show_end('stage1.level1');
        }

    } //kill_enemy

    public function ondrag( pos:Vector ) {

        if(success) return;
    	
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
			jumper.color.tween(0.5, {a:0.5}, true);
    	}

    	if(pre_shoot && !shoot_range) {
    		shid = true;
    		power.enabled = false;
    	}

    	if(inrange) {

    		if(dhid) {
    			dhid = false;
    			dest.color.tween(0.2, {a:0.2}, true);
                offset.color.tween(0.2, {a:1}, true);
    			jumper.color.tween(0.2, {a:1}, true);
    		}

    		var _opp_side = rotation + 180;
    			dest.pos.x = __x( _opp_side );
    			dest.pos.y = __y( _opp_side );
    		var _opp_off = _opp_side + (range_o_angle*2);
    			offset.pos.x = __x( _opp_off );
    			offset.pos.y = __y( _opp_off );            

    	} //dragging && in_range


    	if(shoot_range) {
    		
    		if(shid) {
    		    shid = false;
    			power.enabled = true;
    		}
    		
    	}

    } //ondrag

  

    public function update(dt:Float) {
        
    } //update

} //Stage1Level1
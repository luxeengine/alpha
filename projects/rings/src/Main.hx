
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


class Projectile extends Component {

	public var vel : Vector;	
	public var alive : Bool = false;

	public function init() {
		vel = new Vector();
	} 

	public function live(_vel:Vector) {
		alive = true;
		vel = _vel;
	}

	public function kill() {
		var s:Sprite = cast entity;
			s.visible = false;
	}

	public function update(dt:Float) {
		if(!alive) return;

		pos = pos.clone().add( Vector.Multiply(vel,0.0166666666) );

		if( !Luxe.screen.point_inside( pos ) ) {
			kill();
		}
	}

} //Projectile

class Main extends luxe.Game {

	var player : Sprite;
	var distance : Float = 0;
	var center : Vector;
	var sqrt2 : Float = 1.414213562373095;
	var min_length : Float = 0;
	var rotation : Float = 0;

	var dest : Geometry;
	var offset : Geometry;
	var power : LineGeometry;
	var finger : Geometry;

	var finger_size : Float = 64;

	var p_bullets : Pool<Sprite>;

    public function ready() {

    	distance = Luxe.screen.h*0.4;
    	finger_size = Luxe.screen.h*0.13;
    	min_length = sqrt2 * distance;
    	center = new Vector(Luxe.screen.w/2, Luxe.screen.h/2);

    	p_bullets = new Pool<Sprite>(25,
    		function(index,total){
    			var _s = new Sprite({
    				size : new Vector(finger_size*0.14, finger_size*0.14),
    				color : new Color(0.6,0.1,0,1),
    			});
    			_s.visible = false;
    			_s.add( Projectile, 'projectile' );
    			return _s;
    		}
    	); 

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
    		color : new Color(0.1,0.5,1,0)
    	});
    	finger = Luxe.draw.ring({
    		x : 0, y: 0, r : finger_size,
    		color : new Color(1,1,1,0.1)
    	});


    	Luxe.draw.ring({
    		x : center.x, y:center.y,
    		r : distance,
    		color : new Color(1,1,1,0.75)
    	});

    	Luxe.draw.ring({
    		x : center.x, y:center.y,
    		r : 4,
    		color : new Color(0.5,0,0,0.4)
    	});	


		player = new Sprite({
			pos: new Vector(0,0),
			size: new Vector(64,48)
		});

		set_pos(90);

		p1 = new Vector();

    } //ready

    function set_pos(r) {
    	player.pos.x =  __x(r);
    	player.pos.y =  __y(r);
    	player.rotation_z = r;
    	power.p0 = player.pos;
    	finger.pos = player.pos;

    	rotation = r;
    }

    function __x(d:Float) {    	
		return ( ((-distance)*Math.sin( phoenix.utils.Maths.degToRad(-d) )) + center.x );
    }

    function __y(d:Float) {
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
    } //onmousedown

    function wrap(degrees:Float, lower:Float, upper:Float ) {
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
			shoot_range = true;
		} else {
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

    		Actuate.tween( p1, 0.8, {x:player.pos.x, y:player.pos.y}, true ).onUpdate(function(){
                 power.p1 = p1;
    		});

    		power.color.tween(1, {a:0}, true);
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
    } //onmouseup

    function shoot() {
    	// trace("shooting at " + range_angle + ' with power ' + Vector.Subtract(p1,player.pos).length );
    	var b = p_bullets.get();
    		b.pos.x = player.pos.x;
    		b.pos.y = player.pos.y;
    		var d = Vector.Subtract(p1,player.pos);
    		var p = d.length;
    			if(p < 50) p = 50;
    			if(p == 0) return;

    		b.visible = true;

    		b.get('projectile').live( d.inverted.normalized.multiplyScalar(p) );

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
    		power.color.tween(0.5, {a:0}, true);
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
    			power.color.tween(0.5, {a:1}, true);
    		}

    		power.p1 = pos;
    		p1.x = pos.x;
    		p1.y = pos.y;
    	}

    } //onmousemove

    var isr : Float = 90;
    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.space) {
        	isr += 30;
        	isr = wrap(isr,0,360);
        	set_pos(isr);
        }

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    	

    } //update

} //Main

import luxe.Color;
import luxe.Sprite;
import luxe.Input;
import luxe.Vector;
import phoenix.geometry.Geometry;

class Main extends luxe.Game {

	var player : Sprite;
	var distance : Float = 0;
	var center : Vector;
	var sqrt2 : Float = 1.414213562373095;
	var min_length : Float = 0;
	var rotation : Float = 0;

	var dest : Geometry;
	var offset : Geometry;

    public function ready() {

    	distance = Luxe.screen.h*0.35;
    	min_length = sqrt2 * distance;
    	center = new Vector(Luxe.screen.w/2, Luxe.screen.h/2);


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

    	rotation = 90;

		player = new Sprite({
			pos: new Vector( __x(rotation), __y(rotation) ),
			size: new Vector(64,48)
		});

		player.rotation_z = rotation;

    } //ready

    function set_pos(r) {
    	player.pos.x =  __x(r);
    	player.pos.y =  __y(r);
    	player.rotation_z = r;
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
    public function onmousedown( e:MouseEvent ) {
    	var dx = e.pos.x - player.pos.x;
    	var dy = e.pos.y - player.pos.y;
		var scale = new Vector(dx,dy);
		if(scale.length < 48) {
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

    } //get_inrange

    public function onmouseup( e:MouseEvent ) {

    	if(dragging) {
    		
    		dragging = false;
    		
    		get_inrange(e.pos);

    		dest.color.tween(1, {a:0}, true);
    		offset.color.tween(1, {a:0}, true);
    		dhid = true;

    		if(inrange) {
    				//make directly opposite 0 and far left -45 and far right 45
				move_player( rotation, range_o_angle );
    		}

    	} //dragging
    } //onmouseup

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
    	
    	get_inrange(pos);

    	if(dragging && inrange) {

    		if(dhid) {
    			dhid = false;
    			dest.color.tween(0.2, {a:1}, true);
    			offset.color.tween(0.2, {a:1}, true);
    		}

    		var _opp_side = rotation + 180;
    			dest.pos.x = __x( _opp_side );
    			dest.pos.y = __y( _opp_side );
    		var _opp_off = _opp_side + (range_o_angle*2);
    			offset.pos.x = __x( _opp_off );
    			offset.pos.y = __y( _opp_off );

    	} //dragging && in_range
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

    	Luxe.draw.ring({
    		immediate:true,
    		x : player.pos.x, y: player.pos.y, r : 48,
    		color : new Color(1,1,1,0.55)
    	});

    } //update

} //Main
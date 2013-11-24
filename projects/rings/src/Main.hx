
import luxe.Color;
import luxe.Sprite;
import luxe.Input;
import luxe.Vector;

class Main extends luxe.Game {

	var player : Sprite;
	var distance : Float = 0;
	var center : Vector;
	var sqrt2 : Float = 1.414213562373095;
	var min_length : Float = 0;

    public function ready() {

    	distance = Luxe.screen.h*0.35;
    	min_length = sqrt2 * distance;
    	center = new Vector(Luxe.screen.w/2, Luxe.screen.h/2);

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

    	var r = 90;

		player = new Sprite({
			pos: new Vector( __x(r), __y(r) ),
			size: new Vector(64,48)
		});

		player.rotation_z = r;

    } //ready

    function set_pos(r) {
    	player.pos.x =  __x(r);
    	player.pos.y =  __y(r);
    	player.rotation_z = r;
    }

    function __x(d:Float) {    	
		return ( ((-distance)*Math.sin( phoenix.utils.Maths.degToRad(-d) )) + center.x );
    }

    function __y(d:Float) {
    	return ( ((-distance)*Math.cos( phoenix.utils.Maths.degToRad(-d) )) + center.y );
    }

    var dragging = false;
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

    public function onmouseup( e:MouseEvent ) {

    	if(dragging) {
    		
    		dragging = false;
    		
    		var dx = e.pos.x - player.pos.x;
    		var dy = e.pos.y - player.pos.y;

    		var scale = new Vector(dx,dy);
    		var _pr = player.pos.rotationTo(center);
    		var _angle = wrap( player.pos.rotationTo(e.pos) - _pr, 0, 360);

    		trace('r:'+_angle);

			if((_angle <= 45 && _angle >=0) || (_angle >= 315 && _angle <= 360)) {				
				if(scale.length > min_length) {
					trace(wrap(_angle-45,0,90));
					// move_player( _angle );
				} //if far enough away
			} //if within angle

    	} //dragging
    } //onmouseup

    function move_player( angle_to:Float ) {
    	player.color.tween(1, {a:0}, true).onComplete(function(){
    		
    		player.pos.x = __x( angle_to );
    		player.pos.y = __y( angle_to );
    		player.rotation_z = angle_to;

    		trace("destination is " + (angle_to ));

    		player.color.tween(0.5, {a:1}, true).onComplete(function(){

    		}); //fade in
    	}); //fade out

    } //move_player

    public function onmousemove( e:MouseEvent ) {    	
    	// var _r = -center.rotationTo(e.pos);
    	// player.rotation_z = -_r;
    	// player.pos.x = __x(_r+180);
    	// player.pos.y = __y(_r+180);
    }

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
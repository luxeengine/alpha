package levels;


import luxe.Input;
import luxe.Vector;
import luxe.States;
import luxe.Color;
import luxe.Entity;
import luxe.tween.Actuate;
import luxe.Vector;
import luxe.Visual;

import luxe.structural.Pool;

import phoenix.Batcher;
import phoenix.geometry.ArcGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.LineGeometry;

import Enemy;
import phoenix.geometry.RingGeometry;
import phoenix.geometry.CircleGeometry;
import Projectile;

enum PlayMode {
    none;
    move;
    shoot;    
}

class Stage1Level1 extends State {

    public var player : Visual;
    public var distance : Float = 0;
    public var field_distance : Float = 0;
    var center : Vector;
    var sqrt2 : Float = 1.414213562373095;
    var min_length : Float = 0;

    var default_timescale : Float = 1;

    public var rotation : Float = 0;

    var dest : Geometry;
    var power : LineGeometry;
    var aim : ArcGeometry;
    var aim_point : CircleGeometry;
    var dragger : CircleGeometry;
    var finger : Geometry;
    var jumper : Geometry;

    public var finger_size : Float = 64;
    public var timesize : Float = 64;

    var player_bullets : Pool<Visual>;
    public var enemy_bullets : Pool<Visual>;
    var player_enemies : Pool<Visual>;

    var healths : Array<Visual>;

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
    var dhid : Bool = false;

    var shoot_range : Bool = false;
    var shoot_power : Float= 100.0;
    var finger_offset : Float= 0.0;
    var drag_center_size : Float= 0.0;
    var shoot_time : Float = 0.0;

    var main:Main;
    var inited : Bool = false;

    var progress_bars : Pool<RingGeometry>;

    public function init( _main:Main ) {

        Luxe.renderer.state.lineWidth( finger_size*0.02 );

        main = _main;

        distance = Luxe.screen.h*0.3;
        field_distance = distance+(distance*0.15);        

        finger_size = Luxe.screen.h*0.13;
        finger_offset = finger_size*0.6;
        drag_center_size = distance*0.18;

        shoot_power = distance*2.5;

        timesize = distance*2.5;
        min_length = sqrt2 * distance;
        center = new Vector(Luxe.screen.w/2, Luxe.screen.h/2);

        endpos = new Vector();

        player_bullets = new Pool<Visual>(20,
            function(index,total){

                var _s = new Visual({
                    size : new Vector(finger_size*0.14, finger_size*0.14),
                    color : new Color(1,1,1,1),
                    depth:0.5,
                    geometry: Luxe.draw.circle({
                        r: finger_size*0.09,
                    })
                });

                _s.visible = false;

                var _p = _s.add( Projectile, 'projectile', { init_with:this } );
                    _p.bullettype = 'player';
                return _s;
            }
        ); 

        progress_bars = new Pool<RingGeometry>( 10,
            function(index,total){
                var _s = Luxe.draw.ring({
                    x : center.x, y : center.y,
                    r : ((distance / (total+3)) * (index+3)),
                    depth:0.5,
                    color : new Color(0,0,0,0.1).rgb(0xf6007b)
                });
                return _s;
            }
        );


        enemy_bullets = new Pool<Visual>(30,
            function(index,total) {
                var _s = new Visual({
                    depth:6,
                    size : new Vector(finger_size*0.1, finger_size*0.1),
                    color : new Color(0.8,0.3,0.1,1),
                });
                
                _s.visible = false;
                var _p = _s.add( Projectile, 'projectile', { init_with:this } );
                    _p.bullettype = 'enemy';
                return _s;
            }
        ); 

        player_enemies = new Pool<Visual>(10,
            function(index,total){
                var _s = new Visual({
                    name:"enemy" + index,
                    size : new Vector(finger_size*0.4, finger_size*0.4),
                    color : new Color(0.6,0.1,0,1),
                    depth:6,
                    geometry : Luxe.draw.circle({
                        r: finger_size*0.25,
                    })
                });

                _s.visible = false;

                var _e = _s.add( Enemy, 'enemy', { init_with:this } );
                return _s;
            }
        ); 

        healths = [];
        for(i in 0 ... 3) {

            healths.push(new Visual({
                pos : new Vector(30+(i*40), 30),
                size : new Vector(26,26),
                color : new Color(1, 0.3, 0.1, 1),
                rotation_z : _main.rot,
                depth:0.5
            }));

        } //for 3 health blobs

        enemies = [];
        projectiles = [];

        _range_scale = new Vector();

        dest = Luxe.draw.ring({
            x : center.x, y:center.y,
            r : finger_size*0.1,
            color : new Color(0.3,0.5,0.8,0),
            depth:0.5
        });
        dest = Luxe.draw.ring({
            x : center.x, y:center.y,
            r : finger_size*0.2,
            color : new Color(0.2,0.5,1,0),
            depth:0.5
        });
        power = Luxe.draw.line({
            p0 : new Vector(), p1: new Vector(),
            color : new Color(0.1,0.5,1,0),
            depth:0.5
        });
        finger = Luxe.draw.ring({
            x : 0, y: 0, r : finger_size,
            color : new Color(1,1,1,0.1),
            depth:0.5
        });

        var mainring = Luxe.draw.ring({
            x : center.x, y:center.y,
            r : distance,
            color : new Color(1,1,1,0.75),
            depth : 2,
        });

        var field = Luxe.draw.circle({
            x:center.x, y:center.y, 
            r: field_distance,
            color : new Color().rgb(0x121212),
            depth:0
        });
        
        dragger = Luxe.draw.circle({
            x:center.x, y:center.y, 
            r: drag_center_size,
            color : new Color().rgb(0x242424),
            depth:0
        });

        dragger.color.a = 1;

        jumper = Luxe.draw.arc({
            x : center.x, y:center.y,
            r : distance*0.97,
            color : new Color(0.2,0.5,1,1),
            end_angle : 180, 
            depth : 5, group : 2
        });

        aim = Luxe.draw.arc({
            x : center.x, y:center.y,
            r : field_distance,
            color : new Color(1,0.3,0.1,0),
            start_angle : -5,
            end_angle : 5,
            depth : 5, group : 4
        });

        aim_point = Luxe.draw.circle({
            x:center.x, y:center.y,
            r : finger_size*0.05, 
            color : new Color(1,0.3,0.1,0)
        }); 

        // aim.enabled = false;

        Luxe.addGroup(2, 
            function(b:Batcher){ Luxe.renderer.state.lineWidth( finger_size*0.05 ); },
            function(b:Batcher){ Luxe.renderer.state.lineWidth( finger_size*0.02 ); }
        );
        Luxe.addGroup(4, 
            function(b:Batcher){ Luxe.renderer.state.lineWidth( finger_size*0.03 ); },
            function(b:Batcher){ Luxe.renderer.state.lineWidth( finger_size*0.02 ); }
        );

        mainring.locked = true;

        player = new Visual({
            pos: new Vector(0,0),
            size: new Vector(64,48),
            depth : 8, 
            geometry : Luxe.draw.circle({
                r: finger_size*0.2,
            })
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
        } else {
            Luxe.audio.play('music', 999999);
        }

        power.p1 = player.pos;     

        unset_dragging();
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
        var delay = (3 + Std.random(3));
        Luxe.timer.schedule( delay , spawn_enemy );

        if(!inited) return;

        var e = player_enemies.get();
        if(!e.get('enemy').alive) { 
            e.get('enemy').live();
        }

    } //spawn_

    public var health : Float = 3;
    public function take_damage(amount:Float) {
    
        if(success) return;

        Luxe.audio.play('take_damage');

        player.color.tween(0.2, {r:1,g:0,b:0}).onComplete(function(){
            player.color.tween(0.1, {r:0.2,g:0.5,b:1});
        });

        Actuate.tween(player.scale, 0.2, {x:1.3, y:1.3}).onComplete(function(){
            Actuate.tween(player.scale, 0.1, {x:1, y:1});
        });

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

        Luxe.audio.play('die');
        Luxe.audio.play('distant_explode');
        Luxe.audio.play('enemy_explode');

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

        #if !mobile
            holding = true;
            on_down(e.pos);
        #end

        p1.x = e.pos.x; p1.y = e.pos.y;

        ondrag(e.pos);

    } //onmousedown


    function set_shoot_inrange() {
        
    }

    function unset_shoot_inrange() {
        
    }

    function update_mode_common( pos:Vector ) {

        if(success) return;

        var dx = pos.x - player.pos.x;
        var dy = pos.y - player.pos.y;

        _range_scale.set(dx,dy);

        range_length = _range_scale.length;
        range_p_angle = Math.abs(player.pos.rotationTo(center));
        range_angle = luxe.utils.Maths.wrap_angle( player.pos.rotationTo(pos) + range_p_angle, 0, 360);
        range_o_angle = luxe.utils.Maths.wrap_angle(range_angle-45,0,90) - 45;

    } //update_mode_common

    var p1 : Vector;

    public function onmouseup( e:MouseEvent ) {
        
        if(success) return;

        holding = false;
        downmode = PlayMode.none;

        p1.x = e.pos.x; p1.y = e.pos.y;        

        var last_play_mode = playmode;

        unset_dragging();            

        if(Luxe.timescale != default_timescale) { Luxe.timescale = default_timescale; }

        switch(last_play_mode) {
            case PlayMode.move: 
                move_player( rotation, range_o_angle );
            case PlayMode.shoot:
                shoot();
            default:
        }

        return;
            
    } //onmouseup

    
    function shoot() {
        // trace("shooting at " + range_angle + ' with power ' + Vector.Subtract(p1,player.pos).length );
        if(success) return; 

        var now = haxe.Timer.stamp();            
        if(now >= shoot_time) {
            shoot_time = now + 0.4;                
        } else {
            return;
        }

        if(shoot_power > 0) {

            Luxe.audio.play('shoot2');

            var b = player_bullets.get();

                b.pos.x = player.pos.x;
                b.pos.y = player.pos.y;

                // var d = Vector.Subtract(p1,player.pos);
                //if shooting inverted, its other way around
                var d = Vector.Subtract(player.pos, p1);
                b.get('projectile').live( d.inverted.normalized.multiplyScalar(shoot_power) );

        }

    }

    function move_player( angle_player:Float, angle_opp:Float ) {

        if(success) return;

        Luxe.audio.play('jump');

        player.color.tween(0.1, {a:0}, true).onComplete(function(){

            power.color.tween(0.1, {a:1}, true).onComplete(function(){
                power.color.tween(0.1, {a:0.2}, true).onComplete(function(){
                    power.color.tween(0.6, {a:0}, true);
                });
            });

            var _opp_side = angle_player + 180;
            var _opp_off = _opp_side + (angle_opp*2);
                dest.pos.x = __x( _opp_off );
                dest.pos.y = __y( _opp_off );

            var _final_angle = luxe.utils.Maths.wrap_angle( _opp_off, 0, 360);
              
                power.p1 = player.pos.clone();
                set_pos(_final_angle);                   

                player.color.a = 1;
                Luxe.camera.shake(1.4);

            jumper.rotation.setFromEuler(new Vector(0,0,luxe.utils.Maths.degToRad(rotation)));

        }); //fade out

    } //move_player

    public function ontouchbegin( e:TouchEvent ) {
        holding = true;
        on_down(e.pos);
    }
    public function ontouchend( e:TouchEvent ) {
        holding = false;
        downmode = PlayMode.none;
    }

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

    public function lose_progress() {
        
        if(progress == 0) {
            return;
        }

        progress--;
        progress_bars.index--;
        var b = progress_bars.get();
        b.color.tween( 0.2, {a:0.1}, true );

        progress_bars.index--;

    }

    public function kill_enemy() {

        if(success) return;

        progress++;

        var b = progress_bars.get();
            b.color.tween( 0.2, {a:1}, true );

        if(progress == 10) {
            success = true;
            Luxe.timescale = 0.1;
            kill(true);
            Luxe.timer.schedule(0.5, function(){                
                Luxe.timescale = 1;                
                Luxe.timer.schedule(0.5, function(){
                    main.show_end('stage1.level1');
                });                
            });
        }

    } //kill_enemy

    var draggable : Bool = false;
    var holding : Bool = false;

    function check_draggable(p:Float) {
        if(p <= (finger_size) && holding) {
            draggable = true;            
        } else {
            draggable = false;
        }

        return draggable;
    }

    function set_dragging() {
        // dragger.color.a = 1;
        dragging = true;
    }

    function unset_dragging() {

        // dragger.color.a = 0.5;
        dragging = false;

        unset_mode_all();
    }

    function set_mode_move() {
        
        if(playmode == PlayMode.move) return;

        unset_mode_shoot();

        playmode = PlayMode.move;
        
        dragger.color.r = 0.2; 
        dragger.color.g = 0.5; 
        dragger.color.b = 1;

        player.color.r = 0.2;
        player.color.g = 0.5;
        player.color.b = 1;

        dest.color.tween(0.2, {a:1}, true);
        jumper.color.tween(0.2, {a:1}, true);
    }
    
    function unset_mode_move() {
        
        if(playmode != PlayMode.move) return;

        set_mode_none();

        dest.color.tween(0.5, {a:0}, true);
        // jumper.color.tween(0.5, {a:0.4}, true);

    }

    function unset_mode_all() {
        unset_mode_move();
        unset_mode_shoot();
        set_mode_none();       
    }

    function set_mode_none() {    
        playmode = PlayMode.none; 

        dragger.color.r = 0.1411; 
        dragger.color.g = 0.1411; 
        dragger.color.b = 0.1411;
        
        player.color.r = 1;
        player.color.g = 1;
        player.color.b = 1;
    }

    function set_mode_shoot() {

        if(playmode == PlayMode.shoot) return;

        unset_mode_move();

        playmode = PlayMode.shoot;

        dragger.color.r = 1;
        dragger.color.g = 0.3;
        dragger.color.b = 0.1;

        player.color.r = 1;
        player.color.g = 0.3;
        player.color.b = 0.1;

        aim.color.tween(0.2, {a:1}, true );
        aim_point.color.tween(0.2, {a:1}, true );

    }

    function unset_mode_shoot() {

        if(playmode != PlayMode.shoot) return;

        set_mode_none();

        aim.color.tween(0.5, {a:0}, true );
        aim_point.color.tween(0.5, {a:0}, true );

    }

    function update_mode_move(pos:Vector) {

            //in range for moving    
        var range_spread : Float = 44;

        // trace("in range to move: " + range_angle + " / range_o_angle: " + range_o_angle);        

        var _opp_side = rotation + 180;
        var _opp_off = _opp_side + (range_o_angle * 2);
            dest.pos.x = __x( _opp_off );
            dest.pos.y = __y( _opp_off );

    }

    var endpos : Vector;

    function get_linepoint_on_arc(pos:Vector) {

        var lineend = pos.clone();
        var linestart = player.pos.clone();
            //Calculate terms of the linear and quadratic equations
        var M = (lineend.y - linestart.y) / (lineend.x - linestart.x);
        var B = linestart.y - M * linestart.x;
        var a = 1 + M*M;
        var b = 2 * (M*B - M*center.y - center.x);
        var c = center.x * center.x + B * B +  center.y * center.y -
                field_distance * field_distance - 2 * B * center.y;

        // solve quadratic equation
        var sqRtTerm = Math.sqrt(b * b - 4 * a * c);
        var __x = ((-b) + sqRtTerm)/(2*a);
        // make sure we have the correct root for our line segment
        if ((__x < linestart.x) || (__x > lineend.x)){ __x = ((-b) - sqRtTerm)/(2*a); }
        //solve for the y-component
        var __y = M * __x + B;
        // Intersection Calculated
        endpos.x = __x;
        endpos.y = __y;
    }

    function update_mode_shoot(pos:Vector) {

        // aim.pos = pos.clone().add(Vector.Subtract(pos,player.pos).normalized.multiply(new Vector(finger_offset, finger_offset)));
        get_linepoint_on_arc(pos);
        // aim.rotation.setFromEuler(new Vector(0,0,luxe.utils.Maths.degToRad((aim.pos.rotationTo(player.pos)+90)) ));        
            //get the point on the circle the player is aiming at
        aim.rotation.setFromEuler( new Vector(0,0,luxe.utils.Maths.degToRad( endpos.rotationTo(center)+90 )) );
        aim_point.pos = endpos;

        var range_spread : Float = 90;

        if((range_angle <= range_spread && range_angle >=0) || (range_angle >= (360-range_spread) && range_angle <= 360)) {             
            set_shoot_inrange();
        } else { //if within angle
            unset_shoot_inrange();
        }
    }

    var playmode : PlayMode;
    var downmode : PlayMode;

    public function on_down( pos:Vector ) {

        var d = Vector.Subtract(pos,center);
        var d1 = Vector.Subtract(pos,player.pos);

        var down_distance = d.length;
        var down_distance_from_player = d1.length;
        var inside_field = down_distance <= field_distance;
        var inside_player = down_distance_from_player <= finger_size;

        downmode = PlayMode.none;

        if(inside_player) {
            downmode = PlayMode.move;
        } else if(!inside_field) {
            downmode = PlayMode.shoot;
        }

    } //on_down

    var move_spread : Float = 44;

    public function ondrag( pos:Vector ) {        

            //update the target
        p1.x = pos.x; p1.y = pos.y;
            //know where the mouse is in relation to the center
        var d = Vector.Subtract(pos,player.pos);
        var drag_distance_from_player = d.length;


            //only care about changes to modes we are in, dragging is true when moving the player
        if(!dragging) {

            if(downmode == PlayMode.move) {

                if(check_draggable(drag_distance_from_player)) {
                    set_dragging();
                }

            } //move

        } else { //not/w dragging

                //if we are not dragging, we update the modes
            if(downmode == PlayMode.move) {

                var _moveable = false;
                if((range_angle <= move_spread && range_angle >=0) || (range_angle >= (360-move_spread) && range_angle <= 360)) {  
                    _moveable = true;
                }

                if(drag_distance_from_player > (finger_size) && _moveable) {
                    set_mode_move();
                } else {
                    unset_mode_move();
                }

            } //move

        } //!dragging

        if(downmode == PlayMode.shoot) {

                //outside the ring = shooting
            if(holding) {                        
                set_mode_shoot();
            } else {
                unset_mode_shoot();
            }

        } //shoot

        if(playmode != PlayMode.none) {

            var slowp = 1.0 - (drag_distance_from_player/(timesize));
            if(slowp < 0.06) slowp = 0.06;
            
                Luxe.timescale = slowp;

        } else {
            if(Luxe.timescale != default_timescale) { Luxe.timescale = default_timescale; }
        }

        update_mode_common( pos );

        switch(playmode) {
            case move:
                update_mode_move( pos );
            case shoot:
                update_mode_shoot( pos );
            default:
        }

    } //ondrag

    public function ondrags( pos:Vector ) {

        if(success) return;
        
        // power.p1 = pos;
        // aim.pos = pos;
        // aim.pos = pos.clone().add(Vector.Subtract(pos,player.pos).normalized.multiply(new Vector(finger_offset, finger_offset)));
        // aim.rotation.setFromEuler(new Vector(0,0,luxe.utils.Maths.degToRad((aim.pos.rotationTo(player.pos)+90)) ));
            p1.x = pos.x; p1.y = pos.y;

        // check_drag(pos);

        var pre_in = inrange;
        var pre_shoot = shoot_range;

        // get_inrange(pos);

        if(pre_in && !inrange) {
            dhid = true;
            // dest.color.tween(0.5, {a:0}, true);
            jumper.color.tween(0.5, {a:1}, true);

            dragger.color.r = 1;
            dragger.color.g = 1;

        }

        if(pre_shoot && !shoot_range) {
            shid = true;
            // power.enabled = false;
            // aim.enabled = false;
        }

        if(inrange) {

            dragger.color.r = 0.2;
            dragger.color.g = 0.5;

            if(dhid) {
                dhid = false;
                // dest.color.tween(0.2, {a:1}, true);
                jumper.color.tween(0.2, {a:1}, true);
            }

            var _opp_side = rotation + 180;
            var _opp_off = _opp_side + (range_o_angle*2);
                dest.pos.x = __x( _opp_off );
                dest.pos.y = __y( _opp_off );            

        } //dragging && in_range


        if(shoot_range) {
            
            if(shid) {
                shid = false;
                // aim.enabled = true;
            }
            
        }

    } //ondrag

  

    public function update(dt:Float) {

    } //update

} //Stage1Level1
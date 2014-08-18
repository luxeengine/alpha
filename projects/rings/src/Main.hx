
import luxe.Color;
import luxe.Input;
import luxe.Rectangle;
import luxe.Sprite;
import luxe.States;

import levels.Stage1Level1;
import luxe.Text;
import luxe.tween.Actuate;
import luxe.Vector;
import phoenix.BitmapFont;
import phoenix.geometry.Geometry;

class Main extends luxe.Game {

    public var states : States;

    public var left_geom:Geometry;
    public var right_geom:Geometry;
    public var text:Sprite;

    var next_tap : Dynamic;
    public var rot : Float = 0;

    override function config(config:luxe.AppConfig) {
        config.window.antialiasing = 2;

        return config;
    }

    override function ready() {

        Luxe.update_rate = 1/60;
        Luxe.fixed_delta = 1/60;

        states = new States();
        states.add_state(Stage1Level1, 'stage1.level1', { init_with:this });

        states.init();

        Luxe.audio.create('assets/distant_explode.ogg', 'distant_explode');
        Luxe.audio.create('assets/enemy_explode.ogg', 'enemy_explode');
        Luxe.audio.create('assets/take_damage.ogg', 'take_damage');
        Luxe.audio.create('assets/die.ogg', 'die');
        Luxe.audio.create('assets/jump.ogg', 'jump');
        Luxe.audio.create('assets/shoot.ogg', 'shoot');
        Luxe.audio.create('assets/shoot2.ogg', 'shoot2');
        Luxe.audio.create('assets/UMBRA_ANDRIO.ogg', 'music', true);

            //create the geometries
        left_geom = Luxe.draw.box({
            x:0,               y:-Luxe.screen.h,
            w:Luxe.screen.w/4, h:Luxe.screen.h,
            color: new Color(0,0,0,1).rgb(0x141615),
            depth:10
        });

        right_geom = Luxe.draw.box({
            x:Luxe.screen.w*0.75, y:Luxe.screen.h*2,
            w:Luxe.screen.w/4, h:Luxe.screen.h,
            color: new Color(0,0,0,1).rgb(0xfafeff),
            depth:10
        });


        left_geom.vertices[1].pos.x = Luxe.screen.w * 0.75;
        right_geom.vertices[3].pos.x = -Luxe.screen.w * 0.50;

        var line_x1 : Float = Luxe.screen.w * 0.75;
        var line_x2 : Float = Luxe.screen.w * 0.25;

        var line_1 : Vector = new Vector(line_x1, 0);
        var line_2 : Vector = new Vector(line_x2, Luxe.screen.h);

        rot = line_2.rotationTo( line_1 );
            rot = luxe.utils.Maths.wrap_angle( rot, 0, 360 );

        text = new Sprite({
            no_scene : true,
            size : new Vector(),
            pos : new Vector(Luxe.screen.w/2, Luxe.screen.h/2),
            rotation_z : -(90-rot),
            color : new Color(1,1,1,0),
            depth:10
        });

        show_start('stage1.level1');

    } //ready

    public function show_start( _level:String ) {

        text.destroy();
        text = null;

        trace("_level : " + _level);

        text = new Sprite({
            no_scene : true,
            texture : Luxe.loadTexture('assets/stage_text/'+_level+'.png'),
            pos : new Vector(Luxe.screen.w/2, Luxe.screen.h/2),
            rotation_z : -(90-rot),
            color : new Color(1,1,1,0),
            depth:10
        });

        Actuate.tween( left_geom.transform.pos, 0.3, { y:0 } );
        Actuate.tween( right_geom.transform.pos, 0.4, { y:0 } ).onComplete(function(){
            text.color.tween(0.2, {a:1}, true);
            next_tap = function(){
                hide_start(0.050, function(){
                    states.set('stage1.level1');
                });
            }
        });

    } //show_start

    public function show_end( _level:String, _next:String='' ) {

        text.destroy();
        text = null;

        text = new Sprite({
            no_scene : true,
            texture : Luxe.loadTexture('assets/stage_text/'+_level+'.end.png'),
            pos : new Vector(Luxe.screen.w/2, Luxe.screen.h/2),
            rotation_z : -(90-rot),
            color : new Color(1,1,1,0),
            depth:10
        });

        Actuate.tween( left_geom.transform.pos, 0.3, { y:0 } );
        Actuate.tween( right_geom.transform.pos, 0.4, { y:0 } ).onComplete(function(){
            text.color.tween(0.2, {a:1}, true);
            next_tap = function() {
                // if(_next != '') {
                    hide_start(0, function(){
                        states.set('stage1.level1', true);
                    });
                // }
            }
        });

    } //show_start

    public function hide_start( t:Float, _complete ) {
        text.color.tween(0.2, {a:0}, true).onComplete(function(){
            Actuate.tween( left_geom.transform.pos, 0.4, { y:-Luxe.screen.h } , true).onComplete(function(){
                snow.utils.Timer.delay(t, _complete);
            });
            Actuate.tween( right_geom.transform.pos, 0.3, { y:Luxe.screen.h*2 }, true );
        });
    }

    override function ontouchup(e:TouchEvent) {
        states.ontouchup(e);
    }

    override function ontouchdown(e:TouchEvent) {
        states.ontouchdown(e);
    }

    override function ontouchmove(e:TouchEvent) {
        states.ontouchmove(e);
    } //ontouchmove

    override function onmousedown(e:MouseEvent) {
        states.onmousedown(e);
    } //onmousedown

    override function onmousemove(e:MouseEvent) {
        states.onmousemove(e);
    } //onmousemove

    override function onmouseup(e:MouseEvent) {

        if(next_tap != null) {
            next_tap();
            next_tap = null;
            return;
        }

        states.onmouseup(e);

    } //onmouseup

    override function onkeyup( e:KeyEvent ) {
        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }
    }

    override function update( dt:Float ) {
        states.update(dt);
    }

} //Main

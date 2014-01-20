
package menus;


import luxe.States;

import luxe.Color;
import luxe.Vector;
import luxe.Sprite;
import luxe.Text;
import luxe.Input;
import luxe.Rectangle;

import phoenix.BitmapFont;
import phoenix.geometry.CompositeGeometry;
import phoenix.geometry.Geometry;
import phoenix.Shader;
import phoenix.Batcher;

import haxe.Timer;

import luxe.utils.UUID;
import luxe.Entity;
import luxe.Scene;

import luxe.Camera;
import luxe.Particles;

import luxe.tween.Actuate;

class Menu extends State {   

    public var game : Game;
    public var mouse : Vector;

    public var play : Sprite;
    public var back : Sprite;

    public var fontb : BitmapFont;
    var particles : ParticleSystem; 

    public var dttext : Text;

    public function init( _game:Game ) {    

        trace("init menu");

        game = _game;
        mouse = new Vector();        

        back = new Sprite({
            name : 'back',
            centered : false,
            pos : new Vector(0, 0),
            size : new Vector(960, 640),
            color : new Color().rgb(0x121212)            
        });

        play = new Sprite({
            name:'play',
            centered: false,
            pos : new Vector(0,0),
            depth:1,
            texture : Luxe.loadTexture('assets/menus/bg.png'),
        });

            //By locking a piece of geometry, 
            //It is sent only once to the graphics card (STATIC_DRAW VBO)
        play.locked = true;
        back.locked = true;

    }

    public function reset() {
        
    } //reset

    public function playClicked() {
        game.states.set('manager');
    }

    public function onmouseup(e) {

        mouse = new Vector(e.x, e.y);

        if( play.point_inside(mouse) ) {
            playClicked();  
        } 

    }

    public function onmousemove(e) {    
        mouse = new Vector(e.x, e.y);
    }

    public function update(dt:Float) {
        
    }
   
    public function onkeyup(e:Dynamic) {
        
    }

    public function onkeydown(e:Dynamic) {
        
        if(e.value == 27) {
            Luxe.shutdown();
        }   

        if( e.value == Input.Keys.key_S ) {
            Luxe.camera.shake(10);
        }
    }

    public function enter() {
        play.visible = true;
        back.visible = true;   
    }

    public function leave() {
        
        play.visible = false;
        back.visible = false;

    }

}
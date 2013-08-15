
package menus;


import mode.Mode;

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

import motion.Actuate;

class Menu extends Mode {   

    public var mouse : Vector;

    public var play : Sprite;
    public var back : Sprite;

    public var fontb : BitmapFont;
    var particles : ParticleSystem; 

    public var dttext : Text;

    public function init() {    

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


        var t1 = Luxe.loadTexture('assets/flame.png');
        var t2 = Luxe.loadTexture('assets/smoke.png');
        var t3 = Luxe.loadTexture('assets/embers.png');

            //Create a particle system entity in the scene
        particles = Luxe.scene.create(ParticleSystem,'mainparticles'); 
            //Move to center screen       
        particles.pos = new Vector(480,320);

        particles.add_emitter({
            name : 'flames', 
            particle_image:t1,
            pos : particles.pos,
            start_size:new Vector(96,64),
            end_size:new Vector(20,20),
            end_color:new Color(1.0,0.2,0.2,0),
            gravity : new Vector(0,-6),
            life:0.9,
            depth:2,
            group:5,
            emit_time : 0.04
        });
 
        particles.add_emitter({
            name : 'smoke',
            particle_image : t2,
            start_color : new Color(0.0,0.0,0.0,0.7),
            end_color : new Color(0.3,0.3,0.3,0),
            start_size : new Vector(80,80),
            end_size : new Vector(200,200),
            end_size_random : new Vector(40,40),
            gravity : new Vector(0,-4),
            life : 1.2,
            depth:1,
            group:2,
            emit_time : 0.2
        });

        particles.add_emitter({
            name : 'embers',
            particle_image : t3,
            rotation:0,
            rotation_random:0,
            end_rotation:0,
            end_rotation_random:0,
            end_color : new Color(0,0,0,0).rgb(0xff8a00),
            start_size : new Vector(32,32),
            end_size : new Vector(72,72),
            gravity : new Vector(0,-2),
            life : 1.2,
            depth:3,
            group:5,
            emit_time : 0.5
        });

            //By locking a piece of geometry, 
            //It is sent only once to the graphics card (STATIC_DRAW VBO)
        play.locked = true;

            //We want the particles in group 5 to be blended in additive blending

        Luxe.renderer.default_batcher.add_group(5, 
            function(b:Batcher){
                b.blend_mode(BlendMode.src_alpha, BlendMode.one);
            }, 
            function(b:Batcher){
                b.blend_mode();
            }
        );

        back.visible = true;        

    }

    public function start() {
        
    }

    public function playClicked() {

        // game.modes.set('level01');
        play.flipx = !play.flipx;
        trace('xflip ' + play.flipx);
    }

    public function mouseup(e) {

        mouse = new Vector(e.x, e.y);
        if( play.point_inside(mouse) ) {
            playClicked();  
        } else {
            play.flipy = !play.flipy;
            trace('yflip '  + play.flipy);
        }

        if(particles != null) {
            if(particles.active) {
                // particles.stop();
            } else {
                // particles.emit(-1);
            }
        }
        
    }

    public function mousemove(e) {    
        mouse = new Vector(e.x, e.y);
        if(particles!=null) particles.pos = mouse;
    }

    public function update(dt:Float) {
        
    }
   
    public function keyup(e:Dynamic) {
        
    }

    public function keydown(e:Dynamic) {
        
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
        // particles.init();
    }

    public function leave() {
        
        play.visible = false;
        back.visible = false;
        // if(particles != null) particles.destroy();
    }

}
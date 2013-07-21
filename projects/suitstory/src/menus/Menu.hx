
package menus;

import lab.Rectangle;
import mode.Mode;

import lab.Color;
import lab.Vector;
import lab.Sprite;
import lab.Text;
import lab.Input;

import phoenix.BitmapFont;
import phoenix.geometry.CompositeGeometry;
import phoenix.geometry.Geometry;
import phoenix.Shader;
import phoenix.Batcher;
import haxe.Timer;

import lab.utils.UUID;
import lab.Entity;
import lab.Scene;

import lab.Camera;
import lab.Particles;

import motion.Actuate;


class Menu extends Mode {   

    public var mouse : Vector;

    public var play : Sprite;
    public var back : Sprite;

    public var fontb : BitmapFont;
    var particles : ParticleSystem; 

    public var t : Text;

    public function init() {

        // var image_bytes : haxe.io.Bytes = cast lime.utils.Assets.getBytes('assets/def_0.png');
        // var bytes_string = image_bytes.toHex();
        // var final_string = '"';
        // var current_string = '';

        // for(i in 0...Std.int(bytes_string.length/2) ) {
        //     var p = i * 2;
        //     var b = bytes_string.substr(p, 2);
        //     final_string += '0x'+b+' ';
        //     if(final_string.length)            
        // }

        // final_string +='";';
        // sys.io.File.saveContent('test.font', final_string);
        // trace("SAVING");

        mouse = new Vector();        

        // play = new Sprite({
        //     add:false,
        //     centered: false,
        //     pos : new Vector(0,0),
        //     texture : Lab.loadTexture('assets/menus/bg.png'),
        // });

        var ttt = Lab.loadTexture('assets/menus/bg.png');
        var lol : lab.Sprite = new lab.Sprite({
            texture: ttt, 
            depth: 100
        });

        lol.pos.x = 100;
        lol.pos.y = 100;

        // back = new Sprite({
        //     centered : false,
        //     pos : new Vector(0, 0),
        //     size : new Vector(960, 640),
        //     color : new Color().rgb(0xcc0000)            
        // });

        var t1 = Lab.loadTexture('assets/flame.png');
        var t2 = Lab.loadTexture('assets/smoke.png');
        var t3 = Lab.loadTexture('assets/embers.png');

        // particles = back.add(ParticleSystem,'mainparticles');
        
        // particles.pos = new Vector(480,320);
        // particles.add_emitter({
        //     name : 'flames', 
        //     particle_image:t1,
        //     pos : particles.pos,
        //     start_size:new Vector(96,64),
        //     end_size:new Vector(20,20),
        //     gravity : new Vector(0,-6),
        //     life:0.9,
        //     depth:2,
        //     group:5,
        //     emit_time : 0.04
        // });

        // particles.add_emitter({
        //     name : 'smoke',
        //     particle_image : t2,
        //     start_color : new Color(0.0,0.0,0.0,0.7),
        //     end_color : new Color(0.3,0.3,0.3,0),
        //     start_size : new Vector(80,80),
        //     end_size : new Vector(200,200),
        //     end_size_random : new Vector(40,40),
        //     gravity : new Vector(0,-4),
        //     life : 1.2,
        //     depth:1,
        //     group:2,
        //     emit_time : 0.2
        // });

        // particles.add_emitter({
        //     name : 'embers',
        //     particle_image : t3,
        //     rotation:0,
        //     rotation_random:0,
        //     end_rotation:0,
        //     end_rotation_random:0,
        //     end_color : new Color(0,0,0,0).rgb(0xff8a00),
        //     start_size : new Vector(32,32),
        //     end_size : new Vector(72,72),
        //     gravity : new Vector(0,-2),
        //     life : 1.2,
        //     depth:3,
        //     group:5,
        //     emit_time : 0.5
        // });

        // particles.stop();

        Lab.renderer.default_batcher.add_group(5, 
            function(b:Batcher){
                b.blend_mode(BlendMode.src_alpha, BlendMode.one);
            }, 
            function(b:Batcher){
                b.blend_mode();
            }
        );

    }

    public function start() {
        
    }

    public function playClicked() {

        game.modes.set('level01');
    }

    public function mouseup(e) {

        mouse = new Vector(e.x, e.y);
        // if( play.point_inside(mouse) ) {
            // playClicked();  
        // }

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
        //todo!
        //for some reason the text changing text is way slower than it should be.
        // t.text = 'dt: ' +dt + ' \nflames particles: ' + particles.get('flames').particle_count + ' \nsmoke particles: ' + particles.get('smoke').particle_count;
    }
   
    public function keyup(e:Dynamic) {
    }

    public function keydown(e:Dynamic) {
        
        if(e.value == 27) {
            Lab.shutdown();
        }   

        if( e.value == Input.Keys.key_S ) {
            Lab.camera.shake(10);
        }
    }

    public function enter() {
        // play.visible = true;
  //      back.visible = true;        
    }

    public function leave() {
        // play.visible = false;
        // back.visible = false;
//        particles.destroy();
    }

}

import lime.utils.ByteArray;
import lime.utils.Float32Array;
import luxe.Vector;
import luxe.Color;
import luxe.Input;
import luxe.Entity;
import luxe.Particles;
import luxe.Sprite;
import phoenix.Batcher;

class Derp extends luxe.Entity {
    public function init() {
        trace("derping init");
    }
    public function destroy() {
        trace("destroying derp instance");
    }
}

class Main extends luxe.Game {

    public var mouse : Vector;

    var particle_system : Entity;
    var particles : ParticleSystem;

    var ss : Sprite ;

    public function ready() {

        mouse = new Vector();


        var t1 = Luxe.loadTexture('assets/flame.png');
        var t2 = Luxe.loadTexture('assets/smoke.png');
        var t3 = Luxe.loadTexture('assets/embers.png');

        particles = Luxe.scene.create( ParticleSystem,'particles');
        
        particles.pos = new Vector(Luxe.screen.w/2,Luxe.screen.h/2);
        particles.add_emitter({
            name : 'flames', 
            particle_image:t1,
            pos : particles.pos,
            start_size:new Vector(96,64),
            end_size:new Vector(20,20),
            gravity : new Vector(0,-6),
            life:0.9,
            depth:2,
            group:5,
            emit_time : 1
        });

        ss = new Sprite({
            texture : t2,
            pos : new Vector()
        });

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
            emit_time : 1
        });

        

        Luxe.renderer.default_batcher.add_group(5, 
            function(b:Batcher){
                b.blend_mode(BlendMode.src_alpha, BlendMode.one);
            }, 
            function(b:Batcher){
                b.blend_mode();
            }
        );   

    } //ready
  
    public function onmousemove(e) {
        mouse.set(e.x,e.y);
        // particles.pos = mouse; 

        ss.pos = mouse;
    }
    public function onmousedown(e) {
        mouse.set(e.x,e.y);
    }
    public function onmouseup(e) {
        mouse.set(e.x,e.y);
    }

    public function onkeyup(e) {

      if(e.value == Input.Keys.escape) {
        Luxe.shutdown();
      }
    } //onkeyup

    public function update(dt:Float) {


    } //update

    public function shutdown() {

    } //shutdown
}



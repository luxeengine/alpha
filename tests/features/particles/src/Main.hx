
import lumen.utils.ByteArray;
import lumen.utils.Float32Array;

import luxe.Vector;
import luxe.Color;
import luxe.Input;
import luxe.Entity;
import luxe.Particles;
import luxe.Sprite;

import phoenix.Batcher;


class Main extends luxe.Game {


    public var mouse : Vector;

    var particle_system : Entity;
    var particles : ParticleSystem;

    var ss : Sprite;


    public function ready() {

        mouse = new Vector();


        var t1 = Luxe.loadTexture('assets/flame.png');
        var t2 = Luxe.loadTexture('assets/smoke.png');
        var t3 = Luxe.loadTexture('assets/embers.png');

        particles = Luxe.scene.create(ParticleSystem, 'particles');

        particles.add_emitter({
            name : 'flames',
            particle_image:t1,
            pos : new Vector(0,0),
            start_size:new Vector(96,64),
            end_size:new Vector(20,20),
            gravity : new Vector(0,-90),
            life:0.9,
            depth:2,
            group:5,
            rotation_random:360,
            emit_time : 0.05
        });

        ss = new Sprite({
            texture : t1,
            pos : new Vector(),
            size : new Vector(32,32)
        });

        particles.add_emitter({
            name : 'smoke',
            particle_image : t2,
            start_color : new Color(0.0,0.0,0.0,0.7),
            end_color : new Color(0.3,0.3,0.3,0),
            start_size : new Vector(80,80),
            end_size : new Vector(200,200),
            end_size_random : new Vector(40,40),
            gravity : new Vector(0,-40),
            life : 1.2,
            rotation_random:360,
            depth:1,
            group:2,
            emit_time : 0.2
        });

        particles.add_emitter({
            name : 'embers',
            particle_image : t3,
            end_color : new Color(0,0,0,0).rgb(0xff8a00),
            start_size : new Vector(32,32),
            end_size : new Vector(64,64),
            gravity : new Vector(0,-90),
            life : 0.8,
            end_speed : 0,
            depth:3,
            group:5,
            emit_time : 0.3
        });

        Luxe.renderer.batcher.add_group(5,
            function(b:Batcher){
                b.blend_mode(BlendMode.src_alpha, BlendMode.one);
            },
            function(b:Batcher){
                b.blend_mode();
            }
        );

    } //ready

    public function onmousemove( e:MouseEvent ) {

        mouse.set(e.x,e.y);
        particles.pos = mouse;

        ss.pos = mouse;

    } //onmousemove

    public function onmousedown( e:MouseEvent ) {
        mouse.set(e.x,e.y);
        if(particles.enabled) {
            particles.stop();
        } else {
            particles.emit();
        }
    } //onmousedown

    public function onmouseup( e:MouseEvent ) {
        mouse.set(e.x,e.y);
    } //onmouseup

    public function onkeyup( e:KeyEvent ) {
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }
    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function destroyed() {

    } //destroyed


} //Main

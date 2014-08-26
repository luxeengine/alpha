package luxe;

import luxe.Component;
import phoenix.Texture;

import luxe.options.ParticleOptions;

class ParticleSystem extends Entity {


    public var enabled : Bool = true;
    public var emitters : Map<String, ParticleEmitter>;


    override function init( ) {

        if(emitters == null) {
            new Map<String, ParticleEmitter>();
        }

    } //init

    public function add_emitter(_template:ParticleEmitterOptions) {

        if(emitters == null) emitters = new Map<String, ParticleEmitter>();

        var _name : String = '';

        if(_template.name != null) {
            _name = _template.name;
        } //_template.name != null

        if(_name.length == 0) {
            _name = Luxe.utils.uniqueid();
        } //_name.lengths

            //create the emitter instance
        var _emitter = new ParticleEmitter({ system:this, template:_template });
            add( _name, _emitter );
                //store the reference of the emitter
            emitters.set(_name, _emitter);

    } //add_emitter

    public function emit(duration:Float = -1) {
        enabled = true;
        for(emitter in emitters) {
            emitter.emit(duration);
        }
    } //emit

    public function stop() {
        enabled = false;
        for(emitter in emitters) {
            emitter.stop();
        }
    } //stop

    override function destroyed() {
        for(emitter in emitters) {
            emitter.destroy();
        }
    } //destroy

    override function update(dt:Float) {
        if(!enabled) return;
        // trace(">>> updating " + name);
        for(emitter in emitters) {
            emitter.update(dt);
        }
    } //update


} //Particle System


typedef ParticleEmitterInitData = {
    system : ParticleSystem,
    template : ParticleEmitterOptions
} //ParticleEmitterInitData

class ParticleEmitter extends Component {

    public var particle_system : ParticleSystem;

    public var enabled : Bool = true;
    public var emit_count : Int = 1;
    public var active_particles : Array<Particle>;

    public var elapsed_time : Float = 0;
    public var duration : Float = -1;
    public var emission_rate : Float = 0;
    public var emit_next : Float = 0;
    public var emit_last : Float = 0;
    public var particle_index : Int = 0;

    public var particle_cache : Array<Sprite>;
    public var cache_size : Int = 100;
    public var cache_index : Int = 0;

    public var depth : Float = 0;
    public var group : Int = 0;

        //emitter properties
    public var particle_image : Texture = null;
    public var pos_value : Vector;
    public var pos_offset : Vector;
    public var pos_random : Vector;
    public var emit_time : Float;
    public var direction : Float;
    public var direction_random : Float;
    public var gravity : Vector;

    public var zrotation : Float = 0;
    public var _position : Vector;

        //:todo : no idea why this radius stuff was here,
        //it might be for spawning in a radial area idk
        //will have to figure out when cleaning this up
    public var radius : Float = 50;
    public var radius_random : Float = 50;

        //particle properties
    public var start_size:Vector;
    public var start_size_random:Vector;
    public var end_size:Vector;
    public var end_size_random:Vector;
    public var speed : Float;
    public var end_speed : Float;
    public var speed_random : Float;
    public var life : Float;
    public var life_random : Float;

    public var rotation_value : Float;
    public var rotation_random : Float;
    public var end_rotation : Float;
    public var end_rotation_random : Float;
    public var rotation_offset : Float;
    public var start_color : Color;
    public var start_color_random : Color;
    public var end_color : Color;
    public var end_color_random : Color;

        //The template
    public var template : ParticleEmitterOptions;

        //internal stuff
    var emit_timer : Float = 0;
    var finish_time : Float = 0;
    var direction_vector : Vector;

    var has_end_rotation : Bool = false;
    var _temp_speed : Vector;
    var _to_remove : Array<Particle>;

    public function new( _data:ParticleEmitterInitData ) {
        super();
        particle_system = _data.system;
        template = _data.template;
    }

    override function init() {

        active_particles = new Array<Particle>();
        particle_cache = new Array<Sprite>();

        emit_timer = 0;
        emit_last = 0;
        emit_next = 0;

        _temp_speed = new Vector();

        _to_remove = [];

        // name = _name;
            //apply defaults
        apply(template);

    } //init

    public function apply(_template:ParticleEmitterOptions) {

        if(_template == null) _template = {};

        (_template.depth != null) ?
            depth = _template.depth :
            depth = 0.0;

        (_template.group != null) ?
            group = _template.group :
            group = 0;
//
        (_template.particle_image != null) ?
            particle_image = _template.particle_image :
            particle_image = null;
//
        (_template.emit_time != null) ?
            emit_time = _template.emit_time :
            emit_time = 0.1;

        (_template.cache_size != null) ?
            cache_size = _template.cache_size :
            cache_size = 100;

        (_template.emit_count != null) ?
            emit_count = _template.emit_count :
            emit_count = 1;

        (_template.direction != null) ?
            direction = _template.direction :
            direction = 0;

        (_template.direction_random != null) ?
            direction_random = _template.direction_random :
            direction_random = 0;

        (_template.speed != null) ?
            speed = _template.speed :
            speed = 0;

//
        (_template.speed_random != null) ?
            speed_random = _template.speed_random :
            speed_random = 0;

        (_template.end_speed != null) ?
            end_speed = _template.end_speed :
            end_speed = 0;

        (_template.life != null) ?
            life = _template.life : life = 1;

        (_template.life_random != null) ?
            life_random = _template.life_random :
            life_random = 0;

//
        (_template.rotation != null) ?
            zrotation = _template.rotation :
            zrotation = 0;

        (_template.rotation_random != null) ?
            rotation_random = _template.rotation_random :
            rotation_random = 0;

        (_template.end_rotation != null)
            ? { end_rotation = _template.end_rotation; has_end_rotation = true; }
            : { end_rotation = 0; }

        (_template.end_rotation_random != null) ?
            end_rotation_random = _template.end_rotation_random :
            end_rotation_random = 0;

        (_template.rotation_offset != null) ?
            rotation_offset = _template.rotation_offset :
            rotation_offset = 0;

//
        (_template.direction_vector != null) ?
            direction_vector = _template.direction_vector :
            direction_vector = new Vector();

        (_template.pos != null) ?
            _position = _template.pos :
            _position = new Vector();

        (_template.pos_offset != null) ?
            pos_offset = _template.pos_offset :
            pos_offset = new Vector();

        (_template.pos_random != null) ?
            pos_random = _template.pos_random :
            pos_random = new Vector(10,0);

        (_template.gravity != null) ?
            gravity = _template.gravity :
            gravity = new Vector(0,-8);

        (_template.start_size != null) ?
            start_size = _template.start_size :
            start_size = new Vector(48,48);

        (_template.start_size_random != null) ?
            start_size_random = _template.start_size_random :
            start_size_random = new Vector(5,5);

        (_template.end_size != null) ?
            end_size = _template.end_size :
            end_size = new Vector(64,64);

        (_template.end_size_random != null) ?
            end_size_random = _template.end_size_random :
            end_size_random = new Vector();

//
        (_template.start_color != null) ?
            start_color = _template.start_color :
            start_color = new Color().rgb(0xff8a00);

        (_template.start_color_random != null) ?
            start_color_random = _template.start_color_random :
            start_color_random = new Color(0,0,0,0);

        (_template.end_color != null) ?
            end_color = _template.end_color :
            end_color = new Color(0,0,0,0);

        (_template.end_color_random != null) ?
            end_color_random = _template.end_color_random :
            end_color_random = new Color(0,0,0,0);

    } //apply

    public function destroy() {

        active_particles = null;
        if(particle_cache != null) {
            for(p in particle_cache) {
                if(p != null) {
                    p.destroy();
                }
            }
        }

        particle_cache = null;

    } //destroy

    public function emit(t:Float) {

        duration = t;
        enabled = true;
        emit_last = 0;
        emit_timer = 0;
        emit_next = 0;

        if(duration != -1) {
            finish_time = Luxe.time + duration;
        }
    }

    public function stop() {
        enabled = false;
        elapsed_time = 0;
        emit_timer = 0;
    }

    function spawn() {

        var particle = new Particle(this);

        init_particle( particle );
        active_particles.push( particle );

    }

    function random_1_to_1(){ return Math.random() * 2 - 1; }

    function init_particle( particle:Particle ) {

        particle.rotation = (zrotation + rotation_random * random_1_to_1()) + rotation_offset;

        particle.position.x = (particle_system.pos.x + pos_random.x * random_1_to_1()) + pos_offset.x;
        particle.position.y = (particle_system.pos.y + pos_random.y * random_1_to_1()) + pos_offset.y;

        if(particle_cache[cache_index] != null) {

            particle.sprite = particle_cache[cache_index];
            particle.sprite.visible = true;

                //kill the oldest sprite, as we are now reworking our way up the cache
            // active_particles.shift().sprite.visible = false;

        } else {

            particle.sprite = new Sprite( {
                name : name + '_particle_'+cache_index,
                depth : depth,
                group : group,
                texture : particle_image,
                pos : new Vector()
            });

            particle_cache[cache_index] = particle.sprite;
        }

            //update the index we are inside the pool
        ++cache_index;
            //reset the index if we reach the max
        if(cache_index >= cache_size) {
            cache_index = 0;
        }

        //core.echo(pool_index + ' / ' + poolsize);

        // if(particle.sprite.texture.name != particle_image) {
            // particle.sprite.texture = phoenix.texture(particle_image);
            // particle.sprite.srcrect = rect(0,0,particle.sprite.texture.width,particle.sprite.texture.height);
        // }

        var new_dir = (direction + direction_random * random_1_to_1() ) * ( Math.PI / 180 ); // convert to radians
            direction_vector.set( Math.cos( new_dir ), Math.sin( new_dir ) );

        var _point_speed = speed + speed_random * random_1_to_1();
            particle.speed.set(_point_speed, _point_speed);


        particle.direction.x = direction_vector.x;// * particle.speed.x;
        particle.direction.y = direction_vector.y;// * particle.speed.y;

        particle.start_size.x = start_size.x + (start_size_random.x * random_1_to_1());
        particle.start_size.y = start_size.y + (start_size_random.y * random_1_to_1());

        particle.end_size.x = end_size.x + (end_size_random.x * random_1_to_1());
        particle.end_size.y = end_size.y + (end_size_random.y * random_1_to_1());

        particle.size.x = particle.start_size.x < 0 ? 0 : Math.floor(particle.start_size.x);
        particle.size.y = particle.start_size.y < 0 ? 0 : Math.floor(particle.start_size.y);

        particle.time_to_live = (life + life_random * random_1_to_1());


        particle.speed_delta = (end_speed - _point_speed);
        if(particle.speed_delta != 0) {
            particle.speed_delta /= particle.time_to_live;
        }

        particle.size_delta.x = ( end_size.x - start_size.x ) / particle.time_to_live;
        particle.size_delta.y = ( end_size.y - start_size.y ) / particle.time_to_live;

        var start_color = new Color( start_color.r + start_color_random.r * random_1_to_1(),
                                     start_color.g + start_color_random.g * random_1_to_1(),
                                     start_color.b + start_color_random.b * random_1_to_1(),
                                     start_color.a + start_color_random.a * random_1_to_1() );

        var _end_color   = new Color( end_color.r + end_color_random.r * random_1_to_1(),
                                      end_color.g + end_color_random.g * random_1_to_1(),
                                      end_color.b + end_color_random.b * random_1_to_1(),
                                      end_color.a + end_color_random.a * random_1_to_1() );

        particle.color = start_color;
        particle.end_color = _end_color;

        particle.color_delta.r = ( _end_color.r - start_color.r ) / particle.time_to_live;
        particle.color_delta.g = ( _end_color.g - start_color.g ) / particle.time_to_live;
        particle.color_delta.b = ( _end_color.b - start_color.b ) / particle.time_to_live;
        particle.color_delta.a = ( _end_color.a - start_color.a ) / particle.time_to_live;

        if(has_end_rotation) {
            var _end_rotation = end_rotation + end_rotation_random * random_1_to_1();
            particle.rotation_delta  = ( _end_rotation - particle.rotation ) / particle.time_to_live;
        }

        //update sprite
        particle.sprite.size = new Vector( particle.start_size.x, particle.start_size.y );
        particle.sprite.color = particle.color;
        particle.sprite.pos = new Vector();
        particle.sprite.rotation_z = particle.rotation;

    } //init_particle

    override function update(dt:Float) {

        if( enabled ) { // && emission_rate > 0
            // trace("updating " + name);
            emit_timer = Luxe.time;

            if( emit_timer > emit_next ) {
                emit_next = emit_timer + emit_time;
                emit_last = emit_timer;
                for(i in 0 ... emit_count) {
                    spawn();
                }
            }

            if( duration != -1 && emit_timer > finish_time ){
                stop();
            }

        } //if enabled and still emitting

        var gravity_x = gravity.x;
        var gravity_y = gravity.y;

            //update all active particles
        for(current_particle in active_particles) {

                //die over time
            current_particle.time_to_live -= dt;

                // If the current particle is alive
            if( current_particle.time_to_live > 0 ) {

                    //start with gravity direction
                current_particle.speed.x += current_particle.speed_delta;
                current_particle.speed.y += current_particle.speed_delta;

                current_particle.move_direction.x = gravity_x + (current_particle.direction.x * current_particle.speed.x);
                current_particle.move_direction.y = gravity_y + (current_particle.direction.y * current_particle.speed.y);

                    //then add that to the position
                current_particle.position.x += current_particle.move_direction.x * dt;
                current_particle.position.y += current_particle.move_direction.y * dt;

                    // update colours based on delta
                var r = current_particle.color.r += ( current_particle.color_delta.r * dt );
                var g = current_particle.color.g += ( current_particle.color_delta.g * dt );
                var b = current_particle.color.b += ( current_particle.color_delta.b * dt );
                var a = current_particle.color.a += ( current_particle.color_delta.a * dt );

                var xx = current_particle.size.x += ( current_particle.size_delta.x * dt );
                var yy = current_particle.size.y += ( current_particle.size_delta.y * dt );
                var rr = current_particle.rotation += ( current_particle.rotation_delta * dt );

                    //clamp colors
                if(r < 0) { r = 0; } if(g < 0) { g = 0; } if(b < 0) { b = 0; } if(a < 0) { a = 0; }
                if(r > 1) { r = 1; } if(g > 1) { g = 1; } if(b > 1) { b = 1; } if(a > 1) { a = 1; }

                current_particle.draw_color.set( r,g,b,a );
                current_particle.draw_size.set( xx, yy );

            } else {

                _to_remove.push(current_particle);
                current_particle.sprite.visible = false;

            }

                //now transfer the updated info to the visuals
            current_particle.sprite.pos = current_particle.position;
            current_particle.sprite.size = current_particle.draw_size;
            current_particle.sprite.rotation_z = current_particle.rotation;
            current_particle.sprite.color = current_particle.draw_color;

        } //for each active particle

            //remove the dead ones
        for(_particle in _to_remove) {
            active_particles.remove(_particle);
        }

            //clean up the dead list
        _to_remove.splice(0,_to_remove.length);

    } //update

} //ParticleEmitter


class Particle {


    public var particle_system : ParticleSystem;
    public var particle_emitter : ParticleEmitter;
    public var sprite : Sprite;

    public var start_size : Vector;
    public var end_size : Vector;
    public var size : Vector;
    public var position : Vector;
    public var direction : Vector;
    public var move_direction : Vector;
    public var speed : Vector;
    public var time_to_live : Float = 0;
    public var rotation : Float = 0;

    public var color : Color;
    public var end_color : Color;
    public var color_delta : Color;
    public var size_delta : Vector;
    public var speed_delta : Float;
    public var rotation_delta : Float = 0;

    public var draw_size : Vector;
    public var draw_color : Color;


    public function new(e:ParticleEmitter) {

        particle_emitter = e;
        particle_system = e.particle_system;

        direction = new Vector();
        move_direction = new Vector();
        speed = new Vector();
        speed_delta = 0.0;
        size = new Vector();
        position = new Vector();
        start_size = new Vector();
        end_size = new Vector();
        size_delta = new Vector();

            //delta must be 0
        color_delta = new Color(0,0,0,0);
        color = new Color();
        end_color = new Color();
        draw_color = new Color();
        draw_size = new Vector();

    } //new


}  //Particle

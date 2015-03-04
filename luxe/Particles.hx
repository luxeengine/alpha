package luxe;

import luxe.Component;
import phoenix.Texture;

import luxe.options.ParticleOptions;

class ParticleSystem extends Entity {


    public var paused (default,set) : Bool = false;
    public var enabled : Bool = true;
    public var emitters : Map<String, ParticleEmitter>;


    override function init( ) {

        if(emitters == null) {
            emitters = new Map();
        }

    } //init

    public function add_emitter(_template:ParticleEmitterOptions) {

        if(emitters == null) emitters = new Map();

        var _name = '';

        if(_template.name != null) {
            _name = _template.name;
        } else {
            _name = Luxe.utils.uniqueid();
        }

            //create the emitter instance
        var _emitter = add( new ParticleEmitter({ name:_name, system:this, template:_template, enabled:enabled, paused:paused }) );
            //store the reference of the emitter
        emitters.set(_name, _emitter);

    } //add_emitter

        /** Start all emitters. */
    public function start( duration:Float = -1 ) {

        enabled = true;

        if(emitters != null) {
            for(emitter in emitters) {
                emitter.start(duration);
            }
        }

        paused = false;

    } //start

        /** Stop all emitters from emitting.
            Alive particles will continue to update,
            just emission will stop. see `kill` */
    public function stop() {

        enabled = false;

        if(emitters != null) {
            for(emitter in emitters) {
                emitter.stop();
            }
        }

    } //stop

        /** Stop all emitters from emitting,
            and kills all alive particles. also see `stop` */
    public function kill() {

        enabled = false;

        if(emitters != null) {
            for(emitter in emitters) {
                emitter.kill();
            }
        }

    } //kill

    inline function set_paused(_paused:Bool) {

        if(emitters != null) {
            for(emitter in emitters) {
                emitter.paused = _paused;
            }
        }

        return paused = _paused;

    } //set_paused

} //Particle System


typedef ParticleEmitterInitData = {
    ?name : String,
    system : ParticleSystem,
    template : ParticleEmitterOptions,
    enabled : Bool,
    paused : Bool,
} //ParticleEmitterInitData

class ParticleEmitter extends Component {

    public var system : ParticleSystem;

    public var enabled : Bool = true;
    public var paused : Bool = false;

    public var emit_count : Int = 1;
    public var active_particles : Array<Particle>;

    public var elapsed_time : Float = 0;
    public var duration : Float = -1;
    public var emit_next : Float = 0;
    public var emit_last : Float = 0;
    public var particle_index : Int = 0;

    public var particle_cache : Array<Particle>;
    public var dead_pool : Array<Int>;
    public var cache_size : Int = 100;
    public var cache_wrap : Bool = true;
    public var cache_index : Int = 0;

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

    public var emitter_type : ParticleEmitterType;
    public var default_duration : Float;
    public var y_multiplier : Float;
    public var gravity_radial_accel : Float;
    public var gravity_radial_accel_random : Float;
    public var gravity_tangential_accel : Float;
    public var gravity_tangential_accel_random : Float;
    public var radial_rotation : Float;
    public var radial_rotation_random : Float;
    public var radial_start_radius : Float;
    public var radial_start_radius_random : Float;
    public var radial_end_radius : Float;
    public var radial_end_radius_random : Float;

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
        super({ name:_data.name });
        system = _data.system;
        template = _data.template;
        enabled = _data.enabled;
        paused = _data.paused;
    }

    override function init() {

        active_particles = [];
        particle_cache = [];
        dead_pool = [];

        emit_timer = 0;
        emit_last = 0;
        emit_next = 0;

        _temp_speed = new Vector();

        _to_remove = [];

        if(template.batcher == null)
            template.batcher = Luxe.renderer.batcher;

        // name = _name;
            //apply defaults
        apply(template);

    } //init

    public function apply(_template:ParticleEmitterOptions) {

        if(_template == null) _template = {};
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

        (_template.cache_wrap != null) ?
            cache_wrap = _template.cache_wrap :
            cache_wrap = true;

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

//
        (_template.emitter_type != null) ?
            emitter_type = _template.emitter_type :
            emitter_type = ParticleEmitterType.luxe;

        (_template.default_duration != null) ?
            default_duration = _template.default_duration :
            default_duration = -1.0;

        (_template.y_multiplier != null) ?
            y_multiplier = _template.y_multiplier :
            y_multiplier = 1.0;

        (_template.gravity_radial_accel != null) ?
            gravity_radial_accel = _template.gravity_radial_accel :
            gravity_radial_accel = 0.0;

        (_template.gravity_radial_accel_random != null) ?
            gravity_radial_accel_random = _template.gravity_radial_accel_random :
            gravity_radial_accel_random = 0.0;

        (_template.gravity_tangential_accel != null) ?
            gravity_tangential_accel = _template.gravity_tangential_accel :
            gravity_tangential_accel = 0.0;

        (_template.gravity_tangential_accel_random != null) ?
            gravity_tangential_accel_random = _template.gravity_tangential_accel_random :
            gravity_tangential_accel_random = 0.0;

        (_template.radial_rotation != null) ?
            radial_rotation = _template.radial_rotation :
            radial_rotation = 0.0;

        (_template.radial_rotation_random != null) ?
            radial_rotation_random = _template.radial_rotation_random :
            radial_rotation_random = 0.0;

        (_template.radial_start_radius != null) ?
            radial_start_radius = _template.radial_start_radius :
            radial_start_radius = 0.0;

        (_template.radial_start_radius_random != null) ?
            radial_start_radius_random = _template.radial_start_radius_random :
            radial_start_radius_random = 0.0;

        (_template.radial_end_radius != null) ?
            radial_end_radius = _template.radial_end_radius :
            radial_end_radius = 0.0;

        (_template.radial_end_radius_random != null) ?
            radial_end_radius_random = _template.radial_end_radius_random :
            radial_end_radius_random = 0.0;

        check_cache();

    } //apply

    function cache(index:Int) {

        var particle = new Particle(this, index);
            particle.sprite = new Sprite({
                name: name + '_particle_'+index,
                depth: template.depth,
                group: template.group,
                texture: particle_image,
                no_scene: true,
                no_batcher_add: true,
                pos : new Vector()
            });

        particle_cache[index] = particle;
        dead_pool.push(index);

    } //cache

    inline function check_cache() {

        var _to_cache = cache_size;

        if(particle_cache.length > _to_cache) {

            _to_cache = 0;
            for(i in 0 ... (particle_cache.length - _to_cache)) {
                particle_cache.pop().destroy();
            }

        } else if(particle_cache.length <= _to_cache) {
            _to_cache = _to_cache - particle_cache.length;
        }

        var exist = particle_cache.length;
        if(_to_cache > 0) {
            for(i in 0 ... _to_cache) {
                cache(exist+i);
            }
        }

    } //check_cache


    public function start( t:Float ) {

        duration = (t != -1 ? t : default_duration);

        if (!enabled || paused) {
            enabled = true;
            paused = false;
            emit_last = 0;
            emit_timer = 0;
            emit_next = 0;
        }

        if(duration != -1) {
            finish_time = Luxe.time + duration;
        }

    } //start

    public function stop() {
        enabled = false;
        elapsed_time = 0;
        emit_timer = 0;
    }

    public function kill() {
        stop();

        for(p in active_particles) {
            unspawn(p, false);
        }

        active_particles.splice(0, active_particles.length);

    } //kill

    override function ondestroy() {

        active_particles.splice(0,active_particles.length);
        active_particles = null;

        if(particle_cache != null) {
            while(particle_cache.length > 0) {
                var p = particle_cache.pop();
                p.destroy();
                p = null;
            }
        }

        particle_cache = null;

    } //ondestroy

    function unspawn( particle:Particle, ?_remove_from_active:Bool=true ) {

        if(_remove_from_active) {
            active_particles.remove( particle );
        }

        dead_pool.push( particle.index );
        if(particle.sprite.geometry != null) {
            template.batcher.remove( particle.sprite.geometry );
        }

    } //unspawn

    function spawn() {

        var max_alive = !(active_particles.length < cache_size);
        if( max_alive ) {
            if(cache_wrap) {
                unspawn(active_particles[0]);
            } else {
                return;
            }
        }

            //this is an error state
        if(dead_pool.length == 0) throw "huh, no particles in the dead_pool?!";

            //get the index to spawn from the oldest dead particle
        var spawn_index = dead_pool.shift();
            //fetch it from the particle cache
        var particle = particle_cache[spawn_index];
            //reset it's state
        reset_particle(particle);

        // _debug('particle ${particle.index} / spawn / ttl: ${particle.time_to_live}');

            //store in active list
        active_particles.push(particle);

        if(particle.sprite.geometry != null) {
                //add to rendering
            template.batcher.add(particle.sprite.geometry);
        }

    } //spawn

    function reset_particle(particle:Particle) {

        particle.time_to_live = (life + life_random * random_1_to_1());

        particle.initial_pos.x = (system.pos.x + pos_offset.x);
        particle.initial_pos.y = (system.pos.y + pos_offset.y);
        particle.pos.x = (particle.initial_pos.x + pos_random.x * random_1_to_1());
        particle.pos.y = (particle.initial_pos.y + pos_random.y * random_1_to_1());

        var _start_color =
            particle.color.set( start_color.r + start_color_random.r * random_1_to_1(),
                                start_color.g + start_color_random.g * random_1_to_1(),
                                start_color.b + start_color_random.b * random_1_to_1(),
                                start_color.a + start_color_random.a * random_1_to_1() );

        var _end_color =
            particle.end_color.set( end_color.r + end_color_random.r * random_1_to_1(),
                                    end_color.g + end_color_random.g * random_1_to_1(),
                                    end_color.b + end_color_random.b * random_1_to_1(),
                                    end_color.a + end_color_random.a * random_1_to_1() );

        particle.color_delta.r = ( _end_color.r - _start_color.r ) / particle.time_to_live;
        particle.color_delta.g = ( _end_color.g - _start_color.g ) / particle.time_to_live;
        particle.color_delta.b = ( _end_color.b - _start_color.b ) / particle.time_to_live;
        particle.color_delta.a = ( _end_color.a - _start_color.a ) / particle.time_to_live;

        if( emitter_type == ParticleEmitterType.luxe ) {
            particle.start_size.x = start_size.x + (start_size_random.x * random_1_to_1());
            particle.start_size.y = start_size.y + (start_size_random.y * random_1_to_1());

            particle.end_size.x = end_size.x + (end_size_random.x * random_1_to_1());
            particle.end_size.y = end_size.y + (end_size_random.y * random_1_to_1());

            particle.size.x = particle.start_size.x < 0 ? 0 : Math.floor(particle.start_size.x);
            particle.size.y = particle.start_size.y < 0 ? 0 : Math.floor(particle.start_size.y);
        } else {
            particle.start_size.x = start_size.x + (start_size_random.x * random_1_to_1());
            particle.start_size.y = particle.start_size.x;

            particle.end_size.x = end_size.x + (end_size_random.x * random_1_to_1());
            particle.end_size.y = particle.end_size.x;

            particle.size.x = particle.start_size.x;
            particle.size.y = particle.start_size.y;
        }

        particle.size_delta.x = ( end_size.x - start_size.x ) / particle.time_to_live;
        particle.size_delta.y = ( end_size.y - start_size.y ) / particle.time_to_live;

        particle.rotation = (zrotation + rotation_random * random_1_to_1()) + rotation_offset;

        if(has_end_rotation) {
            var _end_rotation = end_rotation + end_rotation_random * random_1_to_1();
            particle.rotation_delta  = ( _end_rotation - particle.rotation ) / particle.time_to_live;
        } else {
            particle.rotation_delta = 0.0;
        }

        var new_dir = (direction + direction_random * random_1_to_1() ) * ( Math.PI / 180 ); // convert to radians

        switch(emitter_type) {
            case pd_gravity: {
                var _point_speed = speed + speed_random * random_1_to_1();

                particle.direction.x = Math.cos(new_dir) * _point_speed;
                particle.direction.y = Math.sin(new_dir) * _point_speed;
                particle.gravity_radial_accel = gravity_radial_accel + gravity_radial_accel_random * random_1_to_1();
                particle.gravity_tangential_accel = gravity_tangential_accel + gravity_tangential_accel_random * random_1_to_1();
            }

            case pd_radial: {
                particle.radial_rotation = new_dir;

                particle.radial_rotation_delta = (
                    radial_rotation + radial_rotation_random * random_1_to_1()
                ) * ( Math.PI / 180 ) / particle.time_to_live;

                particle.radial_radius = (radial_end_radius + radial_end_radius_random * random_1_to_1());

                particle.radial_radius_delta = (
                    radial_start_radius + radial_start_radius_random * random_1_to_1() - particle.radial_radius
                ) / particle.time_to_live;
            }

            default: {
                direction_vector.set_xy( Math.cos( new_dir ), Math.sin( new_dir ) );

                var _point_speed = speed + speed_random * random_1_to_1();
                particle.speed.set_xy(_point_speed, _point_speed);

                particle.direction.x = direction_vector.x;// * particle.speed.x;
                particle.direction.y = direction_vector.y;// * particle.speed.y;

                particle.speed_delta = (end_speed - _point_speed);
                if(particle.speed_delta != 0) {
                    particle.speed_delta /= particle.time_to_live;
                }
            }
        }

            //update sprite
        particle.sprite.size.set_xy( particle.start_size.x, particle.start_size.y );
        particle.sprite.color = particle.color;
        particle.sprite.pos.copy_from(particle.pos);
        particle.sprite.rotation_z = particle.rotation;

    } //reset_particle


    override function update(dt:Float) {

        if( paused ) return;

        if( enabled ) {
            // trace("updating " + name);
            emit_timer = Luxe.time;

            if( emitter_type == ParticleEmitterType.luxe ) {

                if( emit_timer > emit_next ) {
                    emit_next = emit_timer + emit_time;
                    emit_last = emit_timer;
                    for(i in 0 ... emit_count) {
                        spawn();
                    }
                }

            } else {

                emit_next += dt;
                emit_last = emit_timer;

                // emit_time used as emit_rate here
                while( active_particles.length < emit_count && emit_next > emit_time ) {
                    spawn();
                    emit_next -= emit_time;
                }

            }

            if( duration != -1 && emit_timer > finish_time ){
                stop();
            }

        } //if enabled and still emitting

        var gravity_x = gravity.x;
        var gravity_y = gravity.y;
        var _radial_dir = new Vector();
        var _tangential_dir = new Vector();

            //update all active particles
        for(p in active_particles) {

                //die over time
            p.time_to_live -= dt;

                // If the current particle is alive
            if( p.time_to_live > 0 ) {

                switch (emitter_type) {
                    case pd_gravity: {
                        p.pos.x -= p.initial_pos.x;
                        p.pos.y -= p.initial_pos.y;
                        _radial_dir.set_xy(p.pos.x, p.pos.y);

                        if (p.pos.x != 0 || p.pos.y != 0) {
                            _radial_dir.normalize();
                        }

                        _tangential_dir.set_xy(- _radial_dir.y, _radial_dir.x);

                        _radial_dir.multiplyScalar(p.gravity_radial_accel);
                        _tangential_dir.multiplyScalar(p.gravity_tangential_accel);

                        p.direction.x += (_radial_dir.x + _tangential_dir.x + gravity_x) * dt;
                        p.direction.y += (_radial_dir.y + _tangential_dir.y + gravity_y) * dt;

                        p.pos.x += p.direction.x * dt + p.initial_pos.x;
                        p.pos.y += p.direction.y * dt * y_multiplier + p.initial_pos.y;
                    }

                    case pd_radial: {
                        p.radial_rotation += p.radial_rotation_delta * dt;
                        p.radial_radius += p.radial_radius_delta * dt;
                        p.pos.x = p.initial_pos.x - Math.cos(p.radial_rotation) * p.radial_radius;
                        p.pos.y = p.initial_pos.y - Math.sin(p.radial_rotation) * p.radial_radius * y_multiplier;
                    }

                    default: {
                            //start with gravity direction
                        p.speed.x += p.speed_delta;
                        p.speed.y += p.speed_delta;

                        p.move_dir.x = gravity_x + (p.direction.x * p.speed.x);
                        p.move_dir.y = gravity_y + (p.direction.y * p.speed.y);

                            //then add that to the pos
                        p.pos.x += p.move_dir.x * dt;
                        p.pos.y += p.move_dir.y * dt;
                    }
                }

                    // update colours based on delta
                var r = p.color.r += ( p.color_delta.r * dt );
                var g = p.color.g += ( p.color_delta.g * dt );
                var b = p.color.b += ( p.color_delta.b * dt );
                var a = p.color.a += ( p.color_delta.a * dt );

                var xx = p.size.x += ( p.size_delta.x * dt );
                var yy = p.size.y += ( p.size_delta.y * dt );
                var rr = p.rotation += ( p.rotation_delta * dt );

                    //clamp colors
                if(r < 0) { r = 0; } if(g < 0) { g = 0; } if(b < 0) { b = 0; } if(a < 0) { a = 0; }
                if(r > 1) { r = 1; } if(g > 1) { g = 1; } if(b > 1) { b = 1; } if(a > 1) { a = 1; }

                p.draw_color.set( r,g,b,a );
                p.draw_size.set_xy( xx, yy );

            } else {
                _to_remove.push(p);
            }

                //now transfer the updated info to the visuals
            p.sprite.pos = p.pos; //:todo : shouldn't it be p.sprite.pos.copy_from(p.pos) like in reset_particle()?
            p.sprite.size = p.draw_size;
            p.sprite.rotation_z = p.rotation;
            p.sprite.color = p.draw_color;

        } //for each active particle

            //remove the dead ones
        for(_particle in _to_remove) {
            unspawn(_particle);
        }

            //clean up the dead list
        _to_remove.splice(0,_to_remove.length);

    } //update

    inline function random_1_to_1(){ return Math.random() * 2 - 1; }


} //ParticleEmitter


class Particle {

    public var index : Int;
    public var system : ParticleSystem;
    public var particle_emitter : ParticleEmitter;
    public var sprite : Sprite;

    public var start_size : Vector;
    public var end_size : Vector;
    public var size : Vector;
    public var pos : Vector;
    public var direction : Vector;
    public var move_dir : Vector;
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

    public var initial_pos : Vector;
    public var gravity_radial_accel : Float = 0;
    public var gravity_tangential_accel : Float = 0;
    public var radial_rotation : Float = 0;
    public var radial_rotation_delta : Float = 0;
    public var radial_radius : Float = 0;
    public var radial_radius_delta : Float = 0;

    inline public function new(e:ParticleEmitter, _index:Int) {

        index = _index;
        particle_emitter = e;
        system = e.system;

        direction = new Vector();
        move_dir = new Vector();
        speed = new Vector();
        speed_delta = 0.0;
        size = new Vector();
        pos = new Vector();
        start_size = new Vector();
        end_size = new Vector();
        size_delta = new Vector();

            //delta must be 0
        color_delta = new Color(0,0,0,0);
        color = new Color();
        end_color = new Color();
        draw_color = new Color();
        draw_size = new Vector();

        initial_pos = new Vector();

    } //new

    public function destroy() {

        if(sprite != null) {
            sprite.destroy();
            sprite = null;
        }

        direction = null;
        move_dir = null;
        speed = null;
        size = null;
        pos = null;
        start_size = null;
        end_size = null;
        size_delta = null;
        color_delta = null;
        color = null;
        end_color = null;
        draw_color = null;
        draw_size = null;
        initial_pos = null;

    } //destroy

}  //Particle

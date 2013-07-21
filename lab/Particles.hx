
package lab;

class ParticleSystem extends Entity {

    public var active : Bool = true;
    public var emitters : Map<String, ParticleEmitter>;
    @:isVar public var pos(default, set) : Vector;

    public function init() {
        if(emitters == null) new Map<String, ParticleEmitter>();
        if(pos == null) pos = new Vector();

        // trace("Init particle system : " + name);
    } //init

    public function add_emitter(_template:Dynamic) {

        if(emitters == null) emitters = new Map<String, ParticleEmitter>();

        var _name : String = '';
        
        if(_template.name != null) {
            _name = _template.name;
        } //_template.name != null
            
        if(_name.length == 0) {
            _name = Lab.utils.uuid();
        } //_name.lengths
            
        if(_template.pos != null) {
            pos = _template.pos;
        }
            //create the emitter instance
        var _emitter = add(ParticleEmitter, _name);
            //store ourselves in the emitter
        _emitter.particle_system = this;
            //manual init, because it's probably added too late
        _emitter.init();
            //apply the template to the emitter
        _emitter.apply(_template);
            //store the reference of the emitter
        emitters.set(_name, _emitter);

    } //add

    public function set_pos(_v:Vector) {
        if(emitters != null) {
            for(emitter in emitters) {
                emitter.pos = _v;
            }
        }
        return pos = _v;
    } 

    public function emit(duration:Float = -1) {
        active = true;
        for(emitter in emitters) {
            emitter.emit(duration);
        }
    } //emit

    public function stop() {
        active = false;
        for(emitter in emitters) {
            emitter.stop();
        }        
    } //stop

    public function destroy() {
        for(emitter in emitters) {
            emitter.destroy();
        }        
    } //destroy

    public function update(dt:Float) {
        if(!active) return;
        for(emitter in emitters) {
            emitter.update(dt);
        }
    } //update

}

class ParticleEmitter extends Entity {

    public var particle_system : ParticleSystem;

    public var active : Bool = true;
    public var max_particles : Int = 100;
    public var active_particles : Array<Particle>;

    public var particle_count : Int = 0;
    public var elapsed_time : Float = 0;
    public var duration : Float = -1;
    public var emission_rate : Float = 0;
    public var emit_counter : Float = 0;
    public var emit_next : Float = 0;
    public var emit_last : Float = 0;
    public var particle_index : Int = 0;

    public var particle_cache : Array<Sprite>;
    public var cache_size : Int = 100;
    public var cache_index : Int = 0;

    public var depth : Int = 0;
    public var group : Int = 0;

        //emitter properties
    public var particle_image : phoenix.Texture = null;
    public var pos : Vector;
    public var pos_offset : Vector;
    public var pos_random : Vector;
    public var emit_time : Float;
    public var direction : Float;
    public var direction_random : Float;
    public var gravity : Vector;

        //todo
    public var radius : Float = 50;
    public var radius_random : Float = 50;

        //particle properties
    public var start_size:Vector;
    public var start_size_random:Vector;
    public var end_size:Vector;
    public var end_size_random:Vector;
    public var speed : Float;
    public var speed_random : Float;
    public var life : Float;
    public var life_random : Float;
    public var rotation : Float;
    public var rotation_random : Float;
    public var end_rotation : Float;
    public var end_rotation_random : Float;
    public var rotation_offset : Float;
    public var start_color : Color;
    public var start_color_random : Color;
    public var end_color : Color;
    public var end_color_random : Color;

        //internal stuff
    var direction_vector : Vector;
    
    public function init() {   

        active_particles = new Array<Particle>();
        particle_cache = new Array<Sprite>();
 
        emit_counter = 0;
        emit_last = 0;
        emit_next = 0;
            
            //apply defaults 
        apply({});
    }

    public function apply(_template:Dynamic) {
        if(_template == null) _template = {};
        
        (_template.depth != null) ? 
            depth = _template.depth : 
            depth = 0; 

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
            emit_time = 0.5;

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

        (_template.life != null) ?
            life = _template.life : life = 1.5;

        (_template.life_random != null) ?
            life_random = _template.life_random : 
            life_random = 0;

//
        (_template.rotation != null) ?
            rotation = _template.rotation : 
            rotation = 0;

        (_template.rotation_random != null) ?
            rotation_random = _template.rotation_random : 
            rotation_random = 360;

        (_template.end_rotation != null) ?
            end_rotation = _template.end_rotation : 
            end_rotation = 0;

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
            pos = _template.pos : 
            pos = new Vector();

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
        for(p in particle_cache) {
            p.destroy();
            p = null;
        }        
    }

    public function emit(t:Float){
        duration = t;
        active = true;
        emit_last = 0;
        emit_counter = 0;
        emit_next = 0;  
    } 

    public function stop() {
        active = false;
        elapsed_time = 0;
        emit_counter = 0;
    }

    private function spawn() {
        if(particle_count == max_particles) { return false; }

        var particle = new Particle(this);
        init_particle( particle );
        active_particles.push(particle);
        // trace(active_particles.length);
        // active_particles[ particle_count ] = particle;
        particle_count++;

        return true;
    }

    private function random_1_to_1(){ return Math.random() * 2 - 1; }

    private function init_particle( particle:Particle ) {

        particle.rotation = (rotation + rotation_random * random_1_to_1()) + rotation_offset;

        particle.position.x = (pos.x + pos_random.x * random_1_to_1()) + pos_offset.x;
        particle.position.y = (pos.y + pos_random.y * random_1_to_1()) + pos_offset.y;      

        if(particle_cache[cache_index] != null) {

            particle.sprite = particle_cache[cache_index];
            particle.sprite.visible = true;

        } else {

            particle.sprite = new Sprite( {
                name : name + '_particle_'+cache_index,
                depth : depth,
                group : group,
                texture : particle_image,
                pos : new Vector(),
            });

            particle_cache[cache_index] = particle.sprite;
        }
        
        ++cache_index;
        if(cache_index > cache_size - 1) {
            cache_index = 0;
        }

        //core.echo(pool_index + ' / ' + poolsize);
        
        // if(particle.sprite.texture.name != particle_image) {
            // particle.sprite.texture = phoenix.texture(particle_image);
            // particle.sprite.srcrect = rect(0,0,particle.sprite.texture.width,particle.sprite.texture.height);           
        // } 
        
        if(direction != 0) {
            var new_dir = (direction + direction_random * random_1_to_1() ) * ( Math.PI / 180 ); // convert to radians
            direction_vector.set( Math.cos( new_dir ), Math.sin( new_dir ) ); 
        } else {
            direction_vector.set(0,0,0);
        }

        var vector_speed = speed + speed_random * random_1_to_1();

        particle.direction = Vector.Multiply( direction_vector, vector_speed );        

        particle.start_size.x = start_size.x + (start_size_random.x * random_1_to_1());
        particle.start_size.y = start_size.y + (start_size_random.y * random_1_to_1());

        particle.end_size.x = end_size.x + (end_size_random.x * random_1_to_1());
        particle.end_size.y = end_size.y + (end_size_random.y * random_1_to_1());

        particle.size.x = particle.start_size.x < 0 ? 0 : Math.floor(particle.start_size.x);
        particle.size.y = particle.start_size.y < 0 ? 0 : Math.floor(particle.start_size.y);

        particle.time_to_live = (life + life_random * random_1_to_1());

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

        var _end_rotation = end_rotation + end_rotation_random * random_1_to_1();
        particle.rotation_delta  = ( _end_rotation - particle.rotation ) / particle.time_to_live;

        //update sprite
        particle.sprite.size = new Vector( particle.start_size.x, particle.start_size.y );
        particle.sprite.color = particle.color;
        particle.sprite.pos.x = particle.position.x;
        particle.sprite.pos.y = particle.position.y;
        particle.sprite.rotation = particle.rotation;
        
    } //init_particle

    public function update(dt:Float) {

        if( active ) { // && emission_rate > 0

            emit_counter += dt;

            if( emit_counter > emit_next ) {                
                emit_next = emit_counter + emit_time; 
                emit_last = emit_counter;
                spawn();
            }

            elapsed_time += dt;

            if( duration != -1 && duration < elapsed_time ){
                stop();             
            }

        } //if active and still emitting   

        particle_index = 0;
        while( particle_index < particle_count ) {

            var current_particle = active_particles[ particle_index ];

            // If the current particle is alive then update it
            if( current_particle.time_to_live > 0 ) {

                // Calculate the new direction based on gravity
                var _gravity = Vector.Multiply( gravity, dt ); 

                current_particle.direction = Vector.Add( current_particle.direction, _gravity );
                current_particle.position = Vector.Add( current_particle.position, current_particle.direction );
                current_particle.time_to_live -= dt;

                // Update colours based on delta
                var r = current_particle.color.r += ( current_particle.color_delta.r * dt );
                var g = current_particle.color.g += ( current_particle.color_delta.g * dt );
                var b = current_particle.color.b += ( current_particle.color_delta.b * dt );
                var a = current_particle.color.a += ( current_particle.color_delta.a * dt );

                var xx = current_particle.size.x += ( current_particle.size_delta.x * dt );
                var yy = current_particle.size.y += ( current_particle.size_delta.y * dt );
                
                var rr = current_particle.rotation += ( current_particle.rotation_delta * dt );

                if(r < 0) r = 0;
                if(r > 1) r = 1;                
                if(g < 0) g = 0;
                if(g > 1) g = 1;                
                if(b < 0) b = 0;
                if(b > 1) b = 1;
                if(a < 0) a = 0;
                if(a > 1) a = 1;

                current_particle.draw_color.set( r,g,b,a );
                current_particle.draw_size.set( xx, yy);
                
                particle_index++;

            } else {

                // Replace particle with the last active 
                // if( particle_index != particle_count - 1 ) {
                //     active_particles[ particle_index ] = active_particles[ particle_count-1 ];
                // }
                active_particles.remove(current_particle);
                current_particle.sprite.visible = false;
                current_particle = null;
                //current_particle.sprite.drop();
                //delete current_particle.sprite;
                particle_count--;
            }

        } //while

        if(particle_count <= 0 ) {
            //callback for complete
            // if(onStop) {
                // onStop();
            // }
        }

        for( i in 0 ... particle_count ) {

            var particle = active_particles[ i ];

            // var x = Math.floor( particle.position.x );
            // var y = Math.floor( particle.position.y );

            particle.sprite.pos.x = particle.position.x;
            particle.sprite.pos.y = particle.position.y;
            particle.sprite.size = particle.draw_size;
            particle.sprite.color = particle.draw_color;
            particle.sprite.rotation = particle.rotation;

        }     
    }

}

class Particle {

    public var particle_system : ParticleSystem;
    public var particle_emitter : ParticleEmitter;
    public var sprite : Sprite;

    public var start_size : Vector;
    public var end_size : Vector;
    public var size : Vector;
    public var position : Vector;
    public var direction : Vector;
    public var time_to_live : Float = 0;
    public var rotation : Float = 0;

    public var color : Color;
    public var end_color : Color;
    public var color_delta : Color;
    public var size_delta : Vector;
    public var rotation_delta : Float = 0;
    
    public var draw_position : Vector;
    public var draw_size : Vector;
    public var draw_color : Color;

    public function new(e:ParticleEmitter) {
        particle_emitter = e;
        particle_system = e.particle_system;
        
        direction = new Vector();
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
        draw_position = new Vector();

    }
}
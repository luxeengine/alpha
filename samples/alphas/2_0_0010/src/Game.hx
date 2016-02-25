
import luxe.options.ParticleOptions;
import luxe.resource.Resource.AudioResource;
import luxe.States;
import luxe.Input;
import luxe.Entity;
import luxe.Particles;
import luxe.Vector;
import luxe.Color;
import snow.types.Types.AudioHandle;


class Game extends State {

        //the snow particles
    var snow_particles: ParticleSystem;
        //the event listener id, used to remove it later
    var paused_event_id : String = '';

    public function new() {

        super({ name:'game' });

    } //new

        //called when 'set' state is called on this state
    override function onenter<T>(_:T) {

            //fade to a white ish color
        Luxe.renderer.clear_color.tween(2,{ r:0.6,g:0.6,b:0.6 });

            //start listening for pause events
        paused_event_id = Luxe.events.listen('game.paused', pause_changed);

            //create the particles
        create_snow();
            //create the sounds
        create_wind();

    } //onenter

        //called when 'set' state is called on another state
    override function onleave<T>(_:T) {

            //stop listening for pause events
        Luxe.events.unlisten(paused_event_id);

        cleanup();

    } //onleave

        //when we fire the pause event (from the Pause state)
        //it lands here, because we are listening for it.
        //the type of the event is our own choice, we send it,
        //we receive it, we decide what it is. In this case, a simple
        //haxe anonymous type with a state bool, if true, pause was set
    function pause_changed( event:{ state:Bool } ) {

            //stop the particles
        snow_particles.paused = event.state;

        if(event.state) {
            Luxe.audio.pause(wind_handle);
        } else {
            Luxe.audio.unpause(wind_handle);
        }

    } //pause_changed

    var wind : AudioResource;
    var wind_handle : AudioHandle;

    function create_wind() {

        wind = Luxe.resources.audio('assets/69509__zixem__ruin-wind.ogg');
        wind_handle = Luxe.audio.loop(wind.source);

    } //create_wind

    function create_snow() {

            //particles will get a focus sheet of their own,
            //for now they are serving the purpose of demonstating
            //pausing so that things stop moving when its paused

        snow_particles = new ParticleSystem({name:'particles.snow'});
        snow_particles.pos = new Vector(256, -128);

        var emitter : ParticleEmitterOptions = {};

            emitter.name = 'snow';
            emitter.pos = new Vector();
            emitter.cache_wrap = false;
            emitter.pos_random = new Vector(Luxe.screen.w, 0);
            emitter.cache_size = 512;
            emitter.particle_image = Luxe.resources.texture('assets/particles/snowflake.png');
            emitter.start_color = new Color();
            emitter.end_color = new Color(1,1,1,0);
            emitter.start_size = new Vector(16,16);
            emitter.end_size = new Vector(4,4);
            emitter.rotation_random = 360;
            emitter.gravity  = new Vector(-320,620);
            emitter.speed_random = 20;
            emitter.life = 1;
            emitter.depth = 2;
            emitter.emit_count = 16;
            emitter.emit_time  = 0.02;

        snow_particles.add_emitter(emitter);

    } //create_snow

    function cleanup() {

        Luxe.audio.stop(wind_handle);
        snow_particles.destroy();

    } //cleanup

    override function onkeydown( e:KeyEvent ) {

            //if you put game input below this line
            //it would only happen if not paused
        if(Main.state.enabled('pause')) return;

    } //onkeydown

    override function onkeyup( e:KeyEvent ) {

        var is_paused = Main.state.enabled('pause');

            //important menu based keys
        if(e.keycode == Key.escape) {
            if(!is_paused) {
                Main.state.enable('pause');
            }
        }

    } //onkeyup

    override function update( dt:Float ) {

            //don't update if paused
        if(Main.state.enabled('pause')) return;

            //update code can go here,
            //when paused it would not reach

    } //update


} //Game state


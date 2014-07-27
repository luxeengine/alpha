package luxe;

import luxe.Core;
import luxe.Vector;
import snow.utils.Timer;

#if haxebullet
    import luxe.physics.bullet.PhysicsBullet;
#end //haxebullet

#if nape
    import luxe.physics.nape.PhysicsNape;
#end //nape


class Physics {


    #if haxebullet
        public var bullet : PhysicsBullet;
    #end //haxebullet

    #if nape
        public var nape : PhysicsNape;
    #end //nape

    public var core : Core;
    public var engines : Array<PhysicsEngine>;

        //how often to update
    public var fixed_rate (default,set) : Float = 1/60;
        //how many steps per update
    public var steps (default,set) : Int = 1;
        //how much is a single step. This is set from fixed_rate/steps
    public var step_size : Float = 1/60;

//Physics fixed updates
    @:noCompletion public var timer : Timer;

    public function new( _core:Core ) {

        core = _core;

    } //new

    public function init() {

        engines = [];

        #if haxebullet
            bullet = add_engine(PhysicsBullet);
        #end //haxebullet

        #if nape
            nape = add_engine(PhysicsNape);
        #end //nape

    } //init

    public function reset() {

            //stop any existing loop
        if(timer != null) {
            timer.stop();
            timer = null;
        }

            //Start the physics update loop
        timer = Luxe.timer.schedule( fixed_rate, fixed_update, true );

    } //reset

    static var tag_physics : String = 'physics';

        //called by the timer at a fixed rate
    function fixed_update() {

            Luxe.debug.start(tag_physics);

        update();

            Luxe.debug.end(tag_physics);

    } //fixed_update

    @:noCompletion public function add_engine<T1,T2>( type:Class<T1>, ?_data:T2 ) : T1 {

        var _engine_instance = Type.createInstance( type, [ _data ] );
        var _physics_engine : PhysicsEngine = cast _engine_instance;

            //start with init
        _physics_engine.init();

            //push the engine into the list to be updated
        engines.push( _physics_engine );

            //return typed instance
        return _engine_instance;

    } //add_engine

    function update() {
        for(engine in engines) {
            engine.update();
        }
    }

    public function process() {
        for(engine in engines) {
            engine.process();
        }
    } //process

    public function destroy() {

        timer.stop();
        timer = null;

        for(engine in engines) {
            engine.destroy();
        }

    } //destroy

        //on changing the fixed rate, update the physics timer
    function set_fixed_rate( _rate:Float ) {

            //update the step size
        step_size = _rate/steps;

            //reset the timer so it runs at the new rate
        reset();

        return fixed_rate = _rate;

    } //set_fixed_rate


        //on changing the fixed rate, update the physics timer
    function set_steps( _steps:Int ) {

            //update the step size
        step_size = fixed_rate/_steps;

        return steps = _steps;

    } //set_steps


} //Physics



    //base class for simple physics world
    //updates and access
class PhysicsEngine {

    @:isVar public var paused (get,set) : Bool = false;
    @:isVar public var gravity (get,set) : Vector;

    @:isVar public var draw (get,set) : Bool = true;

    public function new() {

        gravity = new Vector(0, -9.8, 0);

    } //new

    public function init() {

    } //init

    public function process() {

    } //process

    public function update() {

    } //update

    public function get_paused() : Bool {

        return paused;

    } //get_paused

    public function set_paused( ?_pause:Bool ) {

        return paused = _pause;

    } //set_paused

    public function get_draw() : Bool {

        return draw;

    } //get_draw

    public function set_draw( _draw:Bool ) : Bool {

        return draw = _draw;

    } //set_draw

    public function get_gravity() : Vector {

        return gravity;

    } //get_gravity

    public function set_gravity( _gravity:Vector ) {

        return gravity = _gravity;

    } //set_gravity

    public function destroy() {

    }

} //PhysicsEngine

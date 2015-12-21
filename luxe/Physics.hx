package luxe;

import Luxe.Ev;
import luxe.Core;
import luxe.Vector;
import snow.api.Timer;

#if deflect
    import luxe.physics.deflect.PhysicsDeflect;
#end //deflect

#if nape
    import luxe.physics.nape.PhysicsNape;
#end //nape


class Physics {


    #if deflect
        public var deflect : PhysicsDeflect;
    #end //deflect

    #if nape
        public var nape : PhysicsNape;
    #end //nape

    public var core : Core;
    public var engines : Array<PhysicsEngine>;

        //how often to update
    public var step_rate (default,set) : Float = 1/60;
        //how much is a single step. This is set from step_rate initially, but can be changed manually
    public var step_delta : Float = 1/60;

//Physics fixed updates
    @:noCompletion public var timer : Timer;

    public function new( _core:Core ) {

        core = _core;

    } //new

    public function init() {

        engines = [];

        #if deflect
            deflect = add_engine(PhysicsDeflect);
        #end //deflect

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

        if(step_rate != 0) {

                //Start the physics update loop
            timer = Luxe.timer.schedule( step_rate, fixed_update, true );

        } //only if there is a step rate

    } //reset

    static var tag_physics : String = 'physics';

        //called by the timer at a fixed rate
    function fixed_update() {

            #if !luxe_noprofile Luxe.debug.start(tag_physics); #end

        update();

            #if !luxe_noprofile Luxe.debug.end(tag_physics); #end

    } //fixed_update

        /** Add a physics engine type to be run by this class. */
    public function add_engine<T1,T2>( type:Class<T1>, ?_data:T2 ) : T1 {

        var _engine_instance = Type.createInstance( type, [ _data ] );
        var _physics_engine : PhysicsEngine = cast _engine_instance;

            //start with init
        _physics_engine.init();

            //push the engine into the list to be updated
        engines.push( _physics_engine );

            //return typed instance
        return _engine_instance;

    } //add_engine

        /** Only call this manually if step_rate is 0! */
    public function update() {
        for(engine in engines) {
            engine.update();
        }
    }

    public function process() {
        for(engine in engines) {
            engine.process();
        }
    } //process

    public function render() {
        for(engine in engines) {
            engine.render();
        }
    } //render

    public function destroy() {

        if(timer != null) {
            timer.stop();
        }

        timer = null;

        for(engine in engines) {
            engine.destroy();
        }

    } //destroy

        //on changing the fixed rate, update the physics timer
    function set_step_rate( _rate:Float ) {

            //update the step size
        step_rate = _rate;
        step_delta = step_rate;

            //reset the timer so it runs at the new rate
        reset();

        return step_rate;

    } //set_step_rate


} //Physics



    //base class for simple physics world
    //updates and access
class PhysicsEngine {

    public var name : String = 'engine';

    @:isVar public var paused (get,set) : Bool = false;
    @:isVar public var gravity (get,set) : Vector;
    @:isVar public var draw (get,set) : Bool = true;

    public function new() {

        gravity = new Vector(0, -9.8, 0);
        Luxe.on(Ev.render, _render);

    } //new

    public function init() {

    } //init

    function _render(_) {

        render();

    } //_render

    public function process() {

    } //process

    public function update() {

    } //update

    public function render() {

    } //render

    public function destroy() {

    } //destroy

//Properties

    function get_paused() : Bool {

        return paused;

    } //get_paused

    function set_paused( ?_pause:Bool ) {

        return paused = _pause;

    } //set_paused

    function get_draw() : Bool {

        return draw;

    } //get_draw

    function set_draw( _draw:Bool ) : Bool {

        return draw = _draw;

    } //set_draw

    function get_gravity() : Vector {

        return gravity;

    } //get_gravity

    function set_gravity( _gravity:Vector ) {

        return gravity = _gravity;

    } //set_gravity

} //PhysicsEngine

package luxe;

import luxe.Core;


#if haxebullet
    import luxe.physics.bullet.PhysicsBullet;
#end //haxebullet

#if nape
    import luxe.physics.nape.PhysicsNape;
    import luxe.Vector;
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

    public function process() {
        for(engine in engines) {
            engine.process();
        }
    } //process
    
    public function destroy() {
        for(engine in engines) {
            engine.destroy();
        }
    } //destroy


} //Physics



    //base class for simple physics world 
    //updates and access
class PhysicsEngine {

    @:isVar public var paused (get,set) : Bool = false;
    @:isVar public var gravity (get,set) : Vector;

    public var draw : Bool = true;

    public function new() {

        gravity = new Vector(0, -9.8, 0);

    } //new

    public function init() {

    } //innit

    public function process() {

    } //process

    public function get_paused() : Bool {
        
        return paused;

    } //get_paused

    public function set_paused( ?_pause:Bool ) {

        return paused = _pause;

    } //set_paused

    public function get_gravity() : Vector {
        
        return gravity;

    } //get_gravity

    public function set_gravity( _gravity:Vector ) {

        return gravity = _gravity;

    } //set_gravity

    public function destroy() {

    }

} //PhysicsEngine

package luxe;

import luxe.Core;

#if haxebullet
    import luxe.physics.PhysicsBullet;
#end //haxebullet

class Physics {

#if haxebullet    
    public var bullet : PhysicsBullet;
#end //haxebullet
        
    public var core : Core;
    public var engines : Array<PhysicsEngine>;

    public function new( _core:Core ) {
        core = _core;
    }

    public function init() {

        engines = [];

        #if haxebullet
            bullet = add_engine(luxe.physics.PhysicsBullet);
        #end //haxebullet

    }

    @:noCompletion public function add_engine<T1,T2>( type:Class<T1>, ?_data:T2 ) : T1 {

        var _engine_instance = Type.createInstance( type, [ _data ] );        
            //cast to Component so we can set its name
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
    }
    
    public function destroy() {
        for(engine in engines) {
            engine.destroy();
        }
    }

}

    //base class for simple physics world 
    //updates and access
class PhysicsEngine {

    public var paused : Bool = false;

    public function new() {

    } //new


    public function init() {
    } //innit

    public function process() {
    } //process

    public function pause( ?_pause:Bool = true ) {

            //if already paused
            //and we unpausing, start the loop
        if(paused) {
            if(_pause == false) {
                // start_loop();
            }
        }

        paused = _pause;

    } //pause

    public function destroy() {

    }


} //Physics
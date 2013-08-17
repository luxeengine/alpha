package luxe;

import luxe.Core;

#if lime_html5
import bullet.AmmoBinding;
#end //lime_html

import bullet.bulletCollision.broadphaseCollision.BtDbvtBroadphase;
import bullet.bulletCollision.collisionDispatch.BtCollisionDispatcher;
import bullet.bulletCollision.collisionDispatch.BtDefaultCollisionConfiguration;
import bullet.bulletDynamics.constraintSolver.BtSequentialImpulseConstraintSolver;
import bullet.bulletDynamics.dynamics.BtDiscreteDynamicsWorld;

import bullet.bulletDynamics.dynamics.BtRigidBody;


class Physics {
	
	public var core : Core;
    public function new( _core:Core ) { core = _core; }

    public var rate : Float = 0.0167;
    public var step_rate : Float = 0.0167;
    public var max_iterations : Int = 10;
    public var paused : Bool = false;
    public var do_debug_draw : Bool = true;

	var broadphase:BtDbvtBroadphase;
	var collisionConfiguration:BtDefaultCollisionConfiguration;
	var dispatcher:BtCollisionDispatcher;
	var solver:BtSequentialImpulseConstraintSolver;
	public var dynamicsWorld:BtDiscreteDynamicsWorld;

	public function startup() {

		    // Build the broadphase
	    broadphase = new BtDbvtBroadphase();
	    	// Set up the collision configuration and dispatcher
	    collisionConfiguration = new BtDefaultCollisionConfiguration();
            // And the collision dispatcher
	    dispatcher = new BtCollisionDispatcher( collisionConfiguration );
	    	// The physics solver
	    solver = new BtSequentialImpulseConstraintSolver();
	    	// Create the world 
	    dynamicsWorld = new BtDiscreteDynamicsWorld( dispatcher, broadphase, solver, collisionConfiguration );
	    	// Set the default gravity
	    dynamicsWorld.setGravity( new Vector( 0, -10, 0 ) );

    	core._debug(':: luxe :: \t Physics Initialized.');

    }  //startup

    public function setGravity( _gravity:luxe.Vector ) {

    	dynamicsWorld.setGravity( _gravity );

    } //setGravity

    public function addRigidBody( _body:BtRigidBody ) {

    	dynamicsWorld.addRigidBody( _body );

    } //addRigidBody

    private function start_loop() {
			//Set the fixed update to get started
	    // haxe.Timer.delay( fixedProcess, Std.int(rate*1000) );
    } //start_loop

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

    public function process() {

    	if(!paused) {

    			//Update the simulation
	    	dynamicsWorld.stepSimulation( Luxe.dt, max_iterations );       

	    } //paused 

    } //fixedProcess

    public function shutdown() {

    	dynamicsWorld.destroy();
    	solver.destroy();
    	dispatcher.destroy();
    	collisionConfiguration.destroy();
    	broadphase.destroy();

		core._debug(':: luxe :: \t Physics shut down.');
    } //shutdown

} //Physics
package luxe.physics.bullet;

#if haxebullet

    import bullet.bulletCollision.broadphaseCollision.BtDbvtBroadphase;
    import bullet.bulletCollision.collisionDispatch.BtCollisionDispatcher;
    import bullet.bulletCollision.collisionDispatch.BtDefaultCollisionConfiguration;
    import bullet.bulletDynamics.constraintSolver.BtSequentialImpulseConstraintSolver;
    import bullet.bulletDynamics.dynamics.BtDiscreteDynamicsWorld;

    import bullet.bulletDynamics.dynamics.BtRigidBody;
    
    import luxe.physics.bullet.DebugDraw;

    #if luxe_html5

        import bullet.AmmoBinding;
        import luxe.Vector;

    #end //luxe_html5

    class PhysicsBullet extends luxe.Physics.PhysicsEngine {

        public var debugdraw : DebugDraw;
        public var rate : Float = 0.0167;
        public var step_rate : Float = 0.0167;
        public var max_iterations : Int = 7;

        public var world : BtDiscreteDynamicsWorld;

        var broadphase : BtDbvtBroadphase;
        var config : BtDefaultCollisionConfiguration;
        var dispatcher : BtCollisionDispatcher;
        var solver : BtSequentialImpulseConstraintSolver;        

        public override function init() {

                // Build the broadphase
            broadphase = new BtDbvtBroadphase();
                // Set up the collision configuration and dispatcher
            config = new BtDefaultCollisionConfiguration();
                // And the collision dispatcher
            dispatcher = new BtCollisionDispatcher( config );
                // The physics solver
            solver = new BtSequentialImpulseConstraintSolver();
                // Create the world 
            world = new BtDiscreteDynamicsWorld( dispatcher, broadphase, solver, config );
                // Set the default gravity
            gravity = new Vector( 0, -10, 0 );

                // Create the debug draw
            debugdraw = new DebugDraw();

        }  //init

        override function set_gravity( _gravity:Vector ) {

            if(world != null) {
                world.setGravity( _gravity );
            }

            return super.set_gravity(_gravity);

        } //setGravity

        public function add_rigidbody( _body:BtRigidBody ) {

            world.addRigidBody( _body );

        } //addRigidBody

        public override function process() {

            super.process();

            if(!paused) {

                Luxe.debug.start('physics');
                    //Update the simulation
                world.stepSimulation( rate, max_iterations, step_rate );       

                Luxe.debug.end('physics');

            } //paused 

            if(draw) {
                debugdraw.clear();
                debugdraw.draw( world );
            }

        } //process

        override function set_draw( _draw:Bool ) : Bool {

                //clean up any potential geometry when disabling drawing
            if(!_draw) {
                debugdraw.clear();
            }

            return super.set_draw(_draw);

        } //set_draw

        public override function destroy() {

            super.destroy();

            debugdraw.destroy();
            world.destroy();
            solver.destroy();
            dispatcher.destroy();
            config.destroy();
            broadphase.destroy();            

        } //destroy

    } //PhysicsBullet

#end //haxebullet


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
            #if !luxe_html5
                debugdraw = new DebugDraw();
            #end //luxe_html5

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

            #if !luxe_html5
                if(draw) {
                    debugdraw.clear();
                    debugdraw.draw( world );
                }
            #end

        } //process

        public override function update() {

            super.update();

            if(!paused) {

                    //Update the simulation
                for(i in 0 ... Luxe.physics.steps) {
                    world.stepSimulation( Luxe.physics.step_size, max_iterations, step_rate );
                }

            } //paused

        } //update

        override function set_draw( _draw:Bool ) : Bool {

            #if !luxe_html5
                    //clean up any potential geometry when disabling drawing
                if(!_draw) {
                    debugdraw.clear();
                }
            #end

            return super.set_draw(_draw);

        } //set_draw

        public override function destroy() {

            super.destroy();

            #if !luxe_html5
                debugdraw.destroy();
            #end //luxe_html5

            world.destroy();
            solver.destroy();
            dispatcher.destroy();
            config.destroy();
            broadphase.destroy();

        } //destroy

    } //PhysicsBullet

#end //haxebullet


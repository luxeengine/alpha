package luxe.physics.bullet;

#if haxebullet

    import bullet.bulletCollision.broadphaseCollision.BtDbvtBroadphase;
    import bullet.bulletCollision.collisionDispatch.BtCollisionDispatcher;
    import bullet.bulletCollision.collisionDispatch.BtDefaultCollisionConfiguration;
    import bullet.bulletDynamics.constraintSolver.BtSequentialImpulseConstraintSolver;
    import bullet.bulletDynamics.dynamics.BtDiscreteDynamicsWorld;

    import bullet.bulletDynamics.dynamics.BtRigidBody;

    import luxe.physics.bullet.DebugDraw;

    #if luxe_web

        import bullet.AmmoBinding;
        import luxe.Vector;

    #end //luxe_web

    class PhysicsBullet extends luxe.Physics.PhysicsEngine {

        public var debugdraw : DebugDraw;
            //read http://bulletphysics.org/mediawiki-1.5.8/index.php/Stepping_The_World
            //for information on this parameter.
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
            #if !luxe_web
                debugdraw = new DebugDraw();
            #end //luxe_web

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

        public override function render() {

            super.render();

            #if !luxe_web
                if(draw) {
                    debugdraw.clear();
                    debugdraw.draw( world );
                }
            #end

        } //render

        public override function update() {

            super.update();

            if(!paused) {

                    //Update the simulation
                var ts_step : Float = Luxe.physics.step_delta * Luxe.timescale;
                world.stepSimulation( ts_step, max_iterations, ts_step );

            } //paused

        } //update

        override function set_draw( _draw:Bool ) : Bool {

            #if !luxe_web
                    //clean up any potential geometry when disabling drawing
                if(!_draw) {
                    debugdraw.clear();
                }
            #end

            return super.set_draw(_draw);

        } //set_draw

        public override function destroy() {

            super.destroy();

            #if !luxe_web
                debugdraw.destroy();
            #end //luxe_web

            world.destroy();
            solver.destroy();
            dispatcher.destroy();
            config.destroy();
            broadphase.destroy();

        } //destroy

    } //PhysicsBullet

#end //haxebullet


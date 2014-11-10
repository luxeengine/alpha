package luxe.components.physics.deflect.three;


#if deflect


    import deflect.collision.shapes.BtSphereShape;
    import deflect.dynamics.dynamics.BtRigidBody;

    import luxe.components.physics.deflect.three.ShapeCollider;
    import luxe.Component;

    import luxe.utils.Maths;

    class RigidBody extends Component {

        public var rigid_body : BtRigidBody;
        public var collider : ShapeCollider;

        public var inertia : deflect.math.Vector;
        public var mass : Float = 1;
        public var kinematic : Bool = false;
        public var _rotation : deflect.math.Quaternion;

        public var localInertia : deflect.math.Vector;
        public var linearDamping : Float = 0;
        public var angularDamping : Float = 0;
        public var friction : Float = 0.5;
        public var rollingFriction : Float = 0;
        public var restitution : Float = 0;
        public var linearSleepingThreshold : Float = 0.8;
        public var angularSleepingThreshold : Float = 1.0;

            //these are more advanced features that are not really required (see bullet docs)

        public var additionalDamping : Bool = false;
        public var additionalDampingFactor : Float = 0.005;
        public var additionalLinearDampingThresholdSqr : Float = 0.01;
        public var additionalAngularDampingThresholdSqr : Float = 0.01;
        public var additionalAngularDampingFactor : Float = 0.01;

        var construct_info : BtRigidBodyConstructOptions;

        override function init() {

            inertia = new deflect.math.Vector(0,0,0);
            _rotation = new deflect.math.Quaternion(0,0,0,1);

            if(collider == null) {
                var _collider : ShapeCollider = get('collider');
                if(_collider != null) {
                    collider = _collider;
                }
            }  //no collider assigned pre init

            construct_info = {

                localInertia : inertia,
                mass : mass,
                linearDamping : linearDamping,
                angularDamping : angularDamping,
                friction : friction,
                rollingFriction : rollingFriction,
                restitution : restitution,
                linearSleepingThreshold : linearSleepingThreshold,
                angularSleepingThreshold : angularSleepingThreshold,

                additionalDamping : additionalDamping,
                additionalDampingFactor : additionalDampingFactor,
                additionalLinearDampingThresholdSqr : additionalLinearDampingThresholdSqr,
                additionalAngularDampingThresholdSqr : additionalAngularDampingThresholdSqr,
                additionalAngularDampingFactor : additionalAngularDampingFactor

            } //construct_info

        } //init

        override function onreset() {

            rigid_body = new BtRigidBody( collider.shape, new deflect.math.Vector(pos.x,pos.y,pos.z), _rotation, construct_info );

                //Add to the world for updates
            Luxe.physics.deflect.add_rigidbody( rigid_body );

        } //onreset


        override function update(dt:Float) {

            if(mass > 0 && !kinematic) {
                    //apply origin
                pos.set_xyz(rigid_body.origin.x, rigid_body.origin.y, rigid_body.origin.z);
                     //set to the entity
                rotation.set(rigid_body.rotation.x, rigid_body.rotation.y, rigid_body.rotation.z, rigid_body.rotation.w);

            } //only if not static

        } //update

        public function destroyed() {

        } //destroyed

    } //RigidBody

#end //deflect

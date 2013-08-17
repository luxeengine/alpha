package luxe.components.physics;


import bullet.bulletCollision.collisionShapes.BtSphereShape;
import bullet.bulletDynamics.dynamics.BtRigidBody;

import luxe.components.physics.ShapeCollider;
import luxe.components.Components.Component;

import luxe.Quaternion;
import luxe.Vector;
import phoenix.utils.Maths;

class RigidBody extends Component {

    public var rigid_body : BtRigidBody;
    public var collider : ShapeCollider;
    
    public var inertia : Vector;
    public var mass : Float = 1;
    public var kinematic : Bool = false;
    public var _rotation : Quaternion;

    public var localInertia : Vector;
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

    private var construct_info : Dynamic;

    var _rotation_vector : Vector;

    public function init() {

        inertia = new Vector(0,0,0);
        _rotation = new Quaternion(0,0,0,1);
        _rotation_vector = new Vector();

        if(collider == null) {
            var _collider : ShapeCollider = get('collider');
            if(_collider != null) {
                collider = _collider;
            }
        }  //no collider assigned pre startup

        construct_info = {

            localInertia : inertia,
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

    public function start() {

        rigid_body = new BtRigidBody( collider.shape, mass, pos, _rotation, construct_info );

            //Add to the world for updates
        Luxe.physics.addRigidBody( rigid_body );

    } //start

    

    public function update(dt:Float) {

        if(mass > 0 && !kinematic) {
                //apply origin
            pos = rigid_body.origin;
                //apply rotation to cache
            _rotation_vector.setEulerFromQuaternion( rigid_body.rotation );
                 //set to the entity
            rotation = _rotation_vector;

        } //only if not static

    } //update

    public function destroy() {

    } //destroy

} //RigidBody
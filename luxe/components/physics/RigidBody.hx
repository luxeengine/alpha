package luxe.components.physics;


import bullet.bulletCollision.collisionShapes.BtSphereShape;
import bullet.bulletDynamics.dynamics.BtRigidBody;

import luxe.components.physics.ShapeCollider;
import luxe.components.Components.Component;

import luxe.Quaternion;
import luxe.Vector;

class RigidBody extends Component {

    public var rigid_body : BtRigidBody;
    public var collider : ShapeCollider;
    
    public var inertia : Vector;
    public var mass : Float = 1;
    public var kinematic : Bool = false;
    public var _rotation : Quaternion;

    public function init() {

        inertia = new Vector(0,0,0);
        _rotation = new Quaternion(0,0,0,1);

        if(collider == null) {
            var _collider : ShapeCollider = get('collider');
            if(_collider != null) {
                collider = _collider;
            }
        }  //no collider assigned pre startup

    } //init

    public function start() {

        rigid_body = new BtRigidBody( collider.shape, mass, pos, _rotation, inertia );

            //Add to the world for updates
        Luxe.physics.addRigidBody( rigid_body );

    } //start

    public function update(dt:Float) {

        if(mass > 0 && !kinematic) {
            pos = rigid_body.origin;
        } //only if not static

    } //update

    public function destroy() {

    } //destroy

} //RigidBody
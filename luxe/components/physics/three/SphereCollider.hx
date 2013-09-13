package luxe.components.physics.three;
	
import luxe.Vector;

import bullet.bulletCollision.collisionShapes.BtSphereShape;

import luxe.components.physics.three.ShapeCollider;

class SphereCollider extends ShapeCollider {
	
	public var radius : Float;

	public function init() {

		radius = 1.0;

		shape = new BtSphereShape(radius);

	} //init


} //PlaneCollider
package luxe.components.physics;
	
import luxe.Vector;

import bullet.bulletCollision.collisionShapes.BtSphereShape;

import luxe.components.physics.ShapeCollider;

class SphereCollider extends ShapeCollider {
	
	public var radius : Float;

	public function init() {

		radius = 1.0;

		shape = new BtSphereShape(radius);

		trace(' sphere collider init ');

	} //init


} //PlaneCollider
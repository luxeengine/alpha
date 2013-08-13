package luxe.components.physics;
	
import luxe.Vector;

import bullet.bulletCollision.collisionShapes.BtStaticPlaneShape;

import luxe.components.physics.ShapeCollider;

class PlaneCollider extends ShapeCollider {

	
	public var normal : Vector;

	public function init() {

		normal = new Vector(0,1,0);

		shape = new BtStaticPlaneShape( normal, 1 );

		trace(' plane collider init ');

	} //init


} //PlaneCollider
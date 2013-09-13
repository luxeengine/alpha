package luxe.components.physics.three;
	
import luxe.Vector;

import bullet.bulletCollision.collisionShapes.BtStaticPlaneShape;

import luxe.components.physics.three.ShapeCollider;

class PlaneCollider extends ShapeCollider {

	
	public var normal : Vector;

	public function init() {

		normal = new Vector(0,1,0);

		shape = new BtStaticPlaneShape( normal, 1 );

	} //init

} //PlaneCollider
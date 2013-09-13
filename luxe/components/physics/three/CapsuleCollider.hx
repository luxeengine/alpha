package luxe.components.physics.three;
	
import luxe.Vector;

import bullet.bulletCollision.collisionShapes.BtCapsuleShape;

import luxe.components.physics.three.ShapeCollider;

class CapsuleCollider extends ShapeCollider {
	
	public var radius : Float = 1;
	public var height : Float = 1;

	public function init() {

		shape = new BtCapsuleShape( radius, height );

	} //init

} //CapsuleCollider
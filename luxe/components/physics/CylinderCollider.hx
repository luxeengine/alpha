package luxe.components.physics;
	
import luxe.Vector;

import bullet.bulletCollision.collisionShapes.BtCylinderShape;

import luxe.components.physics.ShapeCollider;

class CylinderCollider extends ShapeCollider {
	
	public var width : Float = 1;
	public var height : Float = 1;
	public var depth : Float = 1;

	public function init() {

		shape = new BtCylinderShape( width, height, depth );

	} //init

} //CylinderCollider
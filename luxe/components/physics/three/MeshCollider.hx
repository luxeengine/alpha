package luxe.components.physics.three;
	
import luxe.Vector;

import bullet.bulletCollision.collisionShapes.BtBvhTriangleMeshShape;

import luxe.components.physics.three.ShapeCollider;

class MeshCollider extends ShapeCollider {
	
	public var mesh : Mesh;
	public var quantization : Bool = true;
	public var build_bvh : Bool = true;

	public function init() {
		
		var mesh_vertices : Array<Float> = [];
		
		for(_vert in mesh.geometry.vertices) {
			mesh_vertices.push(_vert.pos.x);
			mesh_vertices.push(_vert.pos.y);
			mesh_vertices.push(_vert.pos.z);
		}

		shape = new BtBvhTriangleMeshShape( mesh_vertices, quantization, build_bvh );

	} //init

} //MeshCollider
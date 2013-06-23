package phoenix.geometry;

import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;

class QuadGeometry extends Geometry {

	public function new( quad : Dynamic ) {
			
		super();

		set(quad);
	}

 	public function set( quad:Dynamic) {
 		
 		vertices.splice(0,vertices.length);

 			//First triangle

 		var vert0 : Vertex = new Vertex( new Vector(0,0) );
 			vert0.uv[0] = new TextureCoord(0,0);

 		var vert1 : Vertex = new Vertex( new Vector(quad.width,0) );
 			vert1.uv[0] = new TextureCoord(1,0);

 		var vert2 : Vertex = new Vertex( new Vector(quad.width,quad.height) );
 	 		vert2.uv[0] = new TextureCoord(1,1);

 			//Second triangle

 		var vert3 : Vertex = new Vertex( new Vector(0, quad.height) );
 	 		vert3.uv[0] = new TextureCoord(0,1);

 		var vert4 : Vertex = new Vertex( new Vector(0,0) );
 	 		vert4.uv[0] = new TextureCoord(0,0);

 		var vert5 : Vertex = new Vertex( new Vector(quad.width,quad.height) );
 	 		vert5.uv[0] = new TextureCoord(1,1);

 			//Add to the list

 		vertices.add( vert0 );
 		vertices.add( vert1 );
 		vertices.add( vert2 );
 		vertices.add( vert3 );
 		vertices.add( vert4 );
 		vertices.add( vert5 );

 	}

}
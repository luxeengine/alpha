package phoenix.geometry;

import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.Vector;

class QuadGeometry extends Geometry {

	public function new( options : Dynamic ) {
			
		super(options);
		set(options);

	}

 	public function set( quad:Dynamic ) {
 		
 		vertices.splice(0, vertices.length);        

        //Create the rectangle at it's origin,
        //so that when geometry.pos is set it is translated accordingly

            //First triangle

        var vert0 : Vertex = new Vertex( new Vector( origin.x, origin.y ) );
           vert0.uv[0] = new TextureCoord(0,0);

        var vert1 : Vertex = new Vertex( new Vector( origin.x+quad.width, origin.y ) );
           vert1.uv[0] = new TextureCoord(1,0);

        var vert2 : Vertex = new Vertex( new Vector( origin.x+quad.width, origin.y+quad.height ) );
            vert2.uv[0] = new TextureCoord(1,1);

           //Second triangle

        var vert3 : Vertex = new Vertex( new Vector( origin.x , origin.y+quad.height ) );
            vert3.uv[0] = new TextureCoord(0,1);

        var vert4 : Vertex = new Vertex( new Vector( origin.x , origin.y ) );
            vert4.uv[0] = new TextureCoord(0,0);

        var vert5 : Vertex = new Vertex( new Vector( origin.x+quad.width , origin.y+quad.height ) );
            vert5.uv[0] = new TextureCoord(1,1);

           //Add to the list

        vertices.push( vert0 );
        vertices.push( vert1 );
        vertices.push( vert2 );
        vertices.push( vert3 );
        vertices.push( vert4 );
        vertices.push( vert5 );


        primitive_type = PrimitiveType.triangles;
        immediate = false;

            //And finally move it into place
        pos = new Vector(quad.x, quad.y);

 	}

}
package phoenix.geometry;

import lab.Vector;
import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.Vector;

class QuadGeometry extends Geometry {

	public function new( options : Dynamic ) {
			
		super(options);
		set(options);

	}

    public function uv( _tl:Vector, _sz:Vector ) {

        if(texture == null) return;

        var tl = new Vector(_tl.x/texture.width, _tl.y/texture.height);
        var sz = new Vector(_sz.x/texture.width, _sz.y/texture.height);

        vertices[0].uv[0] = new TextureCoord( tl.x , tl.y );
        vertices[1].uv[0] = new TextureCoord( tl.x + sz.x , tl.y );
        vertices[2].uv[0] = new TextureCoord( tl.x + sz.x , tl.y + sz.y );
        vertices[3].uv[0] = new TextureCoord( tl.x , tl.y + sz.y );
        vertices[4].uv[0] = new TextureCoord( tl.x , tl.y );
        vertices[5].uv[0] = new TextureCoord( tl.x + sz.x , tl.y + sz.y );
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

        add( vert0 );
        add( vert1 );
        add( vert2 );
        add( vert3 );
        add( vert4 );
        add( vert5 );


        primitive_type = PrimitiveType.triangles;
        immediate = false;

            //And finally move it into place
        pos = new Vector(quad.x, quad.y);

 	}

}
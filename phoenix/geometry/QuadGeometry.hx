package phoenix.geometry;

import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;

class QuadGeometry extends Geometry {

    public var verts : Map<String, Vertex>;

	public function new( quad : Dynamic ) {
			
		super();

        verts = new Map();

		set(quad);
	}

 	public function set( quad:Dynamic) {
 		
 		vertices.splice(0,vertices.length);
        verts = null;
        verts = new Map();

        //bl
        var vert0 : Vertex = new Vertex( new Vector( quad.x , quad.y+quad.height ) );
            vert0.uv[0] = new TextureCoord(0,1);
        //tl
        var vert1 : Vertex = new Vertex( new Vector( quad.x, quad.y ) );
            vert1.uv[0] = new TextureCoord(0,0);
        //br
        var vert2 : Vertex = new Vertex( new Vector( quad.x+quad.width, quad.y+quad.height ) );
            vert2.uv[0] = new TextureCoord(1,1);
        //tr
        var vert3 : Vertex = new Vertex( new Vector( quad.x+quad.width, quad.y ) );
            vert3.uv[0] = new TextureCoord(1,0);

        vertices.push( vert0 );
        vertices.push( vert1 );
        vertices.push( vert2 );
        vertices.push( vert3 );      

        verts['tl'] = vert1;
        verts['tr'] = vert3;
        verts['bl'] = vert0;
        verts['br'] = vert2;

        primitive_type = PrimitiveType.triangle_strip;

 	}

}
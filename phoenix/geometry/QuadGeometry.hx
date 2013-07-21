package phoenix.geometry;

import lab.Vector;
import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.Vector;

class QuadGeometry extends Geometry {

	public function new( options : Dynamic ) {

		super(options);
		set( new Rectangle(options.x, options.y, options.width, options.height) );

        if(options.enabled != null) enabled = options.enabled;
	}

    public function uv( _rect:lab.Rectangle ) {

        if(texture == null) return;

        var tl = new Vector(_rect.x/texture.width, _rect.y/texture.height);
        var sz = new Vector(_rect.w/texture.width, _rect.h/texture.height);

        vertices[0].uv[0] = new TextureCoord( tl.x , tl.y );
        vertices[1].uv[0] = new TextureCoord( tl.x + sz.x , tl.y );
        vertices[2].uv[0] = new TextureCoord( tl.x + sz.x , tl.y + sz.y );
        vertices[3].uv[0] = new TextureCoord( tl.x , tl.y + sz.y );
        vertices[4].uv[0] = new TextureCoord( tl.x , tl.y );
        vertices[5].uv[0] = new TextureCoord( tl.x + sz.x , tl.y + sz.y );
    }

    public function resize( quad:lab.Rectangle ) {

        vertices[0].pos = new Vector( pos.x,            pos.y );
        vertices[1].pos = new Vector( pos.x+quad.w,     pos.y );
        vertices[2].pos = new Vector( pos.x+quad.w,     pos.y+quad.h );

        vertices[3].pos = new Vector( pos.x,            pos.y+quad.h );
        vertices[4].pos = new Vector( pos.x,            pos.y );
        vertices[5].pos = new Vector( pos.x+quad.w,     pos.y+quad.h );

            //adjust for the origin
        translate(origin.inverted);
    }

 	public function set( quad:lab.Rectangle ) {
 		
 		vertices.splice(0, vertices.length);        

        //Create the rectangle at it's origin,
        //so that when geometry.pos is set it is translated accordingly

            //First triangle

        var vert0 : Vertex = new Vertex( new Vector( 0, 0 ) );
           vert0.uv[0] = new TextureCoord(0,0);

        var vert1 : Vertex = new Vertex( new Vector( quad.w, 0 ) );
           vert1.uv[0] = new TextureCoord(1,0);

        var vert2 : Vertex = new Vertex( new Vector( quad.w, quad.h ) );
            vert2.uv[0] = new TextureCoord(1,1);

           //Second triangle

        var vert3 : Vertex = new Vertex( new Vector( 0 , 0+quad.h ) );
            vert3.uv[0] = new TextureCoord(0,1);

        var vert4 : Vertex = new Vertex( new Vector( 0 , 0 ) );
            vert4.uv[0] = new TextureCoord(0,0);

        var vert5 : Vertex = new Vertex( new Vector( quad.w , quad.h ) );
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

            //adjust for origin
        translate(origin.inverted);

            //And finally move it into place
        pos = new Vector(quad.x, quad.y);

 	}

}
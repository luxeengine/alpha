package phoenix.geometry;

import phoenix.Vector;
import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.Vector;

class QuadGeometry extends Geometry {

    @:isVar public var flipx(default, set) : Bool = false;
    @:isVar public var flipy(default, set) : Bool = false;

    var _uv_cache : luxe.Rectangle;

    var is_set : Bool = false;

	public function new( options : Dynamic ) {

		super(options);
        
        if(options == null) return;

            //Do these before set, so they can be applied
        if(options.flipx != null) flipx = options.flipx;
        if(options.flipy != null) flipy = options.flipy;

            //Init
        _uv_cache = new luxe.Rectangle(0,0,1,1);

            //Apply the new options rect
		set( new Rectangle(options.x, options.y, options.w, options.h) );

        if(options.enabled != null) enabled = options.enabled;
        if(options.immediate != null) immediate = options.immediate;

	}

    public function uv( _rect:luxe.Rectangle ) {

        if(texture == null) { 
            trace("Warning : calling UV on a geometry with null texture.");
            return;
        }

        var tlx = _rect.x/texture.actual_width;
        var tly = _rect.y/texture.actual_height;    
        var szx = _rect.w/texture.actual_width;
        var szy = _rect.h/texture.actual_height;

        uv_space( new luxe.Rectangle( tlx, tly, szx, szy ) );

    } //uv

    public function uv_space( _rect:luxe.Rectangle ) {

            //the uv width and height
        var sz_x = _rect.w;
        var sz_y = _rect.h;

            //tl
        var tl_x = _rect.x;
        var tl_y = _rect.y;

            //Keep for later, before changing the values for flipping
        _uv_cache.set( tl_x, tl_y, sz_x, sz_y );

            //tr
        var tr_x = tl_x + sz_x;
        var tr_y = tl_y;
            //br
        var br_x = tl_x + sz_x;
        var br_y = tl_y + sz_y;
            //bl
        var bl_x = tl_x;
        var bl_y = tl_y + sz_y;
            
        var tmp_x = 0.0;
        var tmp_y = 0.0;

                //flipped y swaps tl and tr with bl and br, only on y
            if(flipy) {

                    //swap tl and bl
                tmp_y = bl_y;
                    bl_y = tl_y;
                    tl_y = tmp_y;

                    //swap tr and br
                tmp_y = br_y;
                    br_y = tr_y;
                    tr_y = tmp_y;

            } //flipy

                //flipped x swaps tl and bl with tr and br, only on x
            if(flipx) {

                    //swap tl and tr
                tmp_x = tr_x;
                    tr_x = tl_x;
                    tl_x = tmp_x;

                    //swap bl and br
                tmp_x = br_x;
                    br_x = bl_x;
                    bl_x = tmp_x;

            } //flipx

        vertices[0].uv[0] = new TextureCoord( tl_x , tl_y );
        vertices[1].uv[0] = new TextureCoord( tr_x , tr_y );
        vertices[2].uv[0] = new TextureCoord( br_x , br_y );

        vertices[3].uv[0] = new TextureCoord( bl_x , bl_y );
        vertices[4].uv[0] = new TextureCoord( tl_x , tl_y );
        vertices[5].uv[0] = new TextureCoord( br_x , br_y );

            //if it's locked, it needs to be refreshed to the gpu
        dirty = true;

    } //set uv in uv space directly

    public function resize( quad:luxe.Rectangle ) {

        vertices[0].pos = new Vector( pos.x,            pos.y );
        vertices[1].pos = new Vector( pos.x+quad.w,     pos.y );
        vertices[2].pos = new Vector( pos.x+quad.w,     pos.y+quad.h );

        vertices[3].pos = new Vector( pos.x,            pos.y+quad.h );
        vertices[4].pos = new Vector( pos.x,            pos.y );
        vertices[5].pos = new Vector( pos.x+quad.w,     pos.y+quad.h );

    }

 	public function set( quad:luxe.Rectangle ) {
 		
 		vertices.splice(0, vertices.length);        

        //Create the rectangle at it's origin,
        //so that when geometry.pos is set it is translated accordingly

            //First triangle
        var vert0 : Vertex = new Vertex( new Vector( 0, 0 ) );
        var vert1 : Vertex = new Vertex( new Vector( quad.w, 0 ) );
        var vert2 : Vertex = new Vertex( new Vector( quad.w, quad.h ) );

           //Second triangle
        var vert3 : Vertex = new Vertex( new Vector( 0 , quad.h ) );
        var vert4 : Vertex = new Vertex( new Vector( 0 , 0 ) );
        var vert5 : Vertex = new Vertex( new Vector( quad.w , quad.h ) );

            //Apply the color to the vert
        vert0.color = color;
        vert1.color = color;
        vert2.color = color;
        vert3.color = color;
        vert4.color = color;
        vert5.color = color;
        
           //Add to the list

            //tl
        add( vert0 );
            //tr
        add( vert1 );
            //br
        add( vert2 );
            //bl
        add( vert3 );
            //tl
        add( vert4 );
            //br
        add( vert5 );


        primitive_type = PrimitiveType.triangles;
        immediate = false;

            //adjust for origin
        translate(origin.inverted);

            //And finally move it into place
        pos = new Vector(quad.x, quad.y);

            //Make sure we know we can access the verts now
        is_set = true;

            //Apply default UV, handles flipping etc
        uv_space( new luxe.Rectangle(0,0,1,1) );

 	} //set

    public function set_flipx(_val:Bool) {        
            //set before calling uv_space
        flipx = _val;

        if(is_set) {
            uv_space(_uv_cache);
        }

        return flipx;
    } //set_flipx

    public function set_flipy(_val:Bool) {

            //set before calling uv_space
        flipy = _val;

        if(is_set) {
            uv_space(_uv_cache);
        }

        return flipy;
    } //set_flipy



}
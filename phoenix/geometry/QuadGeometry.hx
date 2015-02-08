package phoenix.geometry;

import phoenix.Vector;
import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.Vector;

import luxe.options.GeometryOptions.QuadGeometryOptions;

class QuadGeometry extends Geometry {

    @:isVar public var flipx(default, set) : Bool = false;
    @:isVar public var flipy(default, set) : Bool = false;

    var _uv_cache : luxe.Rectangle;

    var is_set : Bool = false;

	public function new( ?options : QuadGeometryOptions ) {

		super(options);

        if(options == null) return;

            //Do these before set, so they can be applied
        if(options.flipx != null) flipx = options.flipx;
        if(options.flipy != null) flipy = options.flipy;

        if(options.rect != null) {
            options.x = options.rect.x;
            options.y = options.rect.y;
            options.w = options.rect.w;
            options.h = options.rect.h;
        }

            //Init
        _uv_cache = new luxe.Rectangle(0,0,1,1);

            //Apply the new options rect
		set( new Rectangle(options.x, options.y, options.w, options.h) );

        if(options.visible != null) visible = options.visible;
        if(options.immediate != null) immediate = options.immediate;

	}

    public function uv( _rect:luxe.Rectangle ) {

        if(texture == null) {
            trace("Warning : calling UV on a geometry with null texture.");
            return;
        }

        var tlx = _rect.x/texture.width_actual;
        var tly = _rect.y/texture.height_actual;
        var szx = _rect.w/texture.width_actual;
        var szy = _rect.h/texture.height_actual;

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

        vertices[0].uv.uv0.set_uv( tl_x , tl_y );
        vertices[1].uv.uv0.set_uv( tr_x , tr_y );
        vertices[2].uv.uv0.set_uv( br_x , br_y );

        vertices[3].uv.uv0.set_uv( bl_x , bl_y );
        vertices[4].uv.uv0.set_uv( tl_x , tl_y );
        vertices[5].uv.uv0.set_uv( br_x , br_y );

            //if it's locked, it needs to be refreshed to the gpu
        dirty = true;

    } //set uv in uv space directly

    public function resize( quad:luxe.Vector ) {

        vertices[0].pos.set_xy( 0,            0         );
        vertices[1].pos.set_xy( 0+quad.x,     0         );
        vertices[2].pos.set_xy( 0+quad.x,     0+quad.y  );

        vertices[3].pos.set_xy( 0,            0+quad.y  );
        vertices[4].pos.set_xy( 0,            0         );
        vertices[5].pos.set_xy( 0+quad.x,     0+quad.y  );

    }

 	public function set( quad:luxe.Rectangle ) {

 		vertices.splice(0, vertices.length);

            //First triangle
        var vert0 : Vertex = new Vertex( new Vector( 0, 0 ), color );
        var vert1 : Vertex = new Vertex( new Vector( quad.w, 0 ), color );
        var vert2 : Vertex = new Vertex( new Vector( quad.w, quad.h ), color );

           //Second triangle
        var vert3 : Vertex = new Vertex( new Vector( 0 , quad.h ), color );
        var vert4 : Vertex = new Vertex( new Vector( 0 , 0 ), color );
        var vert5 : Vertex = new Vertex( new Vector( quad.w , quad.h ), color );

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

            //And finally move it into place
        transform.pos = new Vector(quad.x, quad.y);

            //Make sure we know we can access the verts now
        is_set = true;

            //Apply default UV, handles flipping etc
        uv_space( new luxe.Rectangle(0,0,1,1) );

 	} //set

    function set_flipx(_val:Bool) {

            //set before calling uv_space
        flipx = _val;

        if(is_set) {
            uv_space(_uv_cache);
        }

        return flipx;
    } //set_flipx

    function set_flipy(_val:Bool) {

            //set before calling uv_space
        flipy = _val;

        if(is_set) {
            uv_space(_uv_cache);
        }

        return flipy;

    } //set_flipy



}

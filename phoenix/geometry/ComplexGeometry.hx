package phoenix.geometry;

import phoenix.geometry.Geometry;
import phoenix.Batcher;
import phoenix.geometry.Vertex;
import phoenix.geometry.TextureCoord;
import phoenix.Rectangle;
import phoenix.Shader;
import phoenix.Texture;

import phoenix.Color;
import phoenix.Vector;

typedef ComplexQuad = {
	uuid : String, 
	verts : Array<Vertex>,
    flipx : Bool,
    flipy : Bool,
    _uv_cache : Rectangle	
}


//Note that a complex geometry has only one texture, 
// it is for optimising singular geometry that shares many quads
// and share a shader and texture and state

class ComplexGeometry extends Geometry {

	public var quads : Map<String, ComplexQuad>;

	public function new( _options : Dynamic ) {

		super(_options);
		primitive_type = PrimitiveType.triangles;

		quads = new Map();

	}

	public function quad_add( _options:Dynamic ) : String {


		var _uuid : String = luxe.utils.UUID.get();

            //First triangle
        var vert0 : Vertex = new Vertex( new Vector( _options.x,            _options.y ) );
        var vert1 : Vertex = new Vertex( new Vector( _options.x+_options.w, _options.y ) );
        var vert2 : Vertex = new Vertex( new Vector( _options.x+_options.w, _options.y+_options.h ) );

           //Second triangle
        var vert3 : Vertex = new Vertex( new Vector( _options.x , _options.y+_options.h ) );
        var vert4 : Vertex = new Vertex( new Vector( _options.x , _options.y ) );
        var vert5 : Vertex = new Vertex( new Vector( _options.x+_options.w , _options.y+_options.h ) );

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

             //create the complex quad structure
        var _complex_quad : ComplexQuad = {
            uuid : _uuid,
            verts : new Array<Vertex>(),
            flipx : false, flipy : false,
            _uv_cache : new Rectangle(0,0,1,1)
        }

            _complex_quad.verts.push( vert0 );
            _complex_quad.verts.push( vert1 );
            _complex_quad.verts.push( vert2 );
            _complex_quad.verts.push( vert3 );
            _complex_quad.verts.push( vert4 );
            _complex_quad.verts.push( vert5 );

        quads.set( _uuid, _complex_quad );

                //for locked geometry
            dirty = true;        

        return _uuid;

	} //add_quad

    public function quad_remove( _quad_id:String ) {

        var _complex_quad : ComplexQuad = quads.get( _quad_id );
        
        if(_complex_quad != null) {

            remove( _complex_quad.verts[0] );
            remove( _complex_quad.verts[1] );
            remove( _complex_quad.verts[2] );
            remove( _complex_quad.verts[3] );
            remove( _complex_quad.verts[4] );
            remove( _complex_quad.verts[5] );

            quads.remove( _quad_id );

                //for locked geometry
            dirty = true;            

        } //_complex_quad

    } //quad_remove

    public function quad_hide( _quad_id:String ) {

        var _complex_quad : ComplexQuad = quads.get( _quad_id );
        
        if(_complex_quad != null) {

            remove( _complex_quad.verts[0] );
            remove( _complex_quad.verts[1] );
            remove( _complex_quad.verts[2] );
            remove( _complex_quad.verts[3] );
            remove( _complex_quad.verts[4] );
            remove( _complex_quad.verts[5] );

                //for locked geometry
            dirty = true;            

        } //_complex_quad

    } //quad_hide


    public function quad_show( _quad_id:String ) {

        var _complex_quad : ComplexQuad = quads.get( _quad_id );
        
        if(_complex_quad != null) {
            
            add( _complex_quad.verts[0] );
            add( _complex_quad.verts[1] );
            add( _complex_quad.verts[2] );
            add( _complex_quad.verts[3] );
            add( _complex_quad.verts[4] );
            add( _complex_quad.verts[5] );

                //for locked geometry
            dirty = true;            

        } //_complex_quad

    } //quad_hide    

    public function quad_resize( _quad_id:String, _quad : Rectangle ) {

        var _complex_quad : ComplexQuad = quads.get( _quad_id );
        
        if(_complex_quad != null) {

            _complex_quad.verts[0].pos = new Vector( _quad.x,         _quad.y );
            _complex_quad.verts[1].pos = new Vector( _quad.x+_quad.w, _quad.y );
            _complex_quad.verts[2].pos = new Vector( _quad.x+_quad.w, _quad.y+_quad.h );

            _complex_quad.verts[3].pos = new Vector( _quad.x,         _quad.y+_quad.h );
            _complex_quad.verts[4].pos = new Vector( _quad.x,         _quad.y );
            _complex_quad.verts[5].pos = new Vector( _quad.x+_quad.w, _quad.y+_quad.h );

                //for locked geometry
            dirty = true;

        } //_complex_quad

    } //remove_quad

    public function quad_pos( _quad_id:String, _p:Vector ) {
        
        var _complex_quad : ComplexQuad = quads.get( _quad_id );

        if(_complex_quad != null) {

            var _diffx = _p.x - _complex_quad.verts[0].pos.x;
            var _diffy = _p.y - _complex_quad.verts[0].pos.y;

            _complex_quad.verts[0].pos.x += _diffx;
            _complex_quad.verts[0].pos.y += _diffy;

            _complex_quad.verts[1].pos.x += _diffx;
            _complex_quad.verts[1].pos.y += _diffy;

            _complex_quad.verts[2].pos.x += _diffx;
            _complex_quad.verts[2].pos.y += _diffy;

            _complex_quad.verts[3].pos.x += _diffx;
            _complex_quad.verts[3].pos.y += _diffy;

            _complex_quad.verts[4].pos.x += _diffx;
            _complex_quad.verts[4].pos.y += _diffy;

            _complex_quad.verts[5].pos.x += _diffx;
            _complex_quad.verts[5].pos.y += _diffy;

                //for locked geometry
            dirty = true;

        } //_complex_quad != null

    } //quad_pos

    public function quad_color( _quad_id:String, _c:Color ) {

        var _complex_quad : ComplexQuad = quads.get( _quad_id );

        if(_complex_quad != null) {
            _complex_quad.verts[0].color = _c;
            _complex_quad.verts[1].color = _c;
            _complex_quad.verts[2].color = _c;
            _complex_quad.verts[3].color = _c;
            _complex_quad.verts[4].color = _c;
            _complex_quad.verts[5].color = _c;
        } //_complex_quad != null

    } //quad_color

    public function quad_alpha( _quad_id:String, _a:Float ) {

        var _complex_quad : ComplexQuad = quads.get( _quad_id );

        if(_complex_quad != null) {
            _complex_quad.verts[0].color.a = _a;
            _complex_quad.verts[1].color.a = _a;
            _complex_quad.verts[2].color.a = _a;
            _complex_quad.verts[3].color.a = _a;
            _complex_quad.verts[4].color.a = _a;
            _complex_quad.verts[5].color.a = _a;
        } //_complex_quad != null

    } //quad_alpha

    public function quad_uv_space( _quad_id:String, _uv : Rectangle ) {

        var _complex_quad : ComplexQuad = quads.get( _quad_id );

        if(_complex_quad != null) {

            var flipx = _complex_quad.flipx;
            var flipy = _complex_quad.flipy;

                //the uv width and height
            var sz_x = _uv.w;
            var sz_y = _uv.h;

                //tl
            var tl_x = _uv.x;
            var tl_y = _uv.y;

                //Keep for later, before changing the values for flipping
            _complex_quad._uv_cache.set( tl_x, tl_y, sz_x, sz_y );

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

            _complex_quad.verts[0].uv[0] = new TextureCoord( tl_x , tl_y );
            _complex_quad.verts[1].uv[0] = new TextureCoord( tr_x , tr_y );
            _complex_quad.verts[2].uv[0] = new TextureCoord( br_x , br_y );

            _complex_quad.verts[3].uv[0] = new TextureCoord( bl_x , bl_y );
            _complex_quad.verts[4].uv[0] = new TextureCoord( tl_x , tl_y );
            _complex_quad.verts[5].uv[0] = new TextureCoord( br_x , br_y );

                //for locked geometry
            dirty = true;

        } //_complex_quad != null

    } //quad_uv_space

    public function quad_uv( _quad_id:String, _uv : Rectangle ) {

        if( texture == null ) { 
            trace("Warning : calling UV on a Complex Geometry with null texture.");
            return;
        }

        var tlx = _uv.x/texture.actual_width;
        var tly = _uv.y/texture.actual_height;    
        var szx = _uv.w/texture.actual_width;
        var szy = _uv.h/texture.actual_height;

        quad_uv_space( _quad_id, new luxe.Rectangle( tlx, tly, szx, szy ) );

    } //quad_uv

    public function quad_flipx( _quad_id:String, _flip:Bool ) {

        var _complex_quad : ComplexQuad = quads.get( _quad_id );

        if(_complex_quad != null) {
            _complex_quad.flipx = _flip;
            quad_uv_space( _quad_id, _complex_quad._uv_cache );
        } //_complex_quad != null

    } //quad_flipx

    public function quad_flipy( _quad_id:String, _flip:Bool ) {

        var _complex_quad : ComplexQuad = quads.get( _quad_id );

        if(_complex_quad != null) {
            _complex_quad.flipy = _flip;
            quad_uv_space( _quad_id, _complex_quad._uv_cache );
        } //_complex_quad != null

    } //quad_flipy

} //ComplexGeometry
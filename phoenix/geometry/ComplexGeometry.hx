package phoenix.geometry;

import phoenix.geometry.Geometry;
import phoenix.Batcher;
import phoenix.geometry.Vertex;
import phoenix.Shader;
import phoenix.Texture;

import phoenix.Color;
import phoenix.Vector;

typedef ComplexQuad = {
	uuid : String, 
	verts : Array<Vertex>	
}


class ComplexGeometry extends Geometry {

	public var quads : Map<String, ComplexQuad>;

	public function new(_options) {

		super(_options);
		primitive_type = PrimitiveType.triangles;

		quads = new Map();

	}

	public function quad_add( _options:Dynamic ) : String {

			//A unique ID for this quad
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
            verts : new Array<Vertex>()
        }

            _complex_quad.verts.push( vert0 );
            _complex_quad.verts.push( vert1 );
            _complex_quad.verts.push( vert2 );
            _complex_quad.verts.push( vert3 );
            _complex_quad.verts.push( vert4 );
            _complex_quad.verts.push( vert5 );

        quads.set( _uuid, _complex_quad );

        return _uuid;

	} //add_quad

    public function quad_remove( _quad_id:String ) {

        var _complex_quad : ComplexQuad = quads.get( _quad_id );
        
        if(_complex_quad != null) {
            vertices.remove( _complex_quad.verts[0] );
            vertices.remove( _complex_quad.verts[1] );
            vertices.remove( _complex_quad.verts[2] );
            vertices.remove( _complex_quad.verts[3] );
            vertices.remove( _complex_quad.verts[4] );
            vertices.remove( _complex_quad.verts[5] );
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

        trace(_complex_quad);

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

        trace(_complex_quad);

    } //quad_alpha

} //ComplexGeometry
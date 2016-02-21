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

import luxe.Log.*;
import luxe.options.GeometryOptions;

typedef PackedQuad = {
    uid : UInt,
    verts : Array<Vertex>,
    flipx : Bool,
    flipy : Bool,
    visible : Bool,
    _uv_cache : Rectangle
}

typedef PackedQuadOptions = {
    x : Float,
    y : Float,
    w : Float,
    h : Float,

    ?color : Color,
    ?uv : Rectangle,
    ?flipx : Bool,
    ?flipy : Bool,
    ?visible : Bool
}

//Note that a quad pack geometry has only one texture,
// it is for optimising singular geometry that shares many quads
// and share a shader and texture and state

class QuadPackGeometry extends Geometry {

    public var quads : Map<Int, PackedQuad>;

    public function new(_options:GeometryOptions) {

        _options.primitive_type = PrimitiveType.triangles;

        super( _options );

        quads = new Map();

    } //new

    public function clear() {

        for(q in quads.keys()) {
            quad_remove( q );
        }

    } //clear

    public function quad_add( _options:PackedQuadOptions ) : Int {

        def(_options.visible, true);
        def(_options.flipx, false);
        def(_options.flipy, false);

        var _uid = Luxe.utils.uniquehash();

            //First triangle
        var vert0 = new Vertex( new Vector( _options.x,            _options.y ), _options.color );
        var vert1 = new Vertex( new Vector( _options.x+_options.w, _options.y ), _options.color );
        var vert2 = new Vertex( new Vector( _options.x+_options.w, _options.y+_options.h ), _options.color );

           //Second triangle
        var vert3 = new Vertex( new Vector( _options.x , _options.y+_options.h ), _options.color );
        var vert4 = new Vertex( new Vector( _options.x , _options.y ), _options.color );
        var vert5 = new Vertex( new Vector( _options.x+_options.w , _options.y+_options.h ), _options.color );

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

             //create the packed quad
        var _quad = {
            uid : _uid,
            verts : new Array<Vertex>(),
            flipx : _options.flipx,
            flipy : _options.flipx,
            visible : _options.visible,
            _uv_cache : new Rectangle(0,0,1,1)
        }

            _quad.verts.push( vert0 );
            _quad.verts.push( vert1 );
            _quad.verts.push( vert2 );
            _quad.verts.push( vert3 );
            _quad.verts.push( vert4 );
            _quad.verts.push( vert5 );

        quads.set( _uid, _quad );

        if(_options.uv != null) {
            quad_uv( _uid, _options.uv );
        }

            //for locked geometry
        dirty = true;

        return _uid;

    } //add_quad

    public function quad_remove( _quad_id:Int ) {

        var _quad = quads.get( _quad_id );

        if(_quad != null) {

            remove( _quad.verts[0] );
            remove( _quad.verts[1] );
            remove( _quad.verts[2] );
            remove( _quad.verts[3] );
            remove( _quad.verts[4] );
            remove( _quad.verts[5] );

            quads.remove( _quad_id );

                //for locked geometry
            dirty = true;

        } //_quad

    } //quad_remove

    public function quad_visible( _quad_id:Int, visible:Bool ) {

        var _quad = quads.get( _quad_id );

        if(_quad != null) {

                //add only if not already added
            if(visible && !_quad.visible) {

                _quad.visible = false;

                add( _quad.verts[0] );
                add( _quad.verts[1] );
                add( _quad.verts[2] );
                add( _quad.verts[3] );
                add( _quad.verts[4] );
                add( _quad.verts[5] );

            } else if(!visible && _quad.visible) {

                _quad.visible = false;

                remove( _quad.verts[0] );
                remove( _quad.verts[1] );
                remove( _quad.verts[2] );
                remove( _quad.verts[3] );
                remove( _quad.verts[4] );
                remove( _quad.verts[5] );

            } //visible

                //for locked geometry
            dirty = true;

        } //_quad

    } //quad_visible

    public function quad_resize( _quad_id:Int, _size : Rectangle ) {

        var _quad = quads.get( _quad_id );

        if(_quad != null) {

            _quad.verts[0].pos = new Vector( _size.x,         _size.y );
            _quad.verts[1].pos = new Vector( _size.x+_size.w, _size.y );
            _quad.verts[2].pos = new Vector( _size.x+_size.w, _size.y+_size.h );

            _quad.verts[3].pos = new Vector( _size.x,         _size.y+_size.h );
            _quad.verts[4].pos = new Vector( _size.x,         _size.y );
            _quad.verts[5].pos = new Vector( _size.x+_size.w, _size.y+_size.h );

                //for locked geometry
            dirty = true;

        } //_quad

    } //remove_quad

    public function quad_pos( _quad_id:Int, _p:Vector ) {

        var _quad = quads.get( _quad_id );

        if(_quad != null) {

            var _diffx = _p.x - _quad.verts[0].pos.x;
            var _diffy = _p.y - _quad.verts[0].pos.y;

            _quad.verts[0].pos.x += _diffx;
            _quad.verts[0].pos.y += _diffy;

            _quad.verts[1].pos.x += _diffx;
            _quad.verts[1].pos.y += _diffy;

            _quad.verts[2].pos.x += _diffx;
            _quad.verts[2].pos.y += _diffy;

            _quad.verts[3].pos.x += _diffx;
            _quad.verts[3].pos.y += _diffy;

            _quad.verts[4].pos.x += _diffx;
            _quad.verts[4].pos.y += _diffy;

            _quad.verts[5].pos.x += _diffx;
            _quad.verts[5].pos.y += _diffy;

                //for locked geometry
            dirty = true;

        } //_quad != null

    } //quad_pos

    public function quad_color( _quad_id:Int, _c:Color ) {

        var _quad = quads.get( _quad_id );

        if(_quad != null) {
            _quad.verts[0].color = _c;
            _quad.verts[1].color = _c;
            _quad.verts[2].color = _c;
            _quad.verts[3].color = _c;
            _quad.verts[4].color = _c;
            _quad.verts[5].color = _c;
        } //_quad != null

    } //quad_color

    public function quad_alpha( _quad_id:Int, _a:Float ) {

        var _quad = quads.get( _quad_id );

        if(_quad != null) {
            _quad.verts[0].color.a = _a;
            _quad.verts[1].color.a = _a;
            _quad.verts[2].color.a = _a;
            _quad.verts[3].color.a = _a;
            _quad.verts[4].color.a = _a;
            _quad.verts[5].color.a = _a;
        } //_quad != null

    } //quad_alpha

    public function quad_uv_space( _quad_id:Int, _uv : Rectangle ) {

        var _quad = quads.get( _quad_id );

        if(_quad != null) {

            var flipx = _quad.flipx;
            var flipy = _quad.flipy;

                //the uv width and height
            var sz_x = _uv.w;
            var sz_y = _uv.h;

                //tl
            var tl_x = _uv.x;
            var tl_y = _uv.y;

                //Keep for later, before changing the values for flipping
            _quad._uv_cache.set( tl_x, tl_y, sz_x, sz_y );

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

            _quad.verts[0].uv.uv0.set_uv( tl_x , tl_y );
            _quad.verts[1].uv.uv0.set_uv( tr_x , tr_y );
            _quad.verts[2].uv.uv0.set_uv( br_x , br_y );

            _quad.verts[3].uv.uv0.set_uv( bl_x , bl_y );
            _quad.verts[4].uv.uv0.set_uv( tl_x , tl_y );
            _quad.verts[5].uv.uv0.set_uv( br_x , br_y );

                //for locked geometry
            dirty = true;

        } //_quad != null

    } //quad_uv_space

    public function quad_uv( _quad_id:Int, _uv : Rectangle ) {

        if( texture == null ) {
            trace("Warning : calling UV on a PackedQuad Geometry with null texture.");
            return;
        }

        var tlx = _uv.x/texture.width_actual;
        var tly = _uv.y/texture.height_actual;
        var szx = _uv.w/texture.width_actual;
        var szy = _uv.h/texture.height_actual;

        quad_uv_space( _quad_id, new luxe.Rectangle( tlx, tly, szx, szy ) );

    } //quad_uv

    public function quad_flipx( _quad_id:Int, _flip:Bool ) {

        var _quad = quads.get( _quad_id );

        if(_quad != null) {
            _quad.flipx = _flip;
            quad_uv_space( _quad_id, _quad._uv_cache );
        } //_quad != null

    } //quad_flipx

    public function quad_flipy( _quad_id:Int, _flip:Bool ) {

        var _quad = quads.get( _quad_id );

        if(_quad != null) {
            _quad.flipy = _flip;
            quad_uv_space( _quad_id, _quad._uv_cache );
        } //_quad != null

    } //quad_flipy

} //QuadPackGeometry

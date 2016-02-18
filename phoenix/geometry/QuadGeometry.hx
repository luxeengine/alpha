package phoenix.geometry;

import phoenix.Vector;
import phoenix.geometry.Geometry;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.Vector;
import luxe.Log.*;

import luxe.options.GeometryOptions.QuadGeometryOptions;

class QuadGeometry extends Geometry {

    @:isVar public var flipx(default, set) : Bool = false;
    @:isVar public var flipy(default, set) : Bool = false;
        //Has to be a multiple of 90
    @:isVar public var uv_angle(default, set) : Int = 0;

    var _uv_x:Float = 0;
    var _uv_y:Float = 0;
    var _uv_w:Float = 1;
    var _uv_h:Float = 1;

	public function new(_options : QuadGeometryOptions) {

        _options.primitive_type = PrimitiveType.triangles;

		super(_options);

            //Do these before set, so they can be applied
        if(_options.flipx != null) flipx = _options.flipx;
        if(_options.flipy != null) flipy = _options.flipy;

        var _x : Float = _options.x;
        var _y : Float = _options.y;
        var _w : Float = _options.w;
        var _h : Float = _options.h;

        if(_options.rect != null) {
            _x = _options.rect.x;
            _y = _options.rect.y;
            _w = _options.rect.w;
            _h = _options.rect.h;
        }

            //First triangle
            //tl
        add(new Vertex( new Vector(  0,  0 ), color ));
            //tr
        add(new Vertex( new Vector( _w,  0 ), color ));
            //br
        add(new Vertex( new Vector( _w, _h ), color ));

           //Second triangle
            //bl
        add(new Vertex( new Vector(  0, _h ), color ));
            //tl
        add(new Vertex( new Vector(  0,  0 ), color ));
            //br
        add(new Vertex( new Vector( _w, _h ), color ));

        transform.pos = transform.pos.set_xy(_x, _y);

        if(_options.uv != null) {
            uv(_options.uv);
        } else {
            uv_space( 0, 0, 1, 1 );
        }

	} //new

    public inline function uv( _rect:luxe.Rectangle ) {

        assertnull(texture, "QuadGeometry; Calling UV on a geometry with null texture.");

        var tlx = _rect.x/texture.width_actual;
        var tly = _rect.y/texture.height_actual;
        var szx = _rect.w/texture.width_actual;
        var szy = _rect.h/texture.height_actual;

        uv_space( tlx, tly, szx, szy );

    } //uv

    public inline function uv_space( _rect_x:Float,_rect_y:Float,_rect_w:Float,_rect_h:Float ) {

        if(vertices.length == 0) return;

        //the uv width and height
        var sz_x = _rect_w;
        var sz_y = _rect_h;

            //tl
        var tl_x = _rect_x;
        var tl_y = _rect_y;

            //Keep for later, before changing the values for flipping
        _uv_x = tl_x;
        _uv_y = tl_y;
        _uv_w = sz_x;
        _uv_h = sz_y;

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

            //rotates uvs 90 degrees counter-clockwise, i.e. the rotates the texture 90 degrees clockwise
        inline function rotate_uvs() {
            tmp_x = tl_x;
            tl_x = bl_x;
            bl_x = br_x;
            br_x = tr_x;
            tr_x = tmp_x;

            tmp_y = tl_y;
            tl_y = bl_y;
            bl_y = br_y;
            br_y = tr_y;
            tr_y = tmp_y;
        }

            var rotations:Int = Std.int(uv_angle / 90);
            rotations = rotations - 4 * Math.floor(rotations / 4);
            
            for(r in 0...rotations) {
                rotate_uvs();
            }
                //flipped y swaps tl and tr with bl and br
            if(flipy) {
                    //swap tl and bl
                tmp_y = bl_y;
                    bl_y = tl_y;
                    tl_y = tmp_y;

                tmp_x = bl_x;
                    bl_x = tl_x;
                    tl_x = tmp_x;

                    //swap tr and br
                tmp_y = br_y;
                    br_y = tr_y;
                    tr_y = tmp_y;

                tmp_x = br_x;
                    br_x = tr_x;
                    tr_x = tmp_x;
            } //flipy

                //flipped x swaps tl and bl with tr and br
            if(flipx) {
                    //swap tl and tr
                tmp_x = tr_x;
                    tr_x = tl_x;
                    tl_x = tmp_x;

                tmp_y = tr_y;
                    tr_y = tl_y;
                    tl_y = tmp_y;

                    //swap bl and br
                tmp_x = br_x;
                    br_x = bl_x;
                    bl_x = tmp_x;

                tmp_y = br_y;
                    br_y = bl_y;
                    bl_y = tmp_y;
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

    public function resize_xy( _x:Float, _y:Float ) {

        if(vertices.length == 0) return;

        vertices[0].pos.set_xy( 0,      0    );
        vertices[1].pos.set_xy( 0+_x,   0    );
        vertices[2].pos.set_xy( 0+_x,   0+_y );

        vertices[3].pos.set_xy( 0,      0+_y );
        vertices[4].pos.set_xy( 0,      0    );
        vertices[5].pos.set_xy( 0+_x,   0+_y );

    } //resize_xy

    public inline function resize( quad:luxe.Vector ) {

        resize_xy(quad.x, quad.y);

    } //resize

    public inline function set(quad:luxe.Rectangle) {

        set_xywh(quad.x, quad.y, quad.w, quad.h);

    } //set

 	public function set_xywh( _x:Float, _y:Float, _w:Float, _h:Float ) {

        if(vertices.length == 0) return;

            //tl
        vertices[0].pos.set_xy(  0,  0 );
            //tr
        vertices[1].pos.set_xy( _w,  0 );
            //br
        vertices[2].pos.set_xy( _w, _h );

            //bl
        vertices[3].pos.set_xy(  0, _h );
            //tl
        vertices[4].pos.set_xy(  0,  0 );
            //br
        vertices[5].pos.set_xy( _w, _h );

        transform.pos = transform.pos.set_xy(_x, _y);

 	} //set

    function set_flipx(_val:Bool) {

            //set before calling uv_space
        flipx = _val;

        uv_space(_uv_x, _uv_y, _uv_w, _uv_h);

        return flipx;

    } //set_flipx

    function set_flipy(_val:Bool) {

            //set before calling uv_space
        flipy = _val;

        uv_space(_uv_x, _uv_y, _uv_w, _uv_h);

        return flipy;

    } //set_flipy

    function set_uv_angle(_val:Int) {
        assert(_val % 90 == 0, 'uv_angle has to be a multiple of 90');
        uv_angle = _val;
        uv_space(_uv_x, _uv_y, _uv_w, _uv_h);
        return uv_angle;
    }

}

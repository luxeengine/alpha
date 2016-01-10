package luxe;

import luxe.Log.*;
import luxe.Visual;
import luxe.Vector;
import luxe.Rectangle;

import luxe.Resources;
import phoenix.geometry.Geometry;
import phoenix.geometry.QuadGeometry;

import luxe.options.SpriteOptions;

class Sprite extends Visual {


    @:isVar public var centered     (default, set) : Bool = true;
    @:isVar public var flipx        (default, set) : Bool = false;
    @:isVar public var flipy        (default, set) : Bool = false;
    @:isVar public var uv           (default, set) : Rectangle;

    public var geometry_quad : QuadGeometry;


    public function new( options:SpriteOptions ) {

        uv = new Rectangle();

        assertnull(options, 'Sprite requires non-null options');

            //centered
        if(options.centered != null) {
            centered = options.centered;
        }

            //flipx
        if(options.flipx != null) {
            flipx = options.flipx;
        }

            //flipy
        if(options.flipy != null) {
            flipy = options.flipy;
        }

            //create visual
        super( options );

    }

    override function on_geometry_created() {

        super.on_geometry_created();

        if(texture != null) {

                //because the default is 0,0,1,1 uv for the quad, we don't want that when
                //textures are padded (like on web)
            uv = def(options.uv, new Rectangle(0,0,texture.width,texture.height));

                //if texture is render target, flipy
            if(texture.resource_type == ResourceType.render_texture) {
                flipy = true;
            }

        } //texture !null

            //set the origin and centered once created
        centered = !!centered;
            //and re assign the flip values
        flipx = !!flipx;
        flipy = !!flipy;

    } //on_geometry_created

    override function set_geometry( _g:Geometry ) {

        geometry_quad = cast _g;
        return super.set_geometry(_g);

    } //set_geometry

    override public function ondestroy() {

        uv = null;
        geometry_quad = null;
        
        super.ondestroy();

    }

//Helper functions

        /** Returns true if a point is inside the sprite, takes into account the sprite transform,
            which includes more cost than simple AABB like `point_inside_AABB` */
    public function point_inside( _p:Vector ) : Bool {

        if(geometry == null) return false;

        return Luxe.utils.geometry.point_in_geometry(_p, geometry);

    } //point_inside

        /** Returns true if a point is inside the AABB unrotated */
    public function point_inside_AABB(_p:Vector) : Bool {

        if(pos == null) return false;
        if(size == null) return false;

            //scaled size
        var _s_x = size.x * scale.x;
        var _s_y = size.y * scale.y;

        if(centered) {
            var _hx = _s_x / 2;
            var _hy = _s_y / 2;
            if(_p.x < pos.x - _hx) return false;
            if(_p.y < pos.y - _hy) return false;
            if(_p.x > pos.x+_s_x - _hx) return false;
            if(_p.y > pos.y+_s_y - _hy) return false;
        } else {
            if(_p.x < pos.x) return false;
            if(_p.y < pos.y) return false;
            if(_p.x > pos.x+_s_x) return false;
            if(_p.y > pos.y+_s_y) return false;
        }

        return true;

    } //point_inside_AABB

//Properties


//UV / source rect

    function set_uv(_uv:Rectangle) : Rectangle {

        if(_uv == null) return uv = _uv;

        if(geometry_quad != null) {
            geometry_quad.uv(_uv);
        }

        uv = _uv;

        Rectangle.listen( uv, _uv_change );

        return uv;
    }

//Flipping

    function set_flipy(_v:Bool) {

        if(_v == flipy) {
            return flipy;
        }

        if(geometry_quad != null) {
            geometry_quad.flipy = _v;
        }

        return flipy = _v;

    } //set_flipy

    function set_flipx(_v:Bool) {

        if(_v == flipx) {
            return flipx;
        }

        if(geometry_quad != null) {
            geometry_quad.flipx = _v;
        }

        return flipx = _v;

    } //set_flipv

//Size

    override function set_size( _v:Vector ) : Vector {

            //resize the mesh vertices themselves, as scale is relative to this size
            //if explicitly set
        if(geometry_quad != null) {

            geometry_quad.resize( new Vector( _v.x, _v.y ) );

                //If the user doesn't specify a custom origin, we try and work with the center
            if(!_has_custom_origin) {
                if(centered) {
                        //half of the new size
                    origin = _v.clone().divideScalar(2);
                }
            }

        }

            //done
        return super.set_size(_v);

    } //set_size

//Centered

    function set_centered(_c:Bool) : Bool {

            //centered geometry affects the origin directly
        if(size != null) {
            if(_c) {
                origin = new Vector(size.x/2, size.y/2);
            } else {
                origin = new Vector();
            }
        } //size != null

        return centered = _c;

    } //set_centered


        //An internal callback for when x y or w or h on a transform changes
    function _uv_change(_v:Float) { this.set_uv(uv); }

} //Sprite

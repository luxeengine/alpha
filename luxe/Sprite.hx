package luxe;

import luxe.Visual;
import luxe.Vector;
import luxe.Rectangle;

import luxe.Resource;
import phoenix.geometry.Geometry;
import phoenix.geometry.QuadGeometry;

import luxe.options.SpriteOptions;

class Sprite extends Visual {
    

    @:isVar public var centered     (default,set    )   : Bool = true;    
    @:isVar public var flipx        (default,set    )   : Bool = false;
    @:isVar public var flipy        (default,set    )   : Bool = false;
    @:isVar public var uv           (default,set    )   : Rectangle;

    public var geometry_quad : QuadGeometry; 


    public function new<T>( options:SpriteOptions<T> ) {

        uv = new Rectangle();

        if(options == null) {
            throw "Sprite needs not-null options at the moment";
        }

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

        if(texture != null) {

            texture.onload = function(t) {

                    //because the default is 0,0,1,1 uv for the quad, we don't want that when
                    //textures are padded (like on html5)
                if(options.uv == null) {

                    // if(texture.actual_width != texture.width || texture.actual_height != texture.height) {
                        uv = new Rectangle(0,0,texture.width,texture.height);
                    // }

                } else {

                    uv = options.uv;

                }

                    //if texture is render target, flipy
                if(texture.type == ResourceType.render_texture) {
                    flipy = true;
                }
                
            } //onload

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

    }

//Helper functions

    var _hit_box_vert_list : Array<Vector>;
    var _hit_origin_offset : Vector;

        //:todo: note that this function is a heavier alternative
        //plus they should be just one function and use dirty flags
        //to only update things when things do change but 
        //this is utilitarian for now
    public function point_inside_exact(_p:Vector) : Bool {

        if(_hit_box_vert_list == null) {
            _hit_box_vert_list = [];
            _hit_origin_offset = new Vector();
        }
        
        _hit_box_vert_list.splice(0,_hit_box_vert_list.length);
        for(_v in geometry.vertices) {
            _hit_box_vert_list.push( _v.pos.clone().subtract(geometry.origin).applyMatrix4(geometry.transform.world.matrix) );
        }

        return Luxe.utils.geometry.point_in_polygon( _p, _hit_origin_offset, _hit_box_vert_list );

    } //point_inside_exact

        //Returns true if a point is inside the default AABB 
        //todo: Improve this to include origins of geom + rotation + scale
    public function point_inside(_p:Vector) : Bool {

        if(pos == null) return false;
        if(size == null) return false;
        if(centered) {
            var hx = size.x / 2;
            var hy = size.y / 2;
            if(_p.x < pos.x-hx) return false;
            if(_p.y < pos.y-hy) return false;
            if(_p.x > pos.x+size.x-hx) return false;
            if(_p.y > pos.y+size.y-hy) return false;
        } else {
            if(_p.x < pos.x) return false;
            if(_p.y < pos.y) return false;
            if(_p.x > pos.x+size.x) return false;
            if(_p.y > pos.y+size.y) return false;
        }

        return true;
    
    } //point_inside

//Properties


//UV / source rect

    private function set_uv(_uv:Rectangle) : Rectangle {

        if(geometry_quad != null) {
            geometry_quad.uv(_uv);
        }

        uv = _uv;

        _attach_rect_listener( uv, _uv_change );

        return uv;
    } 

//Flipping

    private function set_flipy(_v:Bool) {        

        if(geometry_quad != null) {
            geometry_quad.flipy = _v;
        }

        return flipy = _v;

    } //set_flipy

    private function set_flipx(_v:Bool) {        

        if(geometry_quad != null) {
            geometry_quad.flipx = _v;
        }

        return flipx = _v;

    } //set_flipv

//Size

    private override function set_size( _v:Vector ) : Vector {  

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

        } //if geometry != null
        
            //done
        return super.set_size(_v);

    } //set_size

//Centered 

    private function set_centered(_c:Bool) : Bool {

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


//Serialize

    @:noCompletion public override function get_serialize_data() : Dynamic {
        
        var _data : Dynamic = super.get_serialize_data();

        var _extra : Dynamic = {            
            centered    : centered,
        };
        
        if(uv != null)      _extra.uv = uv.serialized;
        if(flipx)           _extra.flipx = true;
        if(flipy)           _extra.flipy = true;

        return _merge_properties(_data, _extra);

    } //get_serialize_data


        //An internal callback for when x y or w or h on a transform changes
    private function _uv_change(_v:Float) { this.set_uv(uv); }
        //The helper to attach all listeners
    private function _attach_rect_listener( _v : Rectangle, listener ) {
        _v.listen_x = listener;
        _v.listen_y = listener;
        _v.listen_w = listener;
        _v.listen_h = listener;
    } //_attach_rect_listener


} //Sprite

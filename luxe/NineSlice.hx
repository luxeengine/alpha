package luxe;

import luxe.Color;
import luxe.Rectangle;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Batcher;
import phoenix.geometry.ComplexGeometry;
import phoenix.geometry.CompositeGeometry;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.TextureCoord;


typedef Slice = {
    pos : Vector,
    width : Float,
    height : Float,
    source_x : Float,
    source_y : Float,
    source_width : Float,
    source_height : Float,
    geometry_id : String
};

class NineSlice extends luxe.Sprite {

    @:noCompletion public var slices : Array<Slice>;
    @:noCompletion public var added : Bool = false;
    @:noCompletion public var nineslice_options : Dynamic;

    public var top : Float = 32;
    public var left : Float = 32;
    public var right : Float = 32;
    public var width : Float = 0.0;
    public var bottom : Float = 32;
    public var height : Float = 0.0;
    public var source_x : Float = 0.0;
    public var source_y : Float = 0.0;
    public var source_w : Float = 0.0;
    public var source_h : Float = 0.0;
    public var is_set : Bool = false;
    @:noCompletion public var midwidth : Float = 0.0;
    @:noCompletion public var midheight : Float = 0.0;

    private var _batcher : Batcher;
    @:noCompletion public var _geometry : ComplexGeometry;

    public function new(_options:Dynamic) {

        nineslice_options = {};   
            //default to internal batcher
        _batcher = Luxe.renderer.default_batcher;
        slices = new Array<Slice>();

            //we need to tell the sprite not to create geometry ,
            //and not to add us to any scenes or anything
        if(_options == null) {
            _options = {
                no_geometry : true,
                no_scene : true
            }
        } else {
            _options.no_geometry = true;
            _options.no_scene = true;
        }

        nineslice_options = _options;
        
        if(_options.depth != null)      nineslice_options.depth = _options.depth;
        if(_options.group != null)      nineslice_options.group = _options.group;
        if(_options.batcher != null)    _batcher = _options.batcher;
        
            //sprite options to parent
        super(_options);

            //now local options
        if(_options.top != null) top = _options.top;
        if(_options.left != null) left = _options.left;
        if(_options.right != null) right = _options.right;
        if(_options.bottom != null) bottom = _options.bottom;

        if(_options.source_x != null) { source_x = _options.source_x; } 
        if(_options.source_y != null) { source_y = _options.source_y; }
        if(_options.source_w != null) {
            source_w = _options.source_w;
        } else {
            source_w = texture.width;
        }

        if(_options.source_h != null) {
            source_h = _options.source_h;
        } else {
            source_h = texture.height;
        }

        geometry = null;

    }

    public function lock() {
        if(is_set && _geometry != null) {
            _geometry.locked = true;
        }
    }
    public function dirty() {
        if(is_set && _geometry != null) {
            _geometry.dirty = true;
        }
    }

    @:noCompletion public function update_size(_width:Float, _height:Float) {

        width = _width;
        height = _height;

        midwidth = Math.abs(width - left - right);
        midheight = Math.abs(height - top - bottom);
            
            //top left
            slices[0].source_width  = left;
            slices[0].source_height = top;
            slices[0].source_x = source_x;
            slices[0].source_y = source_y;
            slices[0].pos.set(0,0);
            slices[0].width = left;
            slices[0].height = top;

            //top middle
            slices[1].source_width  = source_w - left - right;
            slices[1].source_height = top;
            slices[1].source_x = source_x+left;
            slices[1].source_y = source_y;
            slices[1].pos.set(left,0);
            slices[1].width = width - left - right;
            slices[1].height = top;

            //top right
            slices[2].source_width  = right;
            slices[2].source_height = top;
            slices[2].source_x = source_x+ (source_w - right); 
            slices[2].source_y = source_y;
            slices[2].pos.set(left + midwidth,0);
            slices[2].width = right;
            slices[2].height = top;


            //middle left
            slices[3].source_width  = left;
            slices[3].source_height = source_h - top - bottom;
            slices[3].source_x = source_x; 
            slices[3].source_y = source_y+top;
            slices[3].pos.set(0,top);
            slices[3].width = left;
            slices[3].height = height - top - bottom;

            //middle middle
            slices[4].source_width  = source_w - left - right;
            slices[4].source_height = source_h - top - bottom;
            slices[4].source_x = source_x+left; 
            slices[4].source_y = source_y+top;
            slices[4].pos.set(left,top);
            slices[4].width = width - left - right;
            slices[4].height = height - top - bottom;

            //middle right
            slices[5].source_width  = right;
            slices[5].source_height = source_h - top - bottom;
            slices[5].source_x = source_x+(source_w - right); 
            slices[5].source_y = source_y+top;
            slices[5].pos.set(left + midwidth,top);
            slices[5].width = right;
            slices[5].height = height - top - bottom;


            //bottom left
            slices[6].source_width  = left;
            slices[6].source_height = bottom;
            slices[6].source_x = source_x; 
            slices[6].source_y = source_y+ (source_h - bottom);
            slices[6].pos.set(0,top + midheight);
            slices[6].width = left;
            slices[6].height = bottom;                     

            //bottom middle
            slices[7].source_width  = source_w - left - right;
            slices[7].source_height = bottom;
            slices[7].source_x = source_x+left; 
            slices[7].source_y = source_y+(source_h - bottom);
            slices[7].pos.set(left,top + midheight);
            slices[7].width = width - left - right;
            slices[7].height = bottom;            

            //bottom right
            slices[8].source_width  = right;
            slices[8].source_height = bottom;
            slices[8].source_x = source_x+(source_w - right); 
            slices[8].source_y = source_y+(source_h - bottom);
            slices[8].pos.set(left + midwidth, top + midheight);
            slices[8].width = right;
            slices[8].height = bottom;

    } //update_size

    @:noCompletion public function set(_width:Float, _height:Float) {

        if(added) {
            _geometry.drop();
            added = false;
        }

            //clear the slices
        slices.splice(0,slices.length);
        width = _width;
        height = _height;

        midwidth = Math.abs(width - left - right);
        midheight = Math.abs(height - top - bottom);

        slices.push({
            source_width  : left,
            source_height : top,
            source_x : source_x, 
            source_y : source_y,
            pos : new Vector(0,0),
            width : left,
            height : top,
            geometry_id : ''
        });
            //top middle
        slices.push({
            source_width  : source_w - left - right,
            source_height : top,
            source_x : source_x+left, 
            source_y : source_y,
            pos : new Vector(left,0),
            width : width - left - right,
            height : top,
            geometry_id : ''
        });
            //top right
        slices.push({
            source_width  : right,
            source_height : top,
            source_x : source_x+ (source_w - right), 
            source_y : source_y,
            pos : new Vector(left + midwidth,0),
            width : right,
            height : top,
            geometry_id : ''
        });


            //middle left
        slices.push({
            source_width  : left,
            source_height : source_h - top - bottom,
            source_x : source_x, 
            source_y : source_y+top,
            pos : new Vector(0,top),
            width : left,
            height : height - top - bottom,
            geometry_id : ''
        });
            //middle middle
        slices.push({
            source_width  : source_w - left - right,
            source_height : source_h - top - bottom,
            source_x : source_x+left, 
            source_y : source_y+top,
            pos : new Vector(left,top),
            width : width - left - right,
            height : height - top - bottom,
            geometry_id : ''
        });
            //middle right
        slices.push({
            source_width  : right,
            source_height : source_h - top - bottom,
            source_x : source_x+(source_w - right), 
            source_y : source_y+top,
            pos : new Vector(left + midwidth,top),
            width : right,
            height : height - top - bottom,
            geometry_id : ''
        });


            //bottom left
        slices.push({
            source_width  : left,
            source_height : bottom,
            source_x : source_x, 
            source_y : source_y+ (source_h - bottom),
            pos : new Vector(0,top + midheight),
            width : left,
            height : bottom,
            geometry_id : ''                        
        });
            //bottom middle
        slices.push({
            source_width  : source_w - left - right,
            source_height : bottom,
            source_x : source_x+left, 
            source_y : source_y+(source_h - bottom),
            pos : new Vector(left,top + midheight),
            width : width - left - right,
            height : bottom,
            geometry_id : ''                    
        });
            //bottom right
        slices.push({
            source_width  : right,
            source_height : bottom,
            source_x : source_x+(source_w - right), 
            source_y : source_y+(source_h - bottom),
            pos : new Vector(left + midwidth, top + midheight),
            width : right,
            height : bottom,
            geometry_id : ''
        });

        is_set = true;
    }

    override function set_size( _v : Vector ) {
            
        if(!is_set) return _v;
            //update the values
        update_size(_v.x, _v.y);
            //update the vertices
        for(slice in slices) {
            if(_geometry != null) {
                _geometry.quad_resize(slice.geometry_id , new Rectangle( slice.pos.x, slice.pos.y, slice.width, slice.height ));
            } //_geometry
        }

        return _v;

    } //set_size

    override function set_pos( _v : Vector ) {
        
        super.set_pos(_v);

        var _pv = _v.clone();

        if(is_set) {
            _geometry.pos = _pv;
        }

        return pos = _pv;

    } //set_pos

    override function destroyed() {

        super.destroyed();
        
        if(is_set) {            
            _geometry.drop();
        }

    }

    override function set_visible(_v:Bool) {

        super.set_visible(_v);

        if(is_set) {
            _geometry.enabled = _v;
        }

        return visible = _v;
    }

    override function set_clip(val : Bool) : Bool {

        if(is_set) {
            _geometry.clip = val;
        }

        return clip = val;
    }
//Clip rect
    override function set_clip_rect(val : Rectangle) : Rectangle {

        if(is_set) {
            _geometry.clip_rect = val;
        }

        return clip_rect = val;
    }   
//Color
    override function set_color(_color : Color) : Color {

        if(is_set) {
            _geometry.color = _color;
        }

        return color = _color;
    } //set_color

    private function _create(_pos:Vector, _w:Float, _h:Float, ?_reset:Bool = false) {
        if(!is_set || _reset) {
            set(_w, _h);
        }

        var _color = new Color();

        _geometry = new ComplexGeometry({
            texture : texture,
            color : _color,
            depth : nineslice_options.depth,
            group : nineslice_options.group,
            enabled : nineslice_options.enabled            
        });

        for(slice in slices) {

            slice.geometry_id = _geometry.quad_add({ 
                x: slice.pos.x, 
                y: slice.pos.y,
                w: slice.width,
                h: slice.height
            });

            _geometry.quad_uv( slice.geometry_id, new Rectangle(slice.source_x, slice.source_y, slice.source_width, slice.source_height) );
            _geometry.quad_pos( slice.geometry_id, new Vector(slice.pos.x, slice.pos.y) );

        }

        _geometry.pos = _pos;
        _geometry.id = 'NineSlice';

        _batcher.add( _geometry );

        added = true;
        is_set = true;

    } // _create

    public function create( _pos:Vector, _w:Float, _h:Float, ?_reset:Bool = false ) {
        
        if(!texture.loaded) {
            texture.onload = function(texture){
                _create(_pos,_w,_h,_reset);
            }
        } else {
            _create(_pos,_w,_h,_reset);
        }

    } //create

} //NineSlice
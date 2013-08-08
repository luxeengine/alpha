package luxe.utils;

import luxe.Color;
import luxe.Rectangle;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Batcher;
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
    geometry : QuadGeometry
};

class NineSlice extends luxe.Sprite {

    public var slices : Array<Slice>;
    public var added : Bool = false;
    public var options : Dynamic;

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
    public var midwidth : Float = 0.0;
    public var midheight : Float = 0.0;

    public var _geometry : CompositeGeometry;

    private var _batcher : Batcher;

    public function new(_options:Dynamic) {

        options = {};   
            //default to internal batcher
        _batcher = Luxe.renderer.default_batcher;

            //we need to tell the sprite not to create geometry ,
            //and not to add us to any scenes or anything
        if(_options == null) {
            _options = {
                geometry : false,
                scene : false
            }
        } else {
            _options.geometry = false;
            _options.scene = false;
        }

        options = _options;
        
        if(_options.depth != null) options.depth = _options.depth;
        if(_options.group != null) options.group = _options.group;
        if(_options.batcher != null) _batcher = _options.batcher;
        
            //sprite options to parent
        super(_options);
        slices = new Array<Slice>();

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

        _geometry = new CompositeGeometry();

    }

    public function lock() {
        if(is_set) {
            for(slice in slices) {
                slice.geometry.locked = true;
            }
        }
    }
    public function dirty() {
        if(is_set) {
            for(slice in slices) {
                slice.geometry.dirty = true;
            }
        }
    }

    public function set(_width:Float, _height:Float) {

        if(added) {
            for(slice in slices) {
                Luxe.removeGeometry(slice.geometry);
                slice.geometry = null;
            }

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
            geometry : null
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
            geometry : null
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
            geometry : null
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
            geometry : null
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
            geometry : null
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
            geometry : null
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
            geometry : null                        
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
            geometry : null                    
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
            geometry : null    
        });

        is_set = true;
    }

    public override function set_pos( _v : Vector ) {
        
        super.set_pos(_v);

        if(is_set) {
            for(slice in slices) {
                slice.geometry.pos = new Vector(_v.x + slice.pos.x, _v.y + slice.pos.y);
            }
        }
        return pos = _v;
    }

    public override function destroy() {

        if(is_set) {
            for(slice in slices) {                  
                if(slice.geometry != null ) {
                    slice.geometry.drop();
                }
            }
        }

            //clear our references to these
        geometry = null;
        texture = null;
    }

    public override function set_visible(_v:Bool) {

        super.set_visible(_v);

        if(is_set) {
            for(slice in slices) {
                slice.geometry.enabled = _v;
            }
        }

        return visible = _v;
    }

    public override function set_clip(val : Bool) : Bool {

        if(is_set) {
            for(slice in slices) {
                slice.geometry.clip = val;
            }
        }

        return clip = val;
    }
//Clip rect
    public override function set_clip_rect(val : Rectangle) : Rectangle {

        if(is_set) {
            for(slice in slices) {
                slice.geometry.clip_rect = val;
            }
        }

        return clip_rect = val;
    }    

    private function _create(_pos:Vector, _w:Float, _h:Float, ?_reset:Bool = false) {
        if(!is_set || _reset) {
            set(_w, _h);
        }

        var _color = new Color();

        for(slice in slices) {

            slice.geometry = new QuadGeometry({
                x:0,
                y:0,
                width:slice.width,
                height:slice.height,
                texture : texture,
                color : _color,
                depth : options.depth,
                group : options.group,
                enabled : options.enabled
            });

            slice.geometry.uv( new Rectangle(slice.source_x, slice.source_y, slice.source_width, slice.source_height) );             
            slice.geometry.pos = new Vector(_pos.x + slice.pos.x, _pos.y + slice.pos.y);

            _batcher.add(slice.geometry);
        }

        added = true;
        is_set = true;
    }

    public function create( _pos:Vector, _w:Float, _h:Float, ?_reset:Bool = false ) {
        
        if(!texture.loaded) {
            texture.onload = function(texture){
                _create(_pos,_w,_h,_reset);
            }
        } else {
            _create(_pos,_w,_h,_reset);
        }

    }

}
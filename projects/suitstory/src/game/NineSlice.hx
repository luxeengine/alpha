package game;

import lab.Color;
import lab.Rectangle;
import lab.Sprite;
import lab.Vector;
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

class NineSlice extends lab.Sprite {

    public var slices : Array<Slice>;
    public var added : Bool = false;
    public var options : Dynamic;

    @:isVar public var position(default, set) : Vector;

    public var top : Float = 32;
    public var left : Float = 32;
    public var right : Float = 32;
    public var width : Float = 0.0;
    public var bottom : Float = 32;
    public var height : Float = 0.0;
    public var is_set : Bool = false;
    public var midwidth : Float = 0.0;
    public var midheight : Float = 0.0;

    public function new(_options:Dynamic) {

        options = {};

            //we need to tell the sprite not to create geometry yet in super
        if(_options == null) {
            _options = {
                geometry : false
            }
        } else {
            _options.geometry = false;
        }

        if(_options.top != null) top = _options.top;
        if(_options.left != null) left = _options.left;
        if(_options.right != null) right = _options.right;
        if(_options.bottom != null) bottom = _options.bottom;

        options = _options;
        
        if(_options.depth != null) options.depth = _options.depth;
        if(_options.group != null) options.group = _options.group;
        

        super(_options);
        slices = new Array<Slice>();

    }

    public function set(_width:Float, _height:Float) {

        if(added) {
            for(slice in slices) {
                Lab.removeGeometry(slice.geometry);
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
            source_x : 0, 
            source_y : 0,
            pos : new Vector(0,0),
            width : left,
            height : top,
            geometry : null
        });
            //top middle
        slices.push({
            source_width  : texture.width - left - right,
            source_height : top,
            source_x : left, 
            source_y : 0,
            pos : new Vector(left,0),
            width : width - left - right,
            height : top,
            geometry : null
        });
            //top right
        slices.push({
            source_width  : right,
            source_height : top,
            source_x : texture.width - right, 
            source_y : 0,
            pos : new Vector(left + midwidth,0),
            width : right,
            height : top,
            geometry : null
        });


            //middle left
        slices.push({
            source_width  : left,
            source_height : texture.height - top - bottom,
            source_x : 0, 
            source_y : top,
            pos : new Vector(0,top),
            width : left,
            height : height - top - bottom,
            geometry : null
        });
            //middle middle
        slices.push({
            source_width  : texture.width - left - right,
            source_height : texture.height - top - bottom,
            source_x : left, 
            source_y : top,
            pos : new Vector(left,top),
            width : width - left - right,
            height : height - top - bottom,
            geometry : null
        });
            //middle right
        slices.push({
            source_width  : right,
            source_height : texture.height - top - bottom,
            source_x : texture.width - right, 
            source_y : top,
            pos : new Vector(left + midwidth,top),
            width : right,
            height : height - top - bottom,
            geometry : null
        });


            //bottom left
        slices.push({
            source_width  : left,
            source_height : bottom,
            source_x : 0, 
            source_y : texture.height - bottom,
            pos : new Vector(0,top + midheight),
            width : left,
            height : bottom,
            geometry : null                        
        });
            //bottom middle
        slices.push({
            source_width  : texture.width - left - right,
            source_height : bottom,
            source_x : left, 
            source_y : texture.height - bottom,
            pos : new Vector(left,top + midheight),
            width : width - left - right,
            height : bottom,
            geometry : null                    
        });
            //bottom right
        slices.push({
            source_width  : right,
            source_height : bottom,
            source_x : texture.width - right, 
            source_y : texture.height - bottom,
            pos : new Vector(left + midwidth, top + midheight),
            width : right,
            height : bottom,
            geometry : null    
        });

        is_set = true;
    }

    public function set_position( _pos : Vector ) {
        if(is_set) {
            for(slice in slices) {
                slice.geometry.pos = new Vector(_pos.x + slice.pos.x, _pos.y + slice.pos.y);
            }
        }
        return position =_pos;
    }

    public function create( _pos:Vector, _w:Float, _h:Float, ?_reset:Bool = false ) {
        
        if(!texture.loaded) return;

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
            Lab.addGeometry(slice.geometry);
            slice.geometry.pos = new Vector(_pos.x + slice.pos.x, _pos.y + slice.pos.y);
        }

        added = true;
        is_set = true;

    }

}
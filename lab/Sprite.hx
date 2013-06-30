package lab;

import phoenix.geometry.QuadGeometry;
import phoenix.Texture;
import phoenix.Vector;
import phoenix.Color;

class Sprite {

    @:isVar public var geometry(default,default) : QuadGeometry;
    @:isVar public var texture(default,default) : Texture;
    @:isVar public var pos(default,set) : Vector;
    @:isVar public var size(default,default) : Vector;
    @:isVar public var color(default,set) : Color;

    public function new(options:Dynamic) {

            //temp
        if(options == null) {
            throw "Sprite needs a non null options atm";
        }

            //create the position value so we can exploit it a bit
        pos = new Vector();
        color = new Color();

//image
        if(options.texture != null) {
            texture = options.texture;
        }
//size 
        if(options.size != null) {

            size = options.size;

        } else {

            if(texture != null) {
                size = new Vector(texture.width, texture.height);
            } else {
                size = new Vector(64,64); //default size so its visible at least
            }

        }
//position
        if(options.pos != null) {
            pos = options.pos;
        }
//color
        if(options.color != null) {
            color = options.color;
        }

//other
        geometry = new QuadGeometry({
            x:pos.x, 
            y:pos.y, 
            width:size.x, 
            height:size.y,
            texture : texture,
            color : color,
            shader : options.shader,
            depth : options.depth == null ? 0 : options.depth,
            group : options.group == null ? 0 : options.group
        });

    } //new

//Helper functions

        //Returns true if a point is inside the default AABB 
        //todo: Improve this to include origins of geom + rotation + scale
    public function point_inside(_p:Vector) : Bool {
        if(_p.x < pos.x) return false;
        if(_p.y < pos.y) return false;
        if(_p.x > pos.x+size.x) return false;
        if(_p.y > pos.y+size.y) return false;
        return true;
    }

//Color properties

    public function set_color(_c:Color) {
        if(color == null) {
            return color = _c;
        }
            //A sprite can exist without geometry
        if(geometry != null) {
            geometry.color = _c;
        }

            //assign the color
        color = _c;

            //return a value
        return _c;
    }


//Position properties

    private function xyz_change(_v:Float) {
        set_pos(pos);
    }
    private function _attach_pos(_pos : Vector) {
        _pos.listen_x = xyz_change;
        _pos.listen_y = xyz_change;
        _pos.listen_z = xyz_change;
    }

    public function set_pos(_p:Vector) : Vector {

        if(pos == null) {
            return pos = _p;
        }

            //Some sprites have no geometry at any time
        if(geometry != null) {
                //have to use .clone() because passing the references
                //in while mean that geometry.pos = this.pos;
                //which means when you work out a delta,
                //like: geometry.pos.x - this.pos.x you *always* get 0,
                //because both of them point to the exact same thing.
                //this can cause memory things, so tagging :tolookat:
            geometry.pos = _p.clone();
        }

            //Assign the new value
        pos = _p;

            //Special additional listeners on .x, .y, .z of the position
        _attach_pos( pos );

            //Return the position
        return pos;
    } //set_pos

} //Sprite


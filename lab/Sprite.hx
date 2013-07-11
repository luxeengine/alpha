package lab;

import lab.Vector;

import phoenix.utils.Maths;
import phoenix.geometry.QuadGeometry;
import phoenix.Texture;
import phoenix.Vector;
import phoenix.Color;


import Lab;

class Sprite {

    @:isVar public var geometry(default,default) : QuadGeometry;
    @:isVar public var texture(default,default) : Texture;
    @:isVar public var pos(default,set) : Vector;
    @:isVar public var size(default,default) : Vector;
    @:isVar public var color(default,set) : Color;
    @:isVar public var visible(default,set) : Bool;
    @:isVar public var rotation(default,set) : Float = 0.0;

    public var id : String;

    public function new(options:Dynamic) {

        id = lab.utils.UUID.get();

            //temp
        if(options == null) {
            throw "Sprite needs a non null options atm";
        }

            //create the position value so we can exploit it a bit
        pos = new Vector();
        color = new Color();

//texture
        if(options.texture != null) {
            texture = options.texture;
        }
//position
        if(options.pos != null) {
            pos = options.pos;
        }
//color
        if(options.color != null) {
            color = options.color;
        }        

//size is interesting, as it's possible based on texture
    
            //user specified a size            
        if(options.size != null) {

            size = options.size;
                //the size is explicit, so make the geometry
            _create_geometry(options);

        } else {

                //if the texture isn't invalid entirely
            if(texture != null) {
                if(texture.loaded) {
                    size = new Vector(texture.width, texture.height);
                    _create_geometry(options);
                } else {
                    texture.onload = function(_texture) {                        
                        size = new Vector(texture.width, texture.height);
                        _create_geometry(options);
                    }
                } //texture is not loaded

            } else {
                    //default to a value big enough to see
                size = new Vector(64,64); 
            } //texture !=null

        }


    } //new

    public function _create_geometry(options : Dynamic) {

            //if they give a geometry, don't create one
        if(options.geometry != null) {
            return;
        }

        geometry = new QuadGeometry({
            x:pos.x, 
            y:pos.y, 
            width:size.x, 
            height:size.y,
            texture : texture,
            color : color,
            shader : options.shader,
            depth : (options.depth == null) ? 0 : options.depth,
            group : (options.group == null) ? 0 : options.group,
            enabled : (options.visible == null) ? 0 : options.visible
        });


        if(options.add == null || options.add != false) {
            Lab.addGeometry( geometry );            
        }        
    }
    public function destroy() {
            
            //remove the geometry from any drawing lists
        if(geometry != null) {
            Lab.removeGeometry( geometry );
        }

            //clear our references to these
        geometry = null;
        texture = null;
        
    }

//Helper functions

        //Returns true if a point is inside the default AABB 
        //todo: Improve this to include origins of geom + rotation + scale
    public function point_inside(_p:Vector) : Bool {
        if(pos == null) return false;
        if(size == null) return false;
        if(_p.x < pos.x) return false;
        if(_p.y < pos.y) return false;
        if(_p.x > pos.x+size.x) return false;
        if(_p.y > pos.y+size.y) return false;
        return true;
    }

//Visibility properties
    public function set_visible(_v:Bool) {

        visible = _v;

            //careful
        if(geometry != null) {
            geometry.enabled = _v;
        }

        return visible;

    } //set_visible

//Color properties

    public function set_color(_c:Color) {
            //careful
        if(color == null) {
            return color = _c;
        }
            //careful
        if(geometry != null) {
            geometry.color = _c;
        } //geometry != null

            //assign the color
        color = _c;

            //return a value
        return _c;

    } //set_color

//Rotation 
    
    public function set_rotation(_r:Float) : Float {
            //transform the geometry
            if(geometry != null) {
                geometry.rotate(new Vector(0,0, Maths.degToRad(_r) ));
            }
        return rotation = _r;
    }

//Position properties
    
        //An internal callback for when x y or z on a sprite changes
    private function xyz_change(_v:Float) {
        set_pos(pos);
    }

        //An internal function to attach position 
        //changes to a vector, so we can listen for pos.x as well
    private function _attach_pos(_pos : Vector) {
        _pos.listen_x = xyz_change;
        _pos.listen_y = xyz_change;
        _pos.listen_z = xyz_change;
    }

    public function set_pos(_p:Vector) : Vector {
            //careful
        if(pos == null) {
            return pos = _p;
        }

            //careful
        if(geometry != null) {

                //have to use .clone() because passing the references
                //in while mean that geometry.pos = this.pos;
                //which means when you work out a delta,
                //like: geometry.pos.x - this.pos.x you *always* get 0,
                //because both of them point to the exact same thing.
                //this can cause memory things, so tagging :tolookat:
            geometry.pos = _p.clone();
        }

            //store the position
        pos = _p;

            //Special additional listeners on .x, .y, .z of the position
        _attach_pos( pos );

        return pos;
    } //set_pos

} //Sprite


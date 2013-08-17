package luxe;

import luxe.Vector;
import luxe.Rectangle;
import luxe.Scene;

import phoenix.Quaternion;
import phoenix.utils.Maths;
import phoenix.geometry.QuadGeometry;
import phoenix.Resource;
import phoenix.Texture;
import phoenix.Vector;
import phoenix.Color;

import Luxe;

class Sprite extends Entity {

    @:isVar public var geometry     (default,default)   : QuadGeometry;
    @:isVar public var locked       (default,set    )   : Bool = false;
    @:isVar public var texture      (default,default)   : Texture;
    @:isVar public var size         (default,set    )   : Vector;
    @:isVar public var color        (default,set    )   : Color;
    @:isVar public var visible      (default,set    )   : Bool;
    @:isVar public var rotation_z   (default,set    )   : Float = 0.0;
    @:isVar public var radians      (default,set    )   : Float = 0.0;
    @:isVar public var depth        (default,set    )   : Float = 0.0;
    @:isVar public var centered     (default,set    )   : Bool = true;    
    @:isVar public var origin       (default,set    )   : Vector;
    @:isVar public var uv           (default,set    )   : Rectangle;
    @:isVar public var scene        (default,default)   : Scene;
    @:isVar public var clip         (default,set    )   : Bool;
    @:isVar public var clip_rect    (default,set    )   : Rectangle;
    @:isVar public var flipy        (default,set    )   : Bool;
    @:isVar public var flipx        (default,set    )   : Bool;


    var _rotation_vector : Vector;
    var _rotation_quat : Quaternion;

    public function new(options:Dynamic) {

        super();

            //temp
        if(options == null) {
            throw "Sprite needs a non null options atm";
        }

            //create the position value so we can exploit it a bit
        origin = new Vector();
        color = new Color();
//cached values
        _rotation_vector = new Vector();
        _rotation_quat = new Quaternion();

//name
        if(options.name != null) {
            name = options.name;
        } else {
            name = id; //default to the entity id
        }

//texture
        if(options.texture != null) {
            texture = options.texture;
        }
//centered
        if(options.centered != null) {
            centered = options.centered;
        }
//position
        if(options.pos != null) {
            pos = options.pos;
        }
//color
        if(options.color != null) {
            color = options.color;
        }   
//scene
        if(options.scene != null) {
            scene = options.scene;
        } else {
            scene = Luxe.scene;
        }

//size is interesting, as it's possibly based on texture
    
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
                        if(texture.actual_width != texture.width || texture.actual_height != texture.height) {
                            uv = new Rectangle(0,0,texture.width,texture.height);
                        }
                    }
                } //texture is not loaded

            } else {
                    //default to a value big enough to see
                size = new Vector(64,64); 
                trace('\t\tWarning : null texture handed to sprite constructor');
                _create_geometry(options);
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
            enabled : (options.visible == null) ? true : options.visible
        });

            //if texture is render target, flipy
        if(texture != null && texture.type == ResourceType.render_texture) {
            flipy = true;
        }

            //default to the sprite name
        geometry.id = name;

            //set the origin and centered once created
        var _c = centered;
        centered = _c;

        if(options.add == null || options.add != false) {
            Luxe.addGeometry( geometry );
        }

        if(scene != null) {
            Luxe.scene.add(this);
        } 
    }


    public function destroy() {
            
            //drop the geometry
        if(geometry != null && geometry.added ) {
            geometry.drop(true);
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
    }
//Flipping
    public function set_flipy(_v:Bool) {        

        if(geometry != null) {
            geometry.flipy = _v;
        }

        return flipy = _v;

    } //set_flipy

    public function set_flipx(_v:Bool) {        

        if(geometry != null) {
            geometry.flipx = _v;
        }

        return flipx = _v;

    } //set_flipv

//Visibility properties
    public function set_visible(_v:Bool) {

        visible = _v;

            //careful
        if(geometry != null) {
            geometry.enabled = _v;
        }

        return visible;

    } //set_visible

    public function set_depth(_v:Float) {
        
        if(geometry != null) {
            geometry.depth = _v;
        } //geometry

        return depth = _v;

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

//Origin

    public function set_origin(_o:Vector) : Vector {
        
        if(geometry != null) {
            geometry.origin = _o;
        }

        return origin = _o;
        
    } //set_origin

//Centered 

    public function set_centered(_c:Bool) : Bool {

            //centered geometry affects the origin
        if(geometry != null) {
            if(size != null) {
                if(centered) {
                    geometry.origin = new Vector(size.x/2, size.y/2);
                } else {
                    geometry.origin = new Vector();
                }
            } //size != null
        } //geometry != null

        return centered = _c;
    } //set_centered

//Position properties
    
    public override function set_pos(_p:Vector) : Vector {

        if(geometry != null) {
            geometry.pos = _p.clone();
        } //geometry ! null

            //store the position
        pos = _p;
            //set pos in parent attaches listeners to .x, .y, .z
        super.set_pos( pos );
            //
        return pos;

    } //set_pos

//Rotation 
    
    public function get_rotation_z() : Float {

        return Maths.radToDeg(radians);

    } //get_rotation

    public function set_rotation_z( _r:Float ) : Float {

        radians = Maths.degToRad(_r);

        return rotation_z = _r;

    } // set_rotation_z

    public function set_radians(_r:Float) : Float {

            //Sprite only rotates this way
        _rotation_vector.z = _r;
        _rotation_quat.setFromEuler( _rotation_vector );

        if(geometry != null) {
                //send to the geometry
            geometry.rotation = _rotation_quat;

        } //geometry ! null

        return radians = _r;

    } // set_radians


//Scale

    public override function set_scale( _v:Vector ) : Vector {  

        if(geometry != null) {
            geometry.scale = _v.clone();
        } //geometry != null

            //update the parent
        super.set_scale(_v);

        return _v;
    } //set_scale

//Size
    
        //todo:fix this for new transforms inside geometry
    public function set_size( _v:Vector ) : Vector {  

            //resize the mesh
        if(geometry != null) {
                //todo
                //first, update the origin 
            // if(centered) {
                // geometry.origin = new Vector(_v.x/2, _v.y/2);                
            // }

            // geometry.resize( new Rectangle( pos.x, pos.y, _v.x, _v.y ) );
            // geometry.rotate( new Vector(0, 0, radians) );

        } //if geometry != null

            //done
        return size = _v;

    } //set_size

//Locked

    public function set_locked(_l:Bool) : Bool {

        if(geometry != null) {
            geometry.locked = _l;
        }
        return locked = _l;
    } 

//UV / source rect

    public function set_uv(_uv:Rectangle) : Rectangle {

        if(geometry != null) {
            geometry.uv(_uv);
        }
        return uv = _uv;
    } 

//Geometry properties
//Clip
    public function set_clip(val : Bool) : Bool {
        return geometry.clip = val;
    }
//Clip rect
    public function set_clip_rect(val : Rectangle) : Rectangle {
        return geometry.clip_rect = val;
    }

} //Sprite


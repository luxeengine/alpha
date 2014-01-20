package luxe;

import luxe.Vector;
import luxe.Rectangle;
import luxe.Scene;
import luxe.utils.Maths;

import phoenix.Quaternion;
import phoenix.Shader;
import phoenix.geometry.Geometry;
import phoenix.geometry.QuadGeometry;
import phoenix.Batcher;
import phoenix.Resource;
import phoenix.Texture;
import phoenix.Vector;
import phoenix.Color;

import Luxe;

typedef SpriteOptions = {    
    ?name : String,
    ?pos : Vector,
    ?size : Vector,
    ?origin : Vector,
    ?centered : Bool,
    ?uv : Rectangle,
    ?color : Color,
    ?batcher : Batcher,
    ?texture : Texture,
    ?shader : Shader,
    ?depth : Float,
    ?group : Int,
    ?rotation_z : Float,
    ?visible : Bool,
    ?add : Bool,    
    ?scene : Scene,
    ?serialize : Bool,
    ?geometry : Geometry,

    ?no_scene : Bool,
    ?no_geometry : Bool
}

class Sprite extends Entity {

    @:isVar public var geometry     (default,set    )   : Geometry;
    @:isVar public var locked       (default,set    )   : Bool = false;
    @:isVar public var texture      (default,set    )   : Texture;
    @:isVar public var shader       (default,set    )   : Shader;
    @:isVar public var size         (default,set    )   : Vector;
    @:isVar public var color        (default,set    )   : Color;
    @:isVar public var visible      (default,set    )   : Bool = true;
    @:isVar public var rotation_z   (default,set    )   : Float = 0.0;
    @:isVar public var radians      (default,set    )   : Float = 0.0;
    @:isVar public var depth        (default,set    )   : Float = 0.0;
    @:isVar public var group        (default,set    )   : Int = 0;
    @:isVar public var centered     (default,set    )   : Bool = true;    
    @:isVar public var origin       (default,set    )   : Vector;
    @:isVar public var uv           (default,set    )   : Rectangle;
    @:isVar public var clip         (default,set    )   : Bool = false;
    @:isVar public var clip_rect    (default,set    )   : Rectangle;
    @:isVar public var flipy        (default,set    )   : Bool = false;
    @:isVar public var flipx        (default,set    )   : Bool = false;


    var _rotation_vector : Vector;
    var _rotation_quat : Quaternion;

    var _has_custom_origin : Bool = false;

    public function new( options:SpriteOptions ) {

//cached values
        _rotation_vector = new Vector();
        _rotation_quat = new Quaternion();

        super();

            //temp
        if(options == null) {
            throw "Sprite needs a non null options atm";
        }

            //create the position value so we can exploit it a bit
        origin = new Vector();
        color = new Color();

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
//shader
        if(options.shader != null) {
            shader = options.shader;
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
//depth        
        if(options.depth != null) {
            depth = options.depth;
        }
//group
        if(options.group != null) {
            group = options.group;
        }
//visible
        if(options.visible != null) {
            visible = options.visible;
        }        
//scene
        if(options.scene != null) {
            scene = options.scene;            
        } else {
            scene = Luxe.scene;
        }
//serialize
        if(options.serialize != null) {
            serialize = options.serialize;
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
                trace('\t\tWarning : no texture, or size, handed to sprite constructor so going with a default size.');
                _create_geometry(options);
            } //texture !=null

        }   

    } //new

    var _creating_geometry : Bool = false;
    @:noCompletion public function _create_geometry(options : SpriteOptions) {

            //if they give a geometry, don't create one
        if(options.geometry == null) {
            
            if(options.no_geometry == null || options.no_geometry == false) {
                
                _creating_geometry = true;

                    geometry = new QuadGeometry({
                        x:pos.x, 
                        y:pos.y, 
                        w:size.x, 
                        h:size.y,
                        texture : texture,
                        color : color,
                        shader : shader,
                        depth : (options.depth == null) ? 0 : options.depth,
                        group : (options.group == null) ? 0 : options.group,
                        enabled : (options.visible == null) ? true : options.visible
                    });

                _creating_geometry = false;

                    //set the origin and centered once created
                var _c = centered;
                    centered = _c;

                    //Only add to the batcher if requested
                if(options.add == null || options.add != false) {
                    if(options.batcher == null) {
                        Luxe.addGeometry( geometry );
                    } else {
                        options.batcher.add( geometry );
                    }
                }

            } //no_geometry is not present

        } else {
            
            geometry = options.geometry;

        }

        if(texture != null && texture.loaded) {
            
                //because the default is 0,0,1,1 uv for the quad, we don't want that when
                //textures are padded (like on html5)
            if(options.uv == null) {

                if(texture.actual_width != texture.width || texture.actual_height != texture.height) {
                    uv = new Rectangle(0,0,texture.width,texture.height);
                }

            } else {
                uv = options.uv;
            }

                //if texture is render target, flipy
            if(texture.type == ResourceType.render_texture) {
                flipy = true;
            }

        }

            //default to the sprite name
        if(geometry != null) {
            geometry.id = name;
        }

            //custom provided origin will override any until now
        if(options.origin != null) {
            _has_custom_origin = true;
            origin = options.origin;
        }

            //apply the rotation if any
        if(options.rotation_z != null) {
            rotation_z = options.rotation_z;
        }
            
            //add to the scene unless requested not to
        if(scene != null && options.no_scene != true) {
            Luxe.scene.add(this);            
        }

    } //create_geometry


    function destroyed() {

            //drop the geometry
        if(geometry != null && geometry.added ) {
            geometry.drop( true );
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
    private function set_flipy(_v:Bool) {        

        if(geometry != null) {
            var _geometry:QuadGeometry = cast geometry;
                _geometry.flipy = _v;
        }

        return flipy = _v;

    } //set_flipy

    private function set_flipx(_v:Bool) {        

        if(geometry != null) {
            var _geometry:QuadGeometry = cast geometry;
                _geometry.flipx = _v;
        }

        return flipx = _v;

    } //set_flipv

//Visibility properties
    private function set_visible(_v:Bool) {

        visible = _v;

            //careful
        if(geometry != null) {
            geometry.enabled = _v;
        }

        return visible;

    } //set_visible

    private function set_depth(_v:Float) {
        
        if(geometry != null) {
            geometry.depth = _v;
        } //geometry

        return depth = _v;

    } //set_depth

    private function set_group(_v:Int) {
        
        if(geometry != null) {
            geometry.group = _v;
        } //geometry

        return group = _v;

    } //set_group

//Color properties

    private function set_color(_c:Color) {

        if(color != null && geometry != null) {
            geometry.color = _c;
        } 

        return color = _c;

    } //set_color

    function set_texture(_t:Texture) {

        if(geometry != null) {
            geometry.texture = _t;
        } //geometry!=null  

        return texture = _t;
    }

    function set_shader(_s:Shader) {

        if(geometry != null) {
            geometry.shader = _s;
        } //geometry!=null  

        return shader = _s;
    }

//Origin

    private function set_origin(_o:Vector) : Vector {
        
        if(geometry != null) {
            geometry.origin = _o;
        }

        return origin = _o;
        
    } //set_origin

//Geometry

    private function set_geometry(_g:Geometry) : Geometry {
        
        if(geometry != null) {
                //kill the existing geometry first
            geometry.drop();            
        }

            //store the new one
        geometry = _g;

        if(geometry != null && _creating_geometry == false) {
            //rebind it's colors and whatever else
            
            geometry.color = color;
            geometry.pos = pos;
            geometry.group = group;
            geometry.depth = depth;
            geometry.shader = shader;
            geometry.texture = texture;
            geometry.origin = origin;
            geometry.enabled = visible;

        }        

        return geometry;
        
    } //set_origin

//Centered 

    private function set_centered(_c:Bool) : Bool {

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
    
    private override function set_pos(_p:Vector) : Vector {

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
    
    private function get_rotation_z() : Float {

        return Maths.radToDeg(radians);

    } //get_rotation

    private function set_rotation_z( _r:Float ) : Float {

        radians = Maths.degToRad(_r);

        return rotation_z = _r;

    } // set_rotation_z

    private function set_radians(_r:Float) : Float {

            //Sprite only rotates this way
        _rotation_vector.z = _r;
        _rotation_quat.setFromEuler( _rotation_vector );

        if(geometry != null) {
                //send to the geometry
            geometry.rotation = _rotation_quat;

        } //geometry ! null

        return radians = _r;

    } // set_radians

    private override function set_rotation( _r:Vector ) {

        rotation = _r;

        set_rotation_z(_r.z);

        super.set_rotation(_r);

        return _r;

    } //set_rotation

//Scale

    private override function set_scale( _v:Vector ) : Vector {  

        if(geometry != null) {
            geometry.scale = _v.clone();
        } //geometry != null

        scale = _v;

            //update the parent
        super.set_scale(_v);

        return _v;
    } //set_scale

//Size
    
    private function set_size( _v:Vector ) : Vector {  

            //resize the mesh vertices themselves, as scale is relative to this size
            //if explicitly set
        if(geometry != null) {

            var _geometry:QuadGeometry = cast geometry;
                _geometry.resize( new Vector( _v.x, _v.y ) );            
                
                //If the user doesn't specify a custom origin, we try and work with the center
            if(!_has_custom_origin) {
                if(centered) {
                        //half of the new size
                    origin = _v.clone().divideScalar(2);
                }
            }

        } //if geometry != null

            //done
        return size = _v;

    } //set_size

//Locked

    private function set_locked(_l:Bool) : Bool {

        if(geometry != null) {
            geometry.locked = _l;
        }
        return locked = _l;
    } 

//UV / source rect

    private function set_uv(_uv:Rectangle) : Rectangle {

        if(geometry != null) {
            var _geometry:QuadGeometry = cast geometry;
                _geometry.uv(_uv);
        }
        return uv = _uv;
    } 

//Geometry properties
//Clip
    private function set_clip(val : Bool) : Bool {
        return geometry.clip = val;
    }
//Clip rect
    private function set_clip_rect(val : Rectangle) : Rectangle {
        return geometry.clip_rect = val;
    }

    public override function get_serialize_data() : Dynamic {
        var _data : Dynamic = super.get_serialize_data();

        var _extra : Dynamic = {
            color : color.serialized,
            locked : locked,
            size : size.serialized,
            centered : centered,
            visible : visible, 
            radians : radians
        };
        
        if(texture != null)             _extra.texture = texture.id;
        if(uv != null)                  _extra.uv = uv.serialized;
        if(flipx)                       _extra.flipx = true;
        if(flipy)                       _extra.flipy = true;
        if(clip && clip_rect!=null)     _extra.clip_rect = clip_rect.serialized;
        if(origin != null)              _extra.origin = origin.serialized;

        return _merge_properties(_data, _extra);

    } //get_serialize_data

} //Sprite


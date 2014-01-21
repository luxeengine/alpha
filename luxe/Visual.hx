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

typedef VisualOptions = {    
    ?name : String,
    ?pos : Vector,
    ?size : Vector,
    ?origin : Vector,
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

class Visual extends Entity {

    @:isVar public var size         (default,set    )   : Vector;
    @:isVar public var geometry     (default,set    )   : Geometry;
    @:isVar public var locked       (default,set    )   : Bool = false;
    @:isVar public var texture      (default,set    )   : Texture;
    @:isVar public var shader       (default,set    )   : Shader;
    @:isVar public var color        (default,set    )   : Color;
    @:isVar public var visible      (default,set    )   : Bool = true;
    @:isVar public var rotation_z   (default,set    )   : Float = 0.0;
    @:isVar public var radians      (default,set    )   : Float = 0.0;
    @:isVar public var depth        (default,set    )   : Float = 0.0;
    @:isVar public var group        (default,set    )   : Int = 0;
    @:isVar public var origin       (default,set    )   : Vector;
    @:isVar public var clip         (default,set    )   : Bool = false;
    @:isVar public var clip_rect    (default,set    )   : Rectangle;

    var _rotation_vector : Vector;
    var _rotation_quat : Quaternion;

    var _has_custom_origin : Bool = false;

    public function new( options:VisualOptions ) {

//cached values
        _rotation_vector = new Vector();
        _rotation_quat = new Quaternion();

        super();

            //temp
        if(options == null) {
            throw "Visual needs a non null options atm";
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
                    }
                } //texture is not loaded

            } else {
                    //default to a value big enough to see
                size = new Vector(64,64); 
                // trace('\t\tWarning : no texture, or size, handed to visual constructor so going with a default size.');
                _create_geometry(options);
                
            } //texture !=null

        } //

    } //new

    var _creating_geometry : Bool = false;
    @:noCompletion public function _create_geometry(options : VisualOptions) {

            //if they give a geometry, don't create one
        if(options.geometry == null) {
            
            if(options.no_geometry == null || options.no_geometry == false) {
                
                _creating_geometry = true;

                    geometry = new QuadGeometry({
                        id:name + '.visual',
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

                    //Only add to the batcher if requested
                if(options.add == null || options.add != false) {
                    if(options.batcher == null) {
                        Luxe.addGeometry( geometry );
                    } else {
                        options.batcher.add( geometry );
                    }
                }


                    //call the geometry create listener
                on_geometry_created( options );

            } //no_geometry is not present

        } else {
            
            geometry = options.geometry;

        }

            //default to the visual name
        if(geometry != null) {
            geometry.id = name + ".visual";
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
            scene.add(this);
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

    function on_geometry_created( options:VisualOptions ) {
        //nothing here for now
    } //on_geometry_created

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

            //rebind it's colors and whatever else
        if(geometry != null && _creating_geometry == false) {            
            
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

//Size
    
    private function set_size( _v:Vector ) : Vector {  

            //done
        return size = _v;

    } //set_size

//Rotation 
    
    private function get_rotation_z() : Float {

        return Maths.radToDeg(radians);

    } //get_rotation

    private function set_rotation_z( _r:Float ) : Float {

        radians = Maths.degToRad(_r);

        return rotation_z = _r;

    } // set_rotation_z

    private function set_radians(_r:Float) : Float {

            //Visual only rotates this way
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

//Locked

    private function set_locked(_l:Bool) : Bool {

        if(geometry != null) {
            geometry.locked = _l;
        }
        return locked = _l;
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
            color   : color.serialized,
            size    : size.serialized,
            locked  : locked,
            visible : visible, 
            radians : radians
        };
        
        if(texture != null)             _extra.texture = texture.id;
        if(clip && clip_rect!=null)     _extra.clip_rect = clip_rect.serialized;
        if(origin != null)              _extra.origin = origin.serialized;

        return _merge_properties(_data, _extra);

    } //get_serialize_data

} //Visual


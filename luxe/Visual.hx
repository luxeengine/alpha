package luxe;

import luxe.Color;
import luxe.Entity;
import luxe.Vector;
import luxe.Rectangle;
import luxe.utils.Maths;
import luxe.Resource;

import phoenix.geometry.Geometry;
import phoenix.geometry.QuadGeometry;

import phoenix.Shader;
import phoenix.Batcher;
import phoenix.Quaternion;
import phoenix.Texture;

import luxe.options.VisualOptions;

class Visual extends Entity {


    @:isVar public var size         (default,set) : Vector;
    @:isVar public var geometry     (default,set) : Geometry;
    @:isVar public var locked       (default,set) : Bool = false;
    @:isVar public var texture      (default,set) : Texture;
    @:isVar public var shader       (default,set) : Shader;
    @:isVar public var color        (default,set) : Color;
    @:isVar public var visible      (default,set) : Bool = true;
    @:isVar public var depth        (default,set) : Float = 0.0;
    @:isVar public var group        (default,set) : Int = 0;
    @:isVar public var clip         (default,set) : Bool = false;
    @:isVar public var clip_rect    (default,set) : Rectangle;
    
    @:isVar public var radians      (get,set) : Float = 0.0;
    public var rotation_z           (get,set) : Float;
    
    var _rotation_euler : Vector;
    var _rotation_quat : Quaternion;

    var _has_custom_origin : Bool = false;


    public function new<T>( _options:VisualOptions<T> ) {

//safe
        if(_options == null) {
            throw "Visual needs not-null options at the moment";
        }

//cached values
            //these need to be before super as it calls into the set_pos etc 
            //and that makes it crash if these are not there yet
        _rotation_euler = new Vector();
        _rotation_quat = new Quaternion();

            //call the entity constructor        
        super( _options );

            //create the position value so we can exploit it a bit
        color = new Color();
        size = new Vector();

//texture
        if(options.texture != null) {
            texture = options.texture;
        }
//shader
        if(options.shader != null) {
            shader = options.shader;
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

//serialize
        if(options.serialize != null) {
            serialize = options.serialize;
        }

//size is interesting, as it's possibly based on texture
    
            //user specified a size            
        if(options.size != null) {

            size = options.size;
                //the size is explicit, so make the geometry
            _create_geometry();

        } else {    

                //if the texture isn't invalid entirely
            if(texture != null) {
                if(texture.loaded) {

                    size = new Vector(texture.width, texture.height);
                    _create_geometry();

                } else {

                    texture.onload = function(_texture) {                        
                        size = new Vector(texture.width, texture.height);
                        _create_geometry();
                    }
                } //texture is not loaded

            } else {
                    //default to a value big enough to see
                size = new Vector(64,64); 
                // trace('\t\tWarning : no texture, or size, handed to visual constructor so going with a default size.');
                _create_geometry();
                
            } //texture !=null

        } //

    } //new

    var _creating_geometry : Bool = false;
    @:noCompletion public function _create_geometry() {

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
                        scale: scale.clone(),
                        texture : texture,
                        color : color,
                        shader : shader,
                        depth : (options.depth == null) ? 0 : options.depth,
                        group : (options.group == null) ? 0 : options.group,
                        visible : (options.visible == null) ? true : options.visible
                    });

                _creating_geometry = false;

                    //Only add to the batcher if requested
                if(options.no_batcher_add == null || options.no_batcher_add != true) {

                    if(options.batcher == null) {
                        Luxe.addGeometry( geometry );
                    } else {
                        options.batcher.add( geometry );
                    }

                } //no_batcher_add


                    //call the geometry create listener
                on_geometry_created();

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

    } //create_geometry


    function destroyed() {

            //drop the geometry
        if(geometry != null && geometry.added ) {
            geometry.drop( true );
        }

            //clear our references to these
        geometry = null;        
        texture = null;
        
    } //destroyed

    function on_geometry_created() {
        //nothing here for now
    } //on_geometry_created

//Visibility properties

    function set_visible(_v:Bool) {

        visible = _v;

            //careful
        if(geometry != null) {
            geometry.visible = visible;
        }

        return visible;

    } //set_visible

    function set_depth(_v:Float) {
        
        if(geometry != null) {
            geometry.depth = _v;
        } //geometry

        return depth = _v;

    } //set_depth

    function set_group(_v:Int) {
        
        if(geometry != null) {
            geometry.group = _v;
        } //geometry

        return group = _v;

    } //set_group

//Color properties

    function set_color(_c:Color) {

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

    override function set_origin(_o:Vector) : Vector {
        
        if(geometry != null) {
            geometry.transform.origin = _o.clone();
        }

        return super.set_origin(_o);
        
    } //set_origin

//Geometry
    
    var ignore_texture_on_geometry_change : Bool = false;

    function set_geometry(_g:Geometry) : Geometry {
        
        if(geometry != null) {
                //kill the existing geometry first
            geometry.drop();            
        }

            //store the new one
        geometry = _g;

            //rebind it's colors and whatever else
        if(geometry != null && _creating_geometry == false) {            
            
            geometry.transform.pos = pos;
            geometry.transform.scale = scale;
            geometry.transform.origin = origin;
            geometry.transform.rotation = rotation;
            geometry.color = color;            
            geometry.group = group;
            geometry.depth = depth;            
            geometry.visible = visible;
            geometry.shader = shader;

            if(!ignore_texture_on_geometry_change) {
                geometry.texture = texture;
            }

        }

        return geometry;
        
    } //set_origin


//Transforms

    override function set_pos_from_transform( _pos:Vector ) {
        
        super.set_pos_from_transform(_pos);

        if(geometry != null) {
            geometry.transform.pos = transform.pos;
        } //geometry ! null

    } //set_pos_from_transform

    override function set_rotation_from_transform( _rotation:Quaternion ) {

        super.set_rotation_from_transform(_rotation);

            //update caches
        _rotation_euler.setEulerFromQuaternion(_rotation);
        _rotation_quat.copy(_rotation);

        if(geometry != null) {
            geometry.transform.rotation = _rotation;
        } //geometry ! null

    } //set_rotation_from_transform
    
    override function set_scale_from_transform( _scale:Vector ) {

        super.set_scale_from_transform(_scale);

        if(geometry != null) {
            geometry.transform.scale = transform.scale;
        } //geometry ! null

    } //set_scale_from_transform

    override function set_parent_from_transform( _parent:Transform ) {

        super.set_parent_from_transform(_parent);

        if(geometry != null) {
            geometry.transform.parent = _parent;
        } //geometry != null

    } //set_parent_from_transform

//Size
    
    function set_size( _v:Vector ) : Vector {  

        size = _v;

        Vector.listen( size, _size_change );

        return size;

    } //set_size

//Rotation 
    
    function get_rotation_z() : Float {

        return Maths.radToDeg(radians);

    } //get_rotation

    function set_rotation_z( _r:Float ) : Float {

        radians = Maths.degToRad(_r);

        return _r;

    } //set_rotation_z

    function set_radians(_r:Float) : Float {

        _rotation_euler.z = _r;
        _rotation_quat.setFromEuler( _rotation_euler );

        rotation = _rotation_quat.clone();

        return radians = _r;

    } //set_radians

    function get_radians() : Float {
        return radians;
    } //get_radians

//Locked

    function set_locked(_l:Bool) : Bool {

        if(geometry != null) {
            geometry.locked = _l;
        }

        return locked = _l;

    } //set_locked


//Geometry properties
//Clip
    function set_clip(val : Bool) : Bool {
        return geometry.clip = val;
    }
//Clip rect
    function set_clip_rect(val : Rectangle) : Rectangle {
        return geometry.clip_rect = val;
    }

//Size

        //An internal callback for when x y or z on a size changes
    function _size_change( _v:Float ) { this.set_size( size ); }

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

package phoenix.geometry;

import phoenix.geometry.Geometry;
import phoenix.Batcher;
import phoenix.Quaternion;
import phoenix.Shader;
import phoenix.Texture;

class CompositeGeometry extends Geometry {

    public var geometry : Array<Geometry>;

    public function new(?options:Dynamic = null) {
        
        super(options);

        geometry = new Array<Geometry>();

    } //new

    public function toString() {
        return "CompositeGeometry " + geometry + ' : ' + Std.string(geometry);
    }

    public function clear() {
            //todo profile these splices vs new assigns in haxe
        geometry.splice(0,geometry.length);

    } //clear

        //loses the old geometry for new geometry
    public function replace(_geometry:Array<Geometry>) {

            //remove references 
        clear();
            //store the new geometry
        geometry = _geometry;

    } //replace

    public function has_geometry( g:Geometry ) {

        return Lambda.has(geometry, g);

    } //has_geometry

    public function add_geometry( g:Geometry ) {

        geometry.push(g);

    } //add_geometry

    public function remove_geometry( g:Geometry ) {

        geometry.remove(g);

    } //remove_geometry

    public function add_to_batcher( _batcher:Batcher ) {
        for(geom in geometry) {
            _batcher.add(geom);
        }
    }

    public override function drop( ?remove:Bool = true ) {

        for(geom in geometry) {
            geom.drop( remove );
        }

        geometry.splice(0,geometry.length);

    } //drop

    public override function translate( _offset:Vector ) {        
        if(geometry != null) {
            for(geom in geometry) {
                geom.translate(_offset);
            }
        }
    } //translate

    public override function set_origin( _origin:Vector ) : Vector {
        if(geometry != null) {
            for(geom in geometry) {
                geom.origin = _origin;
            }
        }
        return origin = _origin;
    } //set_origin

    public override function set_pos( _position:Vector ) : Vector {
        if(geometry != null) {
            for(geom in geometry) {
                geom.pos = _position;
            }
        }
        return pos = _position;
    } //set_pos

    public override function set_rotation( _rotation:Quaternion ) : Quaternion {
        if(geometry != null) {
            for(geom in geometry) {
                geom.rotation = _rotation;
            }
        }
        return rotation = _rotation;
    } //set_rotation

    public override function set_color( _color:Color ) : Color {
        if(geometry != null) {
            for(geom in geometry) {
                geom.color = _color;
            }
        }
        return color = _color;
    } //set_color

    public override function set_primitive_type(val : PrimitiveType) : PrimitiveType {
        if(geometry != null) {
            for(geom in geometry) {
                geom.primitive_type = val;
            }
        }
        return primitive_type = val;
    } //set_primitive_type

    public override function set_shader(val : Shader) : Shader {
        if(geometry != null) {
            for(geom in geometry) {
                geom.shader = val;
            }
        }
        return shader = val;
    } //set_shader

    public override function set_texture(val : Texture) : Texture {
        if(geometry != null) {
            for(geom in geometry) {
                geom.texture = val;
            }
        }
        return texture = val;
    } //set_texture

    public override function set_depth(val : Float) : Float {  
        if(geometry != null) {
            for(geom in geometry) {
                geom.depth = val;
            }
        }
        return depth = val;
    } //set_depth

    public override function set_group(val : Int) : Int {   
        if(geometry != null) {     
            for(geom in geometry) {
                geom.group = val;
            }
        }
        return group = val;
    } //set_group

    public override function set_clip(val : Bool) : Bool {
        if(geometry != null) {
            for(geom in geometry) {
                geom.clip = val;
            }
        }
        return clip = val;
    } //set_clip

    public override function set_locked(val : Bool) : Bool {
        if(geometry != null) {
            for(geom in geometry) {
                geom.locked = val;
            }
        }
        return locked = val;
    } //set_locked

    public override function set_dirty(val : Bool) : Bool {
        if(geometry != null) {
            for(geom in geometry) {
                geom.dirty = val;
            }
        }
        return dirty = val;
    } //set_dirty

    public override function set_clip_rect(val : Rectangle) : Rectangle {
        if(geometry != null) {
            for(geom in geometry) {
                geom.clip_rect = val;
            }
        }
        return clip_rect = val;
    } //set_clip_rect

    public override function set_visible(val : Bool) : Bool {

        if(geometry != null) {
            for(geom in geometry) {
                geom.visible = val;
            }
        }

        return visible = val;
    } //set_visible

} //CompositeGeometry

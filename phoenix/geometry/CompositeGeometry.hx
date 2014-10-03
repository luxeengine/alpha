package phoenix.geometry;

import luxe.Log;
import phoenix.geometry.Geometry;
import phoenix.Batcher;
import phoenix.Quaternion;
import phoenix.Shader;
import phoenix.Texture;

import luxe.Log.log;
import luxe.Log._verbose;
import luxe.Log._debug;

import luxe.options.GeometryOptions;

class CompositeGeometry extends Geometry {

    public var geometry : Array<Geometry>;

    public function new( ?_options:GeometryOptions ) {

        super( _options );

        geometry = new Array<Geometry>();

    } //new

    function toString() {

        return "CompositeGeometry " + geometry + ' : ' + Std.string(geometry);

    } //toString

    public function clear() {

            //:todo: profile these splices vs new assigns in haxe
		for (geom in geometry) {
			geom.transform.parent = null;
		}
        geometry.splice(0, geometry.length);

    } //clear

        //loses the old geometry for new geometry
    public function replace(_geometry:Array<Geometry>) {

            //remove references
        clear();
            //store the new geometry
        geometry = _geometry;
            //change their parent to this
        for(geom in geometry) {
            geom.transform.parent = transform;
        }

    } //replace

    public function has_geometry( geom:Geometry ) {

        return Lambda.has(geometry, geom);

    } //has_geometry

    public function add_geometry( geom:Geometry ) {

        if(geom != null) {
            geom.transform.parent = transform;
            geometry.push(geom);
        }

    } //add_geometry

    public function remove_geometry( g:Geometry ) {
		//Try to remove it, if successful also unlink parent
        if (geometry.remove(g)) {
			g.transform.parent = null;
		}

    } //remove_geometry

    public function add_to_batcher( _batcher:Batcher ) {

        for(geom in geometry) {
            _batcher.add(geom);
        }

    } //add_to_batcher

    public override function drop( ?remove:Bool = true ) {

        for(geom in geometry) {
            geom.drop( remove );
            geom = null;
        }

        geometry = null;
        geometry = [];

    } //drop

    public override function translate( _offset:Vector ) {

        if(geometry != null) {
            for(geom in geometry) {
                geom.translate(_offset);
            }
        }

    } //translate


//Properties


    override function set_color( _color:Color ) : Color {

        if(geometry != null) {
            for(geom in geometry) {
                geom.color = _color;
            }
        }

        return color = _color;

    } //set_color

    override function set_primitive_type(val : PrimitiveType) : PrimitiveType {

        if(geometry != null) {
            for(geom in geometry) {
                geom.primitive_type = val;
            }
        }

        return primitive_type = val;

    } //set_primitive_type

    override function set_shader(val : Shader) : Shader {

        if(geometry != null) {
            for(geom in geometry) {
                geom.shader = val;
            }
        }

        return shader = val;

    } //set_shader

    override function set_texture(val : Texture) : Texture {

        if(geometry != null) {

            for(geom in geometry) {
                geom.texture = val;
            }
        }

        return texture = val;

    } //set_texture

    override function set_depth(val : Float) : Float {

        if(geometry != null) {
            for(geom in geometry) {
                geom.depth = val;
            }
        }

        return depth = val;

    } //set_depth

    override function set_group(val : Int) : Int {

        if(geometry != null) {
            for(geom in geometry) {
                geom.group = val;
            }
        }

        return group = val;

    } //set_group

    override function set_locked(val : Bool) : Bool {

        if(geometry != null) {
            for(geom in geometry) {
                geom.locked = val;
            }
        }

        return locked = val;

    } //set_locked

    override function set_dirty(val : Bool) : Bool {

        if(geometry != null) {
            for(geom in geometry) {
                geom.dirty = val;
            }
        }

        return dirty = val;

    } //set_dirty

    override function set_clip_rect(val : Rectangle) : Rectangle {

        if(geometry != null) {
            for(geom in geometry) {
                geom.clip_rect = val;
            }
        }

        return clip_rect = val;

    } //set_clip_rect

    override function set_visible(val : Bool) : Bool {

        if(geometry != null) {
            for(geom in geometry) {
                geom.visible = val;
            }
        }

        return visible = val;

    } //set_visible

} //CompositeGeometry

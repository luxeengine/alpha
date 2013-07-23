package phoenix.geometry;

import phoenix.geometry.Geometry;
import phoenix.Batcher;
import phoenix.Shader;
import phoenix.Texture;

class CompositeGeometry extends Geometry {

    public var geometry : Array<Geometry>;

    public function new(?options:Dynamic = null) {
        
        super(options);

        geometry = new Array<Geometry>();
    }

    public function clear() {
            //todo profile these splices vs new assigns in haxe
        geometry.splice(0,geometry.length);
    }

        //loses the old geometry for new geometry
    public function replace(_geometry:Array<Geometry>) {
            //remove references 
        clear();
            //store the new geometry
        geometry = _geometry;
    }

    public function has_geometry( g:Geometry ) {
        return Lambda.has(geometry, g);
    }

    public function add_geometry( g:Geometry ) {
        geometry.push(g);
    }

    public function remove_geometry( g:Geometry ) {
        geometry.remove(g);
    }

    public override function drop( ?remove:Bool = false ) {
            //todo L keep children?
        for(geom in geometry) {
            geom.drop( remove );
        }

        geometry = null;
    }

    public override function translate( _offset:Vector ) {
        for(geom in geometry) {
            geom.translate(_offset);
        }
    }

    public override function set_color( _color:Color ) : Color {
        for(geom in geometry) {
            geom.color = _color;
        }
        return color = _color;
    }
    public override function set_primitive_type(val : PrimitiveType) : PrimitiveType {        
        for(geom in geometry) {
            geom.primitive_type = val;
        }
        return primitive_type = val;
    }
    public override function set_shader(val : Shader) : Shader {        
        for(geom in geometry) {
            geom.shader = val;
        }
        return shader = val;
    }
    public override function set_texture(val : Texture) : Texture {        
        for(geom in geometry) {
            geom.texture = val;
        }
        return texture = val;
    }
    public override function set_depth(val : Float) : Float {  
        for(geom in geometry) {
            geom.depth = val;
        }
        return depth = val;
    }
    public override function set_group(val : Int) : Int {        
        for(geom in geometry) {
            geom.group = val;
        }
        return group = val;
    }
    public override function set_clip(val : Bool) : Bool {        
        for(geom in geometry) {
            geom.clip = val;
        }
        return clip = val;
    }
    public override function set_enabled(val : Bool) : Bool {        
        for(geom in geometry) {
            geom.enabled = val;
        }
        return enabled = val;
    }
}
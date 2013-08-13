package luxe;

import phoenix.geometry.Geometry;
import phoenix.Texture;
import luxe.Vector;
import luxe.Quaternion;
import phoenix.geometry.Vertex;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;

class Mesh {

    public var geometry : Geometry;
    public var pos : Vector;
    public var scale : Vector;
    public var rotation : Quaternion;    

    public function new(?_options:Dynamic = null) {
        
        pos = 
        scale = new Vector(1,1,1);
        rotation = new Quaternion();        

        if(_options == null) throw "Mesh requires non-null options at the moment";

        var _batcher = (_options.batcher == null) ? Luxe.renderer.default_batcher : _options.batcher;

        pos = (_options.pos == null) ? new Vector() : _options.pos;
        scale = (_options.scale == null) ? new Vector(1,1,1) : _options.scale;
        rotation = (_options.rotation == null) ? new Quaternion() : new Quaternion().setFromEuler(_options.rotation);

        if(_options.file != null) {
            var ext = haxe.io.Path.extension( _options.file );
            switch(ext) {
                case 'obj':
                    fromOBJFile( _options.file, _options.texture );
                default:
                    throw 'cannot handle files with extension ' + ext + ' right now';
            } //switch ext
        } //options.file

        if(geometry != null) {
                //add to the batcher
            _batcher.add(geometry);
        } else {
            throw 'Mesh component with null geometry';
        }

    } //new

    public function set_pos(v:Vector) : Vector {
        
        if(geometry != null) {
            trace('set pos in mesh to geometry');
            geometry.pos = v.clone();
        }

        pos = v;

        return pos;
    }

    public function fromOBJFile( asset_id:String, texture:Texture ) {

        var obj_file = lime.utils.Assets.getText(asset_id);       
        var file_input = new haxe.io.StringInput( obj_file );
        var obj_mesh_data = new phoenix.formats.obj.Reader(file_input).read();

        geometry = new Geometry({
            texture : texture,
            type: PrimitiveType.triangles,
            immediate : false,
            depth : 2
        });

        for(v in obj_mesh_data.vertices) {
           
           var normal : Vector = new Vector();
           if(v.normal != null) {
                normal = new Vector(v.normal.x, v.normal.y, v.normal.z);
           }
           var _v = new Vertex( new Vector( (v.pos.x * scale.x)+pos.x , (v.pos.y * scale.y)+pos.y, (v.pos.z * scale.z)+pos.z), normal );
           if(v.uv != null) {
               _v.uv[0] = new TextureCoord( v.uv.u, 1.0 - v.uv.v );
           } else {
               _v.uv[0] = new TextureCoord( 0, 0 );
           }
           
           geometry.add( _v );

        } //for all verts

            //only thing left is to rotate the mesh according to the given rotation
        geometry.rotate( new Vector().setEulerFromQuaternion(rotation) );

    } // from obj file


} //class mesh
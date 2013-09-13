package luxe;

import phoenix.geometry.Geometry;
import phoenix.Texture;
import luxe.Vector;
import luxe.Quaternion;
import phoenix.geometry.Vertex;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.utils.Maths;

class Mesh {

    public var geometry : Geometry;

    public var pos      (default,set) : Vector;
    public var scale    (default,set) : Vector;
    public var rotation (default,set) : Vector;    

    var _rotation_quat : Quaternion;

    public function new(?_options:Dynamic = null) {

        if(_options == null) throw "Mesh requires non-null options at the moment";

        var _batcher = (_options.batcher == null) ? Luxe.renderer.default_batcher : _options.batcher;

        _rotation_quat = new Quaternion();   

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

            geometry.id = _options.file;
                //add to the batcher
            _batcher.add(geometry);

        } else {
            throw 'Mesh component with null geometry';
        }

        pos = (_options.pos == null) ? new Vector() : _options.pos;
        scale = (_options.scale == null) ? new Vector(1,1,1) : _options.scale;
        rotation = (_options.rotation == null) ? new Vector() : _options.rotation;

    } //new

//Position

    public function set_pos( _position:Vector ) : Vector {
            
        if(geometry != null) {            
            geometry.pos = _position;
        }
        
        return pos = _position;

    } //set_pos

//Rotation

    public function set_rotation( _rotation:Vector ) : Vector {
        
        if(rotation == null) {
            return rotation = _rotation;
        } //rotation is null

        if(geometry != null) {

                //cache locally, avoids allocation
            _rotation_quat.setFromEuler(_rotation);
                //pass to the geometry
            geometry.rotation = _rotation_quat;

        } //geometry
        
        return rotation = _rotation;

    } //set_rotation

//Scale

    public function set_scale( _scale:Vector ) : Vector {
            
        if(geometry != null) {            
            geometry.scale = _scale;
        }
        
        return scale = _scale;

    } //set_scale

//Create a mesh from an Obj file 

    public function fromOBJFile( asset_id:String, texture:Texture, ?_scale:Vector  ) {

        if(_scale == null) _scale = new Vector(1,1,1);

        var obj_file = lime.utils.Assets.getText(asset_id);       
        var file_input = new haxe.io.StringInput( obj_file );
        var obj_mesh_data = new phoenix.formats.obj.Reader(file_input).read();

        geometry = new Geometry({
            texture : texture,
            type: PrimitiveType.triangles,
            immediate : false,
            depth : 1 //todo optionise
        });

        for(v in obj_mesh_data.vertices) {
           
               var normal : Vector = new Vector();
               
               if(v.normal != null) {
                    normal.set(v.normal.x, v.normal.y, v.normal.z);
               }

           var _v = new Vertex( new Vector( (v.pos.x * _scale.x) , (v.pos.y * _scale.y), (v.pos.z * _scale.z) ), normal );

               if(v.uv != null) {                    
                   _v.uv[0] = new TextureCoord( v.uv.u, 1.0 - v.uv.v ); // inverted from texture space 
               } else {
                   _v.uv[0] = new TextureCoord( 0, 0 );
               }
           
           geometry.add( _v );

        } //for all verts

    } // from obj file


} //Mesh


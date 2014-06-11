package luxe;

import phoenix.geometry.Geometry;
import phoenix.Texture;
import luxe.Vector;
import luxe.Quaternion;
import phoenix.geometry.Vertex;
import phoenix.geometry.TextureCoord;
import phoenix.Batcher;
import phoenix.Transform;
import luxe.utils.Maths;

import luxe.options.MeshOptions;

class Mesh {

    public var geometry : Geometry;
    public var transform : Transform;

    public var pos      (default,set) : Vector;
    public var scale    (default,set) : Vector;
    public var rotation (default,set) : Quaternion;

    public function new( ?_options:MeshOptions ) {

        if(_options == null) {
            throw "Mesh requires non-null options at the moment";
        }

        transform = new Transform();
        transform.listen_pos(set_pos_from_transform);
        transform.listen_rotation(set_rotation_from_transform);
        transform.listen_scale(set_scale_from_transform);

        var _batcher = (_options.batcher == null) ? Luxe.renderer.batcher : _options.batcher;

        if(_options.file != null) {

            // trace("\t Loading Mesh from file " + _options.file );
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
        rotation = (_options.rotation == null) ? new Quaternion() : _options.rotation;

    } //new

//Position

    function set_pos( _pos:Vector ) {

        return transform.pos = _pos;

    } //set_pos

    function set_pos_from_transform( _pos:Vector ) {

        // super.set_pos_from_transform(_pos);

        if(geometry != null) {
            geometry.transform.pos = _pos;
        }

    } //set_pos

//Rotation

    function set_rotation( _rotation:Quaternion ) {

        return transform.rotation = _rotation;

    } //set_rotation

    function set_rotation_from_transform( _rotation:Quaternion ) {

        if(geometry != null) {
            geometry.transform.rotation = _rotation;
        } //geometry

    } //set_rotation

//Scale

    function set_scale( _scale:Vector ) {

        return transform.scale = _scale;

    } //set_scale

    function set_scale_from_transform( _scale:Vector ) {

        if(geometry != null) {
            geometry.transform.scale = _scale;
        }

    } //set_scale



//Create a mesh from an Obj file

    function _obj_add_vert( v:phoenix.formats.obj.Data.Vertex, _scale:Vector ) {

        var normal : Vector = new Vector();

           if(v.normal != null) {
                normal.set(v.normal.x, v.normal.y, v.normal.z);
           }

       var _v = new Vertex( new Vector( (v.pos.x * _scale.x) , (v.pos.y * _scale.y), (v.pos.z * _scale.z) ), new Color(), normal );

                //todo;multiple uv sets
           if(v.uv != null) {
               _v.uv.uv0.set( v.uv.u, 1.0 - v.uv.v ); // inverted from texture space
           }

       geometry.add( _v );

    } //_obj_add_vert

    public function fromOBJFile( asset_id:String, texture:Texture, ?_scale:Vector  ) {

        if(_scale == null) _scale = new Vector(1,1,1);

        var obj_file = lime.utils.Assets.getText(asset_id);
        var file_input = new haxe.io.StringInput( obj_file );
        var obj_mesh_data = new phoenix.formats.obj.Reader(file_input).read();

        geometry = new Geometry({
            texture : texture,
            primitive_type: PrimitiveType.triangles,
            immediate : false,
            depth : 1 //:todo : optionise
        });

        for(v in obj_mesh_data.vertices) {

            _obj_add_vert(v, _scale);

        } //for all verts


    } // from obj file


} //Mesh

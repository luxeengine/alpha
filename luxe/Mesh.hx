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

    public var pos      (get,set) : Vector;
    public var scale    (get,set) : Vector;
    public var rotation (get,set) : Quaternion;

    public function new( ?_options:MeshOptions ) {

        if(_options == null) {
            throw "Mesh requires non-null options at the moment";
        }

        transform = new Transform();
        transform.listen_pos(set_pos_from_transform);
        transform.listen_rotation(set_rotation_from_transform);
        transform.listen_scale(set_scale_from_transform);

        if(_options.batcher == null) {
            _options.batcher = Luxe.renderer.batcher;
        }

        if(_options.file != null) {

            // trace("\t Loading Mesh from file " + _options.file );
            var ext = haxe.io.Path.extension( _options.file );
            switch(ext) {
                case 'obj':
                    from_obj_file( _options.file, _options.texture, null, _options.batcher );
                default:
                    throw 'cannot handle files with extension ' + ext + ' right now';
            } //switch ext

        } //options.file

        if(_options.string != null) {
            from_string(_options.string, _options.texture, null, _options.batcher);
        }

        if(_options.geometry != null){
            geometry = _options.geometry;
        }

        if(geometry != null) {

            if(_options.file != null) {
                geometry.id = _options.file;
            }

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

    function get_pos() {
        return transform.pos;
    } //get_pos

    function get_rotation() {
        return transform.rotation;
    } //get_rotation

    function get_scale() {
        return transform.scale;
    } //get_scale

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


    function _obj_add_vert( v:luxe.importers.obj.Data.Vertex, _scale:Vector ) {

        var normal : Vector = new Vector();

           if(v.normal != null) {
                normal.set_xyz(v.normal.x, v.normal.y, v.normal.z);
           }

       var _v = new Vertex( new Vector( (v.pos.x * _scale.x) , (v.pos.y * _scale.y), (v.pos.z * _scale.z) ), new Color(), normal );

                //todo;multiple uv sets
           if(v.uv != null) {
               _v.uv.uv0.set_uv( v.uv.u, 1.0 - v.uv.v ); // inverted from texture space
           }

       geometry.add( _v );

    } //_obj_add_vert

    public function from_string( string_data:String, texture:Texture, ?_scale:Vector, _batcher:Batcher ) {

        if(_scale == null) _scale = new Vector(1,1,1);

        var file_input = new haxe.io.StringInput( string_data );
        var obj_mesh_data = new luxe.importers.obj.Reader(file_input).read();

        geometry = new Geometry({
            texture : texture,
            primitive_type: PrimitiveType.triangles,
            immediate : false,
            batcher : _batcher,
            depth : 1 //:todo : optionise
        });

        for(v in obj_mesh_data.vertices) {

            _obj_add_vert(v, _scale);

        } //for all verts

    } //from_string

    public function from_obj_file( asset_id:String, texture:Texture, ?_scale:Vector, _batcher:Batcher ) {

        if(_scale == null) _scale = new Vector(1,1,1);

        var obj_file = Luxe.loadText(asset_id);

        from_string(obj_file.text, texture, _scale, _batcher);

    } // from obj file

    public function destroy() {
        if(geometry != null) {
            geometry.drop();
            geometry = null;
        }
    }


} //Mesh

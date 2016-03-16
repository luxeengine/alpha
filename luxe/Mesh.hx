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
import luxe.Log.*;

import luxe.options.MeshOptions;

class Mesh {

    public var geometry : Geometry;
    public var transform : Transform;

    public var pos      (get,set) : Vector;
    public var scale    (get,set) : Vector;
    public var rotation (get,set) : Quaternion;

    var options : MeshOptions;

    public function new( _options:MeshOptions ) {

        assertnull(_options, 'Mesh requires non-null options');

        options = _options;

        transform = new Transform();
        transform.listen_pos(set_pos_from_transform);
        transform.listen_rotation(set_rotation_from_transform);
        transform.listen_scale(set_scale_from_transform);

        def(options.batcher, Luxe.renderer.batcher);

        if(options.file != null) {

            _debug('loading from file ${options.file}');

            var _ext = haxe.io.Path.extension( options.file );

            switch(_ext) {

                case 'obj':
                    from_obj_file( options.file, options.texture, null, options.batcher );
                default:
                    throw 'Mesh cannot handle files with extension $_ext';

            } //switch ext

        } else if(options.string != null) {

            from_string(options.string, options.texture, null, options.batcher);

        } else if(options.geometry != null){

            geometry = options.geometry;
            if(options.texture != null) geometry.texture = options.texture;

        }

        pos = def(options.pos, new Vector());
        scale = def(options.scale, new Vector(1,1,1));
        rotation = def(options.rotation, new Quaternion());

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

        var _normal : Vector = new Vector();

           if(v.normal != null) {
                _normal.set_xyz(v.normal.x, v.normal.y, v.normal.z);
           }

       var _v = new Vertex( new Vector( (v.pos.x * _scale.x) , (v.pos.y * _scale.y), (v.pos.z * _scale.z) ), new Color(), _normal );

                //todo;multiple uv sets
           if(v.uv != null) {
               _v.uv.uv0.set_uv( v.uv.u, 1.0 - v.uv.v ); // inverted from texture space
           }

       geometry.add( _v );

    } //_obj_add_vert

    public function from_string( string_data:String, texture:Texture, ?_scale:Vector, _batcher:Batcher ) {

        def(_scale, new Vector(1,1,1));

        var _file_input = new haxe.io.StringInput( string_data );
        var _obj_mesh_data = new luxe.importers.obj.Reader(_file_input).read();

        geometry = new Geometry({
            texture : texture,
            primitive_type: PrimitiveType.triangles,
            immediate : false,
            batcher : _batcher,
            depth : options.depth,
            no_batcher_add : options.no_batcher_add,
            buffer_based : options.buffer_based,
            object_space : options.object_space
        });


        for(v in _obj_mesh_data.vertices) {

            _obj_add_vert(v, _scale);

        } //for all verts

    } //from_string

    public function from_obj_file( asset_id:String, texture:Texture, ?_scale:Vector, _batcher:Batcher ) {

        def(_scale, new Vector(1,1,1));

        var _res = Luxe.resources.text(asset_id);

        assertnull(_res, 'Mesh cannot find text resource named $asset_id, is it loaded?');

        from_string(_res.asset.text, texture, _scale, _batcher);

        geometry.id = asset_id;

    } // from obj file

    public function destroy() {
        if(geometry != null) {
            geometry.drop();
            geometry = null;
        }
    }


} //Mesh

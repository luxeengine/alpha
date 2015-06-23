package luxe.components.render;

import luxe.Component;
import luxe.Mesh;
import luxe.Quaternion;
import luxe.options.MeshOptions;

import luxe.Log.*;

class MeshComponent extends Component {

    public var mesh : Mesh;
    public var options : MeshOptions;

    public function new( _options:MeshOptions ) {

        options = _options;

        assertnull(options, 'MeshComponent requires non-null options');

        def(options.name, 'mesh');

        super({ name:options.name });

    } // new

    override function init() {

        if(mesh == null) {

            mesh = new Mesh(options);

            mesh.pos = entity.pos;
            mesh.rotation = entity.rotation;
            mesh.scale = entity.scale;

        } //mesh != null

    } //init

    override function entity_pos_change( _pos:Vector ) {

        if(mesh != null) {
            mesh.pos = _pos;
        } //mesh

    } //entity_pos_change

    override function entity_rotation_change( _rotation:Quaternion ) {

        if(mesh != null) {
            mesh.rotation = _rotation;
        } //mesh

    } //entity_rotation_change

    override function entity_scale_change( _scale:Vector ) {

        if(mesh != null){
            mesh.scale = _scale;
        } //mesh

    } // entity_scale_change

    override function ondestroy() {

        if(mesh != null) {
            mesh.destroy();
        }

    } // ondestroy

} //MeshComponent

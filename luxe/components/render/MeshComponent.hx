package luxe.components.render;

import luxe.Component;
import luxe.Mesh;
import luxe.Quaternion;
import phoenix.Texture;
import phoenix.Batcher;

class MeshComponent extends Component {
        
    public var mesh : Mesh;
    public var texture : Texture;
    public var file : String;
    public var batcher : Batcher;

    public function init() {

        if(mesh == null) {
            
            mesh = new Mesh({
                file: file, 
                texture: texture, 
                batcher: batcher
            });

            mesh.pos = entity.pos;
            mesh.rotation = entity.rotation;
            mesh.scale = entity.scale;
        }

    } //init
    
    public override function entity_pos_change( _pos:Vector ) {

        if(mesh != null) {
            mesh.pos = _pos;
        } //mesh

    } //entity_pos_change

    public override function entity_rotation_change( _rotation:Quaternion ) {

        if(mesh != null) {
            mesh.rotation = _rotation;
        } //mesh

    } //entity_rotation_change

    public override function entity_scale_change( _scale:Vector ) {

        if(mesh != null){
            mesh.scale = _scale;
        } //mesh
    } // entity_scale_change

    public function update(dt:Float) {

    }

} //MeshComponent

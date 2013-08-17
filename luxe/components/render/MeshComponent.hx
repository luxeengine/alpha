package luxe.components.render;

import luxe.components.Components.Component;
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
        }

    } //init
    
    public override function entity_pos_change( _p:Vector ) {

        if(mesh != null) {
            mesh.pos = _p.clone();
        } //mesh

    } //entity_pos_change

    public override function entity_rotation_change( _p:Vector ) {

        if(mesh != null) {
            mesh.rotation = _p.clone();
        } //mesh

    } //entity_rotation_change

    public function update(dt:Float) {

    }

} //MeshComponent
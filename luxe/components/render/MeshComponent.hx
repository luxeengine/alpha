package luxe.components.render;

import luxe.Component;
import luxe.Mesh;
import luxe.Quaternion;
import luxe.options.MeshOptions
import phoenix.Texture;
import phoenix.Batcher;

class MeshComponent extends Component {

    public var mesh : Mesh;
    public var texture : Texture;
    public var file : String;
    public var batcher : Batcher;

    public function new( ?_options:MeshOptions, ?_name:String = 'mesh' ) {
            // allows the user to optionally pass the MeshOptions that they would 
            // usually pass to a regular Mesh constructor.
        
        if(_options != null) {
            if(_options.texture != null) {
                this.texture = _options.texture;
            }
                
            if(_options.batcher != null) {
                this.batcher = _options.batcher;
            }
                
            if(_options.file != null) {
                this.file = _options.file;
            }
            
        } // _options != null
        
        super({name:_name});
    } // new

    override function init() {

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

    override function update(dt:Float) {

    }

} //MeshComponent

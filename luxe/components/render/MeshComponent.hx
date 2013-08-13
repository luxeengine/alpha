package luxe.components.render;

import luxe.Mesh;
import phoenix.Texture;
import phoenix.Batcher;

class MeshComponent extends Entity {
        
    public var mesh : Mesh;
    public var texture : Texture;
    public var file : String;
    public var batcher : Batcher;

    public function init() {

        mesh = new Mesh({
            file: file, 
            texture: texture, 
            batcher: batcher
        });

    } //init
    
    public override function set_pos(_p:Vector) : Vector {

        trace('pos set in set_pos of MeshComponent ' + _p);

        if(mesh != null) {
            mesh.pos = _p.clone();
        }

            //store the position
        pos = _p;

        return pos;
    } //set_pos

    public function update(dt:Float) {

    }

} //MeshComponent
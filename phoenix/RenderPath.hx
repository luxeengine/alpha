package phoenix;

import lime.gl.GL;
import phoenix.Renderer;
import phoenix.Batcher;
import luxe.structural.BinarySearchTree;

//Default base class will do forward rendering

class RenderPath {
        
    public var renderer : Renderer;
    public function new( _renderer:Renderer ) { 
        renderer = _renderer; 
    }

    public function render( _batchers: BinarySearchTree<Int,Batcher>, _stats:RendererStats ) {

        for(batch in _batchers) {

            if(batch.enabled) {
                batch.draw();
                    //Update render stats
                _stats.geometry_count += batch.geometry.size();
                _stats.dynamic_batched_count += batch.dynamic_batched_count;
                _stats.static_batched_count += batch.static_batched_count;
                _stats.enabled_count += batch.enabled_count;
                _stats.draw_calls += batch.draw_calls;
                // _stats.group_count += batch.groups.

            } //batcher enabled

        } //each batcher

    } //render

} //RenderPath


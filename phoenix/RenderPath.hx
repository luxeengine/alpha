package phoenix;

import snow.render.opengl.GL;
import phoenix.Renderer;
import phoenix.Batcher;
import luxe.structural.BalancedBinarySearchTree;

//Default base class will do forward rendering

class RenderPath {

    public var renderer : Renderer;
    public function new( _renderer:Renderer ) {
        renderer = _renderer;
    }

    // public function render( _batchers: BalancedBinarySearchTree<BatcherKey,Batcher>, _stats:RendererStats ) {
    public function render( _batchers: Array<Batcher>, _stats:RendererStats ) {

        for(batch in _batchers) {
            if(batch.enabled) {

                    //Measure the time and graph it in the debug view
                Luxe.debug.start('batch.' + batch.name);

                    //Tell the batcher to draw
                batch.draw();

                    //Update Render Stats
                _stats.geometry_count += batch.geometry.size();
                _stats.dynamic_batched_count += batch.dynamic_batched_count;
                _stats.static_batched_count += batch.static_batched_count;
                _stats.visible_count += batch.visible_count;
                _stats.draw_calls += batch.draw_calls;
                _stats.vert_count += batch.vert_count;
                // _stats.group_count += batch.groups.

                    //Stop Measuring
                Luxe.debug.end('batch.' + batch.name);

            } //batcher enabled
        } //each batcher

    } //render

} //RenderPath


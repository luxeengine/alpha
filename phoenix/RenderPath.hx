package phoenix;

import snow.modules.opengl.GL;
import phoenix.Renderer;
import phoenix.Batcher;

//Default base class will do forward rendering

class RenderPath {

    public var renderer : Renderer;
    public function new( _renderer:Renderer ) {
        renderer = _renderer;
    }

    public function render( _batchers: Array<Batcher>, _stats:RendererStats ) {

        var c = _batchers.length;
        var i = 0;
        while(i < c) {
            var batch = _batchers[i];
            if(batch.enabled) {

                    //Measure the time and graph it in the debug view
                #if !luxe_noprofile Luxe.debug.start('batch.' + batch.name); #end

                    //Tell the batcher to draw
                batch.draw();

                    //Update Render Stats
                _stats.geometry_count += batch.geometry.size();
                _stats.dynamic_batched_count += batch.dynamic_batched_count;
                _stats.static_batched_count += batch.static_batched_count;
                _stats.visible_count += batch.visible_count;
                _stats.draw_calls += batch.draw_calls;
                _stats.vert_count += batch.vert_count;

                    //Stop Measuring
                #if !luxe_noprofile Luxe.debug.end('batch.' + batch.name); #end

            } //batcher enabled
            batch = null;
            ++i;

        } //each batcher

    } //render

} //RenderPath


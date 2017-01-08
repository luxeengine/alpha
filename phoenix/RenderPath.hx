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

                    //Tell the batcher to draw
                batch.draw();

            } //batcher enabled
            batch = null;
            ++i;

        } //each batcher

    } //render

} //RenderPath


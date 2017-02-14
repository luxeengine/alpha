package phoenix;

import snow.modules.opengl.GL;
import phoenix.Renderer;

//Default base class will do forward rendering

class RenderPath {

    public var renderer : Renderer;
    
    public function new(_renderer:Renderer) {

        renderer = _renderer;

    } //new

    #if !luxe_no_hotpath_inline @:extern #end
    inline public function render(_renderables: Array<Renderable>) {

        var index = 0;
        var count = _renderables.length;

        while(index < count) {

            _renderables[index].draw();

            ++index;

        } //each batcher

    } //render

} //RenderPath


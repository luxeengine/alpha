package lab;

import lab.Core;
import nmegl.gl.GL;

//Default base class will just be a weird color clear color
//use core.set_renderer to replace the default behavior

class Renderer {
        
    public var core : Core;
    public function new( _core:Core ) { core = _core; }

    public function startup() {
            //Done.
        core._debug(':: haxelab :: \t Renderer Initialized.');
    }

    public function shutdown() {
        core._debug(':: haxelab :: \t Renderer shut down.');
    }

    public function process() {
        GL.clearColor(0.3,0.2,0.1,1);
        GL.clear( GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT );
    }


} 

    
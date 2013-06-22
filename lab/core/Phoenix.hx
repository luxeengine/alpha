package lab.core;

import lab.core.Core;

	//Import GL stuff from nme
import lab.gl.GL;
import lab.gl.GLBuffer;


class Phoenix {
		
	public var core : Core;
	public function new( _core:Core ) { core = _core; }

    	//direct_renderer_handle for NME
    public var direct_renderer_handle : Dynamic;

	public function startup() {

			//Set up the OpenGL View
        direct_renderer_handle = nme_direct_renderer_create();
            //Set this handle to the real view with a render function
        nme_direct_renderer_set( direct_renderer_handle, on_render );

        	//Set the clear color
        GL.clearColor(100,100,100,255);

        	//Done.
		core._debug(':: haxelab :: \t Phoenix Initialized.');
	}

	public function shutdown() {
		core._debug(':: haxelab :: \t Phoenix shut down.');
	}

	public function on_render( _rect:Dynamic ) {
		GL.clear( GL.COLOR_BUFFER_BIT );
	}


//nme functions

	private static var nme_direct_renderer_create   = Core.load("nme","nme_direct_renderer_create", 0);
    private static var nme_direct_renderer_set      = Core.load("nme","nme_direct_renderer_set", 2);


} 

    
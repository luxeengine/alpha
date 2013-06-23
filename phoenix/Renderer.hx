package phoenix;

import nmegl.gl.GL;

import phoenix.ResourceManager;
import phoenix.geometry.Geometry;
import phoenix.DefaultShaders;
import phoenix.Shader;


class Renderer {

    public var geometry : Array<Geometry>;
    public var resource_manager : ResourceManager;
        
    public var default_shader : Shader;

    public function startup() {

        trace(':: phoenix :: renderer starting up');

        geometry = new Array<Geometry>();

        resource_manager = new ResourceManager();
        default_shader = new Shader( resource_manager );

        default_shader.load_from_string( DefaultShaders.DefaultVertexShader, DefaultShaders.DefaultFragmentShader );
        
        default_shader.activate();
        
    }

    public function shutdown() {
        trace(':: phoenix :: renderer shutting down');   
    }

        //The main render function 
    public function process() {
        
        GL.clearColor(0.16,0.16,0.16,1);
        GL.clear( GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT );



    }


}

    
package phoenix;

import nmegl.gl.GL;

import phoenix.ResourceManager;
import phoenix.geometry.Geometry;
import phoenix.DefaultShaders;
import phoenix.Shader;
import phoenix.Color;


class Renderer {

    public var resource_manager : ResourceManager;
    public var batchers : Array<Batcher>;
        
        //Default rendering
    public var default_shader : Shader;
    public var default_batcher : Batcher;

    public var should_clear : Bool = true;
    public var clear_color : Color;

    public function startup() {

        clear_color = new Color(0.16,0.16,0.16,1);

        resource_manager = new ResourceManager();

            //create the default rendering shader
        default_shader = new Shader( resource_manager );        

        var compiles = default_shader.load_from_string( 
                            DefaultShaders.DefaultVertexShader, 
                            DefaultShaders.DefaultFragmentShader 
                        );
        
        if( !compiles ) {
            throw "Default shader compilation error! \n" + default_shader.errors;
        }
        
            //create the default batcher
        default_batcher = new Batcher( this );

        trace(':: phoenix :: renderer starting up');        
    }

    public function shutdown() {
        trace(':: phoenix :: renderer shutting down');   
    }

    public function clear( _color:Color ) {
        if(_color == null) _color = clear_color;

        GL.clearColor( _color.r, _color.g, _color.b, _color.a );
        GL.clear( GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT );
    }

        //The main render function 
    public function process() {
        
        if(should_clear) {
            clear( clear_color );
        }

        if(default_batcher != null) {
            default_batcher.draw();
        }

    }


}

    
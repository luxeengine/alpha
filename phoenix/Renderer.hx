package phoenix;

import nmegl.gl.GL;
import nmegl.utils.Libs;

import phoenix.ResourceManager;
import phoenix.geometry.Geometry;
import phoenix.DefaultShaders;
import phoenix.Shader;
import phoenix.Color;
import phoenix.Camera;
import phoenix.Texture;

import nmegl.utils.UInt8Array;
import nmegl.utils.ArrayBuffer;


class Renderer {

    public var resource_manager : ResourceManager;
    public var batchers : Array<Batcher>;
        
        //Default rendering
    public var default_shader : Shader;
    public var default_batcher : Batcher;
    public var default_camera : Camera;

    public var should_clear : Bool = true;
    public var clear_color : Color;

    public function startup() {

        clear_color = new Color(0.16,0.16,0.16,1);

        resource_manager = new ResourceManager();

            //create the default rendering shader
        default_shader = new Shader( resource_manager );  
        default_shader.id = 'default_shader';

        default_camera = new Camera( ProjectionType.ortho, { x2:960, y2:640 } );

        var compiles = default_shader.load_from_string( 
                            DefaultShaders.DefaultVertexShader, 
                            DefaultShaders.DefaultFragmentShader 
                        );

        if( !compiles ) {
            throw "Default shader compilation error! \n" + default_shader.errors;
        }
        
            //create the default batcher
        default_batcher = new Batcher( this );

        GL.enable(GL.DEPTH_TEST);
        GL.depthFunc(GL.LEQUAL);

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

    public function load_texture( _name : String ) : Texture {

        var texture : Texture = new Texture( resource_manager );

        var asset_bytes = nmegl.utils.Assets.getBytes( _name );

        if(asset_bytes != null) {

            texture.create_from_bytes( _name, asset_bytes );

        } else {

            trace(":: phoenix :: Texture not found by asset name.") ;          

        }

        asset_bytes = null;

        trace(":: phoenix :: Texture loaded " + texture.id + ' (' + texture.width + 'x' + texture.height + ')') ;

        return texture;

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

    
package phoenix;

import luxe.Log.*;
import snow.modules.opengl.GL;
import phoenix.Texture;

class RenderState {

    var cull_face : Bool = false;
    var depth_test : Bool = false;
    var depth_mask : Bool = true;
    var renderer : Renderer;
    var _viewport : Rectangle;


    public function new( _renderer:Renderer ) {
        renderer = _renderer;
        _viewport = new Rectangle( 0, 0, 0, 0 );
    }

    public function enable( what:Int ) {
        switch(what) {
            case GL.CULL_FACE:
                if(!cull_face) {
                    cull_face = true;
                    GL.enable(GL.CULL_FACE);
                } //!cull_face
            case GL.DEPTH_TEST:
                if(Luxe.core.app.config.render.depth > 0) {
                    if(!depth_test) {
                        depth_test = true;
                        GL.enable(GL.DEPTH_TEST);
                    }
                } //!depth_test
        } //switch
    } //enable_if_not

    public function disable( what:Int ) {
        switch(what) {
            case GL.CULL_FACE:
                if(cull_face) {
                    cull_face = false;
                    GL.disable(GL.CULL_FACE);
                } //cull_face
            case GL.DEPTH_TEST:
                if(Luxe.core.app.config.render.depth > 0) {
                    if(depth_test) {
                        depth_test = false;
                        GL.disable(GL.DEPTH_TEST);
                    }
                } //depth_test
        } //switch
    } //disable_if_not

    var depth_func : Int = -1;
    public function depth_function( what:Int ) {
        if(depth_func != what) {
            GL.depthFunc( what );
            depth_func = what;
        }
    } //depth_function

    public function viewport( x:Float, y:Float, w:Float, h:Float ) {

        if(
            _viewport.x != x ||
            _viewport.y != y ||
            _viewport.w != w ||
            _viewport.h != h
        ) {

            _viewport.x = x;
            _viewport.y = y;
            _viewport.w = w;
            _viewport.h = h;

                //In OpenGL the viewport is bottom left origin, so we flip the y
                //when submitting our top left based coordinates.
                //We use the target size property of the renderer, which
                //when rendering to the screen matches the window and when
                //rendering to a texture/render target, matches the target.
            var _y : Float = renderer.target_size.y - (y + h);

            GL.viewport( Std.int(x), Std.int(_y), Std.int(w), Std.int(h) );

        }  //if it's changed

    } //viewport

    var _current_fbo : GLFramebuffer = null;
    public function bindFramebuffer( ?buffer:GLFramebuffer=null ) {

        if(_current_fbo != buffer) {

            def(buffer, renderer.default_fbo);

            GL.bindFramebuffer( GL.FRAMEBUFFER, buffer );
            _current_fbo = buffer;
        }

    } //bindFrameBuffer

    var _current_rbo : GLRenderbuffer = null;
    public function bindRenderbuffer( ?buffer:GLRenderbuffer=null ) {

        if(_current_rbo != buffer) {

            def(buffer, renderer.default_rbo);

            GL.bindRenderbuffer( GL.RENDERBUFFER, buffer );
            _current_rbo = buffer;
        }

    } //bindRenderbuffer

    var _used_program : GLProgram = null;
    public function useProgram( program:GLProgram ) {
        if(_used_program != program) {
            _used_program = program;
            GL.useProgram( program ); 
        }
    } //useProgram

    var _active_texture = -1;
    public function activeTexture( val:Int ) {
        if(_active_texture != val) {
            GL.activeTexture(val);
            _active_texture = val;
        }
    } //activeTexture

    public inline function bindTexture( type:TextureType, tex:TextureID ) {
        switch(type) {
            case TextureType.tex_2D:
                bindTexture2D(tex);
            case TextureType.tex_cube:
                bindTextureCube(tex);
        }
    }

    public static var bound_texture_2D : TextureID = null;
    public function bindTexture2D( tex:TextureID ) {
        if(bound_texture_2D != tex) {
            bound_texture_2D = tex;
            GL.bindTexture(GL.TEXTURE_2D, tex); 
        }
    }

    public static var bound_texture_cube : TextureID = null;
    public function bindTextureCube( tex:TextureID ) {
        if(bound_texture_cube != tex) {
            bound_texture_cube = tex;
            GL.bindTexture(GL.TEXTURE_CUBE_MAP, tex);
        }
    }

    var _last_line_width:Float = 1;
    public function lineWidth( _width:Float ) {
        if(_last_line_width != _width) {
            _last_line_width = _width;
            GL.lineWidth( _width );
        }
    }

    var _last_depth_mask:Bool = true;
    public function depthMask( _enable:Bool ) {
        if(_last_depth_mask != _enable) {
            _last_depth_mask = _enable;
            GL.depthMask( _enable );
        }
    }

} //RenderState

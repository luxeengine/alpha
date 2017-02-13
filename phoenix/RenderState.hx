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
    var _view_target_h : Float = 0.0;


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

    public function scissor(x:Float, y:Float, w:Float, h:Float) {

            //the target may have render scaling awareness,
            //so we take the input coordinates into the viewport scaled space
        var _target_scale = renderer.target.viewport_scale;

        x *= _target_scale;
        y *= _target_scale;
        w *= _target_scale;
        h *= _target_scale;

            //the target height is in renderable pixels, so no scaling
        var _target_h = renderer.target.height;
            //In OpenGL the coords are bottom left origin, so we flip the y
        var _y : Float = _target_h - (y + h);

        GL.scissor(Std.int(x), Std.int(_y), Std.int(w), Std.int(h));

    } //scissor

    public function viewport(x:Float, y:Float, w:Float, h:Float) {

            //the target may have render scaling awareness,
            //so we take the input coordinates into the viewport scaled space
        var _target_scale = renderer.target.viewport_scale;

        x *= _target_scale;
        y *= _target_scale;
        w *= _target_scale;
        h *= _target_scale;

            //the target height is in renderable pixels, so no scaling
        var _target_h = renderer.target.height;

            //In OpenGL the viewport is bottom left origin, so we flip the y
            //when submitting our top left based coordinates.
            //We use the target size property of the renderer, which
            //when rendering to the screen matches the window and when
            //rendering to a texture/render target, matches the target.
        var _y : Float = _target_h - (y + h);

        GL.viewport(Std.int(x), Std.int(_y), Std.int(w), Std.int(h));

    } //viewport

    @:noCompletion public var current_framebuffer : GLFramebuffer = null;
    public function bindFramebuffer( ?buffer:GLFramebuffer=null ) {

        if(current_framebuffer != buffer) {

            def(buffer, renderer.default_framebuffer);

            GL.bindFramebuffer( GL.FRAMEBUFFER, buffer );
            current_framebuffer = buffer;
        }

    } //bindFrameBuffer

    var _current_rbo : GLRenderbuffer = null;
    public function bindRenderbuffer( ?buffer:GLRenderbuffer=null ) {

        if(_current_rbo != buffer) {

            def(buffer, renderer.default_renderbuffer);

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

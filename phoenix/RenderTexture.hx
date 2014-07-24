package phoenix;

import snow.render.opengl.GL;
import phoenix.Batcher;
import phoenix.Texture;

import luxe.Resource;
import luxe.ResourceManager;


    //A render texture just extends texture so it can be assigned to meshes etc
class RenderTexture extends Texture {

    public var fbo : GLFramebuffer;

    public function new( _manager:ResourceManager, ?_size:Vector = null ) {

        super( _manager, ResourceType.render_texture );

            //Set it to the buffer
        _size == null ? new Vector( Luxe.screen.w, Luxe.screen.h ) : _size ;
            //Width and height of this texture item
        width = width_actual = Std.int(_size.x);
        height = height_actual = Std.int(_size.y);

            //Create the render texture for the fbo
        texture = GL.createTexture();
            //Bind the texture
        bind();
            //Create the actual texture in memory
        GL.texImage2D( GL.TEXTURE_2D, 0, GL.RGBA, width, height, 0, GL.RGBA, GL.UNSIGNED_BYTE, null );
            //these must be set to be texture complete
        _set_filter(phoenix.FilterType.linear);
        _set_clamp(phoenix.ClampType.edge);

            //Create the FBO
        fbo = GL.createFramebuffer();
            //Bind the FBO
        bindBuffer();
            //Attach the framebuffer texture to the buffer
        GL.framebufferTexture2D( GL.FRAMEBUFFER, GL.COLOR_ATTACHMENT0, GL.TEXTURE_2D, texture, 0 );

        var status = GL.checkFramebufferStatus( GL.FRAMEBUFFER );
        switch (status) {
            case GL.FRAMEBUFFER_COMPLETE:

            case GL.FRAMEBUFFER_INCOMPLETE_ATTACHMENT:
                throw("Incomplete framebuffer: FRAMEBUFFER_INCOMPLETE_ATTACHMENT");

            case GL.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT:
                throw("Incomplete framebuffer: FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT");

            case GL.FRAMEBUFFER_INCOMPLETE_DIMENSIONS:
                throw("Incomplete framebuffer: FRAMEBUFFER_INCOMPLETE_DIMENSIONS");

            case GL.FRAMEBUFFER_UNSUPPORTED:
                throw("Incomplete framebuffer: FRAMEBUFFER_UNSUPPORTED");

            default:
                throw("Incomplete framebuffer: " + status);
        }

            //no lingering
        unbindBuffer();

        loaded = true;

    } //new

    public override function destroy() {

        GL.deleteFramebuffer( fbo );

        super.destroy();

    } //destroy

    public function bindBuffer() {

        Luxe.renderer.state.bindFramebuffer(fbo);

    } //bind

    public function unbindBuffer( ?_other:GLFramebuffer=null ) {

        Luxe.renderer.state.bindFramebuffer( _other );

    } //unbind


} //RenderTexture
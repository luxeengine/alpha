package phoenix;

import snow.modules.opengl.GL;
import phoenix.Batcher;
import phoenix.Texture;

import luxe.Log.*;
import luxe.options.ResourceOptions;
import luxe.resource.Resource;
import luxe.Resources;


    //A render texture just extends texture so it can be assigned to meshes etc
class RenderTexture extends Texture {

    public var fbo : GLFramebuffer;
    public var renderbuffer : GLRenderbuffer;

    public function new( _options:RenderTextureOptions ) {

        _options.resource_type = ResourceType.render_texture;

        super( _options );

        def(_options.width, Std.int(Luxe.screen.w));
        def(_options.height, Std.int(Luxe.screen.h));

            //Width and height of this texture item
        width = width_actual = _options.width;
        height = height_actual = _options.height;

            //super creates the texture id
            //and binds the texture id for us

            //Create the actual texture storage in gpu memory
        if(_options.texture != null) {
            submit(null);
        }
            //these must be set to be texture complete
        apply_props();

            //Create the FBO
        fbo = GL.createFramebuffer();
            //Bind the FBO
        bindBuffer();

            //create the render buffer
        renderbuffer = GL.createRenderbuffer();
            //Bind it so we can attach stuff
        bindRenderBuffer();

            //Create storage for the depth buffer :todo: optionize
        #if (web || mobile || tvos)
        GL.renderbufferStorage(GL.RENDERBUFFER, GL.DEPTH_COMPONENT16, width, height);
        #else
        GL.renderbufferStorage(GL.RENDERBUFFER, GL.DEPTH_COMPONENT, width, height);
        #end
            //Attach the framebuffer texture to the buffer
        GL.framebufferTexture2D( GL.FRAMEBUFFER, GL.COLOR_ATTACHMENT0, GL.TEXTURE_2D, texture, 0 );
            //Attach the depth buffer to the render buffer
        GL.framebufferRenderbuffer( GL.FRAMEBUFFER, GL.DEPTH_ATTACHMENT, GL.RENDERBUFFER, renderbuffer);


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
        unbindRenderBuffer();

            //add to the resource system
        system.add(this);

    } //new

    override function clear() {

        super.clear();

        if(fbo != null) {
            GL.deleteFramebuffer( fbo );
        }

        if(renderbuffer != null) {
            GL.deleteRenderbuffer( renderbuffer );
        }

    } //clear

    @:noCompletion public function bindBuffer() {

        Luxe.renderer.state.bindFramebuffer(fbo);

    } //bind

    @:noCompletion public function unbindBuffer( ?_other:GLFramebuffer=null ) {

        Luxe.renderer.state.bindFramebuffer( _other );

    } //unbind

    @:noCompletion public function bindRenderBuffer() {

        Luxe.renderer.state.bindRenderbuffer( renderbuffer );

    } //bind

    @:noCompletion public function unbindRenderBuffer( ?_other:GLRenderbuffer=null ) {

        Luxe.renderer.state.bindRenderbuffer( _other );

    } //unbind


} //RenderTexture
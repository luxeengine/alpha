package phoenix;

import lime.gl.GLFramebuffer;
import phoenix.Batcher;
import phoenix.ResourceManager;
import phoenix.Texture;

import lime.gl.GL;

	//A render texture just extends texture so it can be assigned to meshes etc
class RenderTexture extends Texture {

	public var fbo : GLFramebuffer;

	public function new( _manager:ResourceManager, ?_size:Vector = null ) {

		super( _manager );

			//Create the render texture for the fbo
		texture = GL.createTexture();
			//Set it to the buffer
		_size == null ? new Vector( Luxe.screen.w, Luxe.screen.h ) : _size ;
			//Width and height of this texture item
		width = Std.int(_size.x);
		height = Std.int(_size.y);

			//Create the actual texture in memory
		GL.texImage2D( GL.TEXTURE_2D, 0, GL.RGBA, width, height, 0, GL.RGBA, GL.UNSIGNED_BYTE, null );

			//Create the FBO
		fbo = GL.createFramebuffer();
			//Bind the FBO
		bindBuffer();
			//Attach the framebuffer texture to the buffer
		GL.framebufferTexture2D( GL.FRAMEBUFFER, GL.COLOR_ATTACHMENT0, GL.TEXTURE_2D, texture, 0 );

			//No lingering
		unbindBuffer();

	} //new

	public override function destroy() {

		GL.deleteFramebuffer( fbo );

		super.destroy();
	} //destroy

	public function bindBuffer() {
		GL.bindFramebuffer( GL.FRAMEBUFFER, fbo );
	} //bind

	public function unbindBuffer( ?_other:GLFramebuffer=null ) {

			//defaults to null, which is the normal framebuffer
		GL.bindFramebuffer( GL.FRAMEBUFFER, _other );
		
	} //unbind


} //RenderTexture
package phoenix;

import lime.gl.GL;
import lime.gl.GLProgram;
import lime.gl.GLTexture;

class RenderState {

    var cull_face : Bool = false;
    var depth_test : Bool = false;
    var renderer : Renderer;
    var _viewport : Rectangle;


    public function new( _renderer:Renderer ) {
        renderer = _renderer;
        _viewport = new Rectangle( 0, 0, Luxe.screen.w, Luxe.screen.h );
    }

    public function enable( what:Dynamic ) {
        switch(what) {
            case GL.CULL_FACE:
                if(!cull_face) {
                    cull_face = true;
                    GL.enable(GL.CULL_FACE);
                } //!cull_face
            case GL.DEPTH_TEST:
                if(Luxe.core.lime.config.depth_buffer) {
                    if(!depth_test) {
                        depth_test = true;
                        GL.enable(GL.DEPTH_TEST);
                    }
                } //!depth_test
        } //switch
    } //enable_if_not

    public function disable( what:Dynamic ) {
        switch(what) {
            case GL.CULL_FACE:
                if(cull_face) {
                    cull_face = false;
                    GL.disable(GL.CULL_FACE);
                } //cull_face
            case GL.DEPTH_TEST:
                if(Luxe.core.lime.config.depth_buffer) {
                    if(depth_test) {
                        depth_test = false;
                        GL.disable(GL.DEPTH_TEST);
                    }
                } //depth_test
        } //switch
    } //disable_if_not

    public function viewport( x:Float, y:Float, w:Float, h:Float ) {

        if( 
            _viewport.x != x || 
            _viewport.y != y || 
            _viewport.w != w || 
            _viewport.h != h
          ) {

                // trace("set viewport " + _viewport);

            _viewport.x = x; _viewport.y = y; _viewport.w = w; _viewport.h = h;
            GL.viewport( Std.int(x), Std.int((Luxe.screen.h - y)-h), Std.int(w), Std.int(h) );

        }  //if it's changed

    } //viewport

    var _used_program : GLProgram = null;
    public function useProgram( program:GLProgram ) {
        if(_used_program != program) {
            _used_program = program;
            GL.useProgram( program );
        }
    } //useProgram

    var _active_texture = null;
    public function activeTexture( val:Dynamic ) {
        if(_active_texture != val) {
            GL.activeTexture(val);
            _active_texture = val;
        }        
    } //activeTexture

    var _bound_texture_2D : GLTexture = null;
    public function bindTexture2D( tex:GLTexture ) {
        if(_bound_texture_2D != tex) {
            _bound_texture_2D = tex;
            GL.bindTexture(GL.TEXTURE_2D, tex);
        }
    }

} //RenderState
package phoenix;

import phoenix.Rectangle;
import phoenix.Texture;
import phoenix.Batcher;
import phoenix.geometry.Geometry;
import phoenix.geometry.GeometryState;

import snow.modules.opengl.GL;

class BatchState {

    public var batcher : Batcher;
    public var geom_state :  GeometryState;
    public var last_geom_state : GeometryState;

    public var last_texture_id : Dynamic;
    public var last_shader_id : Dynamic;
    public var is_clipping : Bool;
    public var clip_rect : Rectangle;
    public var last_clip_rect : Rectangle;
    public var last_blend_src_alpha : Int;
    public var last_blend_src_rgb : Int;
    public var last_blend_dest_alpha : Int;
    public var last_blend_dest_rgb : Int;

    public var log : Bool = false;

    public function new(_r:Batcher){
        batcher = _r;
        geom_state = new GeometryState();
        last_geom_state = new GeometryState();
    }

    public inline function active_shader() : phoenix.Shader {
        if(geom_state.shader != null) {
            return geom_state.shader;
        } else {
            if(geom_state.texture != null) {
                return batcher.renderer.shaders.textured.shader;
            } else {
                return batcher.renderer.shaders.plain.shader;
            }
        }
    }

    public inline function activate(batcher:Batcher) {

            // Handle texture state changes
        if(geom_state.dirty) {

            if(geom_state.texture != null) {

                if(last_texture_id != geom_state.texture.id){

                    last_texture_id = geom_state.texture.id;
                    if(geom_state.texture.texture != null) {
                        geom_state.texture.bind();
                    }

                } //texture id change

            } else {

                Luxe.renderer.state.bindTexture2D(null);
                last_texture_id = null;

            } //geom_state.texture !=null

            var _shader = batcher.shader == null ? geom_state.shader : batcher.shader;

            if(_shader == null) {

                    //fallback onto the default shaders
                if(geom_state.texture != null) {
                    _shader = batcher.renderer.shaders.textured.shader;
                } else {
                    _shader = batcher.renderer.shaders.plain.shader;
                }

            } //_shader

            if(last_shader_id != _shader.program) {
                batcher.apply_default_uniforms(_shader);
                _shader.activate();
                last_shader_id = _shader.program;
            }

            var blend_dirty = last_blend_src_rgb != geom_state.blend_src_rgb;
                blend_dirty = blend_dirty || (last_blend_src_alpha != geom_state.blend_src_alpha); 
                blend_dirty = blend_dirty || (last_blend_dest_rgb != geom_state.blend_dest_rgb); 
                blend_dirty = blend_dirty || (last_blend_dest_alpha != geom_state.blend_dest_alpha); 
            
            if(blend_dirty && !geom_state.ignore_blend) {
                last_blend_src_rgb = geom_state.blend_src_rgb;
                last_blend_src_alpha = geom_state.blend_src_alpha;
                last_blend_dest_rgb = geom_state.blend_dest_rgb;
                last_blend_dest_alpha = geom_state.blend_dest_alpha;
                GL.blendFuncSeparate(
                    last_blend_src_rgb,
                    last_blend_dest_rgb,
                    last_blend_src_alpha,
                    last_blend_dest_alpha
                );
            }

        } //state.dirty

            // excluded from isDirty because rect can change every time without the state being dirty */
            // Handle clipping state changes

            if(geom_state.clip){

                if( !is_clipping ){
                    GL.enable( GL.SCISSOR_TEST );
                    is_clipping = true;
                }

                    // update scissor region if needed.
                if(clip_rect != null) {

                    if(!clip_rect.equal(last_clip_rect)) {

                            // set the scissor rect
                        batcher.renderer.state.scissor(clip_rect.x, clip_rect.y, clip_rect.w, clip_rect.h);

                    } //last clip_rect

                } //clip_rect

            } else { //clip is false

                if( is_clipping ){
                    GL.disable( GL.SCISSOR_TEST );
                    is_clipping = false;
                }

            } //clip is off

            // finally, mark the state as clean.
        geom_state.clean();

    } //activate

    public function deactivate(batcher:Batcher) {

            //undo any textures we bound last
        if(last_texture_id != null) {
            Luxe.renderer.state.bindTexture2D(null);
        }

            //for now we just disable any shader because other
            //batchers are not aware of us yet.
        Luxe.renderer.state.useProgram(null);

            //remove clipping
        if(is_clipping) GL.disable(GL.SCISSOR_TEST);

            //default blend mode
        GL.blendFunc(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA);
        GL.blendEquation(GL.FUNC_ADD);

    } //deactivate

    public function update( geom:Geometry ) : Bool {

        geom_state.clone_onto(last_geom_state);
        geom_state.update(geom.state);

        if(geom_state.clip){
            last_clip_rect = clip_rect;
            clip_rect = geom.clip_rect;
        }

        return geom_state.dirty || (last_clip_rect != clip_rect);

    } //update


//noisy debug stuff
    public function str() {

        if(!log) return;

        trace('\t+ BATCHSTATE LAST ');
            trace("\t\tdepth - "+last_geom_state.depth);
            trace("\t\ttexture - " + (( last_geom_state.texture == null) ? 'null' :  last_geom_state.texture.id ));
            if(last_geom_state.texture != null) {
                trace("\t\t\t " + last_geom_state.texture.texture);
            }
            trace("\t\tshader - " + (( last_geom_state.shader == null) ? 'null' :  last_geom_state.shader.id ));
            trace("\t\tprimitive_type - "+last_geom_state.primitive_type);
            trace("\t\tclip - "+last_geom_state.clip);
        trace('\t- BATCHSTATE LAST');

        trace('\t+ BATCHSTATE STATE');
            trace("\t\tdepth - "+geom_state.depth);
            trace("\t\ttexture - " + (( geom_state.texture == null) ? 'null' :  geom_state.texture.id ));
            if(geom_state.texture != null) {
                trace("\t\t\t " + geom_state.texture.texture);
            }
            trace("\t\tshader - " + (( geom_state.shader == null) ? 'null' :  geom_state.shader.id ));
            trace("\t\tprimitive_type - "+geom_state.primitive_type);
            trace("\t\tclip - "+geom_state.clip);
        trace('\t- BATCHSTATE STATE');
    }

}
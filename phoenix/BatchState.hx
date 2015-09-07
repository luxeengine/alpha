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
    public var last_group : Int = -1;
    public var is_clipping : Bool;
    public var clip_rect : Rectangle;
    public var last_clip_rect : Rectangle;

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


                // Handle group state changes
            if(geom_state.group != last_group) {
                // trace("group state change " + last_group + ' -> ' + geom_state.group  );

                // finalize the previous group.
                var previous = batcher.groups.get(last_group);
                if(previous != null) {
                    // trace('\t--post render for ' + last_group );
                    for(_batch_group in previous) {
                        if(_batch_group.post_render != null) _batch_group.post_render(batcher);
                    } //for batch_group in previous
                } //is there?


                // activate the current group.
                var current = batcher.groups.get(geom_state.group);
                if(current != null) {
                    // trace('\t--pre render for ' + geom_state.group);
                    for(_batch_group in current) {
                        if(_batch_group.pre_render != null) _batch_group.pre_render(batcher);
                    }
                } //is there?

                last_group = geom_state.group;
            }

        } //state.dirty

            // excluded from isDirty because rect can change every time without the state being dirty */
            // Handle clipping state changes

            if(geom_state.clip){

                if( !is_clipping ){
                    GL.enable( GL.SCISSOR_TEST );
                    is_clipping = true;
                }

                    // update scissor test if needed.
                if(clip_rect != null) {

                    if(!clip_rect.equal(last_clip_rect)) {

                            // translate from top-left coords to bottom-left cords
                        var _y = batcher.view.viewport.h - (clip_rect.y + clip_rect.h);
                            // set the scissor rect
                        GL.scissor( Std.int(clip_rect.x) , Std.int(_y), Std.int(clip_rect.w), Std.int(clip_rect.h) );

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
    }

    public function deactivate(batcher:Batcher) {

        if(last_texture_id != null) {
                //undo any textures we bound last
            Luxe.renderer.state.bindTexture2D(null);
        }

            //for now we just disable any shader because other
            //batchers are not aware of us yet.
        Luxe.renderer.state.useProgram(null);

        var previous = batcher.groups.get(last_group);
        if(previous != null) {
            // trace('\t--post render for '+ last_group);
            for(_batch_group in previous) {
                if(_batch_group.post_render != null) _batch_group.post_render(batcher);
            }
        }
        // remove clipping
        if( is_clipping ) GL.disable( GL.SCISSOR_TEST );
    }

    public function update( geom:Geometry ) : Bool {

        geom_state.clone_onto( last_geom_state );
        geom_state.update(geom.state);

        if(geom_state.clip){
            last_clip_rect = clip_rect;
            clip_rect = geom.clip_rect;
        }

        return geom_state.dirty || (last_clip_rect != clip_rect);
    }


//noisy debug stuff
    public function str() {

        if(!log) return;

        trace('\t+ BATCHSTATE LAST ');
            trace("\t\tdepth - "+last_geom_state.depth);
            trace("\t\tgroup - "+last_geom_state.group);
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
            trace("\t\tgroup - "+geom_state.group);
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
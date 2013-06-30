package phoenix;

import phoenix.Texture;
import phoenix.Batcher;
import phoenix.geometry.Geometry;
import phoenix.geometry.GeometryState;

import lime.gl.GL;

class BatchState {

    public var batcher : Batcher;
    public var geom_state :  GeometryState;
    public var last_geom_state : GeometryState;

    public var last_texture_id : Dynamic;
    public var last_shader_id : Dynamic;
    public var last_group : Int;
    public var is_clipping : Bool;
    public var clip_rect : Dynamic;
    public var last_clip_rect : Dynamic;

    public var log : Bool = false;

    public function new(_r:Batcher){
        batcher = _r;
        geom_state = new GeometryState();
        last_geom_state = new GeometryState();
    }

   

    public function activate(batcher:Batcher) {
        
            // Handle texture state changes 
        if(geom_state.dirty) {            

            if(geom_state.texture != null) {

                if(last_texture_id == null) {

                }

                if(last_texture_id != geom_state.texture.id){
                    
                    last_texture_id = geom_state.texture.id;    
                    geom_state.texture.bind();
                    geom_state.texture.activate(batcher.tex0_attribute);
                }

            } else {

                GL.bindTexture(GL.TEXTURE_2D, null);
                last_texture_id = null;

            } //geom_state.texture !=null

            if(geom_state.shader != null) {
            
                if(last_shader_id != geom_state.shader.program) {
                        //activate it and store the reference to it
                    batcher.shader_activate(geom_state.shader);
                    last_shader_id = geom_state.shader.program;
                }

            } else {

                    //fallback onto the default shaders
                if(geom_state.texture != null) {
                        //if there is a texture attached, use the textured shader
                    batcher.shader_activate( batcher.renderer.default_shader_textured );
                    last_shader_id = batcher.renderer.default_shader_textured.program;
                } else {
                    batcher.shader_activate( batcher.renderer.default_shader );
                    last_shader_id = batcher.renderer.default_shader.program;
                }
                
            }

            /*
                // Handle group state changes
            if(state.group != last_group) {
                // finalize the previous group.
                auto previous = r.getGroupState(last_group);
                if(previous) previous->end(r);

                // activate the current group.
                auto current = r.getGroupState(state.group);
                if(current) current->begin(r);

                last_group = state.group;
            }*/

        } //state.dirty

            // excluded from isDirty because rect can change every time without the state being dirty */
            // Handle clipping state changes 

            // if(state.getClip()){
            //     if( !is_clipping ){
            //         glEnable( GL_SCISSOR_TEST );
            //         is_clipping = true;
            //     }

            //     // update scissor test if needed.
            //     if(clip_rect != last_clip_rect){
            //         // translate from top-left coords to bottom-left cords
            //         GLint view[4];
            //         glGetIntegerv( GL_VIEWPORT, &view[0] );
            //         GLuint r_y = view[3] - ((GLuint)clip_rect.getX() + (GLuint)clip_rect.getHeight());

            //         glScissor( (GLuint)clip_rect.getX() , r_y, (GLsizei)clip_rect.getWidth(), (GLsizei)clip_rect.getHeight() );
            //     }
            // }
            // else{
            //     if( is_clipping ){
            //         glDisable( GL_SCISSOR_TEST );
            //         is_clipping = false;
            //     }
            // }

            // finally, mark the state as clean.
        geom_state.clean();
    }

    public function deactivate(batcher:Batcher) {
        
        if(last_texture_id != null) {
                //undo any textures we bound last
            GL.bindTexture(GL.TEXTURE_2D, null);
        }

            //for now we just disable any shader because other 
            //batchers are not aware of us yet.
        GL.useProgram(null);

            //todo
        // finalize the previous group.
        // auto previous = r.getGroupState(last_group);
        // if(previous) previous->end(r);

        // remove clipping
        // if( is_clipping ) glDisable( GL_SCISSOR_TEST );
    }

    public function update( geom:Geometry ) : Bool {

        last_geom_state = geom_state.clone();
        geom_state.update(geom.state);

        // str();

        //todo
        // if(state.clip){
        //     last_clip_rect = clip_rect;
        //     clip_rect = geom.cliprect;
        // }

        return geom_state.dirty;// || last_clip_rect != clip_rect;        
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
package phoenix;

import phoenix.Texture;
import phoenix.Batcher;
import phoenix.geometry.Geometry;
import phoenix.geometry.GeometryState;

import nmegl.gl.GL;

class BatchState {

    public var state :  GeometryState;
    public var last_state : GeometryState;
    public var last_texture_id : Dynamic;
    public var last_group : Int;
    public var is_clipping : Bool;
    public var clip_rect : Dynamic;
    public var last_clip_rect : Dynamic;

    public function new(){
        state = new GeometryState();
    }

    public function activate(renderer:Batcher) {

            // Handle texture state changes 
            trace('\t\t\tstate is dirty? ' + state.dirty);
        if(state.dirty){

            if(state.texture != null) {

                if(!last_texture_id) {
                    GL.enable(GL.TEXTURE_2D);
                }

                trace('checking state of texture ; ');
                trace('was ' + last_texture_id + ' ' + state.texture.id);
                if(last_texture_id != state.texture.id){

                    last_texture_id = state.texture.id;
                    state.texture.bind();
                }

            } else {
                GL.disable(GL.TEXTURE_2D);
                last_texture_id = 0;
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
        state.clean();
    }

    public function deactivate(renderer:Batcher) {
        
        if(last_texture_id) {
            GL.disable(GL.TEXTURE_2D);
        }

        // finalize the previous group.
        // auto previous = r.getGroupState(last_group);
        // if(previous) previous->end(r);

        // remove clipping
        // if( is_clipping ) glDisable( GL_SCISSOR_TEST );
    }

    public function update( geom:Geometry ) : Bool {

        last_state = state;
        state.update(geom.state);

        // if(state.clip){
        //     last_clip_rect = clip_rect;
        //     clip_rect = geom.cliprect;
        // }

        return state.dirty;// || last_clip_rect != clip_rect;        
    }

}
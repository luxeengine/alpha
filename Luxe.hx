package ;


import phoenix.geometry.Geometry;
import phoenix.Texture;
import phoenix.Shader;

import luxe.Rectangle;

class Luxe {

    public static var dt : Float = 0.016;
    public static var core : luxe.Core;
    public static var debug : luxe.Debug;
    public static var draw : luxe.Draw;
    public static var audio : luxe.Audio;
    public static var time : luxe.Time;
    public static var events : luxe.Events;
    public static var input : luxe.Input;
    public static var scene : luxe.Scene;
    public static var physics : luxe.Physics;
    public static var utils : luxe.utils.Utils;

    public static var camera : luxe.Camera;
    public static var renderer : phoenix.Renderer;
    public static var resources : phoenix.ResourceManager;    

    @:isVar public static var screen(get, never) : Rectangle;
    public static function get_screen() { return core.screen; }

    public static function shutdown() {
        core.lime.shutdown();
    }

            //todo , move into screen.cursor, Lab.screen.cursor.visible etc.
        public static function showCursor(_show:Bool) {
            core.lime.window.set_cursor_visible( _show );
        }
        public static function lockCursor(_lock:Bool) {
            core.lime.window.constrain_cursor_to_window_frame( _lock );
        }
        public static function cursorShown() {
            return core.lime.window.cursor_visible;
        }
        public static function cursorLocked() {
            return core.lime.window.cursor_locked;
        }
        public static function setCursorPosition(_x:Int,_y:Int) {
            core.lime.window.set_cursor_position_in_window( _x,_y );
        }

    public static function loadText(_id:String) {
        return lime.utils.Assets.getText(_id);
    }

    public static function loadTexture(_id:String, ?_onloaded:Texture->Void ) : Texture {
        return renderer.load_texture(_id, _onloaded);
    }

    public static function loadShader( ?_ps_id:String='default', ?_vs_id:String='default', ?_onloaded:Shader->Void ) : Shader {
        return renderer.load_shader(_ps_id, _vs_id, _onloaded);
    }

    public static function addGeometry(_geom:Geometry) {
        renderer.default_batcher.add(_geom);
    } 
    
    public static function removeGeometry(_geom:Geometry) {
        renderer.default_batcher.remove(_geom);
    } 

}


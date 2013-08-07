package ;

import lab.Rectangle;
import phoenix.geometry.Geometry;
import phoenix.Texture;


class Lab {
    public static var dt : Float = 0.016;
    public static var core : lab.Core;
    public static var debug : lab.Debug;
    public static var draw : lab.Draw;
    public static var audio : lab.Audio;
    public static var time : lab.Time;
    public static var events : lab.Events;
    public static var input : lab.Input;
    public static var scene : lab.Scene;
    public static var utils : lab.utils.Utils;

    public static var camera : lab.Camera;
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

    public static function addGeometry(_geom:Geometry) {
        renderer.default_batcher.add(_geom);
    } 
    
    public static function removeGeometry(_geom:Geometry) {
        renderer.default_batcher.remove(_geom);
    } 



}


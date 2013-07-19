package ;

import lab.Rectangle;
import phoenix.geometry.Geometry;
import phoenix.Texture;


class Lab {
    public static var dt : Float = 0.016;
    public static var core : lab.Core;
    public static var audio : lab.Audio;
    public static var time : lab.Time;
    public static var events : lab.Events;
    public static var input : lab.Input;
    public static var scene : lab.Scene;
    public static var utils : lab.utils.Utils;

    public static var camera : phoenix.Camera;
    public static var renderer : phoenix.Renderer;
    public static var resources : phoenix.ResourceManager;    

    @:isVar public static var screen(get, never) : Rectangle;
    public static function get_screen() { return core.screen; }

    public static function shutdown() {
        core.lime.shutdown();
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


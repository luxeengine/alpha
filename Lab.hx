package ;

import lab.Rectangle;
import phoenix.geometry.Geometry;
import phoenix.Texture;


class Lab {
    public static var core : lab.Core;
    public static var renderer : phoenix.Renderer;
    public static var camera : phoenix.Camera;
    public static var resources : phoenix.ResourceManager;
    public static var utils : lab.utils.Utils;
    public static var audio : lab.Audio;

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


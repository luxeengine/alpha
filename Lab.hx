package ;

import phoenix.geometry.Geometry;
import phoenix.Texture;


class Lab {
    public static var core : lab.Core;
    public static var renderer : phoenix.Renderer;
    public static var camera : phoenix.Camera;
    public static var resources : phoenix.ResourceManager;
    public static var utils : lab.utils.Utils;

    public static function shutdown() {
        core.lime.shutdown();
    }

    public static function loadText(_id:String) {
        return lime.utils.Assets.getText(_id);
    }

    public static function loadTexture(_id:String, ?_onloaded:Texture->Void ) : Texture {
        return renderer.load_texture(_id, _onloaded);
    }

    public static function addGeometry(geom:Geometry) {
        renderer.default_batcher.add(geom);
    } 
    
    public static function removeGeometry(geom:Geometry) {
        renderer.default_batcher.remove(geom);
    } 



}


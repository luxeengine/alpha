
package game;

import luxe.Modes;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Texture;

class Level extends Mode {

    public var bg : Sprite;

    public function init() {

        bg = new Sprite({
            texture : Luxe.loadTexture('assets/levels/01.exposure.png'),
            centered : false,
            size : new Vector(Luxe.screen.w, Luxe.screen.h),
            visible : false,
            depth : 1
        });

        bg.texture.filter = FilterType.nearest;

    } //init

    public function oninputup(_name:String, _event:Dynamic) {
        switch(_name) {
            case 'quit':
                modes.set('mainmenu');
        }
    }

    public function enable() {
        bg.visible = true;
    } //enter

    public function disable() {
        bg.visible = false;
    } //leave

} //Level
    
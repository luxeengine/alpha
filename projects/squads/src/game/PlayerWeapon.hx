
package game;

import luxe.Vector;
import luxe.Sprite;

import luxe.components.Components.Component;

class PlayerWeapon extends Component {

        //offset rotation in degrees
    public var image : Sprite;

    public function init() {

        image = new Sprite({
            texture : Luxe.loadTexture('assets/game/weapons/GL.png'),
            origin : new Vector(30,35)
        });

        entity.add_child(image);

        entity.events.listen('player.flip', onflip);

    }

    function onflip(_event:Dynamic) {

        image.flipx = _event.flipx;

    }

    public function update() {

    }

} //PlayerAim
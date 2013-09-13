
package game;

import luxe.Vector;
import luxe.Sprite;

import luxe.components.Components.Component;

class PlayerAim extends Component {

        //offset rotation in degrees
    public var offset : Float = 0;
    public var direction : Vector;
    public var reticule : Sprite;
    public var rot : Float = 0;

    public function init() {
        direction = new Vector();
        reticule = new Sprite({
            texture : Luxe.loadTexture('assets/game/reticule.png'),
            origin : new Vector(0,50)
        });

        entity.add_child(reticule);
    }

    public function update() {
        
        direction.set( pos.x - Luxe.mouse.x, pos.y - Luxe.mouse.y ).normalize();

        rot = pos.rotationTo( Luxe.mouse );

        reticule.rotation_z = rot;

    }

} //PlayerAim
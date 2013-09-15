
package game;

import game.PlayerWeapon;
import luxe.Vector;
import luxe.Sprite;

import luxe.components.Components.Component;

class PlayerAim extends Component {

        //offset rotation in degrees
    public var offset : Float = 0;
    public var direction : Vector;
    public var reticule : Sprite;
    public var rot : Float = 0;

    var sprite : Sprite;
    var weapon : PlayerWeapon;

    public function init() {
        direction = new Vector();
        reticule = new Sprite({
            texture : Luxe.loadTexture('assets/game/reticule.png'),
                //custom origin (if centered is desirable, it must be factored in here. so 50 radius + -8 both ways)
            origin : new Vector(8,58),
            depth : 5
        });

        entity.add_child(reticule);

        sprite = cast entity;
        weapon = get('weapon');
    }

    public function update() {
        
        direction.set( Luxe.mouse.x - pos.x, Luxe.mouse.y - pos.y ).normalize();

        rot = pos.rotationTo( Luxe.mouse );

            //clamp to 8 directions?
        // rot = Std.int(rot/45) * 45;

        reticule.rotation_z = rot;        

        if(-rot >= 180) {

            if(sprite.flipx) {
                sprite.flipx = false;
                entity.events.fire('player.flip', {flipx:false});                
            }

            weapon.image.rotation_z = rot - 90;
        } else {
            if(!sprite.flipx) {
                sprite.flipx = true;
                entity.events.fire('player.flip', {flipx:true});
            }

            weapon.image.rotation_z = rot + 90;
        }

    }

} //PlayerAim

package game;

import game.PlayerAnimator;
import game.PlayerTeam;
import game.PlayerWeapon;
import luxe.components.sprite.SpriteAnimation;
import luxe.Quaternion;
import luxe.Vector;
import luxe.Sprite;

import luxe.components.Components.Component;

class PlayerAim extends Component {

        //offset rotation in degrees
    public var facing : Int = 0;
    public var direction : Vector;
    public var reticule : Sprite;
    public var rot : Float = 0;

    var sprite : Sprite;
    var animator : PlayerAnimator;
    var weapon : PlayerWeapon;
    var team : PlayerTeam;

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
        animator = get('animator');
        team = get('team');
    }

    var spriteflipx : Bool = false;
    var last_frame : Int = 1;
    var last_r : Float = 0;
    var behind : Bool = false;

    public function update() {
        
        // direction.set( Luxe.mouse.x - pos.x, Luxe.mouse.y - pos.y ).normalize();

        rot = pos.rotationTo( Luxe.mouse );
        rot = Std.int(rot/45) * 45;

        switch (rot) {
            case 0:
                direction.set(0,-1);
            case -45:
                direction.set(-1,-1);
            case -90:
                direction.set(-1,0);
            case -135:
                direction.set(-1,1);
            case -180:
                direction.set(0,1);
            case -225:
                direction.set(1,1);
            case -270:
                direction.set(1,0);
            case -315:
                direction.set(1,-1);
        }

        direction.normalize();

            //direction is set by the input component
        // rot = pos.rotationTo( Vector.Add(pos, direction.normalized ) );

            //clamp to 8 directions?
        var wrot = Std.int(rot/45) * 45;
        var _frame = Std.int((-rot-22.5)/45);

        var _f = 8 - (_frame);

        facing = _f;

        if(last_frame != _f) {
            animator.facing(_f);
            last_frame = _f;
        }

        if(last_r != rot) {
            last_r = rot;
            reticule.rotation_z = rot;
        } //

        // trace(-rot);

        if(-rot >= 180) {

            if(spriteflipx) {
                spriteflipx = false;
                entity.events.fire('player.flip', {flipx:false});                
            }

            weapon.image.rotation_z = rot - 90;

             if(-rot >= 292.5 || -rot <= 67.5) {
                if(!behind){
                    weapon.image.depth = 4;
                    team.flag.depth = 6;
                    behind = true;
                }
            } else {
                if(behind) {
                    weapon.image.depth = 6;
                    team.flag.depth = 4;
                    behind = false;
                }
            } //-rot
            

        } else {
            if(!spriteflipx) {
                spriteflipx = true;
                entity.events.fire('player.flip', {flipx:true});
            }

            weapon.image.rotation_z = rot + 90;

            if(-rot >= 292.5 || -rot <= 67.5) {
                if(!behind){
                    weapon.image.depth = 4;
                    team.flag.depth = 6;
                    behind = true;
                }
            } else {
                if(behind) {
                    weapon.image.depth = 6;
                    team.flag.depth = 4;
                    behind = false;
                }
            } //-rot

        }

    }

} //PlayerAim
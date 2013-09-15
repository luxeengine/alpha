
package game;

import game.PlayerAim;
import game.PlayerMovement;
import luxe.components.sprite.SpriteAnimation;
import luxe.Vector;
import luxe.Sprite;
import luxe.Rectangle;

import luxe.components.Components.Component;

class PlayerAnimator extends Component {

    var aim : PlayerAim;
    var anim : SpriteAnimation;
    var moving : Bool = false;
    var idle : Bool = false;

    public function init() {

        idle = true;

        aim = get('aim');
        anim = get('anim');       

        entity.events.listen('player.onmoving', onmoving); 
        entity.events.listen('player.onstopping', onstopping);

    } //init

    public function facing(_which:Int) {        
        anim.animation = (moving ? 'run'  : 'idle') + _which;
        anim.restart();
    }

    function onmoving(e) {
        moving = true;
            //fetch the facing direction
        var which = aim.facing;
            //the name becomes run1 or run8 etc
        anim.animation = 'run' + which;
        anim.restart();
    }

    function onstopping(e) {
        anim.animation = 'idle' + aim.facing;
        anim.restart();

        moving = false;
    }

    
} //PlayerAim
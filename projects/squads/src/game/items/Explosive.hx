package game.items;


import game.Bullet;
import luxe.Vector;
import luxe.Sprite;
import luxe.Rectangle;

import luxe.components.Components.Component;

class Explosive extends Component {

    public var desc : Dynamic;

    public function init() {

        entity.events.listen('impact.bullet', on_impact_from_bullet);
    }

    function on_impact_from_bullet(_data:Dynamic) {
        var bulletcomp : Bullet = cast _data.bullet;
        var impactpos : Vector = cast _data.pos;

        var sprite:Sprite = cast entity;
            sprite.visible = false;

    }

} //Explosives
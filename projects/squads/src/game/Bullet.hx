
package game;

import luxe.Vector;
import luxe.Sprite;
import luxe.Rectangle;

import luxe.components.Components.Component;

class Bullet extends Component {

    public var alive : Bool = false;
    public var dir : Vector;
    public var speed : Float = 1;

    var bounds : Rectangle;

    public function init() {
        bounds = new Rectangle(0,0,Luxe.screen.w, Luxe.screen.h);
        dir = new Vector();
    }

    public function fixed_update() {
        
        if(alive) {
            var newx = pos.x + (dir.x * speed);
            var newy = pos.y + (dir.y * speed);

            pos = new Vector(newx, newy);
            
            if(!bounds.point_inside(pos)) {
                alive = false;
                entity.fixed_rate = 0;
                var s:Sprite = cast entity;
                s.visible = false;
            } //if
        } //alive
        
    }

} //PlayerAim
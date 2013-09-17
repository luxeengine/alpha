
package game;

import hxcollision.Collision;
import hxcollision.CollisionData;
import hxcollision.shapes.Circle;
import hxcollision.math.Vector2D;
import luxe.Vector;
import luxe.Sprite;
import luxe.Rectangle;

import luxe.components.Components.Component;

class Bullet extends Component {

    public var alive : Bool = false;
    public var dir : Vector;
    public var speed : Float = 1;

    public var collider : Circle;

    var bounds : Rectangle;

    public function init() {
        bounds = new Rectangle(0,0,Luxe.screen.w, Luxe.screen.h);
        dir = new Vector();
        collider = new Circle(4, new Vector2D(pos.x,pos.y) );
    }

    public function kill( _pos:Vector ) {
        alive = false;
        entity.fixed_rate = 0;
        var s:Sprite = cast entity;
        s.visible = false;
    }

    public function fixed_update() {
        
        if(alive) {
            var newx = pos.x + (dir.x * speed);
            var newy = pos.y + (dir.y * speed);

                //check collision
            collider.x = newx; 
            collider.y = newy;

            if(Game.manager.level_running) {
            
                var results : Array<CollisionData> = Collision.testShapeList(collider, Game.level.air_collision_shapes );
                if(results.length > 0) {
                    kill(pos);
                    return;
                }

            }

            pos = new Vector(newx, newy);
            
            if(!bounds.point_inside(pos)) {
               kill(pos);
               return;
            } //if

        } //alive
        
    }

} //PlayerAim
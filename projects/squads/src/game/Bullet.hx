
package game;

import hxcollision.Collision;
import hxcollision.CollisionData;
import hxcollision.shapes.BaseShape;
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
    public var spawn_pos : Vector;

    var ignored_colliders : Array<BaseShape>;

    public var collider : Circle;

    var bounds : Rectangle;

    public function init() {
        ignored_colliders = [];
        bounds = new Rectangle(0,0,Luxe.screen.w, Luxe.screen.h);
        dir = new Vector();
        collider = new Circle(4, new Vector2D(pos.x,pos.y) );
        collider.name = 'bullet collider';
    }

    public function kill( _pos:Vector ) {
        alive = false;
        entity.fixed_rate = 0;
        var s:Sprite = cast entity;
        s.visible = false;
    }

    public function onspawn( _pos:Vector ) {
        //when spawning, we need to check if we are spawning inside of a collision shape
        //if so, we need to ignore that collision shape until we exit it.
        ignored_colliders = [];
        collider.x = _pos.x;
        collider.y = _pos.y;
        var results : Array<CollisionData> = Collision.testShapeList(collider, Game.level.air_collision_shapes );
        for(collision in results) {
            ignored_colliders.push(collision.shape1);
        }

    } //onspawn

    public function fixed_update() {
        
        if(alive) {
            var newx = pos.x + (dir.x * speed);
            var newy = pos.y + (dir.y * speed);

                //check collision
            collider.x = newx; 
            collider.y = newy;

                //check if we have exited the ignored colliders first
            if(ignored_colliders.length > 0) {                
                for(shape in ignored_colliders) {
                    var result = Collision.testShapes(collider, shape);                    
                    if(result == null) {
                        ignored_colliders.remove(shape);
                    } 
                }
            } //

            if(Game.manager.level_running) {
            
                var results : Array<CollisionData> = Collision.testShapeList(collider, Game.level.air_collision_shapes );
                if(results.length > 0) {
                    
                    var must_kill = true;

                    for(r in results) {
                        if( Lambda.indexOf(ignored_colliders,r.shape1) != -1 ) {
                            must_kill = false;
                        }
                    }

                    if(must_kill) {
                        kill(pos);
                        return;
                    }

                } //results.length

            } //hmm

            pos = new Vector(newx, newy);
            
            if(!bounds.point_inside(pos)) {
               kill(pos);
               return;
            } //if

        } //alive
        
    }

} //PlayerAim
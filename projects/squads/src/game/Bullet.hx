
package game;

import luxe.collision.Collision;
import luxe.collision.CollisionData;
import luxe.collision.shapes.Shape;
import luxe.collision.shapes.Circle;

import luxe.Sprite;
import luxe.Entity;

import luxe.Vector;
import luxe.Rectangle;
import luxe.components.Components.Component;

class Bullet extends Component {

    public var alive : Bool = false;
    public var dir : Vector;
    
    public var spawn_pos : Vector;

    public var speed : Float = 1;
    public var collider : Circle;
    
    var ignored_colliders : Array<Shape>;
    var bounds : Rectangle;

    public function init() {
        ignored_colliders = [];
        bounds = new Rectangle(0,0,Luxe.screen.w, Luxe.screen.h);
        dir = new Vector();
        collider = new Circle(pos.x, pos.y, 4);
        collider.name = 'bullet collider';
    }

    public function kill( _pos:Vector, _shape:Shape ) {
        
        alive = false;
        entity.fixed_rate = 0;
        
        var s:Sprite = cast entity;
            s.visible = false;

        if(_shape != null) {
                //deal with whatever we hit
            var e:Entity = cast _shape.data;
            if(e != null) {
                e.events.fire('impact.bullet', { pos:_pos, bullet:this });
            }
        }

    }

    public function onspawn( _pos:Vector ) {
        //when spawning, we need to check if we are spawning inside of a collision shape
        //if so, we need to ignore that collision shape until we exit it.
        ignored_colliders = [];
        collider.x = _pos.x;
        collider.y = _pos.y;
        var results : Array<CollisionData> = Collision.testShapes(collider, Game.level.air_collision_shapes );
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
                    var result = Collision.test(collider, shape);                    
                    if(result == null) {
                        ignored_colliders.remove(shape);
                    } 
                }
            } //

            if(Game.manager.level_running) {
            
                var results : Array<CollisionData> = Collision.testShapes(collider, Game.level.air_collision_shapes );
                if(results.length > 0) {
                    
                    var must_kill = true;
                    var kitem : Shape = null;

                    for(r in results) {
                        if( Lambda.indexOf(ignored_colliders,r.shape1) != -1 ) {
                            must_kill = false;
                        }
                    }

                    if(must_kill) {

                        kill(pos, results[0].shape1 );
                        return;
                    }

                } //results.length

            } //hmm

            pos = new Vector(newx, newy);
            
            if(!bounds.point_inside(pos)) {
               kill(pos, null);
               return;
            } //if

        } //alive
        
    }

} //PlayerAim
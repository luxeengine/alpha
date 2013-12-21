
package game;

import game.PlayerWeapon;

import hxcollision.Collision;
import hxcollision.CollisionData;
import hxcollision.shapes.Polygon;

import luxe.Vector;
import luxe.Sprite;
import luxe.Color;

import luxe.components.Components.Component;

class PlayerMovement extends Component {
    
    public var velocity : Vector;

    public var moving : Bool = false;

    public var linear_drag : Float = 0.75;
    public var speed : Float = 90;
    public var collider : Polygon;

        //a value used to predict movement, so it can be 
        //cancelled or applied at the end of the physics update
    var next_pos : Vector;
    var skip_physics : Bool = false;

    public function init() {

        velocity = new Vector();
        next_pos = new Vector();

        entity.fixed_rate = 0.02;

        collider = Polygon.create(pos.x,pos.y, 12, 20);

    } //new

    public function update(dt:Float) {

        // Game.level.drawer.drawPolygon(collider);
        // Luxe.draw.box({
        //     x:pos.x-1,
        //     y:pos.y-1,
        //     w:2, 
        //     h:2,
        //     color: new Color(1,0,0,1),
        //     immediate : true
        // });

        // Luxe.draw.ring({
        //     x:pos.x,
        //     y:pos.y,
        //     r:weapon.spawn_offset,
        //     color: new Color(1,0,0,1),
        //     immediate: true
        // });
    }

    // public function getQuadraticCurveControl( start:Vector, end:Vector, passThrough:Vector ) {
    //     //with t = 0.5, const = 2
    //     var _const = 2;
    //     var _x = (_const*passThrough.x) - (start.x/_const) - (end.x/_const);
    //     var _y = (_const*passThrough.y) - (start.y/_const) - (end.y/_const);
    //     return new Vector(_x,_y);
    // }

    // public function getCurvePoints(start:Vector, end:Vector, control:Vector) {
    // var CalculateBezierPoint = function( t, p0, p1, p2, p3 ) {

    //   var u = 1 - t;
    //   var tt = t*t;
    //   var uu = u*u;
    //   var uuu = uu * u;
    //   var ttt = tt * t;
     
    //   var p = p0.mul(uuu); //first term
    //   p = p.add( p1.mul(3 * uu * t) ); //second term
    //   p = p.add( p2.mul(3 * u * tt) ); //third term
    //   p = p.add( p3.mul(ttt) ); //fourth term
     
    //   return p;
    // }

    public function fixed_update(dt:Float) {

            //50hz
        var _step:Float = 0.02;

//make sure we are at latest values
        skip_physics = false;
        next_pos.set(pos.x, pos.y);

//apply linear drag
        // velocity.x *= linear_drag;
        // velocity.y *= linear_drag;

//then apply velocity to position
        if(velocity.x != 0) {
            next_pos.x += velocity.x * _step;
        }
        if(velocity.y != 0) {
            next_pos.y += velocity.y * _step;
        }
//then we can perform collision and bounds checking
            //first move the collider into the new position
        collider.x = next_pos.x; collider.y = next_pos.y + 16;

        //only test if we are in the level
        if(Game.manager.level_running) {

            var results : Array<CollisionData> = Collision.testShapeList(collider, Game.level.ground_collision_shapes );
            for(_result in results) {
                var dir = (_result.overlap > 0) ? 1 : -1;
                next_pos.x += _result.separation.x * dir;
                next_pos.y += _result.separation.y * dir;
            }
            
            collider.x = next_pos.x; collider.y = next_pos.y + 16;

        }

//and finally, if there was an actual change 
        if(!skip_physics) {
            pos = next_pos;
        }
//cancel velocity this frame
        velocity.x = 0;
        velocity.y = 0;
        
    } //do_physics

} //Player
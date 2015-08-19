import luxe.Physics.PhysicsEngine;
import luxe.collision.Collision;
import luxe.collision.shapes.Shape;
import luxe.collision.shapes.Polygon;
import luxe.Vector;
import luxe.utils.Maths;

class CollisionEngine extends PhysicsEngine {
    public var player:Shape;
    public var playerVel:Vector;
    public var jumpAllowed:Bool = false;
    public var levelObstacles:Array<Shape>;
    public var levelTriggers:Array<Shape>;

    public function new() {
        super();
        levelObstacles = [];
        levelTriggers = [];
        playerVel = new Vector();
    }

    override public function init() {
        gravity.set_xyz(0, 800, 0);
    }

    override public function update() {
        if(player == null || levelObstacles == null) return;
        playerVel.add(Vector.Multiply(gravity, Luxe.physics.step_delta));
        player.position = player.position.add(Vector.Multiply(playerVel, Luxe.physics.step_delta));

        jumpAllowed = false;
        var collisions = Collision.shapeWithShapes(player, levelObstacles);
        for(collision in collisions) {
            player.position = player.position.add(collision.separation);
            if(collision.unitVector.x != 0) {
                playerVel.x = 0;
            }
            if(collision.unitVector.y != 0 && Maths.sign(collision.unitVector.y) != Maths.sign(playerVel.y)) {
                playerVel.y = 0;
                if(collision.unitVector.y < 0) {
                    jumpAllowed = true;
                }
            }
        }

        collisions = Collision.shapeWithShapes(player, levelTriggers);
        Luxe.events.fire('CollisionEngine.touchedTriggers', collisions);
    }

    override public function render() {

        if(!draw) return;

        var poly:Polygon;
        for(shape in levelObstacles) {
            poly = cast shape;
            var geom = Luxe.draw.poly({
                solid:false,
                close:true,
                depth:100,
                points:poly.vertices,
                immediate:true
            });

            geom.transform.pos.copy_from(poly.position);
        }
        
    }
}
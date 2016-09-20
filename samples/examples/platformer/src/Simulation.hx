import luxe.collision.Collision;
import luxe.collision.shapes.Shape;
import luxe.collision.shapes.Polygon;
import luxe.Vector;
import luxe.utils.Maths;


// The Simulation class handles two things:
//
//  - physics (simulation of gravity and forces)
//  - collision (separating colliding shapes from each other)
//
//   It is helpful to understand that these two concepts are distinct.
//   Often however, since the "response" from a collision overlap
//   will be fed directly back into the physics as a force,
//   it is easy to see them as one concept. Be aware of the difference :)

// - Collision = separating things that overlap)
// - Collision response = forces applied due to collision ("physics")

class Simulation extends luxe.Physics.PhysicsEngine {

    public var player_collider: Shape;
    public var player_velocity: Vector;
    public var player_can_jump: Bool = false;

    public var obstacle_colliders: Array<Shape>;
    public var trigger_colliders: Array<Shape>;

        //This is called when you call new Simulation
    public function new() {

        super();

        //The paused flag comes from luxe.Physics.PhysicsEngine
        //We want to start paused and let the game set unpaused
        paused = true;

        //collision related

        obstacle_colliders = [];
        trigger_colliders = [];

        //physics related values

        player_velocity = new Vector();

    } //new

        //Called for you when the init event from luxe happens
        //This happens once up front at initialization
    override public function init() {

            //The gravity value comes from luxe.Physics.PhysicsEngine
            //and is just a Vector we can use to apply gravity as a force
        gravity.set_xyz(0, 800, 0);

    } //init

    override public function update() {

            //don't do anything unless we are running
        if(paused) return;

            //We start by appling the forces
        handle_physics();
            //Then we make sure the colliders/shapes are moved
        update_colliders();
            //Then we resolve collisions that may have happened
        handle_collision();

    } //update

    function handle_physics() {

            // The player is affected by gravity as a force,
            // we scale it against the size of the physics time step
        player_velocity.x += gravity.x * Luxe.physics.step_delta;
        player_velocity.y += gravity.y * Luxe.physics.step_delta;

    } //handle_physics

    function update_colliders() {

            // We add the velocity to the player position,
            // scaled by the size of the physics time step
        player_collider.position.x += player_velocity.x * Luxe.physics.step_delta;
        player_collider.position.y += player_velocity.y * Luxe.physics.step_delta;

    } //update_colliders

    function handle_collision() {

        player_can_jump = false;

        var collisions = Collision.shapeWithShapes(player_collider, obstacle_colliders);

        for(collision in collisions) {

            player_collider.position = player_collider.position.add(new Vector(collision.separationX, collision.separationY));

            if(collision.unitVectorX != 0) {
                player_velocity.x = 0;
            }

            if(collision.unitVectorY != 0 && Maths.sign(collision.unitVectorY) != Maths.sign(player_velocity.y)) {
                player_velocity.y = 0;
                if(collision.unitVectorY < 0) {
                    player_can_jump = true;
                }
            }

        }

        collisions = Collision.shapeWithShapes(player_collider, trigger_colliders);
        Luxe.events.fire('simulation.triggers.collide', collisions);

    } //handle_collision


        //This gets called by the engine for us to draw things if we need to,
        //It gets called every frame and is helpful for debug drawing
    override public function render() {

        if(!draw) return;

        for(shape in obstacle_colliders)  draw_collider_polygon(cast shape);
        for(shape in trigger_colliders)   draw_collider_polygon(cast shape);

        draw_collider_polygon(cast player_collider);

    } //render

        //helper to draw colliders
    function draw_collider_polygon(poly:Polygon) {

        var geom = Luxe.draw.poly({
            solid:false,
            close:true,
            depth:100,
            points:poly.vertices,
            immediate:true
        });

        geom.transform.pos.copy_from(poly.position);

    } //draw_collider_polygon

} //Simulation

package luxe.physics.nape;

#if nape

    import luxe.Vector;
    import nape.space.Space;
    import nape.util.Debug;
    import nape.geom.Vec2;
    import luxe.physics.nape.DebugDraw;

    class PhysicsNape extends luxe.Physics.PhysicsEngine {

        public var space : Space;
        public var debugdraw : DebugDraw;

        public var rate : Float = 0.0167;
        public var velocity_iterations : Int = 18;
        public var position_iterations : Int = 18;

        public override function init() {

            space = new Space();

            debugdraw = new DebugDraw();

            gravity = new Vector(0, 980);

        } //init

        public override function process() {

            space.step( rate, velocity_iterations, position_iterations );

            if(draw) {
                debugdraw.clear();
                debugdraw.draw( space );
            }

        } //process

        public override function destroy() {
            
            debugdraw.destroy();
            space.clear();
            space = null;

        } //destroy


            //unit's are pixels/second/second
        override function set_gravity( _gravity:Vector ) {

            if(space != null) {
                space.gravity = Vec2.weak(_gravity.x, _gravity.y);
            }

            return super.set_gravity(_gravity);

        } //set_gravity

    } //PhysicsNape

#end //nape
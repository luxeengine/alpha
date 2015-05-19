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

        public var velocity_iterations : Int = 18;
        public var position_iterations : Int = 18;

        public override function init() {

            space = new Space();

            gravity = new Vector(0, 980);

        } //init

            //update the actual physics
        public override function update() {

            if(!paused) {

                space.step( Luxe.physics.step_delta * Luxe.timescale, velocity_iterations, position_iterations );

                if (draw && debugdraw != null) {
                    debugdraw.update();
                }

            } //paused

        } //update

        public override function destroy() {

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

        override function set_draw(_draw:Bool):Bool {

            if (debugdraw != null) {
                debugdraw.visible = _draw;
            }

            return draw = _draw;

        } //set_draw

    } //PhysicsNape

#end //nape
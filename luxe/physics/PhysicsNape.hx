package luxe.physics;

#if nape

import nape.space.Space;
import nape.util.Debug;
import nape.geom.Vec2;

class PhysicsNape extends luxe.Physics.PhysicsEngine {

    public var space : Space;
    public var debug : Debug;

    public var rate : Float = 0.0167;
    public var velocity_iterations : Int = 18;
    public var position_iterations : Int = 18;

    public override function init() {

            //unit's are pixels/second/second
        var gravity = Vec2.weak(0, 980);
        
        space = new Space(gravity);

    }

    public override function process() {

        space.step( rate, velocity_iterations, position_iterations );

    }

    public override function destroy() {
        
        space.clear();
        space = null;

    }

}

#end //nape
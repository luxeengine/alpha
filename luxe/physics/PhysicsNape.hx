package luxe.physics;

#if nape

import nape.space.Space;
import nape.util.Debug;
import nape.geom.Vec2;

class PhysicsNape extends luxe.Physics.PhysicsEngine {

    public var space : Space;
    public var debug : Debug;
    public var rate : Float = 0.0167;

    public override function init() {

        var gravity = Vec2.weak(0, 600);
        
        space = new Space(gravity);

    }

    public override function process() {

        space.step( rate );

    }

    public override function destroy() {
        
        space.clear();
        space = null;

    }

}

#end //nape
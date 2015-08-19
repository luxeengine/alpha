package luxe.components.physics.nape;

import nape.phys.BodyType;
import nape.phys.Body;

import luxe.components.physics.nape.NapeBody;
import nape.shape.Circle;

typedef CircleColliderOptions = {

    > NapeBodyOptions,

        /** the x position of the circle */
    var x : Float;
        /** the y position of the circle */
    var y : Float;        
        /** the radius of the circle */
    var r : Float;

} //CircleColliderOptions

class CircleCollider extends NapeBody {

    var options : CircleColliderOptions;

    public function new(_options : CircleColliderOptions) : Void {

        options = _options;

        super(options);

    } //new

    override function onadded() {

        super.onadded();

            body.shapes.add(new Circle(options.r, options.material, options.filter));
            body.position.setxy(options.x, options.y);
        
        post_add();

    } //onadded

} //CircleCollider

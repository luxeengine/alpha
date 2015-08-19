package luxe.components.physics.nape;

#if nape

import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;

import luxe.Vector;
import luxe.components.physics.nape.NapeBody;

typedef PolygonColliderOptions = {

    > NapeBodyOptions,

        /** the x position of the circle */
    var x : Float;
        /** the y position of the circle */
    var y : Float; 
        /** The local vertices of the polygon */
    var polygon : Array<Vector>;

} //PolygonColliderOptions

class PolygonCollider extends NapeBody {

    var options : PolygonColliderOptions;

    public function new(_options : PolygonColliderOptions) : Void {

        options = _options;

        super(options);

    } //new

    override function onadded() {

        super.onadded();

            var verts = [];
            for(point in options.polygon) {
                verts.push( new Vec2(point.x, point.y) );
            }

            body.shapes.add(new Polygon(verts, options.material, options.filter));
            body.position.setxy(options.x, options.y);
        
        post_add();

    } //onadded

} //PolygonCollider

#end //nape

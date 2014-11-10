package luxe.components.physics.deflect.three;


#if deflect


    import luxe.Vector;

    import deflect.collision.shapes.BtSphereShape;

    import luxe.components.physics.deflect.three.ShapeCollider;


    class SphereCollider extends ShapeCollider {

        public var radius : Float;

        override function init() {

            radius = 1.0;

            shape = new BtSphereShape(radius);

        } //init


    } //PlaneCollider


#end //deflect

package luxe.components.physics.deflect.three;


#if deflect


    import deflect.collision.shapes.BtStaticPlaneShape;

    import luxe.components.physics.deflect.three.ShapeCollider;


    class PlaneCollider extends ShapeCollider {

        public var normal : deflect.math.Vector;

        override function init() {

            normal = new deflect.math.Vector(0,1,0);

            shape = new BtStaticPlaneShape( normal, 1 );

        } //init

    } //PlaneCollider


#end //deflect

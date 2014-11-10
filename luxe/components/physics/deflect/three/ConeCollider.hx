package luxe.components.physics.deflect.three;


#if deflect


    import luxe.Vector;

    import deflect.collision.shapes.BtConeShape;

    import luxe.components.physics.deflect.three.ShapeCollider;


    class ConeCollider extends ShapeCollider {

        public var radius : Float = 1;
        public var height : Float = 1;

        public function init() {

            shape = new BtConeShape( radius, height );

        } //init

    } //ConeCollider


#end //deflect

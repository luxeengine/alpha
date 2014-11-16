package luxe.components.physics.deflect.three;


#if deflect


    import luxe.Vector;

    import deflect.collision.shapes.BtCapsuleShape;

    import luxe.components.physics.deflect.three.ShapeCollider;


    class CapsuleCollider extends ShapeCollider {

        public var radius : Float = 1;
        public var height : Float = 1;

        public function init() {

            shape = new BtCapsuleShape( radius, height );

        } //init

    } //CapsuleCollider


#end //deflect

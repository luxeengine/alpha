package luxe.components.physics.deflect.three;


#if deflect


    import luxe.Vector;

    import deflect.collision.shapes.BtCylinderShape;

    import luxe.components.physics.deflect.three.ShapeCollider;


    class CylinderCollider extends ShapeCollider {

        public var width : Float = 1;
        public var height : Float = 1;
        public var depth : Float = 1;

        public function init() {

            shape = new BtCylinderShape( width, height, depth );

        } //init

    } //CylinderCollider

#end //deflect

package luxe.components.physics.deflect.three;


#if deflect


    import luxe.Vector;

    import deflect.collision.shapes.BtBoxShape;

    import luxe.components.physics.deflect.three.ShapeCollider;


    class BoxCollider extends ShapeCollider {

        public var width : Float = 1;
        public var height : Float = 1;
        public var depth : Float = 1;

        override function init() {

            shape = new BtBoxShape( width, height, depth );

        } //init

    } //BoxCollider


#end //deflect

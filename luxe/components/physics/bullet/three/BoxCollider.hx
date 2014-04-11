package luxe.components.physics.bullet.three;
    

#if haxebullet


    import luxe.Vector;

    import bullet.bulletCollision.collisionShapes.BtBoxShape;

    import luxe.components.physics.bullet.three.ShapeCollider;


    class BoxCollider extends ShapeCollider {
        
        public var width : Float = 1;
        public var height : Float = 1;
        public var depth : Float = 1;

        public function init() {

            shape = new BtBoxShape( width, height, depth );

        } //init

    } //BoxCollider


#end //haxebullet

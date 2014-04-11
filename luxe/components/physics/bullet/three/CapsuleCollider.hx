package luxe.components.physics.bullet.three;


#if haxebullet


    import luxe.Vector;

    import bullet.bulletCollision.collisionShapes.BtCapsuleShape;

    import luxe.components.physics.bullet.three.ShapeCollider;


    class CapsuleCollider extends ShapeCollider {
        
        public var radius : Float = 1;
        public var height : Float = 1;

        public function init() {

            shape = new BtCapsuleShape( radius, height );

        } //init

    } //CapsuleCollider


#end //haxebullet

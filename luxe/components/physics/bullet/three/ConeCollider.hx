package luxe.components.physics.bullet.three;
    

#if haxebullet


    import luxe.Vector;

    import bullet.bulletCollision.collisionShapes.BtConeShape;

    import luxe.components.physics.bullet.three.ShapeCollider;


    class ConeCollider extends ShapeCollider {
        
        public var radius : Float = 1;
        public var height : Float = 1;

        public function init() {

            shape = new BtConeShape( radius, height );

        } //init

    } //ConeCollider


#end //haxebullet

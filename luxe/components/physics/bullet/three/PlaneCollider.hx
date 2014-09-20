package luxe.components.physics.bullet.three;


#if haxebullet


    import luxe.Vector;

    import bullet.bulletCollision.collisionShapes.BtStaticPlaneShape;

    import luxe.components.physics.bullet.three.ShapeCollider;


    class PlaneCollider extends ShapeCollider {

        public var normal : Vector;

        override function init() {

            normal = new Vector(0,1,0);

            shape = new BtStaticPlaneShape( normal, 1 );

        } //init

    } //PlaneCollider


#end //haxebullet

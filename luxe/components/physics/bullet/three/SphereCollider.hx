package luxe.components.physics.bullet.three;


#if haxebullet


    import luxe.Vector;

    import bullet.bulletCollision.collisionShapes.BtSphereShape;

    import luxe.components.physics.bullet.three.ShapeCollider;


    class SphereCollider extends ShapeCollider {
        
        public var radius : Float;

        override function init() {

            radius = 1.0;

            shape = new BtSphereShape(radius);

        } //init


    } //PlaneCollider


#end //haxebullet

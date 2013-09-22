
import luxe.Color;
import luxe.components.cameras.FlyCamera;
import luxe.components.render.MeshComponent;

import luxe.Entity;
import luxe.Mesh;
import luxe.Vector;
import luxe.Input;
import phoenix.Camera;
import phoenix.Matrix4;
import phoenix.Texture;
import phoenix.utils.Maths;

//import luxe.components.physics.three.MeshCollider;

class Main extends luxe.Game {

    var floor : Entity;
    var floor_mesh : MeshComponent;

    var tower : Entity;
    var tower_mesh : MeshComponent;

    var tower_texture : Texture;
    var floor_texture : Texture;
    var camera : phoenix.Camera;
    var flycam : FlyCamera;

    var left:Bool = false;
    var right:Bool = false;
    var forward:Bool = false;
    var back:Bool = false;
    var fly:Bool = false;

    public function ready() {

        floor_texture = Luxe.loadTexture('assets/floor.png');
        tower_texture = Luxe.loadTexture('assets/tower.png');
        
        tower = Luxe.scene.create(Entity, 'tower');

        tower_mesh = tower.add(MeshComponent, 'mesh');
            tower_mesh.file = 'assets/tower2.obj';
            tower_mesh.texture = tower_texture;

        floor = Luxe.scene.create(Entity, 'floor');

        var floormesh = new Mesh({
            file : 'assets/tower1.obj',
            texture : floor_texture
        });

        floor_mesh = floor.add(MeshComponent, 'mesh');
            floor_mesh.mesh =  floormesh;

        // var mc = floor.add( MeshCollider, 'collider');
        //     mc.mesh = floormesh;

        camera = new phoenix.Camera({
            projection: ProjectionType.perspective,
            fov:30, 
            near:0.01,
            aspect:Luxe.screen.w/Luxe.screen.h
        });

        flycam = new FlyCamera({
            projection: ProjectionType.perspective,
            fov:60, 
            near:0.01,
            aspect:Luxe.screen.w/Luxe.screen.h
        });

        camera.pos = new Vector(0,4,3);
        camera.rotation.setFromEuler(new Vector(Maths.degToRad(-60),0,0));

        flycam.view.pos = new Vector(0,4,3);
        flycam.view.rotation.setFromEuler(new Vector(Maths.degToRad(-60),0,0));

        Luxe.renderer.default_batcher.view = camera;

        Luxe.input.add('left', KeyValue.left);
        Luxe.input.add('left', KeyValue.key_A);
        Luxe.input.add('right', KeyValue.right);
        Luxe.input.add('right', KeyValue.key_D);
        Luxe.input.add('forward', KeyValue.up);
        Luxe.input.add('forward', KeyValue.key_W);
        Luxe.input.add('back', KeyValue.down);
        Luxe.input.add('back', KeyValue.key_S);
        
        Luxe.input.add('change_camera', KeyValue.key_C);

    } //ready

    public function zoom(dir:Float) {
        var forward = new Vector(0,0,-1);
        var rotmat = new Matrix4().makeRotationFromQuaternion(camera.rotation);

            forward.applyMatrix4( rotmat );
            forward.normalize();

        camera.pos.z += forward.z * dir;
        camera.pos.y += forward.y * dir;
    }

    function mouse_in_world(p:Vector) {
        var x = ( p.x / Luxe.screen.w ) * 2 - 1;
        var y = -( p.y / Luxe.screen.h ) * 2 + 1;
        return new Vector(x,y,1);
    }

    function unprojectVector( vector:Vector ) {

        var _viewProjectionMatrix = new Matrix4();
        var _projectionMatrixInverse = new Matrix4();

        _projectionMatrixInverse.getInverse( camera.projection_matrix );
        _viewProjectionMatrix.multiplyMatrices( camera.modelview_matrix, _projectionMatrixInverse );

        return vector.applyProjection( _viewProjectionMatrix );

    }

    function rayIntersectTriangle( origin:Vector, direction:Vector, a:Vector,b:Vector,c:Vector,backfaceCulling:Bool ) {

            // from http://www.geometrictools.com/LibMathematics/Intersection/Wm5IntrRay3Triangle3.cpp
            var diff = new Vector();
            var edge1 = new Vector();
            var edge2 = new Vector();
            var normal = new Vector();

            edge1 = Vector.Subtract( b, a );
            edge2 = Vector.Subtract( c, a );
            normal.cross( edge1, edge2 );

            // Solve Q + t*D = b1*E1 + b2*E2 (Q = kDiff, D = ray direction,
            // E1 = kEdge1, E2 = kEdge2, N = Cross(E1,E2)) by
            //   |Dot(D,N)|*b1 = sign(Dot(D,N))*Dot(D,Cross(Q,E2))
            //   |Dot(D,N)|*b2 = sign(Dot(D,N))*Dot(D,Cross(E1,Q))
            //   |Dot(D,N)|*t = -sign(Dot(D,N))*Dot(Q,N)
            var DdN = direction.dot( normal );
            var sign : Int = 0;

            if ( DdN > 0 ) {

                if ( backfaceCulling ) return null;
                sign = 1;

            } else if ( DdN < 0 ) {

                sign = - 1;
                DdN = - DdN;

            } else {

                return null;

            }

            diff = Vector.Subtract( origin, a );
            var DdQxE2 = sign * direction.dot( edge2.cross( diff, edge2 ) );

            // b1 < 0, no intersection
            if ( DdQxE2 < 0 ) {

                return null;

            }

            var DdE1xQ = sign * direction.dot( Vector.Cross( edge1, diff ) );

            // b2 < 0, no intersection
            if ( DdE1xQ < 0 ) {

                return null;

            }

            // b1+b2 > 1, no intersection
            if ( DdQxE2 + DdE1xQ > DdN ) {

                return null;

            }

            // Line intersects triangle, check if ray does.
            var QdN = - sign * diff.dot( normal );

            // t < 0, no intersection
            if ( QdN < 0 ) {

                return null;

            }

            // Ray intersects triangle.
            var t = QdN / DdN;
            var result = direction.clone();

            return result.multiplyScalar( t ).add( origin );
    }

    public function get_camera_point(?start:Vector=null) : Vector {
        if(start == null) start = camera.pos;

        var direction = new Vector(0,0,-1);
        var rotmat = new Matrix4().makeRotationFromQuaternion(camera.rotation);
            direction.applyMatrix4( rotmat );
            direction.normalize();

            //T = [planeNormal•(pointOnPlane - rayOrigin)]/planeNormal•rayDirection;
            //pointInPlane = rayOrigin + (rayDirection * T);
            var planeNormal = new Vector(0,-1,0);
            var pointOnPlane = new Vector();
            var rayOrigin = start;
                //for [ ] 
            var part1 = planeNormal.dot( Vector.Subtract(pointOnPlane, rayOrigin) );
            var part2 = planeNormal.dot( direction );
            var T = part1 / part2;

            var scaled_direction = direction.multiplyScalar(T);
            var pointInPlane = Vector.Add(start, scaled_direction);

            return pointInPlane;
    }

    public function oninputdown( name:String, e:Dynamic ) {
        switch(name) {
            case 'left': left = true;
            case 'right': right = true;
            case 'forward': forward = true;
            case 'back': back = true;
            case 'change_camera': 
                fly = !fly;
                if(fly) {
                    trace('fly cam activated');
                    Luxe.renderer.default_batcher.view = flycam.view;
                    Luxe.scene.add(flycam);
                } else {
                    trace('game cam activated');
                    Luxe.renderer.default_batcher.view = camera;
                    Luxe.scene.remove(flycam);
                    Luxe.showCursor(true);
                    Luxe.lockCursor(false);
                }
        }
    }
     public function oninputup( name:String, e:Dynamic ) {
        switch(name) {
            case 'left': left = false;
            case 'right': right = false;
            case 'forward': forward = false;
            case 'back': back = false;
        }
     }

    public function onmousedown( e:MouseEvent ) {

        if(!fly) {
            if(e.button == MouseButton.wheel_down || e.button == MouseButton.wheel_up) {
                switch(e.button) {
                    case MouseButton.wheel_down:
                        zoom(-1);
                    case MouseButton.wheel_up:
                        zoom(1);
                    default:
                }
            }
        }

    }

     public function onmouseup( e:MouseEvent ) {

        if(fly) {
            flycam.onmouseup(e);
        }

    } //onmouseup
  
    var raystart : Vector;
    var raydir : Vector;

    public function onmousemove( e:MouseEvent ) {

        var mdir = mouse_in_world(e.pos);
            unprojectVector(mdir);
            mdir.normalize();
            mdir.add(camera.pos);

            raystart = mdir;

        //now mdir is the starting point of the ray
        var _forward = new Vector(0,0,-1);
        var _rotmat = new Matrix4().makeRotationFromQuaternion(camera.rotation);

            _forward.applyMatrix4( _rotmat );
            raydir = _forward.normalized;

        // //now we have the origin and direction,
        // var mesh:MeshComponent = floor_mesh.get('mesh');
        // var hit:Vector = null;

        // var t1 = rayIntersectTriangle(mdir, forward, mesh.mesh.geometry.vertices[0].pos,  mesh.mesh.geometry.vertices[1].pos,  mesh.mesh.geometry.vertices[2].pos, true );
        // if(t1 == null) {
        //     var t2 = rayIntersectTriangle(mdir,forward, mesh.mesh.geometry.vertices[3].pos,  mesh.mesh.geometry.vertices[4].pos,  mesh.mesh.geometry.vertices[5].pos, true );
        //     if(t2 != null) {
        //         hit = t2;
        //     }
        // } else {
        //     hit = t1;
        // }   



        if(fly) {
            flycam.onmousemove(e);
        }
    }

    public function onkeydown( e:KeyEvent ) {
        if(fly) {
            flycam.onkeydown(e);
        }
    }

    public function onkeyup( e:KeyEvent ) {
        
        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }

        if(fly) {
            flycam.onkeyup(e);
        }

    } //onkeyup

    var spd : Float = 2;
    public function update(dt:Float) {

        if(raystart != null && raydir != null) {
            Luxe.draw.line({
                immediate:true,
                p0 : raystart,
                p1 : get_camera_point(raystart),
                color : new Color(1,0,1,1)
            });
        }

        Luxe.draw.line({
            immediate:true,
            p0 : new Vector(0, 100, 0),
            p1 : new Vector(0, -100, 0),
            color : new Color(0,0.6,0,0.2)
        });

        Luxe.draw.line({
            immediate:true,
            p0 : new Vector(0, 0, 100),
            p1 : new Vector(0, 0, -100),
            color : new Color(0,0,0.6,1)
        });

        Luxe.draw.line({
            immediate:true,
            p0 : new Vector(-100, 0, 0),
            p1 : new Vector(100, 0, 0),
            color : new Color(0.6,0,0,1)
        });

        if(!fly) {
            if(forward)     { camera.pos.z -= spd * dt; }
            if(back)        { camera.pos.z += spd * dt; }
            if(left)        { camera.pos.x -= spd * dt; }
            if(right)       { camera.pos.x += spd * dt; }
        }

    } //update

    public function shutdown() {

    } //shutdown
}




import lime.utils.Float32Array;
import luxe.Input;


import luxe.Matrix4;
import luxe.Quaternion;
import luxe.Transform;
import luxe.utils.Maths;
import luxe.Vector;
import luxe.Color;

import phoenix.geometry.QuadGeometry;
import phoenix.DualQuaternion;


class ET extends Transform {

}

class Main extends luxe.Game {

    var p1 : Transform;
    var p2 : Transform;
    var p3 : Transform;

    public function ready() {

        // var pos = new Vector(100,200,300);
        // var rot = new Quaternion().setFromEuler(new Vector( Maths.degToRad(180),Maths.degToRad(45),Maths.degToRad(90)));

        // var dq = new DualQuaternion().setFromTranslationRotation(pos, rot);

        // trace( "pos:" + pos + " // " + dq.translation );
        // trace( "rot:" + rot + " // " + dq.rotation );

        // var m = DualQuaternion.ToMatrix(dq);

        // trace( new Vector().applyMatrix4(m) );
        // trace( new Vector().setEulerFromQuaternion(new Quaternion().setFromRotationMatrix(m)).toDegrees() );
        // trace( new Vector().setEulerFromRotationMatrix(m).toDegrees() );

        // var r1 = new Quaternion().setFromEuler( new Vector( 180, 10, 0 ).toRadians() );
        // var r2 = new Quaternion().setFromEuler( new Vector( 20, 0, 0 ).toRadians() );

        // var rs = new Quaternion().multiplyQuaternions(r1,r2);
        // var ri = new Quaternion().multiplyQuaternions(r2,r1);

        // trace( r1 );
        // trace( r2 );

        // var ts = new Vector().setEulerFromQuaternion(rs).toDegrees();
        // var ti = new Vector().setEulerFromQuaternion(ri).toDegrees();

        // trace( ts );
        // trace( ti );

        // p1 = new Transform();
        // p2 = new Transform();
        // p3 = new Transform();

        // p1.name = 'root';
        // p2.name = 'child';
        // p3.name = 'child.orig';

        // p1.pos = Luxe.screen.mid;
        
        // p2.parent = p1;
        // p3.parent = p2;

        // p2.pos = new Vector(60,60);
        // p2.rotation = new Quaternion().setFromEuler( new Vector(0,0,90).toRadians() );

        // p3.pos = new Vector(15,15);

        // Luxe.draw.circle({x:0,y:0,r:1,color:new Color(1,1,1,0.2)});

        Luxe.draw.line({ p0:new Vector(0, 0), p1:new Vector(100, 0), depth:9 });
        Luxe.draw.line({ p0:new Vector(0, 25), p1:new Vector(100, 25), depth:9 });
        Luxe.draw.line({ p0:new Vector(0, 50), p1:new Vector(100, 50), depth:9 });
        Luxe.draw.line({ p0:new Vector(0, 75), p1:new Vector(100, 75), depth:9 });
        Luxe.draw.line({ p0:new Vector(0, 100), p1:new Vector(100, 100), depth:9 });

        Luxe.draw.line({ p0:new Vector(0, 0), p1:new Vector(0, 100), depth:9 });
        Luxe.draw.line({ p0:new Vector(25, 0), p1:new Vector(25, 100), depth:9 });
        Luxe.draw.line({ p0:new Vector(50, 0), p1:new Vector(50, 100), depth:9 });
        Luxe.draw.line({ p0:new Vector(75, 0), p1:new Vector(75, 100), depth:9 });
        Luxe.draw.line({ p0:new Vector(100, 0), p1:new Vector(100, 100), depth:9 });

        qg = new QuadGeometry({
            x:0, y:0, w:50, h:50
        });

        qg.transform.name = 'qg';
        qg.origin = new Vector(25,25);
        qg.transform.pos = new Vector(50,50,0);
        qg.transform.scale = new Vector(2,2);
        // qg.transform.rotation = qg.transform.rotation.setFromEuler(new Vector(0,0,45).toRadians());
        qg.color = new Color().rgb(0xff403b);

        d1 = new Transform();

            d1.scale = new Vector(1,0.5,1);
            d1.pos = new Vector(0,0,0);

        // qg.transform.parent = d1;
        

        Luxe.addGeometry( qg );

        //ways to set a transform :
        // pos.x
        // pos = 
        // pos.set 

        //consequences of 
        // pos.x -> listener -> set_pos(pos) -> pos_changed(pos)
        // pos = -> set_pos(pos) -> pos_changed(pos)
        // pos.set -> 

    } //ready
    
    var d1 : Transform;
    var qg : QuadGeometry;

    public function onmousemove( e:MouseEvent ) {
        d1.pos = e.pos.clone().add(Luxe.camera.pos);
        // trace(Luxe.camera.pos);
    }

    public function onkeydown( e:KeyEvent ) {

        // if(e.key == KeyValue.space) {
        //     trace(Luxe.camera.transform.pos);
        //     trace(Luxe.camera.transform.world.pos);
        //     trace(Luxe.camera.transform.rotation);
        //     trace(Luxe.camera.transform.world.rotation);
        // }

        if(e.key == KeyValue.key_P) {
            if(qg.transform.parent == null) {
                qg.transform.parent = d1;
                qg.transform.pos = new Vector();
            } else {
                qg.transform.parent = null;
                qg.transform.pos = Luxe.screen.mid;
            }
        }

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    var r : Float = 0;

    public function update(dt:Float) {

        r += 100 * dt;

        // d1.rotation = new Quaternion().setFromEuler( new Vector(0,0,r*0.25).toRadians() );
        // qg.transform.rotation = new Quaternion().setFromEuler( new Vector(0,0,r).toRadians() );

        // p1.rotation = new Quaternion().setFromEuler( new Vector(0,0,r*0.25).toRadians() );
        // p2.rotation = new Quaternion().setFromEuler( new Vector(0,0,r).toRadians() );
        // p3.rotation = new Quaternion().setFromEuler( new Vector(0,0,r*4).toRadians() );

        // Luxe.draw.ring({
        //     immediate : true,
        //     x: p1.world.pos.x,
        //     y: p1.world.pos.y,
        //     r: 10,
        //     color : new Color().rgb(0xff403b)
        // });

        // var g = Luxe.draw.box({
        //     immediate : true,
        //     x: p2.world.pos.x,
        //     y: p2.world.pos.y,
        //     w:16, h:16,
        //     color : new Color().rgb(0xff403b)
        // });

        // var g2 = Luxe.draw.rectangle({
        //     immediate : true,
        //     x: p3.world.pos.x,
        //     y: p3.world.pos.y,
        //     w: 6, h:6,
        //     color : new Color().rgb(0xffffff)
        // });

        // g.origin = new Vector(8,8);
        // g.transform.rotation = g.transform.rotation.setFromEuler(new Vector(0,0,r).toRadians());

        // g2.origin = new Vector(3,3);
        // g2.transform.rotation = g2.transform.rotation.setFromEuler(new Vector(0,0,r*4).toRadians());

    } //update

} //Main
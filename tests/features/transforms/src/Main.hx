
import snow.utils.Float32Array;
import luxe.Input;


import luxe.Matrix;
import luxe.Quaternion;
import luxe.Sprite;
import luxe.Transform;
import luxe.tween.Actuate;
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

    override function ready() {

        // var pos = new Vector(100,200,300);
        // var rot = new Quaternion().setFromEuler(new Vector( Maths.radians(180),Maths.radians(45),Maths.radians(90)));

        // var dq = new DualQuaternion().setFromTranslationRotation(pos, rot);

        // trace( "pos:" + pos + " // " + dq.translation );
        // trace( "rot:" + rot + " // " + dq.rotation );

        // var m = DualQuaternion.ToMatrix(dq);

        // trace( new Vector().transform(m) );
        // trace( new Vector().setEulerFromQuaternion(new Quaternion().setFromRotationMatrix(m)).degrees() );
        // trace( new Vector().setEulerFromRotationMatrix(m).degrees() );

        // var r1 = new Quaternion().setFromEuler( new Vector( 180, 10, 0 ).radians() );
        // var r2 = new Quaternion().setFromEuler( new Vector( 20, 0, 0 ).radians() );

        // var rs = new Quaternion().multiplyQuaternions(r1,r2);
        // var ri = new Quaternion().multiplyQuaternions(r2,r1);

        // trace( r1 );
        // trace( r2 );

        // var ts = new Vector().setEulerFromQuaternion(rs).degrees();
        // var ti = new Vector().setEulerFromQuaternion(ri).degrees();

        // trace( ts );
        // trace( ti );



        p1 = new Transform();
        p1.world.auto_decompose = true;
        p2 = new Transform();
        p2.world.auto_decompose = true;
        p3 = new Transform();
        p3.world.auto_decompose = true;

        p1.name = 'root';
        p2.name = 'child';
        p3.name = 'child.orig';

        p1.pos = Luxe.screen.mid;

        p2.parent = p1;
        p3.parent = p2;

        p2.pos = new Vector(60,60);
        p2.rotation = new Quaternion().setFromEuler( new Vector(0,0,90).radians() );

        p3.pos = new Vector(15,15);

        Luxe.draw.circle({x:0,y:0,r:1,color:new Color(1,1,1,0.2)});

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
            x:0, y:0, w:50, h:50,
            batcher : Luxe.renderer.batcher
        });

        qg.transform.name = 'qg';
        qg.transform.origin = new Vector(25,25);
        qg.transform.scale = new Vector(1.5,1.5);
        qg.transform.rotation = qg.transform.rotation.setFromEuler(new Vector(0,0,45).radians());
        qg.color = new Color().rgb(0xff403b);

        d1 = new Transform();

            d1.scale = new Vector(1,0.5,1);
            d1.pos = new Vector(0,0,0);

        qg.transform.parent = d1;


        var spr_tween_test = new Sprite({
            pos : new Vector(0,Luxe.screen.h-16),
            size : new Vector(16,16),
            centered : false,
            color : new Color().rgb(0xff403b)
        });

        Actuate.tween(spr_tween_test.pos, 6, {x:Luxe.screen.w-16}).repeat().reflect().ease(luxe.tween.easing.Linear.easeNone);

        var spr_parent = new Sprite({
            name : 'spr_parent',
            pos : new Vector(0, Luxe.screen.h-32),
            size : new Vector(16,16),
            centered : false,
            color : new Color().rgb(0xff403b)
        });

        var spr_child = new Sprite({
            name : 'spr_child',
            pos : new Vector(8,8),
            size : new Vector(8,8),
            color : new Color().rgb(0xffffff)
        });

        spr_child.parent = spr_parent;

        Actuate.tween(spr_parent.pos, 8, {x:Luxe.screen.w-16}).repeat().reflect().ease(luxe.tween.easing.Linear.easeNone);

    } //ready

    var d1 : Transform;
    var qg : QuadGeometry;

    override function onmousemove( e:MouseEvent ) {
        d1.pos = e.pos.clone().add(Luxe.camera.pos);
    }

    override function onkeydown( e:KeyEvent ) {


        if(e.keycode == Key.key_p) {
            if(qg.transform.parent == null) {
                qg.transform.parent = d1;
                qg.transform.pos = new Vector();
            } else {
                qg.transform.parent = null;
                qg.transform.pos = Luxe.screen.mid;
            }
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    var r : Float = 0;

    override function update(dt:Float) {

        r += 100 * dt;

        qg.transform.rotation = new Quaternion().setFromEuler( new Vector(0,0,r).radians() );

        p1.rotation = new Quaternion().setFromEuler( new Vector(0,0,r*0.25).radians() );
        p2.rotation = new Quaternion().setFromEuler( new Vector(0,0,r).radians() );
        p3.rotation = new Quaternion().setFromEuler( new Vector(0,0,r*4).radians() );

        Luxe.draw.ring({
            immediate : true,
            x: p1.world.pos.x,
            y: p1.world.pos.y,
            r: 10,
            color : new Color().rgb(0xff403b)
        });

        var g = Luxe.draw.box({
            immediate : true,
            x: p2.world.pos.x,
            y: p2.world.pos.y,
            w:16, h:16,
            color : new Color().rgb(0xff403b)
        });

        var g2 = Luxe.draw.rectangle({
            immediate : true,
            x: p3.world.pos.x,
            y: p3.world.pos.y,
            w: 6, h:6,
            color : new Color().rgb(0xffffff)
        });

        g.transform.origin = new Vector(8,8);
        g.transform.rotation = g.transform.rotation.setFromEuler(new Vector(0,0,r).radians());

        g2.transform.origin = new Vector(3,3);
        g2.transform.rotation = g2.transform.rotation.setFromEuler(new Vector(0,0,r*4).radians());

    } //update

} //Main
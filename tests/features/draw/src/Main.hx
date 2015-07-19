
import luxe.Rectangle;
import luxe.Text;
import luxe.utils.Maths;
import luxe.Vector;
import luxe.Color;
import luxe.Input;

import phoenix.geometry.CircleGeometry;
import phoenix.geometry.RingGeometry;
import phoenix.geometry.LineGeometry;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.RectangleGeometry;
import phoenix.Texture;
import snow.types.Types;

typedef AccelEvent = {
    timestamp:Float,
    value:Float,
    axis:Int
}

class Main extends luxe.Game {


    public var mouse    : Vector;
    public var line     : LineGeometry;
    public var rect     : RectangleGeometry;
    public var box      : QuadGeometry;
    public var circle   : CircleGeometry;
    public var ring     : RingGeometry;


    override function config(config:luxe.AppConfig) {

        config.preload.textures.push({ id:'assets/logo.png' });

        return config;

    } //config

    var accel_x: Float = 0.5;
    var accel_y: Float = 0.5;
    var accel_z: Float = 0.5;

    override function onevent( ev:SystemEvent ) {

        if(ev.type == SystemEventType.input) {
            if(ev.input.type == InputEventType.joystick) {

                #if mobile
                    var event : AccelEvent = ev.input.event;
                    switch(event.axis) {
                        case 0: accel_x = event.value;
                        case 1: accel_y = event.value;
                        case 2: accel_z = event.value;
                    }
                #end

                #if web

                    var event = ev.input.event;
                    if(event.type == 'orientation') {
                        // available:
                        // event.alpha;
                        // event.beta;
                        // event.gamma;
                    } else
                    if(event.type == 'motion') {
                        // available:
                        // event.acceleration (.x, .y, .z)
                        // event.accelerationIncludingGravity (.x, .y, .z)
                        // event.rotationRate (.alpha, .beta, .gamma)
                        accel_x = event.acceleration.x;
                        accel_y = event.acceleration.y;
                        accel_z = event.acceleration.z;
                    }

                #end

            } //if joystick
        } //if input

    } //onevent

    override function ready() {


        mouse = new Vector();

        line = Luxe.draw.line({
            p0 : new Vector( 0, Luxe.screen.h/2 ),
            p1 : new Vector( Luxe.screen.w, Luxe.screen.h/2 ),
            color : new Color(0.5,0.2,0.2,1)
        });

        rect = Luxe.draw.rectangle({
            x : 10, y : 10,
            w : Luxe.screen.w - 20,
            h : Luxe.screen.h - 20,
            color : new Color(0.4,0.4,0.4)
        });


        Luxe.draw.ngon({
            r:200, sides : 3,
            solid : true,
            color: new Color(1,1,1,0.1),
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });
        Luxe.draw.ngon({
            r:120, sides : 3,
            color: new Color(1,1,1,0.5),
            angle: 90,
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });
        Luxe.draw.ngon({
            r:120, sides : 3,
            color: new Color(1,1,1,0.5),
            angle: 180,
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });
        Luxe.draw.ngon({
            r:200, sides : 5,
            color: new Color(1,1,1,0.3),
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });
        Luxe.draw.ngon({
            r:200, sides : 6,
            color: new Color(1,1,1,0.3),
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });
        Luxe.draw.ngon({
            r:200, sides : 7,
            color: new Color(1,1,1,0.3),
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });
        Luxe.draw.ngon({
            r:200, sides : 8,
            color: new Color(1,1,1,0.3),
            x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
        });

        box = Luxe.draw.box({
            x : 40, y : 40,
            w : Luxe.screen.w - 80,
            h : Luxe.screen.h - 80,
            color : new Color(0,0,0,0.5)
        });

        Luxe.draw.circle({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            r : 100,
            start_angle:120,
            end_angle:240,
            color : new Color(0,0,0,0.1).rgb(0xffffff)
        });

        circle = Luxe.draw.circle({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            r : 50,
            color : new Color(0,0,0,1).rgb(0xff4b03)
        });

        ring = Luxe.draw.ring({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            r : 60,
            color : new Color(1,1,1,1)
        });

        Luxe.draw.ring({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            rx : 200,
            ry : 100,
            color : new Color(1,1,1,0.3)
        });

        Luxe.draw.ring({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            rx : 100,
            ry : 200,
            color : new Color(1,1,1,0.3)
        });

        Luxe.draw.arc({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            r : 70,
            end_angle:70,
            color : new Color(1,1,1,1)
        });

        Luxe.draw.text({
            color : new Color(1,1,1,1),
            pos : Luxe.screen.mid.add(new Vector(0,50)),
            point_size : 24,
            text :
"Luxe.draw.ring({
        x : Luxe.screen.mid.x,
        y : Luxe.screen.mid.y,
        r : 70,
        color : new Color(1,1,1,1)
});\n"

        });

        Luxe.draw.texture({
            pos : Luxe.screen.mid.subtract(new Vector(30,30)),
            texture : Luxe.resources.texture('assets/logo.png'),
            size : new Vector(60,60)
        });

    } //ready

    override function onmousemove( e:MouseEvent ) {
        mouse.set_xy(e.x,e.y);
    } //onmousemove

    override function onmousedown( e:MouseEvent ) {
        mouse.set_xy(e.x,e.y);
    } //onmousedown

    override function onmouseup( e:MouseEvent ) {
        mouse.set_xy(e.x,e.y);
    } //onmouseup

    override function onkeyup( e:KeyEvent ) {
        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }
    } //onkeyup

    override function onrender() {

        //accel

            var apos = new Vector(accel_x * Luxe.screen.w, accel_y * Luxe.screen.h);

            Luxe.draw.ring({
                    //this line is important, as each frame it will create new geometry!
                immediate : true,
                x : apos.x,
                y : apos.y,
                rx : Luxe.screen.h*0.02,
                ry : Luxe.screen.h*0.02,
                color : new Color(1,1,1,1).rgb(0xf6007b)
            });

            Luxe.draw.text({
                    //this line is important, as each frame it will create new geometry!
                immediate:true,
                align : TextAlign.center,
                color : new Color().rgb(0xf6007b),
                pos : apos,
                point_size : 12,
                text : 'accel: ${Maths.fixed(accel_x, 3)} ${Maths.fixed(accel_y, 3)} ${Maths.fixed(accel_z, 3)}'
            });

        //mouse

            Luxe.draw.rectangle({
                    //this line is important, as each frame it will create new geometry!
                immediate : true,
                x : mouse.x-85, y : mouse.y,
                w : 170,
                h : 32,
                color : new Color(Math.random(),Math.random(),Math.random(),0.5)
            });

            Luxe.draw.text({
                    //this line is important, as each frame it will create new geometry!
                immediate:true,
                align : TextAlign.center,
                color : new Color(Math.random(),Math.random(),Math.random(),0.5),
                pos : mouse,
                text : '$accel_x, $accel_y, $accel_z'//Std.string(luxe.utils.Maths.fixed(Luxe.dt, 6))
            });

    } //onrender


} //Main

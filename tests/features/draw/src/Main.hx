
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


class Main extends luxe.Game {

    public var line     : LineGeometry;
    public var rect     : RectangleGeometry;
    public var box      : QuadGeometry;
    public var circle   : CircleGeometry;
    public var ring     : RingGeometry;

    override function config(config:luxe.AppConfig) {

        config.preload.textures.push({ id:'assets/logo.png' });

        config.render.antialiasing = 2;

        return config;

    } //config

    override function ready() {

        line = Luxe.draw.line({
            p0 : new Vector( 0, Luxe.screen.h/2 ),
            p1 : new Vector( Luxe.screen.w, Luxe.screen.h/2 ),
            color : new Color(0.5,0.2,0.2,1)
        });

        rect = Luxe.draw.rectangle({
            x : 10, y : 10,
            depth: -2,
            w : Luxe.screen.w - 20,
            h : Luxe.screen.h - 20,
            color : new Color(0.4,0.4,0.4)
        });

        var _mx = Luxe.screen.mid.x;

        Luxe.draw.poly({
            solid : true,
            depth : -1,
            colors: [
                new Color().rgb(0xff4b03),
                new Color().rgb(0xff4b03),
                new Color().rgb(0xff4b03),
                new Color().rgb(0x121212),
                new Color().rgb(0x121212),
                new Color().rgb(0xff4b03),
                new Color().rgb(0xff4b03),
            ],
            points : [
                new Vector(_mx-(55/2)+160, 228/2),
                new Vector(_mx-(154/2)+160, 207/2),
                new Vector(_mx-(167/2)+160, 217/2),
                new Vector(_mx-(215/2)+160, 367/2),
                new Vector(_mx-(88/2)+160, 404/2),
                new Vector(_mx-(49/2)+160, 240/2),
                new Vector(_mx-(55/2)+160, 228/2),
            ]
        });

        Luxe.draw.poly({
            solid : false,
            depth : -1,
            colors: [
                new Color().rgb(0xff4b03),
                new Color().rgb(0xff4b03),
                new Color().rgb(0xff4b03),
                new Color().rgb(0x191919),
                new Color().rgb(0x191919),
                new Color().rgb(0xff4b03),
                new Color().rgb(0xff4b03)
            ],
            points : [
                new Vector(_mx+(55/2)-160, 228/2),
                new Vector(_mx+(154/2)-160, 207/2),
                new Vector(_mx+(167/2)-160, 217/2),
                new Vector(_mx+(215/2)-160, 367/2),
                new Vector(_mx+(88/2)-160, 404/2),
                new Vector(_mx+(49/2)-160, 240/2),
                new Vector(_mx+(55/2)-160, 228/2),
            ]
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
            depth:-3,
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
            start_angle:140,
            end_angle:220,
            color: new Color(1,1,1,0.8)
        });

        Luxe.draw.arc({
            x : Luxe.screen.w/2,
            y : Luxe.screen.h/2,
            r : 70,
            start_angle:-40,
            end_angle:40,
            color: new Color(1,1,1,0.7)
        });

        Luxe.draw.text({
            color : new Color(1,1,1,0.5),
            pos : new Vector(45,45),
            point_size : 12,
            text :
"Luxe.draw.ring({
        color : new Color(1,1,1,1)
        x : Luxe.screen.mid.x,
        y : Luxe.screen.mid.y,
        r : 70,
});\n"

        });

        Luxe.draw.texture({
            pos : Luxe.screen.mid.subtract(new Vector(30,30)),
            texture : Luxe.resources.texture('assets/logo.png'),
            size : new Vector(60,60)
        });

    } //ready

    override function onkeyup( e:KeyEvent ) {
        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }
    } //onkeyup

    override function onrender() {

        var mouse = Luxe.screen.cursor.pos;

            var r = Luxe.draw.rectangle({
                    //this line is important, as each frame it will create new geometry!
                immediate : true,
                x : mouse.x-85, y : mouse.y+5,
                w : 170,
                h : 32
            });

            var t = Luxe.draw.text({
                    //this line is important, as each frame it will create new geometry!
                immediate:true,
                align : TextAlign.center,
                pos : mouse,
                text : Std.string(luxe.utils.Maths.fixed(Luxe.dt, 6))
            });

            r.color.a = 0.5;
            t.color.a = 0.3;

    } //onrender


} //Main

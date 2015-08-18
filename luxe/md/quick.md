
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[View all guides](guide.html)
###[Back](index.html#quick)

----

## Some quick examples of things done in luxe

### Creating a simple sprite
---

    import luxe.Sprite;
    import luxe.Vector;

    class MyGame extends luxe.Game {

        override function ready() {

            var player = new Sprite({
                texture : Luxe.resources.texture('assets/player.png'),
                pos : Luxe.screen.mid,
                depth : 4
            });

                //random position in a circle 90% of screen size

            var rand = Luxe.utils.geometry.random_point_in_unit_circle();

            player.pos.x = rand.x * (Luxe.screen.w * 0.9);
            player.pos.y = rand.y * (Luxe.screen.h * 0.9);

        } //ready

    } //MyGame



### Create an entity and give it a component
---

        //will get added to default scene
    var player = new Entity({ name:'player' });

        //custom component class
    var move = new PlayerMovement({ name:'move' });

        //2.5x faster than default
    move.speed *= 2.5;

        //attach to entity!
    entity.add(move);


### Drawing raw geometry shapes
---

    Luxe.draw.rectangle({
        x : 10,
        y : 10,
        w : Luxe.screen.w - 20,
        h : Luxe.screen.h - 20,
        color : new ColorHSV(120, 0.5, 1.0)
    });

    Luxe.draw.circle({
        r : 50,
        x : Luxe.screen.w/2,
        y : Luxe.screen.h/2,
        color : new Color().rgb(0xcc0000)
    });

    Luxe.draw.arc({
        r : 70,
        end_angle:60,
        x : Luxe.screen.w/2,
        y : Luxe.screen.h/2,
        color : new Color(1,1,1,1)
    });

---

&nbsp;
&nbsp;

###[View all guides](guide.html)
###[Back](index.html#quick)

&nbsp;
&nbsp;
&nbsp;
&nbsp;
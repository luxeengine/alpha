
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[View all guides](guide.html)
###[Back to index](index.html)

----

## Some quick examples of things done in luxe

### Creating a simple sprite
---

    import luxe.Sprite;
    import luxe.Vector;

    var player = new Sprite({
        depth : 4,
        pos : new Vector( Luxe.screen.w, Luxe.screen.h ),
        texture : Luxe.loadTexture('assets/player.png')
    });

    player.pos.x = Luxe.screen.w/4;


### Create an entity and give it a component
---

    var entity = Luxe.scene.create(Entity, 'player');

    var move = entity.add(PlayerMovement, 'move');
            //2.5x faster than default
        move.speed *= 2.5;


### Drawing shapes 
---

    Luxe.draw.rectangle({
        x : 10, y : 10,
        w : Luxe.screen.w - 20, 
        h : Luxe.screen.h - 20,
        color : new Color(0.4,0.4,0.4)
    });

    Luxe.draw.circle({
        x : Luxe.screen.w/2,
        y : Luxe.screen.h/2,
        r : 50,
        color : new Color(0.8,0.3,0.2,1)
    }); 

    Luxe.draw.arc({
        x : Luxe.screen.w/2,
        y : Luxe.screen.h/2,
        r : 70,
        end_angle:70,
        color : new Color(1,1,1,1)
    });

---

&nbsp;   
&nbsp;   

###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   
&nbsp;   
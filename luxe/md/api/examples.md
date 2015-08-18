
> luxe.Draw.arc

```
    //draws a 60 degree arc center screen
var geometry = Luxe.draw.arc({
    r : 70,
    end_angle:60,
    x : Luxe.screen.w/2,
    y : Luxe.screen.h/2,
    color : new Color(1,1,1,1)
});
```

> luxe.Draw.line

```
    //draws a line horizontally across the screen
var geometry = Luxe.draw.line({
    p0 : new Vector( 0, Luxe.screen.h/2 ),
    p1 : new Vector( Luxe.screen.w, Luxe.screen.h/2 ),
    color : new Color(0.5,0.2,0.2,1)
});
```

> luxe.Draw.rectangle

```
    //draws a outline rectangle just inside the screen
var geometry = Luxe.draw.rectangle({
    x : 10, y : 10,
    w : Luxe.screen.w - 20,
    h : Luxe.screen.h - 20,
    color : new Color(0.4,0.4,0.4)
});
```

> luxe.Draw.box

```
    //draw a filled box just inside the screen
var geometry = Luxe.draw.box({
    x : 40, y : 40,
    w : Luxe.screen.w - 80,
    h : Luxe.screen.h - 80,
    color : new Color(0,0,0,0.5)
});
```

> luxe.Draw.ring

```
    //draw a outline circle center screen
ring = Luxe.draw.ring({
    x : Luxe.screen.w/2,
    y : Luxe.screen.h/2,
    r : 60,
    color : new Color(1,1,1,1)
});
```

> luxe.Draw.circle

```
    //draw a solid circle center screen
var geometry = Luxe.draw.circle({
    x : Luxe.screen.w/2,
    y : Luxe.screen.h/2,
    r : 50,
    color : new Color(0,0,0,1).rgb(0xff4b03)
});
```

> luxe.Draw.text

```
    //draw some center aligned text, center screen
Luxe.draw.text({
    color : new Color(1,1,1,1),
    pos : Luxe.screen.mid,
    point_size : 24,
    align : TextAlign.center,
    text : "some text \n indeed"
});
```

> luxe.Draw.texture

```
    //draw a texture center screen
Luxe.draw.texture({
    pos : Luxe.screen.mid,
    texture : Luxe.resources.texture('assets/logo.png'),
    size : new Vector(60,60)
});
```

> luxe.Draw.ngon

```
    //draw a solid triangle center screen
Luxe.draw.ngon({
    r:200,
    sides : 3,
    solid : true,
    color: new Color(1,1,1,0.1),
    x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
});
```

> luxe.Draw.poly

```
    //draw a list of points as a polygon
Luxe.draw.poly({
    solid : true,
    color: new Color().rgb(0xff4b03),
    points : [
        new Vector(28, 114),
        new Vector(77, 104),
        new Vector(84, 109),
        new Vector(108, 184),
        new Vector(44, 202),
        new Vector(25, 120),
        new Vector(28, 114),
    ]
});
```

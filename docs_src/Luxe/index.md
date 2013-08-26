
[![Logo](http://luxeengine.com/images/logo.png)](./index.html)

A cross platform haxe powered game development engine

##About

Luxe is a cross platform, rapid development, haxe based OpenGL game engine    
for deploying games on [Mac](mac.html), [Windows](windows.html), [Linux](linux.html), [Android](android.html), [iOS](ios.html) and [WebGL/HTML5](html5.html).

Luxe is built on top of open source technologies, like [Haxe](http://haxe.org), [NME](http://github.com/haxenme/NME) and built with performance and simplicity in mind, without sacrificing much low level access and without unneccessary complexity.

Luxe uses common patterns and approaches to simplify working with the engine, such as Components/Entity systems, State Machines and Event Driven models. 

##Quick look
&nbsp;
&nbsp;
**A simple sprite example**

    import luxe.Sprite;
    import luxe.Vector;

    var player = new Sprite({
        depth : 4,
        pos : new Vector( Luxe.screen.w, Luxe.screen.h ),
        texture : Luxe.loadTexture('assets/player.png')
    });

    player.pos.x = Luxe.screen.w/4;
&nbsp;
&nbsp;
**A simple component example**

    import luxe.Entity;
    import luxe.components.MeshComponent;

    var cube_mesh = Luxe.scene.create(Entity, 'sphere');

    var cube_mesh_component = cube_mesh.add(MeshComponent, 'mesh');

        cube_mesh.get('mesh').file = 'assets/cube.obj';
        cube_mesh.get('mesh').texture = Luxe.loadTexture('assets/cube.png');


##Documentation

[View Full Index](all.html)    

[View API](api.html)   
[View Types](types.html)   
[View Classes](classes.html)
&nbsp;
&nbsp;

&nbsp;


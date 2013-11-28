
[![Logo](http://luxeengine.com/images/logo.png)](./index.html)

A cross platform haxe powered game development engine.

--- 
##About

Luxe is a cross platform, rapid development, haxe based OpenGL game engine    
for deploying games on Mac, Windows, Linux, Android, iOS and WebGL/HTML5.

<img title="Mac" alt="Mac" src="images/mac.png" class="platform-icon-64"/>
<img title="Linux" alt="Linux" src="images/linux.png" class="platform-icon-64"/>
<img title="Windows" alt="Windows" src="images/windows.png" class="platform-icon-64"/>
<img title="WebGL/HTML5" alt="WebGL/HTML5" src="images/web.png" class="platform-icon-64"/>
<img title="iOS" alt="iOS" src="images/ios.png" class="platform-icon-64"/>
<img title="Android" alt="Android" src="images/android.png" class="platform-icon-64"/>

Luxe is built on top of open source technologies, like [Haxe](http://haxe.org) and [lime](http://github.com/openfl/lime) and is built with simplicity in mind.
Luxe uses common patterns for working with the engine, such as Components/Entity systems, State Machines and Event systems. 

You code once in haxe, and deploy to all available platforms.

----
## Guides

###[view the setup guide](setup.html)   
###[view the luxe guide](guide.html)   

----
##Quick look
&nbsp; [go here for more](quick.html)   

**A simple sprite example**

    import luxe.Sprite;
    import luxe.Vector;

    var player = new Sprite({
        depth : 4,
        pos : new Vector( Luxe.screen.w, Luxe.screen.h ),
        texture : Luxe.loadTexture('assets/player.png')
    });

    player.pos.x = Luxe.screen.w/4;

----

##Documentation

<!-- [View Full Index](all.html)     -->

[View API](api.html)   
[View Types](types.html)   
[View luxe Class Index](luxe.Classes.html)   
[View phoenix Class Index](phoenix.Classes.html)   
&nbsp;
&nbsp;

&nbsp;


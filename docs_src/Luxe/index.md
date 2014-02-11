
[![Logo](http://luxeengine.com/images/logo.png)](./index.html)

A cross platform haxe powered game development engine.

--- 
##About

Luxe is a cross platform, rapid development, haxe based OpenGL game engine    
for deploying games on Mac, Windows, Linux, Android, iOS and WebGL/HTML5.

<img title="Mac" alt="Mac" src="images/mac64.png" class="platform-icon-64"/>
<img title="Linux" alt="Linux" src="images/linux64.png" class="platform-icon-64"/>
<img title="Windows" alt="Windows" src="images/windows64.png" class="platform-icon-64"/>
<img title="WebGL/HTML5" alt="WebGL/HTML5" src="images/web64.png" class="platform-icon-64"/>
<img title="iOS" alt="iOS" src="images/ios64.png" class="platform-icon-64"/>
<img title="Android" alt="Android" src="images/android64.png" class="platform-icon-64"/>

Luxe is produly built on top of open source technologies, like [Haxe](http://haxe.org) and [lime](http://limeframework.com/) and is built with simplicity in mind.
Luxe uses common patterns for working with the engine, such as Components/Entity systems, State Machines and Event systems but does not stop you from bypassing those in favour of your own specific methodology. 

You code once in haxe, and deploy to all available platforms.

[ ![haxe](images/haxe.png) ](http://haxe.org)

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

<a name="docs"></a>

##Documentation

###[View API](api.html)   
###[View All Types](types.html) 

---

####!! [ View full luxe Class Index](luxe.Classes.html)   
####!! [View full phoenix Class Index](phoenix.Classes.html)   
&nbsp;
&nbsp;

&nbsp;


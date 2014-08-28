
[![Logo](http://luxeengine.com/images/logo.png)](./index.html)

A cross platform haxe powered game development engine.

--- 
##About

Luxe is a cross platform, rapid development, haxe based OpenGL game engine    
for deploying games on Mac, Windows, Linux, Android, iOS and WebGL.

<img title="Mac" alt="Mac" src="images/mac64.png" class="platform-icon-64"/>
<img title="Linux" alt="Linux" src="images/linux64.png" class="platform-icon-64"/>
<img title="Windows" alt="Windows" src="images/windows64.png" class="platform-icon-64"/>
<img title="WebGL" alt="WebGL" src="images/web64.png" class="platform-icon-64"/>
<img title="iOS" alt="iOS" src="images/ios64.png" class="platform-icon-64"/>
<img title="Android" alt="Android" src="images/android64.png" class="platform-icon-64"/>


Luxe is produly built on top of open source technologies, like [Haxe](http://haxe.org). It's built on top of [snow](http://snowkit.org/snow), uses [flow](http://snowkit.org/flow) to build and is built with simplicity in mind. You code once in haxe, and deploy to all available platforms.


[ ![haxe](images/haxe.png) ](http://haxe.org)

Luxe supplies and uses common patterns for working with the engine, such as Components/Entity systems, State Machines and Event systems. These are not enforced and do not stop you from bypassing those in favour of your own specific methodology.   

What this means is that luxe is a facilitator, it contains many helpers, functions and systems for you to use when building your games.


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

    ...

    var player = new Sprite({
        depth : 4,
        pos : new Vector( Luxe.screen.w, Luxe.screen.h ),
        texture : Luxe.loadTexture('assets/player.png')
    });

    player.pos.x = Luxe.screen.w/4;


----

<a name="docs"></a>

##Documentation

###[View API](api/index.html) 

---

##Games being developed with luxe

&nbsp;
&nbsp;

###Equilibrium 
[news page](https://twitter.com/bennpowell) | wip title

![eq_menu](images/games/eq/eq_menu.png)

---

![eq_ingame](images/games/eq/eq_ingame.png)

&nbsp;
&nbsp;

---

###Westport Independent
[news page](https://twitter.com/0010_Games)

![eq_menu](images/games/wpi/wpi_logo.png)

---

![eq_ingame](images/games/wpi/wpi_ingame.png)

&nbsp;



[![Logo](http://luxeengine.com/images/logo.png)](./index.html)

 [api](#docs) • [guide](#docs) • [source](https://github.com/underscorediscovery/luxe) • [issues](https://github.com/underscorediscovery/luxe/issues) 

A free and open cross platform game development engine.   

--- 
##About

luxe is a free, open source cross platform rapid development haxe based game engine    
for deploying games on Mac, Windows, Linux, Android, iOS and WebGL.

<img title="Mac" alt="Mac" src="images/mac64.png" class="platform-icon-64"/>
<img title="Linux" alt="Linux" src="images/linux64.png" class="platform-icon-64"/>
<img title="Windows" alt="Windows" src="images/windows64.png" class="platform-icon-64"/>
<img title="WebGL" alt="WebGL" src="images/web64.png" class="platform-icon-64"/>
<img title="iOS" alt="iOS" src="images/ios64.png" class="platform-icon-64"/>
<img title="Android" alt="Android" src="images/android64.png" class="platform-icon-64"/>


luxe is built on top of open source technologies, and proudly powered by [Haxe](http://haxe.org). It's built on top of [snow](http://snowkit.org/snow), uses [flow](http://snowkit.org/flow) to build and is built with simplicity in mind. You code only in haxe, and deploy to all available platforms.


[ ![haxe](images/haxe.png) ](http://haxe.org)

----

<a name="quick"></a>
<h2>Quick look</h2>
<small>[more quick examples](quick.html)</small>
 
** A simple sprite **


    var player = new Sprite({
        texture : Luxe.loadTexture('assets/player.png'),
        pos : Luxe.screen.mid,
        depth : 4
    });

---
### brief design philosophy

####luxe is a facilitator

The engine supplies and supports common patterns for making games, like _Components/Entity_ systems, _State Machines_ and _Events_ messaging systems. 

**_These are not enforced_** and do not stop you from bypassing those in favour of your own specific methodology or architecting.   

luxe contains many helpers, functions and systems for you to use when building your games, allowing luxe to be feature packed without being bloated.
luxe is minimilistic in core and design, in that application domain features are left up to libraries and the application itself.

It might not supply every feature you need for your specific game, but it will make it very easy to get there quickly.
For more concrete examples of this in practice, read the [design philosophy](design.html) page.

----
<a name="docs"></a>

## Guides

###[view the setup guide](setup.html)   
###[view the luxe guide](guide.html)   

----

##Documentation

###[View API docs](api/index.html) 

---

##Features

Take note there are features that are not listed,   
pending features are [dissected in the roadmap](#roadmap).

These features may not be what you expect them to be.   
Read the design links for more info.   

<small>
`design` : Brief details on what the system is about, and contains.   
`guide` : User guide link for the feature, explained in depth.   
</small>


**Short list and focuses**

- `Open` - Free and Open Source, under the [UPDATEME] license
- `Approachable` - high pace through an expressive, easy to use API. 
- `Rapid` Fits jam games and long form projects alike.
- `Documentation` - continuous focus on documenting with high standards
- `Audio` - OpenAL/HowlerJS backed audio, named or instance based API
- `Rendering` - WebGL spec based API, same code on all platforms
- `Portable` - written to be ported, supporting new platforms is simpler
- `Input` - Low level, immediate, event based OR high level input API for Gamepad, Touch, Keys and Mouse

**gameplay**

- `Scene` - simple auto scene state management <small> [design](#), [guide](#) </small>
- `Collision` - SAT collision query for shapes/rays <small> [design](#), [guide](#) </small>
- `Physics` - third party framework hooks, i.e [nape](http://napephys.com/).  <small> [design](#), [guide](#) </small>
- `Transforms` - stackable transforms for positioning/rendering <small> [design](#), [guide](#) </small>
- `Timing` - control over time scale, per entity fixed rates and more <small> [design](#), [guide](#) </small>
- `Timer` - schedule functions and events into the timeline <small> [design](#), [guide](#) </small>
- `Audio` - simple to use but flexible audio api <small> [design](#), [guide](#) </small>

**Rendering**

- `Sprite` - visual backed class with animation, flipping etc <small> [design](#), [guide](#sprite) </small>
- `Color` - handle HSV, HSL, RGB interchangeably <small> [design](#), [guide](#color) </small>
- `Render` - automatic or self managed batching of geometry <small> [design](#), [guide](#rendering) </small>
- `Render control` - flexible depth, blending and group rendering <small> [design](#), [guide](#render_control) </small>
- `OpenGL` - direct or indirect access to WebGL spec API <small> [design](#), [guide](#opengl) </small>
- `Shaders` - first class citizen, built into the core of rendering <small> [design](#), [guide](#) </small>
- `Camera` - split views, focus, rotation, shake, etc built in <small> [design](#), [guide](#) </small>
- `Tilemaps` - isometric, ortho support, with import from [Tiled](http://mapeditor.org) <small> [design](#), [guide](#) </small>
- `Drawing` - easy style shape/geometry drawing API <small> [design](#), [guide](#) </small>
- `Nineslice` - for scaling of assets like UI elements <small> [design](#), [guide](#) </small>
- `Particles` - simple particle support for quick effects <small> [design](#), [guide](#) </small>
- `Textures` - easy to use texture api, fully supports render to texture <small> [design](#), [guide](#) </small>
- `Fonts` - BMFont based bitmap font rendering <small> [design](#), [guide](#) </small>

**systemic**

- `Assets` - cross platform access to assets <small> [design](#), [guide](#) </small>
- `Maths` - support for Vector, Matrix and Quaternion based maths <small> [design](#), [guide](#) </small>
- `States` - modal, transient and stacked state machine <small> [design](#), [guide](#events) </small>
- `Events` - expressive filterable local or global event system <small> [design](#), [guide](#states) </small>
- `Components` - modular code behavior composition <small> [design](#), [guide](#components) </small>
- `Structural` - common data structures [link](https://github.com/underscorediscovery/structural)
- `Tweening` - customized Actuate built in <small> [design](#), [guide](#tweening) </small>
- `Utils` - many geometrical and game related utilities <small> [api](api/index.html#luxe.utils) </small>
- `Parcel` - control preloading, loading/unloading parcels of assets <small> [design](#), [guide](#parcels) </small>


&nbsp;
&nbsp;

##Games developed in luxe
Either developed, or developing

---

###The Westport Independent
[news page](https://twitter.com/0010_Games)   
[home page](http://www.doublezeroonezero.com/westport.html)   

![wpi_menu](images/games/wpi/wpi_logo.png)

&nbsp;
&nbsp;

---

###Untitled RTS exploration game
[news page](https://twitter.com/___discovery)   
[home page](http://notes.underscorediscovery.com/)

<iframe src="http://gfycat.com/ifr/HeartySilverBorderterrier" frameborder="0" scrolling="no" width="600" height="500" style="-webkit-backface-visibility: hidden;-webkit-transform: scale(1);" ></iframe>

---

###Equilibrium (working title)
[news page](https://twitter.com/bennpowell)

![eq_menu](images/games/eq/eq_menu.png)

---

![eq_ingame](images/games/eq/eq_ingame.png)

&nbsp;
&nbsp;

&nbsp;
&nbsp;

&nbsp;
&nbsp;


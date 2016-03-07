
[![Logo](http://luxeengine.com/images/logo.png)](./index.html)

 [api](#api) • [guide](#docs) • [source](https://github.com/underscorediscovery/luxe) • [issues](https://github.com/underscorediscovery/luxe/issues) 

A free and open cross platform game development engine.   

---

<script src="{{{rel_path}}}js/release.version.js"> </script>
<div class="version">current version <a href="https://github.com/underscorediscovery/luxe/" id="version_notes_link" target="_blank">notes</a> <code> <a id="version_tag" target="_blank" href="https://github.com/underscorediscovery/luxe/"> master </a></code> </div>

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
        texture : Luxe.resources.texture('assets/player.png'),
        pos : Luxe.screen.mid,
        depth : 4
    });

---

###Community

#### Home
Join the community on http://snowkit.org   
and share your projects, ask questions and   
view additional setup guides and tutorials. 

**Please visit http://snowkit.org for the latest news and changes that are happening!**

All news regarding luxe is posted on snowkit.org,   
plus you get to see what others are making.

#### Chat
You can also also join the [community chat](http://snowkit.org/chat) for realtime discussion and help.

[![snowkit](./images/snowkit.png)](http://snowkit.org)

---

###Alpha

<small>
Please note   

luxe is currently considered alpha, which means there may be bugs, inconsistencies, incomplete implementations, and possible minor API changes.
It is still considered fairly stable and is being used by multiple tools and games,
but there are things to tighten up before 1.0.0 release can be called final. 

Join us in developing and testing the engine and tools, below.
</small>

####2D focus

For version 1.0.0 luxe will focus solely on being a really solid, flexible 2D game engine first. That doesn't mean that 3D is not possible, there are already 3D tests and examples around the repo but please be aware there is no lighting model, very little 3D file imports this is intentional.

The roadmap will speak more of this soon.

---

### brief design philosophy

####luxe is a facilitator

The engine supplies and supports common patterns for making games, like _Components/Entity_ systems, _State Machines_ and _Events_ messaging systems. 

**_These are not enforced_** and do not stop you from bypassing those in favour of your own specific methodology or architecting.   

luxe contains many helpers, functions and systems for you to use when building your games, allowing luxe to be feature packed without being bloated.
luxe is minimilistic in core and design, in that application domain features are left up to libraries and the application itself.

It might not supply every feature you need for your specific game, but it will make it very easy to get there quickly.
For more concrete examples of this in practice. Click the diagram below for a full picture of the architecture/design.

<a href="./images/luxe-design.png" target="_blank"> <img src="./images/luxe-design-small.png" /> </a>

----
<a name="docs"></a>

## Guides

###[view the setup guide](setup.html)   
###[view the luxe guide](guide.html)   

----
<a name="api"></a>

##Documentation

###[View API docs](api/index.html) 

---

<style> img {max-width:32em;} </style>

## Editor support

Where possible, full code completion and building from the editor is supplied.

#### [Sublime Text](https://underscorediscovery.github.io/flow/guide/sublimetext.html) (mac/windows/linux)
[![](images/plugins/sublime.png)](https://underscorediscovery.github.io/flow/guide/sublimetext.html)

---

#### [Atom](https://atom.io/packages/flow) (mac/windows/linux)
[![](images/plugins/atom.png)](https://atom.io/packages/flow)

---

#### [FlashDevelop](https://underscorediscovery.github.io/flow/guide/flashdevelop.html) (windows only)

template is at [snowkit-fd](https://github.com/Chman/Snowkit-FD), and here is a [Download link](https://github.com/Chman/Snowkit-FD/blob/master/SnowkitTemplate.fdz?raw=true)   

[![](images/plugins/fd.png)](https://underscorediscovery.github.io/flow/guide/flashdevelop.html)

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

- `Open` - Free and Open Source, under the [MIT license](https://github.com/underscorediscovery/luxe/blob/master/LICENSE.md)
- `Approachable` - high pace through an expressive, easy to use API. 
- `Rapid` Fits jam games and long form projects alike.
- `Documentation` - continuous focus on documenting with high standards
- `Audio` - OpenAL/HowlerJS backed audio, named or instance based API
- `Rendering` - WebGL spec based API, same code on all platforms
- `Portable` - written to be ported, supporting new platforms is simpler
- `Input` - Low level, immediate, event based OR high level input API for Gamepad, Touch, Keys and Mouse

**gameplay**

- `Scene` - simple auto scene state management <small> ~~[guide](#)~~ </small>
- `Collision` - SAT collision query for shapes/rays <small> ~~[guide](#)~~ </small>
- `Physics` - third party framework hooks, i.e [nape](http://napephys.com/).  <small> ~~[guide](#)~~ </small>
- `Transforms` - stackable transforms for positioning/rendering <small> ~~[guide](#)~~ </small>
- `Timing` - control over time scale, per entity fixed rates and more <small> ~~[guide](#)~~ </small>
- `Timer` - schedule functions and events into the timeline <small> [guide](guide.timers.html) </small>
- `Audio` - simple to use but flexible audio api <small> ~~[guide](guide.audio.html)~~ </small>

**Rendering**

- `Sprite` - visual backed class with animation, flipping etc <small> [guide](guide.sprite.html)</small>
- `Color` - handle HSV, HSL, RGB interchangeably <small> [guide](guide.color.html) </small>
- `Render` - automatic or self managed batching of geometry <small> ~~[guide](#rendering)~~ </small>
- `Render control` - flexible depth, blending and group rendering <small> [guide](guide.rendercontrol.html) </small>
- `OpenGL` - direct or indirect access to WebGL spec API <small> ~~[guide](#opengl)~~ </small>
- `Shaders` - first class citizen, built into the core of rendering <small> [guide](guide.shaders.html) </small>
- `Camera` - split views, focus, rotation, shake, etc built in <small> ~~[guide](guide.camera.html)~~ </small>
- `Tilemaps` - isometric, ortho support, with import from [Tiled](http://mapeditor.org) <small> ~~[guide](#)~~ </small>
- `Drawing` - easy style shape/geometry drawing API <small> [guide](guide.drawing.html) </small>
- `Nineslice` - for scaling of assets like UI elements <small> ~~[guide](#)~~ </small>
- `Particles` - simple particle support for quick effects <small> ~~[guide](guide.particles.html)~~ </small>
- `Textures` - easy to use texture api, fully supports render to texture <small> ~~[guide](guide.textures.html)~~ </small>
- `Fonts` - BMFont based bitmap font rendering <small> [guide](guide.fonts.html) </small>

**systemic**

- `Assets` - cross platform access to assets <small> [guide](guide.assets.html) </small>
- `Maths` - support for Vector, Matrix and Quaternion based maths <small> ~~[guide](#)~~ </small>
- `States` - modal, transient and stacked state machine <small> ~~[guide](#states)~~ </small>
- `Events` - expressive filterable local or global event system <small> [guide](guide.events.html) </small>
- `Components` - modular code behavior composition <small> [guide](guide.basiccomponents.html) </small>
- `Structural` - common data structures [link](https://github.com/underscorediscovery/structural)
- `Tweening` - customized Actuate built in <small> [guide](guide.tween.html) </small>
- `Utils` - many geometrical and game related utilities <small> [api](api/index.html#luxe.utils) </small>
- `Parcel` - control preloading, loading/unloading parcels of assets <small> ~~[guide](#parcels)~~ </small>


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

###-Heavier than Air-

[dev log](http://forums.tigsource.com/index.php?topic=47030.0)   
[game post](http://snowkit.org/2015/01/21/heavier-than-air-wip/)

![htamenu](images/games/hta/1.png)


<iframe src="http://gfycat.com/ifr/JauntySpiffyHeifer" frameborder="0" scrolling="no" width="532" height="167" style="-webkit-backface-visibility: hidden;-webkit-transform: scale(1);" ></iframe>


###SOIL

[news page](http://soil.sudsdev.net/)   
[twitter](https://twitter.com/JustSuds)   

![soil_ingame](images/games/soil/soil_ingame.png)

<iframe width="420" height="315" src="http://www.youtube.com/embed/wPttCM7-GRc" frameborder="0" allowfullscreen></iframe>

---

###Operator Overload 
[news page](https://twitter.com/bennpowell)   
[game post](http://snowkit.org/2016/02/25/luxe-alpha-3-0-bennpowell/)

![eq_menu](images/games/eq/eq_menu.png)

<iframe src='https://gfycat.com/ifr/IdleWellmadeGermanspitz' frameborder='0' scrolling='no' width='420' height='504' allowfullscreen></iframe>

&nbsp;
&nbsp;

&nbsp;
&nbsp;

&nbsp;
&nbsp;



[![Logo](http://luxeengine.com/images/logo.png)](index.html)

#### Just starting out?
Don't miss the [ setup guide ](setup.html).

## Choose your destination
----
###[ Beginners guide ](#beginnersguide)   
**The beginners guide is a linear guide**,   
it follows a semi logical progression about getting started with luxe.

[ Getting Started ](#gettingstarted)    
[ Images and sprites ](#imagesandsprites)    
[ Sprites and animation ](#spritesandanimation)    
[ Text and tweening ](#textandtweening)    

<a name="list"></a>
###[ Feature guide ](#featureguide)   
The feature guide is a piece by piece reference for specific features of the engine, designed to explain and teach what the engine can do.

**gameplay**

[ timers ](#timers)   
[ transforms ](#transforms)
~~app timing~~    
~~audio~~    
~~scene~~    
~~physics~~    
~~collision~~    

**rendering**

[ sprite ](#sprite)   
[ sprite animation ](#spriteanimation)    
[ color ](#color)    
~~render batching~~   
[ render control ](#rendercontrol)   
[ shaders ](#shaders)    
~~cameras~~    
~~tilemaps~~    
[ drawing ](#drawing)    
~~nineslice~~    
~~particles~~    
~~textures~~   
[ fonts ](#fonts)    

**systems**

[ assets ](#assets)   
~~maths~~   
~~states~~    
[ events ](#events)   
[ components ](#components)   
[ tweening ](#tweening)    
[ utils ](#utils)    


###[ Details guide ](#detailguide)   
The detail guide is a look at the inner structure and design philosophy behind the engine and it's pieces, as well as elaborate on common questions.

[ ~~OpenGL API access~~ ](#opengl)  
[ ~~OpenAL API access~~ ](#openal)  
[ ~~snow API access~~ ](#snow)  


###[ Advanced guide ](#advancedguide)   
The advanced guide is for more experienced developers looking to fully understand and take advantage of squeezing more out of the engine.


----

<a name="beginnersguide"> </a>

## Beginners guide

<a name="gettingstarted"> </a>
### [ Getting Started with luxe ](guide.one.html)
- Understanding the anatomy of a luxe game,   
drawing a sprite, and moving it around.
[ ![getting started guide screenshot](images/guide.one.png) ](guide.one.html)

<a name="imagesandsprites"> </a>
### [ Images and sprites ](guide.two.html)
- Drawing static images, flipping, and movement
[ ![sprites guide screenshot](images/guide.two.png) ](guide.two.html)

<a name="spritesandanimation"> </a>
### [ Sprites and animation ](guide.three.html)
- Drawing animated sprites, preloading, and more
[ ![sprite anim guide screenshot](images/guide.three.png) ](guide.three.html)

<a name="textandtweening"> </a>
### [ Text and tweening ](guide.four.html)
- Playing some sounds, fading, simple events, text and more
[ ![text guide screenshot](images/guide.four.png) ](guide.four.html)

----
<a class="toplink" href="#">back to top</a>
<a name="featureguide"> </a>

## Feature guide
####These can be used and read in any order

These vary from feature reference guides to in depth article guides.

---
<a class="toplink" href="#">back to top</a>

### Gameplay

### scene
- Scene/entity relationship

### physics
- Physics hook implementation
![physics guide screenshot](images/guide.physics.png)

### collision
- SAT collision query helpers
![collision guide screenshot](images/guide.collision.png)

<a name="transforms"> </a>
### [transforms](guide.transforms.html)
- transformation stack for spatial control (pos/rot/scale)
![transform guide screenshot](images/guide.transforms.png)

### app timing
- app timing, timescale, fixed rate, etc

<a name="timers"> </a>
### [timers](guide.timers.html)
- scheduling things in time, once or repeating

### audio
- playing music and sound effects

---
<a class="toplink" href="#">back to top</a>

### Rendering

<a name="sprite"> </a>
### [ sprite ](guide.sprite.html)
- Sprite feature guide

<a name="spriteanimation"> </a>
### [ sprite animation ](guide.spriteanimation.html)
- How to bring your sprites to life by importing sprite sheets or using separate images.

<a name="color"> </a>
### [ color guide ](guide.color.html)
- The different types of color classes and utility functions for handling HSL, HSV, and RGB color.
[ ![color guide screenshot](images/guide.color.png) ](guide.color.html)

### render batching
- understanding and using the batching system effectively

<a name="rendercontrol"> </a>
### [render control](guide.rendercontrol.html)
- controlling depth, blend mode, and using render events like pre/post render
[ ![render control guide screenshot](images/guide.rendercontrol.png) ](guide.rendercontrol.html)

<a name="shaders"> </a>
### [ shader guide ](guide.shaders.html)
- Understanding how to use shaders on your sprites or geometry.
[ ![shader guide screenshot](images/guide.shaders.png) ](guide.shaders.html)

### cameras
- creating and manipulating views
![camera guide screenshot](images/guide.cameras.png)

### tilemaps
- creating manually, or loading tilemaps from Tiled
![tiles guide screenshot](images/guide.tiles.png)

<a name="drawing"> </a>
### [ drawing guide ](guide.drawing.html)
- How to draw shapes, text, and to create custom geometry
[ ![sprites guide screenshot](images/guide.drawing.png) ](guide.drawing.html)

### nineslice
- "Nine slice" scaleable graphics helper guide

### particles
- using the default simple particle system
![particle guide screenshot](images/guide.particles.png)

### textures
- managing and working with textures and render textures

<a name="fonts"> </a>
### [fonts](guide.fonts.html)
- creating, loading and displaying custom bitmap fonts


---
<a class="toplink" href="#">back to top</a>

### Systems

<a name="assets"> </a>
### [ assets ](guide.assets.html)
- loading and using text, bytes, or other assets with parcels

### maths
- using Matrix, Quaternion and Vector and Math utils

### states
- using the built in state machine, for stackable, transient or modal states

<a name="events"> </a>
### [ events ](guide.events.html)
- Using the event system to communicate locally and globally.

<a name="components"> </a>
### [ components ](guide.basiccomponents.html)
- using the built in component entity system

<a name="tweening"> </a>
### [ tweening ](guide.tween.html)
- Making things animate smoothly over time using tweening.
[ ![tween guide screenshot](images/guide.tween.png) ](guide.tween.html)

<a name="utils"> </a>
### [ utils ](guide.utils.html)
- Find out about utilities like maths and geometry functions


----
<a class="toplink" href="#">back to top</a>
<a name="detailguide"> </a>

## Detail guide

:todo:

----
<a class="toplink" href="#">back to top</a>

<a name="advancedguide"> </a>

:todo:

----
<a class="toplink" href="#">back to top</a>


&nbsp;   
&nbsp;   
&nbsp;   



[![Logo](http://luxeengine.com/images/logo.png)](index.html)

Don't miss the [ setup guide ](setup.html) if you are only just getting things installed.


## Choose your destination
----
###[ Beginners guide ](#beginnersguide)   
**The beginners guide is a linear guide**,   
it follows a semi logical progression about getting started with luxe.

[ Getting Started ](#gettingstarted)    
[ Images and sprites ](#imagesandsprites)    
[ Sprites and animation ](#spritesandanimation)    


###[ Feature guide ](#featureguide)   
The feature guide is a piece by piece reference for specific features of the engine, designed to explain and teach what the engine can do.

**gameplay**

[ ~~scene~~ ](#scene)    
[ ~~physics~~ ](#physics)    
[ ~~collision~~ ](#collision)    
[ ~~transforms~~ ](#transforms)    
[ ~~timing~~ ](#timing)    
[ ~~timers~~ ](#timers)    
[ ~~audio~~ ](#audio)    

**rendering**

[ sprite ](#sprite)   
[ sprite animation ](#spriteanimation)    
[ color ](#color)    
[ ~~rendering~~ ](#rendering)   
[ ~~render control~~ ](#render_control)   
[ shaders ](#shaders)    
[ ~~cameras~~ ](#camera)    
[ ~~tilemaps~~ ](#tilemap)    
[ drawing ](#drawing)    
[ ~~nineslice~~ ](#nineslice)    
[ ~~particles~~ ](#particles)    
[ ~~textures / render textures~~ ](#textures)    
[ ~~fonts~~ ](#fonts)    

**systems**

[ ~~assets~~ ](#assets)   
[ ~~maths~~ ](#maths)   
[ ~~states~~ ](#states)    
[ events ](#events)   
[ components ](#components)   
[ tweening ](#tweening)    
[ ~~utils~~ ](#utils)    


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
[ ![input guide screenshot](images/guide.three.png) ](guide.three.html)

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

### transforms
- transformation stack for spatial control (pos/rot/scale)
![transform guide screenshot](images/guide.transforms.png)

### timing
- app timing, timescale, fixed rate, etc

### timers
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

### rendering
- understanding and using the batching system effectively

### render control
- controlling depth, blend mode, and render events

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

### fonts
- loading and displaying custom bitmap fonts


---
<a class="toplink" href="#">back to top</a>

### Systems

### assets
- loading and using text, bytes, or other assets with parcels

### maths
- using Matrix, Quaternion and Vector and Math utils

### states
- using the built in state machine, for stackable, transient or modal states

<a name="events"> </a>
### [ events ](guide.events.html)
- Using the event system to communicate locally and globally.

<a name="tweening"> </a>
### [ tweening ](guide.tween.html)
- Making things animate smoothly over time using tweening.
[ ![tween guide screenshot](images/guide.tween.png) ](guide.tween.html)

### utils
- find out about various utility functions and features in luxe


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


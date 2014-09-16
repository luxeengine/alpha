
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

---
## SpriteAnimation feature guide
---

The [beginners guides](guide.html#beginnersguide) cover the basic sprite and sprite animation usage.


The `SpriteAnimation` class extends the `Component` class,   
allowing it to be attached to a `Sprite`.

This component can only be attached to a `Sprite` or child instance.

### Animation type

The SpriteAnimation component supports

- uv animation from a packed sprite sheet
- image sequence from separate textures

### Controlling playback

For each example, anim is an instance of a `SpriteAnimation`

#### get/set animation

`anim.animation = 'name';`   
`var name = anim.animation;`   

### With current animation

#### get/change speed

`anim.speed = 25;`   
`var speed = anim.speed;`   

#### set specific frame

uses frame index, not image frame

`anim.set_frame( 6 );`

#### control playback

`anim.restart();`   
`anim.play();`   
`anim.stop();`   

### add/remove frame events

`anim.add_event( 'animation', 6, 'event_name' );`   
`anim.remove_event( 'animation', 6, 'event_name' );`   
`anim.remove_events( 'animation', 6 );`   

### Animation Data

The animation frame JSON data consists of the following properties :

#### UV & Image sequence

- `pingpong` : Bool
    - default: false
    - if true, the animation will reverse at the last frame
    - 1  2  3  2  1
- `loop` : Bool
    - default: false
    - if true, the animation will continue to loop
    - 1  2  3  1  2  3 etc
    - can combine with pingpong
- `reverse` : Bool
    - default: false
    - if true, animation will play in reverse
    - can combine with pingpong and loop
    - 3  2  1
- `speed` : Float
    - default: 2
    - frames per second to play at
    - can be 0
- `events` : Array of { frame:Int, ?event:String }
    - fires named _event_ on _frame_ into the attached sprite
    - IF _event_ is not given:
    - {animation}.event.{frame}, i.e "walk.event.5"
    - handler given [SpriteAnimationEventData](api/luxe/components/SpriteAnimationEventData.html)
- `frameset` : Array of String
    - required
    - sequential list of frames or frame actions:
    - range : "1-10"
    - frame : "1"
    - `hold n` hold current for _n_ frames of time : "hold 10"
    - `f hold n` hold specific frame _f_ for _n_ frames : "1 hold 10"
- `frame_size` : { x:Int, y:Int }
    - the size of a frame in texture pixels
    - acts as the default for frame_sources, if any
- `frame_sources` : { frame:Int, pos:{ x:Int, y:Int }, size:{ w:Int, h:Int }, source:{ x:Int, y:Int, w:Int, h:Int } }
    - optional
    - per frame custom size, position and source uv rect
    - uses frame_size in place of missing info

#### Image sequence only

- `image_sequence` : String
    - name of a sequence of images :
    - i.e assets/idle => assets/idle0.png ... assets/idleN.png
    - will search for :
    - `name_0`, `name-0`, `name0` patterns
- `filter_type` : String
    - "linear" or "nearest", to set when loading the sequence

&nbsp;   

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   
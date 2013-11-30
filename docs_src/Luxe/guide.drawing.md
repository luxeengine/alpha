
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#drawing)
###[View all guides](guide.html)


## Drawing shapes and geometry in luxe
---

Luxe supports drawing a few shapes by default, each with some very similar options available. We can start by defining which functions are available, these functions are accessed via the Luxe api under `Luxe.draw`.

- line    
- rectangle
- box
- ring
- circle
- arc
- pie
- text

You should notice a pattern here - a rectangle is an outline, and a box is filled in. A ring is an outline, a circle is filled in. An arc is an outline, a pie is filled in. 

## Common options for drawing functions
---
Each drawing function takes a single `options` parameter but there are a couple of shared options:

- color `Color`
- depth `Float`
- group `Int`
- immediate `Bool`
- batcher `Batcher`
- pos `Vector`

###Unique options 
---
Obivously not all functions share all properties, here is the unique properties that are available

#### text
    
- text `String` The text to draw
- font `BitmapFont` The font to use when drawing

#### line

- p0 `Vector` The first point on the line
- p1 `Vector` The second point on the line

#### circle / ring

- r `Float` The radius of the circle

#### arc / pie

- r `Float` The radius of the circle
- end_angle `Float` The ending angle of the arc

---

###Live demo
---

<div data-content="samples/test_draw/index.html" class="sample"> <p>Click to run example</p> </div>

---

&nbsp;   

&nbsp;   

###[Back to feature guide](guide.html#drawing)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   
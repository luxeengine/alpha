
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#shaders)
###[View all guides](guide.html)

---
## Applying shaders to geometry
---

When you draw something on screen, it is generally submitted as some geometry. That is, a set of vertices describing the geometry, is sent to the graphics card for rendering. A sprite, is a "quad", and generally is sent as two triangles.

When you send geometry to the graphics card to be drawn, you can specify custom shaders to use that will be applied to the geometry.   
There are two kinds of shaders to understand for now - don't worry, they always sound really complex but in principle they are quite logical.



###Live demo
---
Mouse x axis controls the distortion in the distort shader.
Mouse x axis controls the hue degrees in the Hue change shader.
Level background has a severe tilt shift shader that also desaturates the image.

<div data-content="samples/test_shaders/index.html" class="sample"> <p>Click to run example</p> </div>

---

&nbsp;   

###[Back to feature guide](guide.html#shaders)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   
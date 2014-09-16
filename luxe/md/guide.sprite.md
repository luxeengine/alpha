
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

---
## Sprite feature guide
---

The [beginners guides](guide.html#beginnersguide) cover the basic sprite usage.

The `Sprite` class extends the `Visual` class, which is a geometry container.

`Sprite` is also an `Entity`, so it can accept `Component` attachments.

The sprite class is a Quad based geometry, and facilitates common actions with a quad based, textured sprite.
If you want other geometrical control, use `Visual` instead, as sprite is specific to a quad.

In concept a sprite is 2D, but no restriction on 3D rotation or positioning is employed. All 2D helpers will only affect x/y properties of the sprite.

###list specific features

#### centered

By default, the sprite origin will be centered. By setting the centered flag to false, it will be top left instead.
The centered flag is used only when a custom origin is not specified, it will not override the explicit origin.

The centered flag sets the origin to `size/2` essentially.

#### flipx/flipy

The flipx and flipy flags will flip the geometry along it's own x or y axis respectively.   
Flipping works by changing the UV coordinates of the texture, based on their existing coordinates.

If the flip flag is already setting, setting it twice has no effect, so you can safely do so.

#### size

The size of the geometry in units, which allows setting a baseline size of the geometry. This differs from the scale transform as it is in units, allowing simpler scaling through a preset size.

#### uv

A rectangle in texture pixels for the UV coordinates of this sprite. Can be animated through setting the properties of the UV or assigning a new UV.

#### rotation_z

A convenience for setting the 2D rotation (around the z axis) _in degrees_. Will reflect changes to _radians_.

#### radians

A convenience for setting the 2D rotation (around the z axis) _in radians_. Will reflect changes to _rotation_z_.




---

&nbsp;   

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   
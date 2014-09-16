
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)


## Render sorting

The rendering works by sorting items according to the following high level rules :

- Renderer
    - batchers, sorted by `layer` property
        - geometry, sorted by a order sort
            - `depth`
            - shader
            - texture
            - primitive
            - clipping
            - age

In general use, you control specific batches of items using a `Batcher`, specifying it's layer for overall order. Then, you specify geometry depths, **the rest is automatic**.

### Geometry depth

In luxe, "geometry depth" is not the same as the geometry z position in world space. The depth is a render tree depth, **controlling render order explicitly**.

If you want to draw spriteA above spriteB, setting spriteA depth to 2, and spriteB depth to 1, it will always rendering second.

##### depth values

The depth value **is a floating point number* which is convenient for "last minute" depth control, allowing finely grained details to matter. Some examples can be "all hud elements are between 10 and 11", where 10.1 is hud background, 10.2 is hud buttons, 10.3 is hud text and so on.

Because of this, `10.1` is a valid depth and so is `10.142325`. The granularity is subject to floating point errors, so try not to go too small here or you may get different sorting.

##### uses
This is especially useful when render depth is calculated dynamically. In a 2D front down view, the depth can simply be the Y position in world space, and as avatars move through the space they update their depth to their position. It also allows division to be used to calculate sorting, which is helpful in situations where depth is calculated on the fly.

As the depth value is the first rule, it can also be used when working with depth testing and transparent objects. You could split transparent objects into a separate batcher, and control it as a whole, or you can separate it using the depth values, ensuring the render order is respected.

---

## Render callbacks

In your [game class](api/luxe/Game.html) you can override the `onprerender`, `onrender` and `onpostrender` events.

These are for _all_ rendering that happens, not a specific subset of geometry. This is useful if you want to do some explicit rendering into render targets before the rest is processed.

### Group render callbacks

In luxe, in phoenix (the rendering engine in luxe) you can give geometry (and therefore sprites etc) a group number.

The group number is a simple integer, and allows you to group geometry such that a pre/post render callback can be triggered. This allows you to specify custom render state (like blend modes) or control rendering into textures explicitly through the use of a group number.

Take a look at this example, we ask the default batcher to tell us when group 3 is rendered.

```
override function ready() {

    Luxe.renderer.batcher.add_group( 3, pre_group3, post_group3 );

} //ready

function pre_group3(_) {

        //change how this group is blended
    Luxe.renderer.blend_mode( BlendMode.dst_color, BlendMode.one_minus_src_alpha );

} //pre_group3

function post_group3(_) {

        //reset to default
    Luxe.renderer.blend_mode();

} //post_group3
```

And the results would be similar to :

![](images/guide.rendercontrol.1.png)


Blending and blendmodes are a very frequent topic in rendering and you can explore the different types here :

[Anders Riggelsen blend modes online tool](http://www.andersriggelsen.dk/glblendfunc.php)

---

&nbsp;

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

&nbsp;
&nbsp;
&nbsp;
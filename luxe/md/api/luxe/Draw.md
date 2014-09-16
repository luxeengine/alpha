
[![Logo](../../images/logo.png)](../../api/index.html)

---


<h1>Draw</h1>
<small>`luxe.Draw`</small>

The `Luxe.draw` API class implementation.
    This class handles quick access to drawing common geometry options,
    and is a facilitator for higher level drawing. These can be used given to a `Visual` to convert
    them into a higher level entity for use with the default scene.

<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="arc"><a class="lift" href="#arc">arc</a></a><div class="clear"></div>
            <code class="signature apipage">arc(options:[luxe.options.DrawArcOptions](../../api/luxe/options/DrawArcOptions.html)<span></span>) : [phoenix.geometry.ArcGeometry](../../api/phoenix/geometry/ArcGeometry.html)</code><br/><span class="small_desc_flat">Draw an arc (open circle) at the specified `x`,`y`, between `start_angle` and `end_angle` with radius `r` (or `rx`,`ry` optionally for an ellipsical arc), with options</span>

```
    //draws a 60 degree arc center screen
var geometry = Luxe.draw.arc({
    r : 70,
    end_angle:60,
    x : Luxe.screen.w/2,
    y : Luxe.screen.h/2,
    color : new Color(1,1,1,1)
});
```
</span>
<span class="method apipage">
            <a name="box"><a class="lift" href="#box">box</a></a><div class="clear"></div>
            <code class="signature apipage">box(options:[luxe.options.DrawBoxOptions](../../api/luxe/options/DrawBoxOptions.html)<span></span>) : [phoenix.geometry.QuadGeometry](../../api/phoenix/geometry/QuadGeometry.html)</code><br/><span class="small_desc_flat">Draw a solid rectangle box at the specified `x`,`y`,`w`,`h` with options</span>

```
    //draw a filled box just inside the screen
var geometry = Luxe.draw.box({
    x : 40, y : 40,
    w : Luxe.screen.w - 80,
    h : Luxe.screen.h - 80,
    color : new Color(0,0,0,0.5)
});
```
</span>
<span class="method apipage">
            <a name="circle"><a class="lift" href="#circle">circle</a></a><div class="clear"></div>
            <code class="signature apipage">circle(options:[luxe.options.DrawCircleOptions](../../api/luxe/options/DrawCircleOptions.html)<span></span>) : [phoenix.geometry.CircleGeometry](../../api/phoenix/geometry/CircleGeometry.html)</code><br/><span class="small_desc_flat">Draw a solid circle at the specified `x`,`y` with radius `r` (or `rx`,`ry` optionally for an ellipse), with options</span>

```
    //draw a solid circle center screen
var geometry = Luxe.draw.circle({
    x : Luxe.screen.w/2,
    y : Luxe.screen.h/2,
    r : 50,
    color : new Color(0,0,0,1).rgb(0xff4b03)
});
```
</span>
<span class="method apipage">
            <a name="line"><a class="lift" href="#line">line</a></a><div class="clear"></div>
            <code class="signature apipage">line(options:[luxe.options.DrawLineOptions](../../api/luxe/options/DrawLineOptions.html)<span></span>) : [phoenix.geometry.LineGeometry](../../api/phoenix/geometry/LineGeometry.html)</code><br/><span class="small_desc_flat">Draw a line geometry between points `p0` and `p1` with options</span>

```
    //draws a line horizontally across the screen
var geometry = Luxe.draw.line({
    p0 : new Vector( 0, Luxe.screen.h/2 ),
    p1 : new Vector( Luxe.screen.w, Luxe.screen.h/2 ),
    color : new Color(0.5,0.2,0.2,1)
});
```
</span>
<span class="method apipage">
            <a name="ngon"><a class="lift" href="#ngon">ngon</a></a><div class="clear"></div>
            <code class="signature apipage">ngon(options:[luxe.options.DrawNgonOptions](../../api/luxe/options/DrawNgonOptions.html)<span></span>) : [phoenix.geometry.Geometry](../../api/phoenix/geometry/Geometry.html)</code><br/><span class="small_desc_flat">Draw an n-sided polygon (3 sides for triangle, 6 for hexagon etc) at `x`,`y` with a radius `r` and `sides` with options</span>

```
    //draw a solid triangle center screen
Luxe.draw.ngon({
    r:200,
    sides : 3,
    solid : true,
    color: new Color(1,1,1,0.1),
    x:Luxe.screen.mid.x, y:Luxe.screen.mid.y
});
```
</span>
<span class="method apipage">
            <a name="rectangle"><a class="lift" href="#rectangle">rectangle</a></a><div class="clear"></div>
            <code class="signature apipage">rectangle(options:[luxe.options.DrawRectangleOptions](../../api/luxe/options/DrawRectangleOptions.html)<span></span>) : [phoenix.geometry.RectangleGeometry](../../api/phoenix/geometry/RectangleGeometry.html)</code><br/><span class="small_desc_flat">Draw a rectangle outline at the specified `x`,`y`,`w`,`h` with options</span>

```
    //draws a outline rectangle just inside the screen
var geometry = Luxe.draw.rectangle({
    x : 10, y : 10,
    w : Luxe.screen.w - 20,
    h : Luxe.screen.h - 20,
    color : new Color(0.4,0.4,0.4)
});
```
</span>
<span class="method apipage">
            <a name="ring"><a class="lift" href="#ring">ring</a></a><div class="clear"></div>
            <code class="signature apipage">ring(options:[luxe.options.DrawRingOptions](../../api/luxe/options/DrawRingOptions.html)<span></span>) : [phoenix.geometry.RingGeometry](../../api/phoenix/geometry/RingGeometry.html)</code><br/><span class="small_desc_flat">Draw a circle outline at the specified `x`,`y` with radius `r` (or `rx`,`ry` optionally for an ellipse), with options</span>

```
    //draw a outline circle center screen
ring = Luxe.draw.ring({
    x : Luxe.screen.w/2,
    y : Luxe.screen.h/2,
    r : 60,
    color : new Color(1,1,1,1)
});
```
</span>
<span class="method apipage">
            <a name="text"><a class="lift" href="#text">text</a></a><div class="clear"></div>
            <code class="signature apipage">text(options:[Dynamic](#)<span></span>) : [phoenix.geometry.Geometry](../../api/phoenix/geometry/Geometry.html)</code><br/><span class="small_desc_flat">Draw `text` at `pos` using `font` (or no font for default font) with options</span>

```
    //draw some center aligned text, center screen
Luxe.draw.text({
    color : new Color(1,1,1,1),
    pos : Luxe.screen.mid,
    size : 24,
    align : TextAlign.center,
    text : "some text \n indeed"
});
```
</span>
<span class="method apipage">
            <a name="texture"><a class="lift" href="#texture">texture</a></a><div class="clear"></div>
            <code class="signature apipage">texture(options:[luxe.options.DrawTextureOptions](../../api/luxe/options/DrawTextureOptions.html)<span></span>) : [phoenix.geometry.QuadGeometry](../../api/phoenix/geometry/QuadGeometry.html)</code><br/><span class="small_desc_flat">Draw a textured `box` with image `texture` at `x`,`y`,`w`,`h` OR with `pos` and `size`, and `uv` with options</span>

```
    //draw a texture center screen
Luxe.draw.texture({
    pos : Luxe.screen.mid,
    texture : Luxe.loadTexture('assets/logo.png'),
    size : new Vector(60,60)
});
```
</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;
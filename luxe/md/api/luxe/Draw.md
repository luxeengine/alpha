
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Draw</h1>
<small>`luxe.Draw`</small>

The `Luxe.draw` API class implementation.
    This class handles quick access to drawing common geometry options,
    and is a facilitator for higher level drawing. These can be used given to a `Visual` to convert
    them into a higher level entity for use with the default scene.

---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="line"><a class="lift" href="#line">line</a></a> <div class="clear"></div><code class="signature apipage">line(options:[luxe.options.DrawLineOptions](#)<span></span>) : [phoenix.geometry.LineGeometry](#)</code><br/><span class="small_desc_flat">Draw a line geometry between points `p0` and `p1` with options</span>
        </span>
    <span class="method apipage">
            <a name="rectangle"><a class="lift" href="#rectangle">rectangle</a></a> <div class="clear"></div><code class="signature apipage">rectangle(options:[luxe.options.DrawRectangleOptions](#)<span></span>) : [phoenix.geometry.RectangleGeometry](#)</code><br/><span class="small_desc_flat">Draw a rectangle outline at the specified `x`,`y`,`w`,`h` with options</span>
        </span>
    <span class="method apipage">
            <a name="box"><a class="lift" href="#box">box</a></a> <div class="clear"></div><code class="signature apipage">box(options:[luxe.options.DrawBoxOptions](#)<span></span>) : [phoenix.geometry.QuadGeometry](#)</code><br/><span class="small_desc_flat">Draw a solid rectangle box at the specified `x`,`y`,`w`,`h` with options</span>
        </span>
    <span class="method apipage">
            <a name="ring"><a class="lift" href="#ring">ring</a></a> <div class="clear"></div><code class="signature apipage">ring(options:[luxe.options.DrawRingOptions](#)<span></span>) : [phoenix.geometry.RingGeometry](#)</code><br/><span class="small_desc_flat">Draw a circle outline at the specified `x`,`y` with radius `r` (or `rx`,`ry` optionally for an ellipse), with options</span>
        </span>
    <span class="method apipage">
            <a name="circle"><a class="lift" href="#circle">circle</a></a> <div class="clear"></div><code class="signature apipage">circle(options:[luxe.options.DrawCircleOptions](#)<span></span>) : [phoenix.geometry.CircleGeometry](#)</code><br/><span class="small_desc_flat">Draw a solid circle at the specified `x`,`y` with radius `r` (or `rx`,`ry` optionally for an ellipse), with options</span>
        </span>
    <span class="method apipage">
            <a name="arc"><a class="lift" href="#arc">arc</a></a> <div class="clear"></div><code class="signature apipage">arc(options:[luxe.options.DrawArcOptions](#)<span></span>) : [phoenix.geometry.ArcGeometry](#)</code><br/><span class="small_desc_flat">Draw an arc (open circle) at the specified `x`,`y`, between `start_angle` and `end_angle` with radius `r` (or `rx`,`ry` optionally for an ellipsical arc), with options</span>
        </span>
    <span class="method apipage">
            <a name="ngon"><a class="lift" href="#ngon">ngon</a></a> <div class="clear"></div><code class="signature apipage">ngon(options:[luxe.options.DrawNgonOptions](#)<span></span>) : [phoenix.geometry.Geometry](#)</code><br/><span class="small_desc_flat">Draw an n-sided polygon (3 sides for triangle, 6 for hexagon etc) at `x`,`y` with a radius `r` and `sides` with options</span>
        </span>
    <span class="method apipage">
            <a name="texture"><a class="lift" href="#texture">texture</a></a> <div class="clear"></div><code class="signature apipage">texture(options:[luxe.options.DrawTextureOptions](#)<span></span>) : [phoenix.geometry.QuadGeometry](#)</code><br/><span class="small_desc_flat">Draw a textured `box` with image `texture` at `x`,`y`,`w`,`h` OR with `pos` and `size`, and `uv` with options</span>
        </span>
    <span class="method apipage">
            <a name="text"><a class="lift" href="#text">text</a></a> <div class="clear"></div><code class="signature apipage">text(options:[Dynamic](#)<span></span>) : [phoenix.geometry.Geometry](#)</code><br/><span class="small_desc_flat">Draw `text` at `pos` using `font` (or no font for default font) with options</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
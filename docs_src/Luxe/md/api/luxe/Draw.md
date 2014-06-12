
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Draw

The `Luxe.draw` API class implementation.
    This class handles quick access to drawing common geometry options,
    and is a facilitator for higher level drawing. These can be used given to a `Visual` to convert
    them into a higher level entity for use with the default scene.

---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="arc"><a class="lift" href="#arc">arc</a></a><code class="signature apipage">arc(options:<span>[luxe.options.DrawArcOptions](#luxe.options.DrawArcOptions)</span>) : [phoenix.geometry.ArcGeometry](#phoenix.geometry.ArcGeometry)</code><br/><span class="small_desc_flat">Draw an arc (open circle) at the specified `x`,`y`, between `start_angle` and `end_angle` with radius `r` (or `rx`,`ry` optionally for an ellipsical arc), with options</span>
        </span>
    <span class="method apipage">
            <a name="box"><a class="lift" href="#box">box</a></a><code class="signature apipage">box(options:<span>[luxe.options.DrawBoxOptions](#luxe.options.DrawBoxOptions)</span>) : [phoenix.geometry.QuadGeometry](#phoenix.geometry.QuadGeometry)</code><br/><span class="small_desc_flat">Draw a solid rectangle box at the specified `x`,`y`,`w`,`h` with options</span>
        </span>
    <span class="method apipage">
            <a name="circle"><a class="lift" href="#circle">circle</a></a><code class="signature apipage">circle(options:<span>[luxe.options.DrawCircleOptions](#luxe.options.DrawCircleOptions)</span>) : [phoenix.geometry.CircleGeometry](#phoenix.geometry.CircleGeometry)</code><br/><span class="small_desc_flat">Draw a solid circle at the specified `x`,`y` with radius `r` (or `rx`,`ry` optionally for an ellipse), with options</span>
        </span>
    <span class="method apipage">
            <a name="line"><a class="lift" href="#line">line</a></a><code class="signature apipage">line(options:<span>[luxe.options.DrawLineOptions](#luxe.options.DrawLineOptions)</span>) : [phoenix.geometry.LineGeometry](#phoenix.geometry.LineGeometry)</code><br/><span class="small_desc_flat">Draw a line geometry between points `p0` and `p1` with options</span>
        </span>
    <span class="method apipage">
            <a name="ngon"><a class="lift" href="#ngon">ngon</a></a><code class="signature apipage">ngon(options:<span>[luxe.options.DrawNgonOptions](#luxe.options.DrawNgonOptions)</span>) : [phoenix.geometry.Geometry](#phoenix.geometry.Geometry)</code><br/><span class="small_desc_flat">Draw an n-sided polygon (3 sides for triangle, 6 for hexagon etc) at `x`,`y` with a radius `r` and `sides` with options</span>
        </span>
    <span class="method apipage">
            <a name="rectangle"><a class="lift" href="#rectangle">rectangle</a></a><code class="signature apipage">rectangle(options:<span>[luxe.options.DrawRectangleOptions](#luxe.options.DrawRectangleOptions)</span>) : [phoenix.geometry.RectangleGeometry](#phoenix.geometry.RectangleGeometry)</code><br/><span class="small_desc_flat">Draw a rectangle outline at the specified `x`,`y`,`w`,`h` with options</span>
        </span>
    <span class="method apipage">
            <a name="ring"><a class="lift" href="#ring">ring</a></a><code class="signature apipage">ring(options:<span>[luxe.options.DrawRingOptions](#luxe.options.DrawRingOptions)</span>) : [phoenix.geometry.RingGeometry](#phoenix.geometry.RingGeometry)</code><br/><span class="small_desc_flat">Draw a circle outline at the specified `x`,`y` with radius `r` (or `rx`,`ry` optionally for an ellipse), with options</span>
        </span>
    <span class="method apipage">
            <a name="text"><a class="lift" href="#text">text</a></a><code class="signature apipage">text(options:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>) : [phoenix.geometry.Geometry](#phoenix.geometry.Geometry)</code><br/><span class="small_desc_flat">Draw `text` at `pos` using `font` (or no font for default font) with options</span>
        </span>
    <span class="method apipage">
            <a name="texture"><a class="lift" href="#texture">texture</a></a><code class="signature apipage">texture(options:<span>[luxe.options.DrawTextureOptions](#luxe.options.DrawTextureOptions)</span>) : [phoenix.geometry.QuadGeometry](#phoenix.geometry.QuadGeometry)</code><br/><span class="small_desc_flat">Draw a textured `box` with image `texture` at `x`,`y`,`w`,`h` OR with `pos` and `size`, and `uv` with options</span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;
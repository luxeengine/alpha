
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>ShapeDrawer</h1>
<small>`luxe.collision.ShapeDrawer`</small>

To implement your own debug drawing class, you only need to override drawLine function and implement it
    the rest is handled internally. You can override specifics if you want, but it's not required

---

`class`
<span class="meta">
<br/>meta: @:keep
</span>


---


&nbsp;
&nbsp;










<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="drawCircle"><a class="lift" href="#drawCircle">drawCircle</a></a><div class="clear"></div>
            <code class="signature apipage">drawCircle(circle:[luxe.collision.shapes.Circle](#)<span></span>, color:[luxe.Color](#)<span>=null</span>, immediate:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat">Draw a circle `Shape`</span>
        </span>
    <span class="method apipage">
            <a name="drawLine"><a class="lift" href="#drawLine">drawLine</a></a><div class="clear"></div>
            <code class="signature apipage">drawLine(p0:[luxe.Vector](#)<span></span>, p1:[luxe.Vector](#)<span></span>, color:[luxe.Color](#)<span>=null</span>, immediate:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat">Draw a line between p0 and p1. Implement this function at minimum in custom drawing handlers</span>
        </span>
    <span class="method apipage">
            <a name="drawPolygon"><a class="lift" href="#drawPolygon">drawPolygon</a></a><div class="clear"></div>
            <code class="signature apipage">drawPolygon(poly:[luxe.collision.shapes.Polygon](#)<span></span>, color:[luxe.Color](#)<span>=null</span>, immediate:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat">Draw a `Polygon`</span>
        </span>
    <span class="method apipage">
            <a name="drawShape"><a class="lift" href="#drawShape">drawShape</a></a><div class="clear"></div>
            <code class="signature apipage">drawShape(shape:[luxe.collision.shapes.Shape](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Draw a `Shape`, it will determine the type and draw it for you.</span>
        </span>
    <span class="method apipage">
            <a name="drawVector"><a class="lift" href="#drawVector">drawVector</a></a><div class="clear"></div>
            <code class="signature apipage">drawVector(v:[luxe.Vector](#)<span></span>, start:[luxe.Vector](#)<span></span>, color:[luxe.Color](#)<span>=null</span>, immediate:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat">Draw a `Vector` (with magnitude)</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new() : [Void](#)</code><br/><span class="small_desc_flat">empty constructor</span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
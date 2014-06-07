
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



#ShapeDrawer

To implement your own debug drawing class, you only need to override drawLine function and implement it
    the rest is handled internally. You can override specifics if you want, but it's not required

---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/>no public members

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="drawCircle"><a class="lift" href="#drawCircle">drawCircle</a></a><code class="signature apipage">drawCircle(circle:<span>[luxe.collision.shapes.Circle](#luxe.collision.shapes.Circle)</span>, ?color:<span>[luxe.Color](#luxe.Color)=null</span>, ?immediate:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Draw a circle `Shape`</span>
        </span>
    <span class="method apipage">
            <a name="drawLine"><a class="lift" href="#drawLine">drawLine</a></a><code class="signature apipage">drawLine(p0:<span>[luxe.Vector](#luxe.Vector)</span>, p1:<span>[luxe.Vector](#luxe.Vector)</span>, ?color:<span>[luxe.Color](#luxe.Color)=null</span>, ?immediate:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Draw a line between p0 and p1. Implement this function at minimum in custom drawing handlers</span>
        </span>
    <span class="method apipage">
            <a name="drawPolygon"><a class="lift" href="#drawPolygon">drawPolygon</a></a><code class="signature apipage">drawPolygon(poly:<span>[luxe.collision.shapes.Polygon](#luxe.collision.shapes.Polygon)</span>, ?color:<span>[luxe.Color](#luxe.Color)=null</span>, ?immediate:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Draw a `Polygon`</span>
        </span>
    <span class="method apipage">
            <a name="drawShape"><a class="lift" href="#drawShape">drawShape</a></a><code class="signature apipage">drawShape(shape:<span>[luxe.collision.shapes.Shape](#luxe.collision.shapes.Shape)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Draw a `Shape`, it will determine the type and draw it for you.</span>
        </span>
    <span class="method apipage">
            <a name="drawVector"><a class="lift" href="#drawVector">drawVector</a></a><code class="signature apipage">drawVector(v:<span>[luxe.Vector](#luxe.Vector)</span>, start:<span>[luxe.Vector](#luxe.Vector)</span>, ?color:<span>[luxe.Color](#luxe.Color)=null</span>, ?immediate:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Draw a `Vector` (with magnitude)</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">empty constructor</span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;

[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>Polygon</h1>
<small>`luxe.collision.shapes.Polygon`</small>

A polygon collision shape

---

`class`extends <code><span>luxe.collision.shapes.Shape</span></code>

---

&nbsp;
&nbsp;







<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><code class="signature apipage">destroy() : Void</code><br/><span class="small_desc_flat">Destroy this polygon and clean up.</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(x:Float<span></span>, y:Float<span></span>, vertices:Array<span></span>) : Void</code><br/><span class="small_desc_flat">Create a new polygon with a given set of vertices at position x,y.</span>
        </span>
    <span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a><span class="inline-block static">static</span><code class="signature apipage">create(x:Float<span></span>, y:Float<span></span>, sides:Int<span></span>, radius:Float<span>=100</span>) : luxe.collision.shapes.Polygon</code><br/><span class="small_desc_flat">Helper to create an Ngon at x,y with given number of sides, and radius.
            A default radius of 100 if unspecified. Returns a ready made `Polygon` collision `Shape`</span>
        </span>
    <span class="method apipage">
            <a name="rectangle"><a class="lift" href="#rectangle">rectangle</a></a><span class="inline-block static">static</span><code class="signature apipage">rectangle(x:Float<span></span>, y:Float<span></span>, width:Float<span></span>, height:Float<span></span>, centered:Bool<span>=true</span>) : luxe.collision.shapes.Polygon</code><br/><span class="small_desc_flat">Helper generate a rectangle at x,y with a given width/height and centered state.
            Centered by default. Returns a ready made `Polygon` collision `Shape`</span>
        </span>
    <span class="method apipage">
            <a name="square"><a class="lift" href="#square">square</a></a><span class="inline-block static">static</span><code class="signature apipage">square(x:Float<span></span>, y:Float<span></span>, width:Float<span></span>, centered:Bool<span>=true</span>) : luxe.collision.shapes.Polygon</code><br/><span class="small_desc_flat">Helper generate a square at x,y with a given width/height with given centered state.
            Centered by default. Returns a ready made `Polygon` collision `Shape`</span>
        </span>
    <span class="method apipage">
            <a name="triangle"><a class="lift" href="#triangle">triangle</a></a><span class="inline-block static">static</span><code class="signature apipage">triangle(x:Float<span></span>, y:Float<span></span>, radius:Float<span></span>) : luxe.collision.shapes.Polygon</code><br/><span class="small_desc_flat">Helper generate a triangle at x,y with a given radius. 
            Returns a ready made `Polygon` collision `Shape`</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
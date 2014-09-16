
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---


<h1>Polygon</h1>
<small>`luxe.collision.shapes.Polygon`</small>

A polygon collision shape

<hr/>

`class`extends <code><span>luxe.collision.shapes.Shape</span></code><br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;






<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">create(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, sides:[Int](http://api.haxe.org/Int.html)<span></span>, radius:[Float](http://api.haxe.org/Float.html)<span>=100</span>) : [luxe.collision.shapes.Polygon](../../../../api/luxe/collision/shapes/Polygon.html)</code><br/><span class="small_desc_flat">Helper to create an Ngon at x,y with given number of sides, and radius.
            A default radius of 100 if unspecified. Returns a ready made `Polygon` collision `Shape`</span>


</span>
<span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Destroy this polygon and clean up.</span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, vertices:[Array](http://api.haxe.org/Array.html)&lt;[luxe.Vector](../../../../api/luxe/Vector.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Create a new polygon with a given set of vertices at position x,y.</span>


</span>
<span class="method apipage">
            <a name="rectangle"><a class="lift" href="#rectangle">rectangle</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">rectangle(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, width:[Float](http://api.haxe.org/Float.html)<span></span>, height:[Float](http://api.haxe.org/Float.html)<span></span>, centered:[Bool](http://api.haxe.org/Bool.html)<span>=true</span>) : [luxe.collision.shapes.Polygon](../../../../api/luxe/collision/shapes/Polygon.html)</code><br/><span class="small_desc_flat">Helper generate a rectangle at x,y with a given width/height and centered state.
            Centered by default. Returns a ready made `Polygon` collision `Shape`</span>


</span>
<span class="method apipage">
            <a name="square"><a class="lift" href="#square">square</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">square(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, width:[Float](http://api.haxe.org/Float.html)<span></span>, centered:[Bool](http://api.haxe.org/Bool.html)<span>=true</span>) : [luxe.collision.shapes.Polygon](../../../../api/luxe/collision/shapes/Polygon.html)</code><br/><span class="small_desc_flat">Helper generate a square at x,y with a given width/height with given centered state.
            Centered by default. Returns a ready made `Polygon` collision `Shape`</span>


</span>
<span class="method apipage">
            <a name="triangle"><a class="lift" href="#triangle">triangle</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">triangle(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, radius:[Float](http://api.haxe.org/Float.html)<span></span>) : [luxe.collision.shapes.Polygon](../../../../api/luxe/collision/shapes/Polygon.html)</code><br/><span class="small_desc_flat">Helper generate a triangle at x,y with a given radius. 
            Returns a ready made `Polygon` collision `Shape`</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;
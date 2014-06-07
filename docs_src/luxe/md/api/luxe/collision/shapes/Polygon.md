
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



#Polygon

A polygon collision shape

---

`class`extends <code><span>[luxe.collision.shapes.Shape]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="active"><a class="lift" href="#active">active</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">active : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat">The state of this shape, if inactive can be ignored in results</span><span class="member apipage">
            <a name="data"><a class="lift" href="#data">data</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">data : [Dynamic](http://api.haxe.org/Dynamic.html)</code><br/></span>
        <span class="small_desc_flat">A generic data object where you can store anything you want, for later use</span><span class="member apipage">
            <a name="name"><a class="lift" href="#name">name</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat">The name of this shape, to help in debugging</span><span class="member apipage">
            <a name="tags"><a class="lift" href="#tags">tags</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">tags : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [String](http://api.haxe.org/String.html)&gt;</code><br/></span>
        <span class="small_desc_flat">A list of tags to use for marking shapes with data for later use, by key/value</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a><span class="inline-block static">static</span><code class="signature apipage">create(x:<span>[Float](http://api.haxe.org/Float.html)</span>, y:<span>[Float](http://api.haxe.org/Float.html)</span>, sides:<span>[Int](http://api.haxe.org/Int.html)</span>, ?radius:<span>[Float](http://api.haxe.org/Float.html)=100</span>) : [luxe.collision.shapes.Polygon](#luxe.collision.shapes.Polygon)</code><br/><span class="small_desc_flat">Helper to create an Ngon at x,y with given number of sides, and radius.
            A default radius of 100 if unspecified. Returns a ready made `Polygon` collision `Shape`</span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Destroy this polygon and clean up.</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">new(x:<span>[Float](http://api.haxe.org/Float.html)</span>, y:<span>[Float](http://api.haxe.org/Float.html)</span>, vertices:<span>[Array](http://api.haxe.org/Array.html)&lt;[luxe.Vector](#luxe.Vector)&gt;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Create a new polygon with a given set of vertices at position x,y.</span>
        </span>
    <span class="method apipage">
            <a name="rectangle"><a class="lift" href="#rectangle">rectangle</a></a><span class="inline-block static">static</span><code class="signature apipage">rectangle(x:<span>[Float](http://api.haxe.org/Float.html)</span>, y:<span>[Float](http://api.haxe.org/Float.html)</span>, width:<span>[Float](http://api.haxe.org/Float.html)</span>, height:<span>[Float](http://api.haxe.org/Float.html)</span>, ?centered:<span>[Bool](http://api.haxe.org/Bool.html)=true</span>) : [luxe.collision.shapes.Polygon](#luxe.collision.shapes.Polygon)</code><br/><span class="small_desc_flat">Helper generate a rectangle at x,y with a given width/height and centered state.
            Centered by default. Returns a ready made `Polygon` collision `Shape`</span>
        </span>
    <span class="method apipage">
            <a name="square"><a class="lift" href="#square">square</a></a><span class="inline-block static">static</span><code class="signature apipage">square(x:<span>[Float](http://api.haxe.org/Float.html)</span>, y:<span>[Float](http://api.haxe.org/Float.html)</span>, width:<span>[Float](http://api.haxe.org/Float.html)</span>, ?centered:<span>[Bool](http://api.haxe.org/Bool.html)=true</span>) : [luxe.collision.shapes.Polygon](#luxe.collision.shapes.Polygon)</code><br/><span class="small_desc_flat">Helper generate a square at x,y with a given width/height with given centered state.
            Centered by default. Returns a ready made `Polygon` collision `Shape`</span>
        </span>
    <span class="method apipage">
            <a name="triangle"><a class="lift" href="#triangle">triangle</a></a><span class="inline-block static">static</span><code class="signature apipage">triangle(x:<span>[Float](http://api.haxe.org/Float.html)</span>, y:<span>[Float](http://api.haxe.org/Float.html)</span>, radius:<span>[Float](http://api.haxe.org/Float.html)</span>) : [luxe.collision.shapes.Polygon](#luxe.collision.shapes.Polygon)</code><br/><span class="small_desc_flat">Helper generate a triangle at x,y with a given radius. 
            Returns a ready made `Polygon` collision `Shape`</span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="position"><a class="lift" href="#position">position</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">position : [luxe.Vector]()</code><br/><span class="small_desc_flat">The position of this shape</span>
        </span><span class="property apipage">
            <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">rotation : [Float]()</code><br/><span class="small_desc_flat">The rotation of this shape, in degrees</span>
        </span><span class="property apipage">
            <a name="scaleX"><a class="lift" href="#scaleX">scaleX</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">scaleX : [Float]()</code><br/><span class="small_desc_flat">The scale in the x direction of this shape</span>
        </span><span class="property apipage">
            <a name="scaleY"><a class="lift" href="#scaleY">scaleY</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">scaleY : [Float]()</code><br/><span class="small_desc_flat">The scale in the y direction of this shape</span>
        </span><span class="property apipage">
            <a name="transformedVertices"><a class="lift" href="#transformedVertices">transformedVertices</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">transformedVertices : [Array]()&lt;[luxe.Vector]()&gt;</code><br/><span class="small_desc_flat">The transformed (rotated/scale) vertices cache</span>
        </span><span class="property apipage">
            <a name="vertices"><a class="lift" href="#vertices">vertices</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">vertices : [Array]()&lt;[luxe.Vector]()&gt;</code><br/><span class="small_desc_flat">The vertices of this shape</span>
        </span><span class="property apipage">
            <a name="x"><a class="lift" href="#x">x</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">x : [Float]()</code><br/><span class="small_desc_flat">The x position of this shape</span>
        </span><span class="property apipage">
            <a name="y"><a class="lift" href="#y">y</a></a><a title="inherited from luxe.collision.shapes.Shape" class="tooltip inherited">&gt;</a><code class="signature apipage">y : [Float]()</code><br/><span class="small_desc_flat">The y position of this shape</span>
        </span>

&nbsp;
&nbsp;
&nbsp;

[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



#Shape

A base collision class shape

---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="active"><a class="lift" href="#active">active</a></a><code class="signature apipage">active : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat">The state of this shape, if inactive can be ignored in results</span><span class="member apipage">
            <a name="data"><a class="lift" href="#data">data</a></a><code class="signature apipage">data : [Dynamic](http://api.haxe.org/Dynamic.html)</code><br/></span>
        <span class="small_desc_flat">A generic data object where you can store anything you want, for later use</span><span class="member apipage">
            <a name="name"><a class="lift" href="#name">name</a></a><code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat">The name of this shape, to help in debugging</span><span class="member apipage">
            <a name="tags"><a class="lift" href="#tags">tags</a></a><code class="signature apipage">tags : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [String](http://api.haxe.org/String.html)&gt;</code><br/></span>
        <span class="small_desc_flat">A list of tags to use for marking shapes with data for later use, by key/value</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">clean up and destroy this shape</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(\_x:<span>[Float](http://api.haxe.org/Float.html)</span>, \_y:<span>[Float](http://api.haxe.org/Float.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Create a new shape at give position x,y</span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="position"><a class="lift" href="#position">position</a></a><code class="signature apipage">position : [luxe.Vector]()</code><br/><span class="small_desc_flat">The position of this shape</span>
        </span><span class="property apipage">
            <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><code class="signature apipage">rotation : [Float]()</code><br/><span class="small_desc_flat">The rotation of this shape, in degrees</span>
        </span><span class="property apipage">
            <a name="scaleX"><a class="lift" href="#scaleX">scaleX</a></a><code class="signature apipage">scaleX : [Float]()</code><br/><span class="small_desc_flat">The scale in the x direction of this shape</span>
        </span><span class="property apipage">
            <a name="scaleY"><a class="lift" href="#scaleY">scaleY</a></a><code class="signature apipage">scaleY : [Float]()</code><br/><span class="small_desc_flat">The scale in the y direction of this shape</span>
        </span><span class="property apipage">
            <a name="transformedVertices"><a class="lift" href="#transformedVertices">transformedVertices</a></a><code class="signature apipage">transformedVertices : [Array]()&lt;[luxe.Vector]()&gt;</code><br/><span class="small_desc_flat">The transformed (rotated/scale) vertices cache</span>
        </span><span class="property apipage">
            <a name="vertices"><a class="lift" href="#vertices">vertices</a></a><code class="signature apipage">vertices : [Array]()&lt;[luxe.Vector]()&gt;</code><br/><span class="small_desc_flat">The vertices of this shape</span>
        </span><span class="property apipage">
            <a name="x"><a class="lift" href="#x">x</a></a><code class="signature apipage">x : [Float]()</code><br/><span class="small_desc_flat">The x position of this shape</span>
        </span><span class="property apipage">
            <a name="y"><a class="lift" href="#y">y</a></a><code class="signature apipage">y : [Float]()</code><br/><span class="small_desc_flat">The y position of this shape</span>
        </span>

&nbsp;
&nbsp;
&nbsp;

[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---


<h1>Shape</h1>
<small>`luxe.collision.shapes.Shape`</small>

A base collision class shape

<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="active"><a class="lift" href="#active">active</a></a><div class="clear"></div>
                <code class="signature apipage">active : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">The state of this shape, if inactive can be ignored in results</span><br/><span class="member apipage">
                <a name="data"><a class="lift" href="#data">data</a></a><div class="clear"></div>
                <code class="signature apipage">data : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat">A generic data object where you can store anything you want, for later use</span><br/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div>
                <code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">The name of this shape, to help in debugging</span><br/><span class="member apipage">
                <a name="tags"><a class="lift" href="#tags">tags</a></a><div class="clear"></div>
                <code class="signature apipage">tags : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [String](http://api.haxe.org/String.html)&gt;</code><br/></span>
            <span class="small_desc_flat">A list of tags to use for marking shapes with data for later use, by key/value</span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="position"><a class="lift" href="#position">position</a></a><div class="clear"></div>
                <code class="signature apipage">position : [luxe.Vector](../../../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">The position of this shape</span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><div class="clear"></div>
                <code class="signature apipage">rotation : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The rotation of this shape, in degrees</span><span class="member apipage">
                <a name="scaleX"><a class="lift" href="#scaleX">scaleX</a></a><div class="clear"></div>
                <code class="signature apipage">scaleX : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The scale in the x direction of this shape</span><span class="member apipage">
                <a name="scaleY"><a class="lift" href="#scaleY">scaleY</a></a><div class="clear"></div>
                <code class="signature apipage">scaleY : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The scale in the y direction of this shape</span><span class="member apipage">
                <a name="transformedVertices"><a class="lift" href="#transformedVertices">transformedVertices</a></a><div class="clear"></div>
                <code class="signature apipage">transformedVertices : [Array](http://api.haxe.org/Array.html)&lt;[luxe.Vector](../../../../api/luxe/Vector.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The transformed (rotated/scale) vertices cache</span><span class="member apipage">
                <a name="vertices"><a class="lift" href="#vertices">vertices</a></a><div class="clear"></div>
                <code class="signature apipage">vertices : [Array](http://api.haxe.org/Array.html)&lt;[luxe.Vector](../../../../api/luxe/Vector.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The vertices of this shape</span><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a><div class="clear"></div>
                <code class="signature apipage">x : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The x position of this shape</span><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a><div class="clear"></div>
                <code class="signature apipage">y : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The y position of this shape</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">clean up and destroy this shape</span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Create a new shape at give position x,y</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;
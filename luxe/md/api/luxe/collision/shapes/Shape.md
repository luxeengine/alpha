
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>Shape</h1>
<small>`luxe.collision.shapes.Shape`</small>

A base collision class shape

---

`class`
<span class="meta">
<br/>meta: @:keep
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/><span class="member apipage">
                <a name="active"><a class="lift" href="#active">active</a></a><div class="clear"></div>
                <code class="signature apipage">active : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">The state of this shape, if inactive can be ignored in results</span><span class="member apipage">
                <a name="data"><a class="lift" href="#data">data</a></a><div class="clear"></div>
                <code class="signature apipage">data : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat">A generic data object where you can store anything you want, for later use</span><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div>
                <code class="signature apipage">name : [String](#)</code><br/></span>
            <span class="small_desc_flat">The name of this shape, to help in debugging</span><span class="member apipage">
                <a name="tags"><a class="lift" href="#tags">tags</a></a><div class="clear"></div>
                <code class="signature apipage">tags : [Map](#)&lt;[String](#), [String](#)&gt;</code><br/></span>
            <span class="small_desc_flat">A list of tags to use for marking shapes with data for later use, by key/value</span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="position"><a class="lift" href="#position">position</a></a><div class="clear"></div>
                <code class="signature apipage">position : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The position of this shape</span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><div class="clear"></div>
                <code class="signature apipage">rotation : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The rotation of this shape, in degrees</span><span class="member apipage">
                <a name="scaleX"><a class="lift" href="#scaleX">scaleX</a></a><div class="clear"></div>
                <code class="signature apipage">scaleX : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The scale in the x direction of this shape</span><span class="member apipage">
                <a name="scaleY"><a class="lift" href="#scaleY">scaleY</a></a><div class="clear"></div>
                <code class="signature apipage">scaleY : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The scale in the y direction of this shape</span><span class="member apipage">
                <a name="transformedVertices"><a class="lift" href="#transformedVertices">transformedVertices</a></a><div class="clear"></div>
                <code class="signature apipage">transformedVertices : [Array](#)&lt;[luxe.Vector](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The transformed (rotated/scale) vertices cache</span><span class="member apipage">
                <a name="vertices"><a class="lift" href="#vertices">vertices</a></a><div class="clear"></div>
                <code class="signature apipage">vertices : [Array](#)&lt;[luxe.Vector](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The vertices of this shape</span><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a><div class="clear"></div>
                <code class="signature apipage">x : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The x position of this shape</span><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a><div class="clear"></div>
                <code class="signature apipage">y : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The y position of this shape</span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](#)</code><br/><span class="small_desc_flat">clean up and destroy this shape</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_x:[Float](#)<span></span>, \_y:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Create a new shape at give position x,y</span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
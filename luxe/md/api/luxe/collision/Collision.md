
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>Collision</h1>
<small>`luxe.collision.Collision`</small>



---

`class`
<span class="meta">
<br/>meta: @:keep
</span>


---


&nbsp;
&nbsp;










<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="pointInPoly"><a class="lift" href="#pointInPoly">pointInPoly</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">pointInPoly(point:[luxe.Vector](#)<span></span>, poly:[luxe.collision.shapes.Polygon](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">Test if a given point lands inside the given polygon</span>
        </span>
    <span class="method apipage">
            <a name="ray"><a class="lift" href="#ray">ray</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">ray(lineStart:[luxe.Vector](#)<span></span>, lineEnd:[luxe.Vector](#)<span></span>, shapes:[Array](#)&lt;[luxe.collision.shapes.Shape](#)&gt;<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">Test a line between two points against a list of shapes. 
            If a collision is found, returns true, otherwise false.</span>
        </span>
    <span class="method apipage">
            <a name="test"><a class="lift" href="#test">test</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">test(shape1:[luxe.collision.shapes.Shape](#)<span></span>, shape2:[luxe.collision.shapes.Shape](#)<span></span>) : [luxe.collision.CollisionData](#)</code><br/><span class="small_desc_flat">Test a single shape against another shape. 
            When no collision is found between them, this function returns null.
            Returns a `CollisionData` if a collision is found.</span>
        </span>
    <span class="method apipage">
            <a name="testCircleLine"><a class="lift" href="#testCircleLine">testCircleLine</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">testCircleLine(circle:[luxe.collision.shapes.Circle](#)<span></span>, lineStart:[luxe.Vector](#)<span></span>, lineEnd:[luxe.Vector](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">Test a circle vs a line between two points</span>
        </span>
    <span class="method apipage">
            <a name="testShapes"><a class="lift" href="#testShapes">testShapes</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">testShapes(shape1:[luxe.collision.shapes.Shape](#)<span></span>, shapes:[Array](#)&lt;[luxe.collision.shapes.Shape](#)&gt;<span></span>) : [Array](#)&lt;[luxe.collision.CollisionData](#)&gt;</code><br/><span class="small_desc_flat">Test a single shape against multiple other shapes. 
            Will never return null, always length 0 array. 
            Returns a list of `CollisionData` information for each collision found.</span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
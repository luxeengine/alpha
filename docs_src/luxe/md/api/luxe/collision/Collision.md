
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



#Collision



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/>no public members

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="pointInPoly"><a class="lift" href="#pointInPoly">pointInPoly</a></a><span class="inline-block static">static</span><code class="signature apipage">pointInPoly(point:<span>[luxe.Vector](#luxe.Vector)</span>, poly:<span>[luxe.collision.shapes.Polygon](#luxe.collision.shapes.Polygon)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Test if a given point lands inside the given polygon</span>
        </span>
    <span class="method apipage">
            <a name="ray"><a class="lift" href="#ray">ray</a></a><span class="inline-block static">static</span><code class="signature apipage">ray(lineStart:<span>[luxe.Vector](#luxe.Vector)</span>, lineEnd:<span>[luxe.Vector](#luxe.Vector)</span>, shapes:<span>[Array](http://api.haxe.org/Array.html)&lt;[luxe.collision.shapes.Shape](#luxe.collision.shapes.Shape)&gt;</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Test a line between two points against a list of shapes. 
            If a collision is found, returns true, otherwise false.</span>
        </span>
    <span class="method apipage">
            <a name="test"><a class="lift" href="#test">test</a></a><span class="inline-block static">static</span><code class="signature apipage">test(shape1:<span>[luxe.collision.shapes.Shape](#luxe.collision.shapes.Shape)</span>, shape2:<span>[luxe.collision.shapes.Shape](#luxe.collision.shapes.Shape)</span>) : [luxe.collision.CollisionData](#luxe.collision.CollisionData)</code><br/><span class="small_desc_flat">Test a single shape against another shape. 
            When no collision is found between them, this function returns null.
            Returns a `CollisionData` if a collision is found.</span>
        </span>
    <span class="method apipage">
            <a name="testCircleLine"><a class="lift" href="#testCircleLine">testCircleLine</a></a><span class="inline-block static">static</span><code class="signature apipage">testCircleLine(circle:<span>[luxe.collision.shapes.Circle](#luxe.collision.shapes.Circle)</span>, lineStart:<span>[luxe.Vector](#luxe.Vector)</span>, lineEnd:<span>[luxe.Vector](#luxe.Vector)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Test a circle vs a line between two points</span>
        </span>
    <span class="method apipage">
            <a name="testShapes"><a class="lift" href="#testShapes">testShapes</a></a><span class="inline-block static">static</span><code class="signature apipage">testShapes(shape1:<span>[luxe.collision.shapes.Shape](#luxe.collision.shapes.Shape)</span>, shapes:<span>[Array](http://api.haxe.org/Array.html)&lt;[luxe.collision.shapes.Shape](#luxe.collision.shapes.Shape)&gt;</span>) : [Array](http://api.haxe.org/Array.html)&lt;[luxe.collision.CollisionData](#luxe.collision.CollisionData)&gt;</code><br/><span class="small_desc_flat">Test a single shape against multiple other shapes. 
            Will never return null, always length 0 array. 
            Returns a list of `CollisionData` information for each collision found.</span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;
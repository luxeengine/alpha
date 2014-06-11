
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



#MotionPath

* @author Joshua Granick
 * @author Aleš Tomeček (for RotationPath)

---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="bezier"><a class="lift" href="#bezier">bezier</a></a><code class="signature apipage">bezier(x:<span>[Float](http://api.haxe.org/Float.html)</span>, y:<span>[Float](http://api.haxe.org/Float.html)</span>, controlX:<span>[Float](http://api.haxe.org/Float.html)</span>, controlY:<span>[Float](http://api.haxe.org/Float.html)</span>, ?strength:<span>[Float](http://api.haxe.org/Float.html)=1</span>) : [luxe.tween.MotionPath](#luxe.tween.MotionPath)</code><br/><span class="small_desc_flat">* Adds a bezier curve to the current motion path
	 * @param	x		The x position of the end point for the curve
	 * @param	y		The y position of the end point for the curve
	 * @param	controlX		The x position of the control point for the curve, which affects the angle and midpoint
	 * @param	controlX		The x position of the control point for the curve, which affects the angle and midpoint
	 * @param	strength		The degree of emphasis that should be placed on this segment. If a motion path contains multiple segments with the same strength, they all receive equal emphasis (Default is 1)
	 * @return		The current motion path instance</span>
        </span>
    <span class="method apipage">
            <a name="line"><a class="lift" href="#line">line</a></a><code class="signature apipage">line(x:<span>[Float](http://api.haxe.org/Float.html)</span>, y:<span>[Float](http://api.haxe.org/Float.html)</span>, ?strength:<span>[Float](http://api.haxe.org/Float.html)=1</span>) : [luxe.tween.MotionPath](#luxe.tween.MotionPath)</code><br/><span class="small_desc_flat">* Adds a line to the current motion path
	 * @param	x		The x position of the end point for the line
	 * @param	x		The y position of the end point for the line
	 * @param	strength		The degree of emphasis that should be placed on this segment . If a motion path contains multiple segments with the same strength, they all receive equal emphasis (Default is 1)
	 * @return		The current motion path instance</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><code class="signature apipage">rotation : [luxe.tween.RotationPath]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="x"><a class="lift" href="#x">x</a></a><code class="signature apipage">x : [luxe.tween.IComponentPath]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="y"><a class="lift" href="#y">y</a></a><code class="signature apipage">y : [luxe.tween.IComponentPath]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;
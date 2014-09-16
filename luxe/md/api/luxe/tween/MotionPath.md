
[![Logo](../../../images/logo.png)](../../../api/index.html)

---


<h1>MotionPath</h1>
<small>`luxe.tween.MotionPath`</small>

* @author Joshua Granick
 * @author Aleš Tomeček (for RotationPath)

<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><div class="clear"></div>
                <code class="signature apipage">rotation : [luxe.tween.RotationPath](../../../api/luxe/tween/RotationPath.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a><div class="clear"></div>
                <code class="signature apipage">x : [luxe.tween.IComponentPath](../../../api/luxe/tween/IComponentPath.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a><div class="clear"></div>
                <code class="signature apipage">y : [luxe.tween.IComponentPath](../../../api/luxe/tween/IComponentPath.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="bezier"><a class="lift" href="#bezier">bezier</a></a><div class="clear"></div>
            <code class="signature apipage">bezier(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, controlX:[Float](http://api.haxe.org/Float.html)<span></span>, controlY:[Float](http://api.haxe.org/Float.html)<span></span>, strength:[Float](http://api.haxe.org/Float.html)<span>=1</span>) : [luxe.tween.MotionPath](../../../api/luxe/tween/MotionPath.html)</code><br/><span class="small_desc_flat">* Adds a bezier curve to the current motion path
     * @param   x       The x position of the end point for the curve
     * @param   y       The y position of the end point for the curve
     * @param   controlX        The x position of the control point for the curve, which affects the angle and midpoint
     * @param   controlX        The x position of the control point for the curve, which affects the angle and midpoint
     * @param   strength        The degree of emphasis that should be placed on this segment. If a motion path contains multiple segments with the same strength, they all receive equal emphasis (Default is 1)
     * @return      The current motion path instance</span>


</span>
<span class="method apipage">
            <a name="line"><a class="lift" href="#line">line</a></a><div class="clear"></div>
            <code class="signature apipage">line(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, strength:[Float](http://api.haxe.org/Float.html)<span>=1</span>) : [luxe.tween.MotionPath](../../../api/luxe/tween/MotionPath.html)</code><br/><span class="small_desc_flat">* Adds a line to the current motion path
     * @param   x       The x position of the end point for the line
     * @param   x       The y position of the end point for the line
     * @param   strength        The degree of emphasis that should be placed on this segment . If a motion path contains multiple segments with the same strength, they all receive equal emphasis (Default is 1)
     * @return      The current motion path instance</span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;
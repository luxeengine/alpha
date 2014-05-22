
[![Logo](../../../images/logo.png)](../../../index.html)

---

#MotionPath

--- 

* @author Joshua Granick

---
<br/>

&emsp;&emsp;&emsp;home   
[API Index](../../../api/index.html#luxe.tween)   
&emsp;&emsp;&emsp;parent    
[luxe](../)     
&emsp;&emsp;&emsp;current    
[luxe.tween](./) / MotionPath

<br/>

---


[Properties](#Properties)   
[Methods](#Methods)   


---

&nbsp;   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="x" href="#x">x</a>



`x : luxe.tween.IComponentPath`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="y" href="#y">y</a>



`y : luxe.tween.IComponentPath`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="bezier" href="#bezier">bezier</a>



`bezier(x:Float, y:Float, controlX:Float, controlY:Float, ?strength:Float=1) : luxe.tween.MotionPath`

<span class="small_desc_flat"> * Adds a bezier curve to the current motion path
     * @param   x  The x position of the end point for the curve
     * @param   y  The y position of the end point for the curve
     * @param   controlX  The x position of the control point for the curve, which affects the angle and midpoint
     * @param   controlX  The x position of the control point for the curve, which affects the angle and midpoint
     * @param   strength  The degree of emphasis that should be placed on this segment. If a motion path contains multiple segments with the same strength, they all receive equal emphasis (Default is 1)
     * @return  The current motion path instance </span>   

<a class="lift" name="line" href="#line">line</a>



`line(x:Float, y:Float, ?strength:Float=1) : luxe.tween.MotionPath`

<span class="small_desc_flat"> * Adds a line to the current motion path
     * @param   x  The x position of the end point for the line
     * @param   x  The y position of the end point for the line
     * @param   strength  The degree of emphasis that should be placed on this segment . If a motion path contains multiple segments with the same strength, they all receive equal emphasis (Default is 1)
     * @return  The current motion path instance </span>   

<a class="lift" name="new" href="#new">new</a>



`new() `

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   
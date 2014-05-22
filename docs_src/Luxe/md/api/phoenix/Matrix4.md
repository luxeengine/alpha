
[![Logo](../../images/logo.png)](../../index.html)

---

#Matrix4


&emsp;&emsp;&emsp;home   
[API Index](../../api/index.html#phoenix)   
&emsp;&emsp;&emsp;parent    
_none_   
&emsp;&emsp;&emsp;current    
[phoenix](./) / Matrix4

<br/>

---


[Members](#Members)   
[Properties](#Properties)   
[StaticMethods](#StaticMethods)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="elements" href="#elements">elements</a>



`elements : Array<Float>`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="M11" href="#M11">M11</a>



`M11 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M12" href="#M12">M12</a>



`M12 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M13" href="#M13">M13</a>



`M13 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M14" href="#M14">M14</a>



`M14 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M21" href="#M21">M21</a>



`M21 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M22" href="#M22">M22</a>



`M22 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M23" href="#M23">M23</a>



`M23 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M24" href="#M24">M24</a>



`M24 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M31" href="#M31">M31</a>



`M31 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M32" href="#M32">M32</a>



`M32 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M33" href="#M33">M33</a>



`M33 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M34" href="#M34">M34</a>



`M34 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M41" href="#M41">M41</a>



`M41 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M42" href="#M42">M42</a>



`M42 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M43" href="#M43">M43</a>



`M43 : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="M44" href="#M44">M44</a>



`M44 : Float`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="StaticMethods" ></a>
###StaticMethods   
---
<a class="lift" name="GetBackward" href="#GetBackward">GetBackward</a>



`GetBackward(_m:phoenix.Matrix4) : phoenix.Vector`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="GetDown" href="#GetDown">GetDown</a>



`GetDown(_m:phoenix.Matrix4) : phoenix.Vector`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="GetForward" href="#GetForward">GetForward</a>



`GetForward(_m:phoenix.Matrix4) : phoenix.Vector`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="GetLeft" href="#GetLeft">GetLeft</a>



`GetLeft(_m:phoenix.Matrix4) : phoenix.Vector`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="GetRight" href="#GetRight">GetRight</a>



`GetRight(_m:phoenix.Matrix4) : phoenix.Vector`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="GetUp" href="#GetUp">GetUp</a>



`GetUp(_m:phoenix.Matrix4) : phoenix.Vector`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="clone" href="#clone">clone</a>



`clone() : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="compose" href="#compose">compose</a>



`compose(_position:phoenix.Vector, _quaternion:phoenix.Quaternion, _scale:phoenix.Vector) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="compose_with_origin" href="#compose_with_origin">compose_with_origin</a>



`compose_with_origin(_position:phoenix.Vector, _origin:phoenix.Vector, _quaternion:phoenix.Quaternion, _scale:phoenix.Vector) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="copy" href="#copy">copy</a>



`copy(m:phoenix.Matrix4) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="copyPosition" href="#copyPosition">copyPosition</a>



`copyPosition(m:phoenix.Matrix4) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="decompose" href="#decompose">decompose</a>



`decompose(?_position:phoenix.Vector, ?_quaternion:phoenix.Quaternion, ?_scale:phoenix.Vector) : phoenix.MatrixTransform`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="determinant" href="#determinant">determinant</a>



`determinant() : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="extractRotation" href="#extractRotation">extractRotation</a>



`extractRotation(m:phoenix.Matrix4) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="flattenToArray" href="#flattenToArray">flattenToArray</a>



`flattenToArray(?_flat:Array<Float>) : Array<Float>`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="flattenToArrayOffset" href="#flattenToArrayOffset">flattenToArrayOffset</a>



`flattenToArrayOffset(_flat:Array<Float>, _offset:Int) : Array<Float>`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="float32array" href="#float32array">float32array</a>



`float32array() : lime.utils.Float32Array`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="fromArray" href="#fromArray">fromArray</a>



`fromArray(_from:Array<Float>) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="getInverse" href="#getInverse">getInverse</a>



`getInverse(_m:phoenix.Matrix4) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="getMaxScaleOnAxis" href="#getMaxScaleOnAxis">getMaxScaleOnAxis</a>



`getMaxScaleOnAxis() : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="getPosition" href="#getPosition">getPosition</a>



`getPosition() : phoenix.Vector`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="identity" href="#identity">identity</a>



`identity() : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="inverse" href="#inverse">inverse</a>



`inverse() : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="lookAt" href="#lookAt">lookAt</a>



`lookAt(_eye:phoenix.Vector, _target:phoenix.Vector, _up:phoenix.Vector) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="make2D" href="#make2D">make2D</a>



`make2D(_x:Float, _y:Float, ?_scale:Float=1, ?_rotation:Float=0) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="makeFrustum" href="#makeFrustum">makeFrustum</a>



`makeFrustum(_left:Float, _right:Float, _bottom:Float, _top:Float, _near:Float, _far:Float) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="makeOrthographic" href="#makeOrthographic">makeOrthographic</a>



`makeOrthographic(_left:Float, _right:Float, _top:Float, _bottom:Float, _near:Float, _far:Float) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="makePerspective" href="#makePerspective">makePerspective</a>



`makePerspective(_fov:Float, _aspect:Float, _near:Float, _far:Float) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="makeRotationAxis" href="#makeRotationAxis">makeRotationAxis</a>



`makeRotationAxis(_axis:phoenix.Vector, _angle:Float) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="makeRotationFromEuler" href="#makeRotationFromEuler">makeRotationFromEuler</a>



`makeRotationFromEuler(_v:phoenix.Vector, ?_order:String='XYZ') : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="makeRotationFromQuaternion" href="#makeRotationFromQuaternion">makeRotationFromQuaternion</a>



`makeRotationFromQuaternion(q:phoenix.Quaternion) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="makeRotationX" href="#makeRotationX">makeRotationX</a>



`makeRotationX(_theta:Float) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="makeRotationY" href="#makeRotationY">makeRotationY</a>



`makeRotationY(_theta:Float) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="makeRotationZ" href="#makeRotationZ">makeRotationZ</a>



`makeRotationZ(_theta:Float) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="makeScale" href="#makeScale">makeScale</a>



`makeScale(_x:Float, _y:Float, _z:Float) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="makeTranslation" href="#makeTranslation">makeTranslation</a>



`makeTranslation(_x:Float, _y:Float, _z:Float) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="multiply" href="#multiply">multiply</a>



`multiply(_m:phoenix.Matrix4) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="multiplyMatrices" href="#multiplyMatrices">multiplyMatrices</a>



`multiplyMatrices(_a:phoenix.Matrix4, _b:phoenix.Matrix4) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="multiplyScalar" href="#multiplyScalar">multiplyScalar</a>



`multiplyScalar(_s:Float) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="multiplyToArray" href="#multiplyToArray">multiplyToArray</a>



`multiplyToArray(_a:phoenix.Matrix4, _b:phoenix.Matrix4, _r:Array<Float>) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="multiplyVector3Array" href="#multiplyVector3Array">multiplyVector3Array</a>



`multiplyVector3Array(_a:Array<Float>) : Array<Float>`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="new" href="#new">new</a>



`new(?n11:Float=1, ?n12:Float=0, ?n13:Float=0, ?n14:Float=0, ?n21:Float=0, ?n22:Float=1, ?n23:Float=0, ?n24:Float=0, ?n31:Float=0, ?n32:Float=0, ?n33:Float=1, ?n34:Float=0, ?n41:Float=0, ?n42:Float=0, ?n43:Float=0, ?n44:Float=1) `

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="scale" href="#scale">scale</a>



`scale(_v:phoenix.Vector) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set" href="#set">set</a>



`set(n11:Float, n12:Float, n13:Float, n14:Float, n21:Float, n22:Float, n23:Float, n24:Float, n31:Float, n32:Float, n33:Float, n34:Float, n41:Float, n42:Float, n43:Float, n44:Float) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="setPosition" href="#setPosition">setPosition</a>



`setPosition(_v:phoenix.Vector) : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="toArray" href="#toArray">toArray</a>



`toArray() : Array<Float>`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="toString" href="#toString">toString</a>



`toString() : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="transpose" href="#transpose">transpose</a>



`transpose() : phoenix.Matrix4`

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   
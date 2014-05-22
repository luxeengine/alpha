
[![Logo](../../images/logo.png)](../../index.html)

---


##[API Index](../../api/index.html#phoenix)   
&emsp;&emsp;&emsp;[phoenix](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Quaternion

---

#Quaternion


---


[Properties](#Properties)   
[StaticMethods](#StaticMethods)   
[Methods](#Methods)   


---

&nbsp;   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="w" href="#w">w</a>



`w : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="x" href="#x">x</a>



`x : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="y" href="#y">y</a>



`y : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="z" href="#z">z</a>



`z : Float`

<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="StaticMethods" ></a>
###StaticMethods   
---
<a class="lift" name="Dot" href="#Dot">Dot</a>



`Dot(_a:phoenix.Quaternion, _b:phoenix.Quaternion) : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="Slerp" href="#Slerp">Slerp</a>



`Slerp(_qa:phoenix.Quaternion, _qb:phoenix.Quaternion, _qm:phoenix.Quaternion, _t:Float) : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="add" href="#add">add</a>



`add(_quaternion:phoenix.Quaternion) : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="addQuaternions" href="#addQuaternions">addQuaternions</a>



`addQuaternions(_a:phoenix.Quaternion, _b:phoenix.Quaternion) : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="clone" href="#clone">clone</a>



`clone() : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="conjugate" href="#conjugate">conjugate</a>



`conjugate() : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="copy" href="#copy">copy</a>



`copy(_quaternion:phoenix.Quaternion) : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="dot" href="#dot">dot</a>



`dot(_other:phoenix.Quaternion) : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="equals" href="#equals">equals</a>



`equals(_q:phoenix.Quaternion) : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="fromArray" href="#fromArray">fromArray</a>



`fromArray(_a:Array<Float>) : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="inverse" href="#inverse">inverse</a>



`inverse() : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="length" href="#length">length</a>



`length() : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="lengthSq" href="#lengthSq">lengthSq</a>



`lengthSq() : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="multiply" href="#multiply">multiply</a>



`multiply(_quaternion:phoenix.Quaternion) : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="multiplyQuaternions" href="#multiplyQuaternions">multiplyQuaternions</a>



`multiplyQuaternions(_a:phoenix.Quaternion, _b:phoenix.Quaternion) : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="multiplyScalar" href="#multiplyScalar">multiplyScalar</a>



`multiplyScalar(_scalar:Float) : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="new" href="#new">new</a>



`new(?_x:Float=0, ?_y:Float=0, ?_z:Float=0, ?_w:Float=1) `

<span class="small_desc_flat">  </span>   

<a class="lift" name="normalize" href="#normalize">normalize</a>



`normalize() : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="set" href="#set">set</a>



`set(_x:Float, _y:Float, _z:Float, _w:Float) : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="setFromAxisAngle" href="#setFromAxisAngle">setFromAxisAngle</a>



`setFromAxisAngle(_axis:phoenix.Vector, _angle:Float) : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="setFromEuler" href="#setFromEuler">setFromEuler</a>



`setFromEuler(_euler:phoenix.Vector, ?_order:String='XYZ') : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="setFromRotationMatrix" href="#setFromRotationMatrix">setFromRotationMatrix</a>



`setFromRotationMatrix(_m:phoenix.Matrix4) : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="slerp" href="#slerp">slerp</a>



`slerp(_qb:phoenix.Quaternion, _t:Float) : phoenix.Quaternion`

<span class="small_desc_flat">  </span>   

<a class="lift" name="toArray" href="#toArray">toArray</a>



`toArray() : Array<Float>`

<span class="small_desc_flat">  </span>   

<a class="lift" name="toString" href="#toString">toString</a>



`toString() : String`

<span class="small_desc_flat">  </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   
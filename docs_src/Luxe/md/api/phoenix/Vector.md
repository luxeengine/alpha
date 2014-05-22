
[![Logo](../../images/logo.png)](../../index.html)

---


##[API Index](../../api/index.html#phoenix)   
&emsp;&emsp;&emsp;[phoenix](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Vector

---

#Vector


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
<a class="lift" name="ignore_listeners" href="#ignore_listeners">ignore_listeners</a>



`ignore_listeners : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="listen_x" href="#listen_x">listen_x</a>



`listen_x : Float->Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="listen_y" href="#listen_y">listen_y</a>



`listen_y : Float->Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="listen_z" href="#listen_z">listen_z</a>



`listen_z : Float->Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="w" href="#w">w</a>



`w : Float`

<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="angle2D" href="#angle2D">angle2D</a>



`angle2D : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="inverted" href="#inverted">inverted</a>



`inverted : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="length" href="#length">length</a>



`length : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="lengthsq" href="#lengthsq">lengthsq</a>



`lengthsq : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="normalized" href="#normalized">normalized</a>



`normalized : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="serialized" href="#serialized">serialized</a>



`serialized : Dynamic`

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
<a class="lift" name="Add" href="#Add">Add</a>



`Add(a:phoenix.Vector, b:phoenix.Vector) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="AddScalar" href="#AddScalar">AddScalar</a>



`AddScalar(a:phoenix.Vector, b:Float) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="Cross" href="#Cross">Cross</a>



`Cross(a:phoenix.Vector, b:phoenix.Vector) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="Divide" href="#Divide">Divide</a>



`Divide(a:phoenix.Vector, b:Float) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="DivideVector" href="#DivideVector">DivideVector</a>



`DivideVector(a:phoenix.Vector, b:phoenix.Vector) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="Multiply" href="#Multiply">Multiply</a>



`Multiply(a:phoenix.Vector, b:Float) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="MultiplyVector" href="#MultiplyVector">MultiplyVector</a>



`MultiplyVector(a:phoenix.Vector, b:phoenix.Vector) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="RotationTo" href="#RotationTo">RotationTo</a>



`RotationTo(a:phoenix.Vector, b:phoenix.Vector) : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="Subtract" href="#Subtract">Subtract</a>



`Subtract(a:phoenix.Vector, b:phoenix.Vector) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="SubtractScalar" href="#SubtractScalar">SubtractScalar</a>



`SubtractScalar(a:phoenix.Vector, b:Float) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="ToDegrees" href="#ToDegrees">ToDegrees</a>



`ToDegrees(_radian_vector:phoenix.Vector) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="ToRadians" href="#ToRadians">ToRadians</a>



`ToRadians(_degree_vector:phoenix.Vector) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="add" href="#add">add</a>



`add(other:phoenix.Vector) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="addScalar" href="#addScalar">addScalar</a>



`addScalar(v:Float) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="applyMatrix4" href="#applyMatrix4">applyMatrix4</a>



`applyMatrix4(_m:phoenix.Matrix4) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="applyProjection" href="#applyProjection">applyProjection</a>



`applyProjection(m:phoenix.Matrix4) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="applyQuaternion" href="#applyQuaternion">applyQuaternion</a>



`applyQuaternion(q:phoenix.Quaternion) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="clone" href="#clone">clone</a>



`clone() : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="copy_from" href="#copy_from">copy_from</a>



`copy_from(_other:phoenix.Vector) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="cross" href="#cross">cross</a>



`cross(a:phoenix.Vector, b:phoenix.Vector) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="divide" href="#divide">divide</a>



`divide(other:phoenix.Vector) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="divideScalar" href="#divideScalar">divideScalar</a>



`divideScalar(v:Float) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="dot" href="#dot">dot</a>



`dot(other:phoenix.Vector) : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="equals" href="#equals">equals</a>



`equals(other:phoenix.Vector) : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="multiply" href="#multiply">multiply</a>



`multiply(other:phoenix.Vector) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="multiplyScalar" href="#multiplyScalar">multiplyScalar</a>



`multiplyScalar(v:Float) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="new" href="#new">new</a>



`new(?_x:Float=0, ?_y:Float=0, ?_z:Float=0, ?_w:Float=0) `

<span class="small_desc_flat">  </span>   

<a class="lift" name="normalize" href="#normalize">normalize</a>



`normalize() : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="rotationTo" href="#rotationTo">rotationTo</a>



`rotationTo(other:phoenix.Vector) : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="set" href="#set">set</a>



`set(?_x:Float, ?_y:Float, ?_z:Float, ?_w:Float) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="setEulerFromQuaternion" href="#setEulerFromQuaternion">setEulerFromQuaternion</a>



`setEulerFromQuaternion(q:phoenix.Quaternion, ?order:String='XYZ') : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="setEulerFromRotationMatrix" href="#setEulerFromRotationMatrix">setEulerFromRotationMatrix</a>



`setEulerFromRotationMatrix(m:phoenix.Matrix4, ?order:String='XYZ') : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="set_xy" href="#set_xy">set_xy</a>



`set_xy(_x:Float, _y:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="set_xyz" href="#set_xyz">set_xyz</a>



`set_xyz(_x:Float, _y:Float, _z:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="set_xyzw" href="#set_xyzw">set_xyzw</a>



`set_xyzw(_x:Float, _y:Float, _z:Float, _w:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="subtract" href="#subtract">subtract</a>



`subtract(other:phoenix.Vector) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="subtractScalar" href="#subtractScalar">subtractScalar</a>



`subtractScalar(v:Float) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="toDegrees" href="#toDegrees">toDegrees</a>



`toDegrees() : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="toRadians" href="#toRadians">toRadians</a>



`toRadians() : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="toString" href="#toString">toString</a>



`toString() : String`

<span class="small_desc_flat">  </span>   

<a class="lift" name="transformDirection" href="#transformDirection">transformDirection</a>



`transformDirection(m:phoenix.Matrix4) : phoenix.Vector`

<span class="small_desc_flat">  </span>   

<a class="lift" name="truncate" href="#truncate">truncate</a>



`truncate(max:Float) : phoenix.Vector`

<span class="small_desc_flat">  </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   
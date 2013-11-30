
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to types](types.html)   

[Properties](#Properties)   
[Transforms](#Transforms)   
[Static Methods](#StaticMethods)   


&nbsp;   

###luxe.Quaternion   
---
<a class="lift" name="new" href="#new">new</a>

`new(_x:Float = 0, _y:Float = 0, _z:Float = 0, _w:Float = 1) : Quaternion`
<span class="small_desc_flat">  </span>   

<a class="lift" name="set" href="#set">set</a>

`set( _x:Float, _y:Float, _z:Float, _w:Float ) : Quaternion`
<span class="small_desc_flat">  </span>   

<a class="lift" name="copy" href="#copy">copy</a>

`copy( _quaternion :Quaternion ) : Quaternion`
<span class="small_desc_flat">  </span>   

<a class="lift" name="clone" href="#clone">clone</a>

`clone() : Quaternion`
<span class="small_desc_flat">  </span>   

<a class="lift" name="inverse" href="#inverse">inverse</a>

`inverse() : Quaternion`
<span class="small_desc_flat">  </span>   

<a class="lift" name="conjugate" href="#conjugate">conjugate</a>

`conjugate() : Quaternion`
<span class="small_desc_flat">  </span>   

<a class="lift" name="lengthSq" href="#lengthSq">lengthSq</a>

`lengthSq() : Float`
<span class="small_desc_flat">  </span>   

<a class="lift" name="length" href="#length">length</a>

`length() : Float`
<span class="small_desc_flat">  </span>   

<a class="lift" name="normalize" href="#normalize">normalize</a>

`normalize() : Quaternion`
<span class="small_desc_flat">  </span>   

<a class="lift" name="slerp" href="#slerp">slerp</a>

`slerp( _qb:Quaternion, _t:Float ) : Quaternion`
<span class="small_desc_flat">  </span>   

<a class="lift" name="fromArray" href="#fromArray">fromArray</a>

`fromArray( _a:Array<Float> ) : Quaternion`
<span class="small_desc_flat">  </span>   

<a class="lift" name="toArray" href="#toArray">toArray</a>

`toArray() : Array<Float>`
<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="Transforms" ></a>
###Transforms   
---
<a class="lift" name="setFromEuler" href="#setFromEuler">setFromEuler</a>

`setFromEuler( _euler:Vector, _order:String = 'XYZ' ) : Quaternion`
<span class="small_desc_flat">  </span>   

<a class="lift" name="setFromAxisAngle" href="#setFromAxisAngle">setFromAxisAngle</a>

`setFromAxisAngle( _axis:Vector, _angle:Float ) : Quaternion`
<span class="small_desc_flat">  </span>   

<a class="lift" name="setFromRotationMatrix" href="#setFromRotationMatrix">setFromRotationMatrix</a>

`setFromRotationMatrix( _m:Matrix4 ) : Quaternion`
<span class="small_desc_flat">  </span>   

<a class="lift" name="multiply" href="#multiply">multiply</a>

`multiply( _quaternion:Quaternion ) : Quaternion`
<span class="small_desc_flat">  </span>   

<a class="lift" name="multiplyQuaternions" href="#multiplyQuaternions">multiplyQuaternions</a>

`multiplyQuaternions( _a:Quaternion, _b:Quaternion ) : Quaternion`
<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="x" href="#x">x</a>

`quaternion.x : Float`
<span class="small_desc_flat"> The x component of the quaternion </span>   

<a class="lift" name="y" href="#y">y</a>

`quaternion.y : Float`
<span class="small_desc_flat"> The y component of the quaternion </span>   

<a class="lift" name="z" href="#z">z</a>

`quaternion.z : Float`
<span class="small_desc_flat"> The z component of the quaternion </span>   

<a class="lift" name="w" href="#w">w</a>

`quaternion.w : Float`
<span class="small_desc_flat"> The w component of the quaternion </span>   

&nbsp;   

<a class="lift" name="StaticMethods" ></a>
###Static Methods   
---
<a class="lift" name="Slerp" href="#Slerp">Slerp</a>

`Slerp( _qa:Quaternion , _qb:Quaternion, _qm:Quaternion , _t:Float ) : Quaternion`
<span class="small_desc_flat">  </span>   



&nbsp;
&nbsp;
&nbsp;

---  
###[Back to types](types.html)   


&nbsp;   
&nbsp;   
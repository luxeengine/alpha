
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to types](types.html)   

[Transforms](#Transforms)   
[Composition](#Composition)   
[Creating Transforms](#CreateTransforms)   
[Static Methods](#StaticMethods)   


&nbsp;   

###luxe.Matrix4   
---
<a class="lift" name="new" href="#new">new</a>

```
new(
	 n11:Float = 1, n12:Float = 0, n13:Float = 0, n14:Float = 0,
	 n21:Float = 0, n22:Float = 1, n23:Float = 0, n24:Float = 0,
	 n31:Float = 0, n32:Float = 0, n33:Float = 1, n34:Float = 0,
	 n41:Float = 0, n42:Float = 0, n43:Float = 0, n44:Float = 1
 ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="set" href="#set">set</a>

```
set(
	 n11:Float, n12:Float, n13:Float, n14:Float,
	 n21:Float, n22:Float, n23:Float, n24:Float,
	 n31:Float, n32:Float, n33:Float, n34:Float,
	 n41:Float, n42:Float, n43:Float, n44:Float
) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="copy" href="#copy">copy</a>

```copy(m:Matrix4) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="clone" href="#clone">clone</a>

```clone() : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="identity" href="#identity">identity</a>

```identity () : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="inverse" href="#inverse">inverse</a>

```inverse() : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="getInverse" href="#getInverse">getInverse</a>

```getInverse( _m:Matrix4 ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="copyPosition" href="#copyPosition">copyPosition</a>

```copyPosition( m:Matrix4 ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="extractRotation" href="#extractRotation">extractRotation</a>

```extractRotation( m:Matrix4 ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="determinant" href="#determinant">determinant</a>

```determinant() : Float```
<span class="small_desc_flat">  </span>   

<a class="lift" name="getMaxScaleOnAxis" href="#getMaxScaleOnAxis">getMaxScaleOnAxis</a>

```getMaxScaleOnAxis() : Float```
<span class="small_desc_flat">  </span>   

<a class="lift" name="fromArray" href="#fromArray">fromArray</a>

```fromArray( _from:Array<Float> )```
<span class="small_desc_flat">  </span>   

<a class="lift" name="toArray" href="#toArray">toArray</a>

```toArray() : Array<Float>```
<span class="small_desc_flat">  </span>   

<a class="lift" name="flattenToArray" href="#flattenToArray">flattenToArray</a>

```flattenToArray( _flat:Array<Float> = null ) : Array<Float>```
<span class="small_desc_flat">  </span>   

<a class="lift" name="flattenToArrayOffset" href="#flattenToArrayOffset">flattenToArrayOffset</a>

```flattenToArrayOffset( _flat:Array<Float>, _offset:Int ) : Array<Float>```
<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="Transforms" ></a>
###Transforms   
---
<a class="lift" name="setPosition" href="#setPosition">setPosition</a>

```setPosition( _v:Vector ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="multiplyScalar" href="#multiplyScalar">multiplyScalar</a>

```multiplyScalar( _s:Float ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="multiply" href="#multiply">multiply</a>

```multiply( _m:Matrix4 ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="scale" href="#scale">scale</a>

```scale( _v:Vector ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="lookAt" href="#lookAt">lookAt</a>

```lookAt( _eye:Vector, _target:Vector, _up:Vector ) : Matrix4```
<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="Composition" ></a>
###Composition   
---
<a class="lift" name="compose" href="#compose">compose</a>

```compose( _position:Vector, _quaternion:Quaternion, _scale:Vector ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="decompose" href="#decompose">decompose</a>

```decompose( _position:Vector = null, _quaternion:Quaternion = null, _scale:Vector = null ) : Array<Dynamic>```
<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="CreateTransforms" ></a>
###Creating Transforms   
---
<a class="lift" name="makeRotationFromEuler" href="#makeRotationFromEuler">makeRotationFromEuler</a>

```makeRotationFromEuler( _v:Vector, _order:String = 'XYZ') : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="makeRotationFromQuaternion" href="#makeRotationFromQuaternion">makeRotationFromQuaternion</a>

```makeRotationFromQuaternion( q:Quaternion ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="makeTranslation" href="#makeTranslation">makeTranslation</a>

```makeTranslation( _x:Float, _y:Float, _z:Float ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="makeRotationX" href="#makeRotationX">makeRotationX</a>

```makeRotationX( _theta:Float ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="makeRotationY" href="#makeRotationY">makeRotationY</a>

```makeRotationY( _theta:Float ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="makeRotationZ" href="#makeRotationZ">makeRotationZ</a>

```makeRotationZ( _theta:Float ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="makeRotationAxis" href="#makeRotationAxis">makeRotationAxis</a>

```makeRotationAxis( _axis:Vector, _angle:Float ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="makeScale" href="#makeScale">makeScale</a>

```makeScale( _x:Float, _y:Float, _z:Float) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="make2D" href="#make2D">make2D</a>

```make2D(_x:Float, _y:Float, _scale:Float = 1, _rotation:Float = 0)```
<span class="small_desc_flat">  </span>   

<a class="lift" name="makeFrustum" href="#makeFrustum">makeFrustum</a>

```makeFrustum( _left:Float, _right:Float, _bottom:Float, _top:Float, _near:Float, _far:Float ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="makePerspective" href="#makePerspective">makePerspective</a>

```makePerspective( _fov:Float, _aspect:Float, _near:Float, _far:Float ) : Matrix4```
<span class="small_desc_flat">  </span>   

<a class="lift" name="makeOrthographic" href="#makeOrthographic">makeOrthographic</a>

```makeOrthographic( _left:Float, _right:Float, _top:Float, _bottom:Float, _near:Float, _far:Float ) : Matrix4```
<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="StaticMethods" ></a>
###Static Methods   
---
<a class="lift" name="GetLeft" href="#GetLeft">GetLeft</a>

```GetLeft( _m:Matrix4 ) : Vector```
<span class="small_desc_flat">  </span>   

<a class="lift" name="GetRight" href="#GetRight">GetRight</a>

```GetRight( _m:Matrix4 ) : Vector```
<span class="small_desc_flat">  </span>   

<a class="lift" name="GetUp" href="#GetUp">GetUp</a>

```GetUp( _m:Matrix4 ) : Vector```
<span class="small_desc_flat">  </span>   

<a class="lift" name="GetDown" href="#GetDown">GetDown</a>

```GetDown( _m:Matrix4 ) : Vector```
<span class="small_desc_flat">  </span>   

<a class="lift" name="GetForward" href="#GetForward">GetForward</a>

```GetForward( _m:Matrix4 ) : Vector```
<span class="small_desc_flat">  </span>   

<a class="lift" name="GetBackward" href="#GetBackward">GetBackward</a>

```GetBackward( _m:Matrix4 ) : Vector```
<span class="small_desc_flat">  </span>   



&nbsp;
&nbsp;
&nbsp;

---  
###[Back to types](types.html)   


&nbsp;   
&nbsp;   